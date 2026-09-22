"""
=============================================================================
FASHIONSTORE - SERVICIO DE VENTAS Y RESERVAS (CU15)
Sistemas de Información II - UAGRM
-----------------------------------------------------------------------------
Lógica de negocio para el carrito de compras y checkout digital:
1. Validación de stock disponible en sucursal.
2. Creación de reserva (bloquea artículos hasta 24h o hasta confirmación).
3. Conversión de reserva en venta confirmada (descuenta stock vía trigger).
4. Listado e historial de ventas para clientes y administradores.
5. Registro en bitácora inmutable (CU25).
=============================================================================
"""

import base64
import io
import qrcode
from decimal import Decimal, ROUND_HALF_UP
from typing import Any
from datetime import datetime, timedelta

from fastapi import HTTPException, status

from app.schemas.venta import (
    ReservaPeticion,
    ReservaProbadorCrear,
    ReservaProbadorEstadoActualizar,
    TicketReservaRespuesta,
    VentaConfirmarPeticion,
)
from app.services.bitacora_service import ACCION_INSERT, ACCION_UPDATE, registrar_bitacora


# ─────────────────────────────────────────────────────────────────────────────
# VALIDACIÓN DE STOCK (carrito pre-checkout)
# ─────────────────────────────────────────────────────────────────────────────

def validar_stock_carrito(
    cursor: Any,
    items: list[dict],
    id_sucursal: int,
) -> dict:
    """Verifica si cada variante del carrito tiene stock suficiente en la sucursal.

    Parámetros:
        cursor: cursor activo de PostgreSQL.
        items: lista de dicts con id_variante_prenda y cantidad.
        id_sucursal: sucursal donde se realizará la venta.

    Retorna:
        dict: {valido: bool, items_sin_stock: list[int], mensaje: str|None}
    """
    items_sin_stock = []

    for item in items:
        cursor.execute(
            """
            SELECT COALESCE(stock, 0) AS stock
            FROM inventario
            WHERE id_variante_prenda = %s AND id_sucursal = %s;
            """,
            (item["id_variante_prenda"], id_sucursal),
        )
        row = cursor.fetchone()
        stock_disponible = row["stock"] if row else 0

        if stock_disponible < item["cantidad"]:
            items_sin_stock.append(item["id_variante_prenda"])

    valido = len(items_sin_stock) == 0
    return {
        "valido": valido,
        "items_sin_stock": items_sin_stock,
        "mensaje": None if valido else "Algunos productos no tienen stock suficiente",
    }


# ─────────────────────────────────────────────────────────────────────────────
# RESERVA (CU15)
# ─────────────────────────────────────────────────────────────────────────────

