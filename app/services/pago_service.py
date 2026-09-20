"""
=============================================================================
FASHIONSTORE - SERVICIO DE PAGOS (CU20)
Sistemas de Información II - UAGRM
-----------------------------------------------------------------------------
Lógica de integración con pasarelas de pago:
1. Stripe Checkout Session: crea sesión de pago y gestiona webhook de confirmación.
2. QR Dinámico Bolivia: genera imagen QR con datos del pago (sin banco real).
3. Registro en pago_transaccion con payload completo.
4. Auditoría en bitácora (CU25).
=============================================================================
"""

import base64
import io
import os
import secrets
import string
from decimal import Decimal
from typing import Any

import qrcode
import stripe
from fastapi import HTTPException, Request, status

from app.schemas.pago import (
    QRConfirmarPeticion,
    QRGenerarPeticion,
    StripeCheckoutPeticion,
)
from app.services.bitacora_service import ACCION_INSERT, registrar_bitacora
from app.services.venta_service import confirmar_venta
from app.schemas.venta import VentaConfirmarPeticion


# Configurar Stripe con la clave del entorno (modo test si empieza con sk_test_)
stripe.api_key = os.getenv("STRIPE_SECRET_KEY", "sk_test_fashionstore_mock_key")
STRIPE_WEBHOOK_SECRET = os.getenv("STRIPE_WEBHOOK_SECRET", "")
FRONTEND_URL = os.getenv("FRONTEND_URL", "http://localhost:4200")


# ─────────────────────────────────────────────────────────────────────────────
# STRIPE (CU20)
# ─────────────────────────────────────────────────────────────────────────────

def crear_sesion_stripe(
    cursor: Any,
    datos: StripeCheckoutPeticion,
    ip_address: str,
) -> dict:
    """Crea una sesión de Stripe Checkout para pagar una reserva.

    Parámetros:
        cursor: cursor activo de PostgreSQL.
        datos: id_reserva, id_cliente y URLs de retorno.
        ip_address: IP del cliente para auditoría.

    Retorna:
        dict: url_pago, session_id, id_reserva, monto.

    Errores:
        HTTP 404: reserva inexistente.
        HTTP 402: error de Stripe.
    """
    # Obtener reserva
    cursor.execute(
        "SELECT id_reserva, total, estado FROM reserva WHERE id_reserva = %s;",
        (datos.id_reserva,),
    )
    reserva = cursor.fetchone()
    if not reserva:
        raise HTTPException(
            status_code=status.HTTP_404_NOT_FOUND,
            detail="Reserva no encontrada",
        )
    if reserva["estado"] not in ("Pendiente", "Preparado"):
        raise HTTPException(
            status_code=status.HTTP_409_CONFLICT,
            detail=f"La reserva tiene estado '{reserva['estado']}' y no puede pagarse",
        )

    monto_bs = Decimal(str(reserva["total"]))
    # Stripe trabaja en centavos. Usamos BOB → centavos ficticios (1 BOB = 100 centavos)
    monto_centavos = int(monto_bs * 100)

    try:
        session = stripe.checkout.Session.create(
            payment_method_types=["card"],
            line_items=[
                {
                    "price_data": {
                        "currency": "bob",
                        "product_data": {
                            "name": f"Pedido FashionStore #{datos.id_reserva}",
                            "description": "Ropa y accesorios de moda",
                        },
                        "unit_amount": monto_centavos,
                    },
                    "quantity": 1,
                }
            ],
            mode="payment",
            success_url=f"{datos.url_exito}?session_id={{CHECKOUT_SESSION_ID}}&reserva={datos.id_reserva}",
            cancel_url=f"{datos.url_cancelacion}?reserva={datos.id_reserva}",
            metadata={
                "id_reserva": str(datos.id_reserva),
                "id_cliente": str(datos.id_cliente),
            },
        )
        session_id = session.id
        url_pago = session.url

    except stripe.error.StripeError as exc:
        raise HTTPException(
            status_code=status.HTTP_402_PAYMENT_REQUIRED,
            detail=f"Error de Stripe: {str(exc)}",
        )

    # Registrar transacción pendiente
    cursor.execute(
        """
        INSERT INTO pago_transaccion (id_venta, pasarela, transaccion_id, monto, estado_pago, payload_respuesta)
        VALUES (NULL, 'Stripe', %s, %s, 'Pendiente', %s::jsonb)
        RETURNING id_pago;
        """,
        (
            session_id,
            monto_bs,
            f'{{"session_id": "{session_id}", "id_reserva": {datos.id_reserva}}}',
        ),
    )

    registrar_bitacora(
        cursor=cursor,
        accion=ACCION_INSERT,
        tabla_afectada="pago_transaccion",
        registro_id=datos.id_reserva,
        detalle=f"Sesión Stripe creada para reserva #{datos.id_reserva}. Monto: Bs {monto_bs}.",
        id_usuario=datos.id_cliente,
        ip_address=ip_address,
    )

    return {
        "url_pago": url_pago,
        "session_id": session_id,
        "id_reserva": datos.id_reserva,
        "monto": monto_bs,
    }