def crear_reserva(
    cursor: Any,
    datos: ReservaPeticion,
    id_usuario: int | None,
    ip_address: str,
) -> dict:
    """Crea una reserva con los artículos del carrito del cliente.

    Bloquea el stock lógicamente durante 24 horas o hasta que se confirme
    el pago. No descuenta inventario físico hasta que la venta se confirme.

    Parámetros:
        cursor: cursor activo de PostgreSQL.
        datos: items del carrito con sucursal y cliente.
        id_usuario: ID del usuario autenticado (cliente).
        ip_address: IP del cliente para auditoría.

    Retorna:
        dict: reserva completa con sus ítems.

    Errores:
        HTTP 400: sin items, cantidades inválidas.
        HTTP 404: sucursal o variantes inexistentes.
        HTTP 422: stock insuficiente para alguna variante.
    """
    if not datos.items:
        raise HTTPException(
            status_code=status.HTTP_400_BAD_REQUEST,
            detail="El carrito no puede estar vacío",
        )

    # Validar sucursal
    cursor.execute(
        "SELECT id_sucursal, nombre FROM sucursal WHERE id_sucursal = %s;",
        (datos.id_sucursal,),
    )
    sucursal = cursor.fetchone()
    if not sucursal:
        raise HTTPException(
            status_code=status.HTTP_404_NOT_FOUND,
            detail="La sucursal especificada no existe",
        )

    # Validar cliente y asegurar que pertenece al usuario autenticado
    cursor.execute(
        """
        SELECT c.id_cliente 
        FROM cliente c
        JOIN usuario u ON LOWER(c.correo) = LOWER(u.correo)
        WHERE c.id_cliente = %s AND u.id_usuario = %s AND c.estado = 'Activo';
        """,
        (datos.id_cliente, id_usuario),
    )
    if not cursor.fetchone():
        raise HTTPException(
            status_code=status.HTTP_404_NOT_FOUND,
            detail="El cliente especificado no existe, está inactivo o no corresponde a su usuario",
        )

    # Validar stock para cada item
    items_list = [
        {"id_variante_prenda": it.id_variante_prenda, "cantidad": it.cantidad}
        for it in datos.items
    ]
    resultado_stock = validar_stock_carrito(cursor, items_list, datos.id_sucursal)
    if not resultado_stock["valido"]:
        raise HTTPException(
            status_code=status.HTTP_422_UNPROCESSABLE_ENTITY,
            detail=f"Stock insuficiente para variantes: {resultado_stock['items_sin_stock']}",
        )

    # Calcular total de la reserva
    total = Decimal("0.00")
    for it in datos.items:
        total += Decimal(str(it.precio_unitario)) * it.cantidad
    total = total.quantize(Decimal("0.01"), rounding=ROUND_HALF_UP)

    # Fecha límite: 24 horas desde ahora
    fecha_limite = datetime.now() + timedelta(hours=24)

    # Insertar cabecera de reserva
    cursor.execute(
        """
        INSERT INTO reserva (id_cliente, id_sucursal, fecha_limite, estado, total)
        VALUES (%s, %s, %s, 'Pendiente', %s)
        RETURNING id_reserva, fecha_reserva, fecha_limite, estado, total;
        """,
        (datos.id_cliente, datos.id_sucursal, fecha_limite, total),
    )
    reserva_row = cursor.fetchone()
    id_reserva = reserva_row["id_reserva"]

    # Insertar cada ítem de detalle
    for it in datos.items:
        subtotal_item = (
            Decimal(str(it.precio_unitario)) * it.cantidad
        ).quantize(Decimal("0.01"), rounding=ROUND_HALF_UP)
        cursor.execute(
            """
            INSERT INTO detalle_reserva (id_reserva, id_variante_prenda, cantidad, precio_unitario)
            VALUES (%s, %s, %s, %s);
            """,
            (id_reserva, it.id_variante_prenda, it.cantidad, it.precio_unitario),
        )

    # Auditoría
    registrar_bitacora(
        cursor=cursor,
        accion=ACCION_INSERT,
        tabla_afectada="reserva",
        registro_id=id_reserva,
        detalle=(
            f"Reserva #{id_reserva} creada por cliente {datos.id_cliente} "
            f"en sucursal {datos.id_sucursal} por Bs {total}. "
            f"{len(datos.items)} ítem(s). Válida hasta {fecha_limite.strftime('%Y-%m-%d %H:%M')}."
        ),
        id_usuario=id_usuario,
        ip_address=ip_address,
    )

    return obtener_reserva_por_id(cursor, id_reserva)


def obtener_reserva_por_id(cursor: Any, id_reserva: int) -> dict:
    """Recupera una reserva completa con sus ítems detallados."""
    cursor.execute(
        """
        SELECT r.*, s.nombre AS sucursal_nombre, v.id_venta
        FROM reserva r
        JOIN sucursal s ON r.id_sucursal = s.id_sucursal
        LEFT JOIN venta v ON r.id_reserva = v.id_reserva
        WHERE r.id_reserva = %s;
        """,
        (id_reserva,),
    )
    cabecera = cursor.fetchone()
    if not cabecera:
        raise HTTPException(
            status_code=status.HTTP_404_NOT_FOUND,
            detail="La reserva solicitada no existe",
        )

    cursor.execute(
        """
        SELECT
            dr.id_variante_prenda,
            v.sku_variante,
            p.nombre AS prenda_nombre,
            t.nombre AS talla,
            c.nombre AS color,
            dr.cantidad,
            dr.precio_unitario,
            (dr.cantidad * dr.precio_unitario) AS subtotal
        FROM detalle_reserva dr
        JOIN variante_prenda v ON dr.id_variante_prenda = v.id_variante_prenda
        JOIN prenda p ON v.id_prenda = p.id_prenda
        JOIN talla t ON v.id_talla = t.id_talla
        JOIN color c ON v.id_color = c.id_color
        WHERE dr.id_reserva = %s
        ORDER BY dr.id_variante_prenda;
        """,
        (id_reserva,),
    )
    items = cursor.fetchall()

    resultado = dict(cabecera)
    resultado["items"] = items
    return resultado


# ─────────────────────────────────────────────────────────────────────────────
# VENTA (CU15 — post-pago confirmado)
# ─────────────────────────────────────────────────────────────────────────────

def confirmar_venta(
    cursor: Any,
    datos: VentaConfirmarPeticion,
    id_usuario: int | None,
    ip_address: str,
) -> dict:
    """Convierte una reserva confirmada en una venta real.

    Descuenta el stock mediante inserción en movimiento_inventario (trigger PL/pgSQL).
    Marca la reserva como 'Atendido'. Registra la venta y sus ítems.

    Parámetros:
        cursor: cursor activo de PostgreSQL.
        datos: cabecera de la venta (reserva, cliente, método de pago).
        id_usuario: ID del usuario (cliente o cajero).
        ip_address: IP para auditoría.

    Retorna:
        dict: venta completa con ítems.

    Errores:
        HTTP 404: reserva inexistente.
        HTTP 409: reserva ya procesada o cancelada.
    """
    # Obtener y validar la reserva
    cursor.execute(
        """
        SELECT id_reserva, id_cliente, id_sucursal, estado, total
        FROM reserva
        WHERE id_reserva = %s FOR UPDATE;
        """,
        (datos.id_reserva,),
    )
    reserva = cursor.fetchone()
    if not reserva:
        raise HTTPException(
            status_code=status.HTTP_404_NOT_FOUND,
            detail="La reserva especificada no existe",
        )
    if reserva["estado"] not in ("Pendiente", "Preparado"):
        raise HTTPException(
            status_code=status.HTTP_409_CONFLICT,
            detail=f"La reserva tiene estado '{reserva['estado']}' y no puede convertirse en venta",
        )

    # Obtener ítems de la reserva
    cursor.execute(
        """
        SELECT id_variante_prenda, cantidad, precio_unitario,
               (cantidad * precio_unitario) AS subtotal
        FROM detalle_reserva
        WHERE id_reserva = %s;
        """,
        (datos.id_reserva,),
    )
    items_reserva = cursor.fetchall()
    if not items_reserva:
        raise HTTPException(
            status_code=status.HTTP_400_BAD_REQUEST,
            detail="La reserva no tiene ítems para procesar",
        )

    # Calcular totales
    subtotal = sum(Decimal(str(it["subtotal"])) for it in items_reserva)
    subtotal = subtotal.quantize(Decimal("0.01"), rounding=ROUND_HALF_UP)
    descuento = datos.descuento.quantize(Decimal("0.01"), rounding=ROUND_HALF_UP)
    total = (subtotal - descuento).quantize(Decimal("0.01"), rounding=ROUND_HALF_UP)

    id_cliente = datos.id_cliente or reserva["id_cliente"]
    id_sucursal = datos.id_sucursal or reserva["id_sucursal"]

    # Insertar cabecera de venta
    cursor.execute(
        """
        INSERT INTO venta
            (id_cliente, id_sucursal, id_cajero, id_reserva, tipo_venta,
             metodo_pago, subtotal, descuento, total)
        VALUES (%s, %s, %s, %s, %s, %s, %s, %s, %s)
        RETURNING id_venta, fecha_venta;
        """,
        (
            id_cliente,
            id_sucursal,
            id_usuario,
            datos.id_reserva,
            datos.tipo_venta,
            datos.metodo_pago,
            subtotal,
            descuento,
            total,
        ),
    )
    venta_row = cursor.fetchone()
    id_venta = venta_row["id_venta"]

    # Insertar detalles de venta y movimientos de inventario (salida de stock)
    for it in items_reserva:
        subtotal_item = (
            Decimal(str(it["precio_unitario"])) * it["cantidad"]
        ).quantize(Decimal("0.01"), rounding=ROUND_HALF_UP)

        cursor.execute(
            """
            INSERT INTO detalle_venta
                (id_venta, id_variante_prenda, cantidad, precio_unitario, subtotal)
            VALUES (%s, %s, %s, %s, %s);
            """,
            (
                id_venta,
                it["id_variante_prenda"],
                it["cantidad"],
                it["precio_unitario"],
                subtotal_item,
            ),
        )

        # Movimiento Salida para descontar del inventario
        cursor.execute(
            """
            INSERT INTO movimiento_inventario
                (id_sucursal, id_variante_prenda, tipo, cantidad, motivo, id_usuario)
            VALUES (%s, %s, 'Salida', %s, %s, %s);
            """,
            (
                id_sucursal,
                it["id_variante_prenda"],
                it["cantidad"],
                f"Venta online #{id_venta} CU15",
                id_usuario,
            ),
        )

    # Marcar reserva como Atendida
    cursor.execute(
        "UPDATE reserva SET estado = 'Atendido', updated_at = NOW() WHERE id_reserva = %s;",
        (datos.id_reserva,),
    )

    # Auditoría
    registrar_bitacora(
        cursor=cursor,
        accion=ACCION_INSERT,
        tabla_afectada="venta",
        registro_id=id_venta,
        detalle=(
            f"Venta online #{id_venta} confirmada desde reserva #{datos.id_reserva}. "
            f"Cliente: {id_cliente}. Método pago: {datos.metodo_pago}. "
            f"Total: Bs {total} ({len(items_reserva)} ítems)."
        ),
        id_usuario=id_usuario,
        ip_address=ip_address,
    )

    return obtener_venta_por_id(cursor, id_venta)