def procesar_webhook_stripe(
    cursor: Any,
    payload: bytes,
    sig_header: str,
    ip_address: str,
) -> dict:
    """Procesa el webhook de Stripe al confirmar un pago exitoso.

    Valida la firma criptográfica de Stripe, extrae los metadatos de la
    reserva y llama a confirmar_venta() para completar la transacción.

    Parámetros:
        cursor: cursor activo de PostgreSQL.
        payload: cuerpo crudo de la petición webhook.
        sig_header: cabecera Stripe-Signature.
        ip_address: IP del webhook para auditoría.

    Retorna:
        dict: {status: 'ok', id_venta: int} o {status: 'ignorado'}.
    """
    if STRIPE_WEBHOOK_SECRET:
        try:
            event = stripe.Webhook.construct_event(
                payload, sig_header, STRIPE_WEBHOOK_SECRET
            )
        except (ValueError, stripe.error.SignatureVerificationError) as exc:
            raise HTTPException(
                status_code=status.HTTP_400_BAD_REQUEST,
                detail=f"Firma de webhook inválida: {str(exc)}",
            )
    else:
        # Sin secret configurado → modo test/mock (parseo directo)
        import json
        event = json.loads(payload)

    if event.get("type") != "checkout.session.completed":
        return {"status": "ignorado", "tipo_evento": event.get("type")}

    session = event["data"]["object"]
    metadata = session.get("metadata", {})
    id_reserva = int(metadata.get("id_reserva", 0))
    id_cliente = int(metadata.get("id_cliente", 0))
    session_id = session.get("id", "")
    monto = Decimal(str(session.get("amount_total", 0))) / 100

    if not id_reserva:
        return {"status": "ignorado", "razon": "Sin id_reserva en metadata"}

    # Obtener sucursal de la reserva
    cursor.execute(
        "SELECT id_sucursal FROM reserva WHERE id_reserva = %s;",
        (id_reserva,),
    )
    reserva_row = cursor.fetchone()
    if not reserva_row:
        return {"status": "ignorado", "razon": "Reserva no encontrada"}

    # Confirmar la venta
    datos_venta = VentaConfirmarPeticion(
        id_reserva=id_reserva,
        id_cliente=id_cliente if id_cliente > 0 else None,
        id_sucursal=reserva_row["id_sucursal"],
        tipo_venta="Online",
        metodo_pago="Tarjeta",
        descuento=Decimal("0.00"),
    )
    venta = confirmar_venta(cursor, datos_venta, id_cliente or None, ip_address)
    id_venta = venta["id_venta"]

    # Actualizar pago_transaccion con el id_venta
    cursor.execute(
        """
        UPDATE pago_transaccion
        SET id_venta = %s, estado_pago = 'Aprobado',
            payload_respuesta = payload_respuesta || %s::jsonb
        WHERE transaccion_id = %s;
        """,
        (
            id_venta,
            f'{{"id_venta": {id_venta}}}',
            session_id,
        ),
    )

    return {"status": "ok", "id_venta": id_venta}


# ─────────────────────────────────────────────────────────────────────────────
# QR BOLIVIANO (CU20)
# ─────────────────────────────────────────────────────────────────────────────

def _generar_referencia() -> str:
    """Genera un código alfanumérico único de 12 caracteres para el pago QR."""
    alfabeto = string.ascii_uppercase + string.digits
    return "FS-" + "".join(secrets.choice(alfabeto) for _ in range(9))