def obtener_venta_por_id(cursor: Any, id_venta: int) -> dict:
    """Recupera una venta completa con sus ítems detallados."""
    cursor.execute(
        """
        SELECT
            v.id_venta, v.id_cliente,
            CONCAT(c.nombre_completo) AS cliente_nombre,
            v.id_sucursal, s.nombre AS sucursal_nombre,
            v.tipo_venta, v.metodo_pago,
            v.subtotal, v.descuento, v.total, v.fecha_venta
        FROM venta v
        LEFT JOIN cliente c ON v.id_cliente = c.id_cliente
        LEFT JOIN sucursal s ON v.id_sucursal = s.id_sucursal
        WHERE v.id_venta = %s;
        """,
        (id_venta,),
    )
    cabecera = cursor.fetchone()
    if not cabecera:
        raise HTTPException(
            status_code=status.HTTP_404_NOT_FOUND,
            detail="La venta solicitada no existe",
        )

    cursor.execute(
        """
        SELECT
            dv.id_variante_prenda,
            vp.sku_variante,
            p.nombre AS prenda_nombre,
            t.nombre AS talla,
            col.nombre AS color,
            dv.cantidad,
            dv.precio_unitario,
            dv.subtotal
        FROM detalle_venta dv
        JOIN variante_prenda vp ON dv.id_variante_prenda = vp.id_variante_prenda
        JOIN prenda p ON vp.id_prenda = p.id_prenda
        JOIN talla t ON vp.id_talla = t.id_talla
        JOIN color col ON vp.id_color = col.id_color
        WHERE dv.id_venta = %s
        ORDER BY dv.id_variante_prenda;
        """,
        (id_venta,),
    )
    items = cursor.fetchall()

    resultado = dict(cabecera)
    resultado["items"] = items
    return resultado


def listar_ventas(
    cursor: Any,
    id_cliente: int | None = None,
    id_sucursal: int | None = None,
    skip: int = 0,
    limit: int = 50,
) -> list[dict]:
    """Lista el historial de ventas con filtros opcionales."""
    condiciones = ["1=1"]
    parametros: list[Any] = []

    if id_cliente is not None:
        condiciones.append("v.id_cliente = %s")
        parametros.append(id_cliente)
    if id_sucursal is not None:
        condiciones.append("v.id_sucursal = %s")
        parametros.append(id_sucursal)

    parametros.extend([limit, skip])

    cursor.execute(
        f"""
        SELECT
            v.id_venta, v.id_cliente,
            CONCAT(c.nombre_completo) AS cliente_nombre,
            v.id_sucursal, s.nombre AS sucursal_nombre,
            v.tipo_venta, v.metodo_pago,
            v.subtotal, v.descuento, v.total, v.fecha_venta
        FROM venta v
        LEFT JOIN cliente c ON v.id_cliente = c.id_cliente
        LEFT JOIN sucursal s ON v.id_sucursal = s.id_sucursal
        WHERE {" AND ".join(condiciones)}
        ORDER BY v.fecha_venta DESC, v.id_venta DESC
        LIMIT %s OFFSET %s;
        """,
        tuple(parametros),
    )
    return cursor.fetchall()


def listar_reservas_cliente(cursor: Any, id_cliente: int) -> list[dict]:
    """Lista todas las reservas de un cliente con su estado actual."""
    cursor.execute(
        """
        SELECT
            r.id_reserva, r.id_sucursal, s.nombre AS sucursal_nombre,
            r.fecha_reserva, r.fecha_limite, r.estado, r.total
        FROM reserva r
        JOIN sucursal s ON r.id_sucursal = s.id_sucursal
        WHERE r.id_cliente = %s
        ORDER BY r.fecha_reserva DESC;
        """,
        (id_cliente,),
    )
    return cursor.fetchall()


# ─────────────────────────────────────────────────────────────────────────────
# RESERVAS PARA PROBADOR FÍSICO Y ATENCIÓN EN SUCURSAL (CU16, CU17)
# ─────────────────────────────────────────────────────────────────────────────

def _generar_qr_ticket(id_reserva: int, codigo_ticket: str, sucursal_nombre: str) -> str:
    """Genera imagen QR codificada en base64 para el ticket de reserva."""
    contenido = f"FASHIONSTORE|RESERVA|{id_reserva}|{codigo_ticket}|{sucursal_nombre}"
    qr = qrcode.QRCode(
        version=1,
        error_correction=qrcode.constants.ERROR_CORRECT_M,
        box_size=8,
        border=2,
    )
    qr.add_data(contenido)
    qr.make(fit=True)
    img = qr.make_image(fill_color="black", back_color="white")

    buffer = io.BytesIO()
    img.save(buffer, format="PNG")
    return base64.b64encode(buffer.getvalue()).decode("utf-8")