def generar_qr_boliviano(
    cursor: Any,
    datos: QRGenerarPeticion,
    ip_address: str,
) -> dict:
    """Genera un código QR de pago boliviano con los datos de la reserva.

    El contenido del QR sigue el formato de texto estándar boliviano:
    «FASHIONSTORE|<referencia>|<monto>|<concepto>»

    Parámetros:
        cursor: cursor activo de PostgreSQL.
        datos: reserva, cliente, monto, concepto.
        ip_address: IP del cliente.

    Retorna:
        dict: qr_base64, referencia, monto, id_reserva, expira_en_minutos.
    """
    # Validar reserva
    cursor.execute(
        "SELECT id_reserva, estado FROM reserva WHERE id_reserva = %s;",
        (datos.id_reserva,),
    )
    reserva = cursor.fetchone()
    if not reserva:
        raise HTTPException(
            status_code=status.HTTP_404_NOT_FOUND,
            detail="Reserva no encontrada",
        )
    if reserva["estado"] not in ("Pendiente", "Preparado"):
        raise HTTPException(
            status_code=status.HTTP_409_CONFLICT,
            detail="La reserva no puede pagarse en su estado actual",
        )

    referencia = _generar_referencia()
    monto_str = f"{datos.monto:.2f}"
    contenido_qr = f"FASHIONSTORE|{referencia}|{monto_str}|{datos.concepto}"

    # Generar imagen QR
    qr = qrcode.QRCode(
        version=1,
        error_correction=qrcode.constants.ERROR_CORRECT_M,
        box_size=10,
        border=4,
    )
    qr.add_data(contenido_qr)
    qr.make(fit=True)
    img = qr.make_image(fill_color="black", back_color="white")

    buffer = io.BytesIO()
    img.save(buffer, format="PNG")
    qr_base64 = base64.b64encode(buffer.getvalue()).decode("utf-8")

    # Registrar transacción pendiente en pago_transaccion
    cursor.execute(
        """
        INSERT INTO pago_transaccion
            (id_venta, pasarela, transaccion_id, monto, estado_pago, payload_respuesta)
        VALUES (NULL, 'QR Bolivia', %s, %s, 'Pendiente', %s::jsonb)
        RETURNING id_pago;
        """,
        (
            referencia,
            datos.monto,
            f'{{"referencia": "{referencia}", "id_reserva": {datos.id_reserva}, "concepto": "{datos.concepto}"}}',
        ),
    )

    registrar_bitacora(
        cursor=cursor,
        accion=ACCION_INSERT,
        tabla_afectada="pago_transaccion",
        registro_id=datos.id_reserva,
        detalle=f"QR boliviano generado para reserva #{datos.id_reserva}. Ref: {referencia}. Monto: Bs {monto_str}.",
        id_usuario=datos.id_cliente,
        ip_address=ip_address,
    )

    return {
        "qr_base64": qr_base64,
        "referencia": referencia,
        "monto": datos.monto,
        "id_reserva": datos.id_reserva,
        "expira_en_minutos": 15,
    }


def confirmar_pago_qr(
    cursor: Any,
    datos: QRConfirmarPeticion,
    id_usuario: int | None,
    ip_address: str,
) -> dict:
    """Confirma manualmente un pago QR boliviano.

    Valida que la referencia QR exista y esté pendiente, luego convierte
    la reserva en venta y marca el pago como aprobado.

    Parámetros:
        cursor: cursor activo de PostgreSQL.
        datos: referencia QR, reserva, cliente, sucursal.
        id_usuario: ID del usuario que confirma.
        ip_address: IP para auditoría.

    Retorna:
        dict: venta confirmada completa.
    """
    # Validar referencia QR
    cursor.execute(
        """
        SELECT id_pago, estado_pago
        FROM pago_transaccion
        WHERE transaccion_id = %s AND pasarela = 'QR Bolivia';
        """,
        (datos.referencia,),
    )
    pago = cursor.fetchone()
    if not pago:
        raise HTTPException(
            status_code=status.HTTP_404_NOT_FOUND,
            detail="Referencia QR no encontrada",
        )
    if pago["estado_pago"] != "Pendiente":
        raise HTTPException(
            status_code=status.HTTP_409_CONFLICT,
            detail=f"El pago QR ya tiene estado '{pago['estado_pago']}'",
        )

    # Confirmar la venta
    datos_venta = VentaConfirmarPeticion(
        id_reserva=datos.id_reserva,
        id_cliente=datos.id_cliente,
        id_sucursal=datos.id_sucursal,
        tipo_venta="Online",
        metodo_pago="QR",
        descuento=Decimal("0.00"),
    )
    venta = confirmar_venta(cursor, datos_venta, id_usuario, ip_address)
    id_venta = venta["id_venta"]

    # Actualizar estado del pago a Aprobado
    cursor.execute(
        """
        UPDATE pago_transaccion
        SET id_venta = %s, estado_pago = 'Aprobado'
        WHERE transaccion_id = %s;
        """,
        (id_venta, datos.referencia),
    )

    return venta


def obtener_pagos_por_venta(cursor: Any, id_venta: int) -> list[dict]:
    """Lista todas las transacciones de pago asociadas a una venta."""
    cursor.execute(
        """
        SELECT id_pago, id_venta, pasarela, transaccion_id, monto, estado_pago, fecha
        FROM pago_transaccion
        WHERE id_venta = %s
        ORDER BY fecha DESC;
        """,
        (id_venta,),
    )
    return cursor.fetchall()