def crear_reserva_probador(
    cursor: Any,
    datos: ReservaProbadorCrear,
    id_usuario: int | None,
    ip_address: str,
) -> dict:
    """Crea una reserva de prendas para prueba física en una sucursal (CU16).

    Bloquea temporalmente el stock físico en la sucursal generando un movimiento
    de salida provisional. Si la reserva se cancela o no se concreta, el stock
    se devuelve mediante movimiento de entrada.
    """
    if not datos.items:
        raise HTTPException(
            status_code=status.HTTP_400_BAD_REQUEST,
            detail="La reserva debe incluir al menos una prenda para probar",
        )

    # Validar sucursal
    cursor.execute(
        "SELECT id_sucursal, nombre FROM sucursal WHERE id_sucursal = %s;",
        (datos.id_sucursal,),
    )
    sucursal = cursor.fetchone()
    if not sucursal:
        raise HTTPException(
            status_code=status.HTTP_404_NOT_FOUND,
            detail="La sucursal física especificada no existe",
        )

    # Validar cliente
    cursor.execute(
        "SELECT id_cliente, nombre_completo FROM cliente WHERE id_cliente = %s AND estado = 'Activo';",
        (datos.id_cliente,),
    )
    cliente = cursor.fetchone()
    if not cliente:
        raise HTTPException(
            status_code=status.HTTP_404_NOT_FOUND,
            detail="El cliente especificado no existe o está inactivo",
        )

    # Validar stock disponible en la sucursal seleccionada
    items_list = [
        {"id_variante_prenda": it.id_variante_prenda, "cantidad": it.cantidad}
        for it in datos.items
    ]
    resultado_stock = validar_stock_carrito(cursor, items_list, datos.id_sucursal)
    if not resultado_stock["valido"]:
        raise HTTPException(
            status_code=status.HTTP_422_UNPROCESSABLE_ENTITY,
            detail=f"Stock insuficiente en sucursal {sucursal['nombre']} para variantes: {resultado_stock['items_sin_stock']}",
        )

    # Calcular total estimado
    total = Decimal("0.00")
    for it in datos.items:
        total += Decimal(str(it.precio_unitario)) * it.cantidad
    total = total.quantize(Decimal("0.01"), rounding=ROUND_HALF_UP)

    # Fecha límite según horas de vigencia solicitadas
    fecha_limite = datetime.now() + timedelta(hours=datos.horas_vigencia)

    # Inserción en cabecera de reserva
    cursor.execute(
        """
        INSERT INTO reserva (id_cliente, id_sucursal, fecha_limite, estado, total)
        VALUES (%s, %s, %s, 'Pendiente', %s)
        RETURNING id_reserva, fecha_reserva, fecha_limite, estado, total;
        """,
        (datos.id_cliente, datos.id_sucursal, fecha_limite, total),
    )
    reserva_row = cursor.fetchone()
    id_reserva = reserva_row["id_reserva"]
    codigo_ticket = f"TKT-{id_reserva:06d}"

    # Inserción de ítems y reserva de stock físico (descuento temporal)
    for it in datos.items:
        cursor.execute(
            """
            INSERT INTO detalle_reserva (id_reserva, id_variante_prenda, cantidad, precio_unitario)
            VALUES (%s, %s, %s, %s);
            """,
            (id_reserva, it.id_variante_prenda, it.cantidad, it.precio_unitario),
        )

        # Descontar stock físico temporalmente en la tienda
        cursor.execute(
            """
            INSERT INTO movimiento_inventario
                (id_sucursal, id_variante_prenda, tipo, cantidad, motivo, id_usuario)
            VALUES (%s, %s, 'Salida', %s, %s, %s);
            """,
            (
                datos.id_sucursal,
                it.id_variante_prenda,
                it.cantidad,
                f"Bloqueo temporal por reserva de probador #{id_reserva} ({codigo_ticket})",
                id_usuario,
            ),
        )

    # Auditoría inmutable en bitácora (CU25)
    registrar_bitacora(
        cursor=cursor,
        accion=ACCION_INSERT,
        tabla_afectada="reserva",
        registro_id=id_reserva,
        detalle=(
            f"Reserva para probador #{id_reserva} ({codigo_ticket}) creada por cliente {datos.id_cliente} "
            f"('{cliente['nombre_completo']}') en sucursal {datos.id_sucursal} ('{sucursal['nombre']}'). "
            f"{len(datos.items)} prendas separadas. Vigencia: {datos.horas_vigencia} horas."
        ),
        id_usuario=id_usuario,
        ip_address=ip_address,
    )

    return obtener_ticket_reserva_qr(cursor, id_reserva)


def obtener_ticket_reserva_qr(cursor: Any, id_o_codigo: str | int) -> dict:
    """Recupera el ticket de reserva completo con QR y desglose de prendas."""
    id_reserva: int | None = None
    if isinstance(id_o_codigo, int) or (isinstance(id_o_codigo, str) and id_o_codigo.isdigit()):
        id_reserva = int(id_o_codigo)
    elif isinstance(id_o_codigo, str) and id_o_codigo.upper().startswith("TKT-"):
        try:
            id_reserva = int(id_o_codigo.upper().replace("TKT-", ""))
        except ValueError:
            id_reserva = None

    if id_reserva is None:
        raise HTTPException(
            status_code=status.HTTP_400_BAD_REQUEST,
            detail="Identificador o código de ticket de reserva inválido",
        )

    cursor.execute(
        """
        SELECT
            r.id_reserva, r.id_cliente,
            CONCAT(c.nombre_completo) AS cliente_nombre,
            r.id_sucursal, s.nombre AS sucursal_nombre,
            r.fecha_reserva, r.fecha_limite, r.estado, r.total
        FROM reserva r
        JOIN sucursal s ON r.id_sucursal = s.id_sucursal
        LEFT JOIN cliente c ON r.id_cliente = c.id_cliente
        WHERE r.id_reserva = %s;
        """,
        (id_reserva,),
    )
    cabecera = cursor.fetchone()
    if not cabecera:
        raise HTTPException(
            status_code=status.HTTP_404_NOT_FOUND,
            detail=f"No se encontró la reserva con ticket #{id_reserva}",
        )

    cursor.execute(
        """
        SELECT
            dr.id_variante_prenda,
            v.sku_variante,
            p.nombre AS prenda_nombre,
            t.nombre AS talla,
            c.nombre AS color,
            dr.cantidad,
            dr.precio_unitario,
            (dr.cantidad * dr.precio_unitario) AS subtotal
        FROM detalle_reserva dr
        JOIN variante_prenda v ON dr.id_variante_prenda = v.id_variante_prenda
        JOIN prenda p ON v.id_prenda = p.id_prenda
        JOIN talla t ON v.id_talla = t.id_talla
        JOIN color c ON v.id_color = c.id_color
        WHERE dr.id_reserva = %s
        ORDER BY dr.id_variante_prenda;
        """,
        (id_reserva,),
    )
    items = cursor.fetchall()

    codigo_ticket = f"TKT-{id_reserva:06d}"
    sucursal_nom = cabecera["sucursal_nombre"] or "Sucursal"
    qr_base64 = _generar_qr_ticket(id_reserva, codigo_ticket, sucursal_nom)

    resultado = dict(cabecera)
    resultado["codigo_ticket"] = codigo_ticket
    resultado["qr_base64"] = qr_base64
    resultado["items"] = items
    return resultado


def actualizar_estado_reserva_probador(
    cursor: Any,
    id_reserva: int,
    datos: ReservaProbadorEstadoActualizar,
    id_usuario: int | None,
    ip_address: str,
) -> dict:
    """Gestiona la transición de estados en tienda para probadores físicos (CU17).

    - Pendiente -> Preparado ('En Probador'): prendas entregadas en cabina.
    - Preparado/Pendiente -> Atendido ('Completada'): cliente compra las prendas.
    - Pendiente/Preparado -> Cancelado ('Liberar Stock'): reingresa el stock físico a tienda.
    """
    cursor.execute(
        """
        SELECT id_reserva, id_cliente, id_sucursal, estado, total
        FROM reserva
        WHERE id_reserva = %s;
        """,
        (id_reserva,),
    )
    reserva = cursor.fetchone()
    if not reserva:
        raise HTTPException(
            status_code=status.HTTP_404_NOT_FOUND,
            detail="La reserva especificada no existe",
        )

    estado_actual = reserva["estado"]
    nuevo_estado = datos.nuevo_estado

    if estado_actual == nuevo_estado:
        return obtener_ticket_reserva_qr(cursor, id_reserva)

    if estado_actual in ("Atendido", "Cancelado"):
        raise HTTPException(
            status_code=status.HTTP_409_CONFLICT,
            detail=f"La reserva ya está finalizada con estado '{estado_actual}' y no admite cambios",
        )

    # Obtener ítems de la reserva
    cursor.execute(
        """
        SELECT id_variante_prenda, cantidad, precio_unitario
        FROM detalle_reserva
        WHERE id_reserva = %s;
        """,
        (id_reserva,),
    )
    items_reserva = cursor.fetchall()

    codigo_ticket = f"TKT-{id_reserva:06d}"

    # Lógica según el nuevo estado
    if nuevo_estado == "Cancelado":
        # Devolver stock a la sucursal (reingreso de prendas no compradas)
        for it in items_reserva:
            cursor.execute(
                """
                INSERT INTO movimiento_inventario
                    (id_sucursal, id_variante_prenda, tipo, cantidad, motivo, id_usuario)
                VALUES (%s, %s, 'Entrada', %s, %s, %s);
                """,
                (
                    reserva["id_sucursal"],
                    it["id_variante_prenda"],
                    it["cantidad"],
                    f"Reingreso por cancelación de reserva de probador #{id_reserva} ({codigo_ticket})",
                    id_usuario,
                ),
            )

    elif nuevo_estado == "Atendido":
        # Consolidar la venta presencial en el mostrador
        subtotal = sum(Decimal(str(it["precio_unitario"])) * it["cantidad"] for it in items_reserva)
        cursor.execute(
            """
            INSERT INTO venta
                (id_cliente, id_sucursal, id_cajero, id_reserva, tipo_venta,
                 metodo_pago, subtotal, descuento, total)
            VALUES (%s, %s, %s, %s, 'Presencial', 'Efectivo', %s, 0.00, %s)
            RETURNING id_venta;
            """,
            (
                reserva["id_cliente"],
                reserva["id_sucursal"],
                id_usuario,
                id_reserva,
                subtotal,
                subtotal,
            ),
        )
        venta_row = cursor.fetchone()
        id_venta = venta_row["id_venta"]

        for it in items_reserva:
            subtotal_item = Decimal(str(it["precio_unitario"])) * it["cantidad"]
            cursor.execute(
                """
                INSERT INTO detalle_venta
                    (id_venta, id_variante_prenda, cantidad, precio_unitario, subtotal)
                VALUES (%s, %s, %s, %s, %s);
                """,
                (id_venta, it["id_variante_prenda"], it["cantidad"], it["precio_unitario"], subtotal_item),
            )

    # Actualizar estado de la reserva
    cursor.execute(
        "UPDATE reserva SET estado = %s, updated_at = NOW() WHERE id_reserva = %s;",
        (nuevo_estado, id_reserva),
    )

    # Registrar en bitácora inmutable (CU25)
    detalle_bitacora = (
        f"Reserva #{id_reserva} ({codigo_ticket}) transicionó de '{estado_actual}' a '{nuevo_estado}'. "
        f"Motivo: {datos.motivo or 'Gestión de probador en sucursal'}. "
        f"Sucursal: {reserva['id_sucursal']}."
    )
    registrar_bitacora(
        cursor=cursor,
        accion=ACCION_UPDATE,
        tabla_afectada="reserva",
        registro_id=id_reserva,
        detalle=detalle_bitacora,
        id_usuario=id_usuario,
        ip_address=ip_address,
    )

    return obtener_ticket_reserva_qr(cursor, id_reserva)


def listar_reservas_sucursal(
    cursor: Any,
    id_sucursal: int | None = None,
    estado: str | None = None,
    skip: int = 0,
    limit: int = 50,
) -> list[dict]:
    """Lista las reservas asignadas a una sucursal para la atención en probador (CU17)."""
    condiciones = ["1=1"]
    parametros: list[Any] = []

    if id_sucursal is not None:
        condiciones.append("r.id_sucursal = %s")
        parametros.append(id_sucursal)

    if estado is not None and estado.strip():
        condiciones.append("r.estado = %s")
        parametros.append(estado.strip())

    parametros.extend([limit, skip])

    cursor.execute(
        f"""
        SELECT
            r.id_reserva, r.id_cliente,
            CONCAT(c.nombre_completo) AS cliente_nombre,
            c.telefono AS cliente_telefono,
            r.id_sucursal, s.nombre AS sucursal_nombre,
            r.fecha_reserva, r.fecha_limite, r.estado, r.total,
            (SELECT COUNT(*) FROM detalle_reserva dr WHERE dr.id_reserva = r.id_reserva) AS total_prendas
        FROM reserva r
        JOIN sucursal s ON r.id_sucursal = s.id_sucursal
        LEFT JOIN cliente c ON r.id_cliente = c.id_cliente
        WHERE {" AND ".join(condiciones)}
        ORDER BY 
            CASE 
                WHEN r.estado = 'Pendiente' THEN 1
                WHEN r.estado = 'Preparado' THEN 2
                ELSE 3 
            END,
            r.fecha_reserva DESC
        LIMIT %s OFFSET %s;
        """,
        tuple(parametros),
    )
    return cursor.fetchall()
