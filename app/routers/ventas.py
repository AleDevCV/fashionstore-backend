"""
=============================================================================
FASHIONSTORE - ROUTER DE VENTAS (CU15)
Sistemas de Información II - UAGRM
-----------------------------------------------------------------------------
Endpoints REST para el checkout digital:
- Validar stock del carrito antes del pago.
- Crear reserva (primer paso del checkout).
- Confirmar venta (post-pago, para integraciones internas o cajero).
- Historial de ventas del cliente y del panel administrativo.
=============================================================================
"""

from fastapi import APIRouter, Depends, Query, Request, status

from app.database import get_db
from app.schemas.venta import (
    ReservaPeticion,
    ReservaRespuesta,
    ValidarCarritoPeticion,
    ValidarCarritoRespuesta,
    VentaConfirmarPeticion,
    VentaDetalladaRespuesta,
    VentaRespuesta,
)
from app.services import venta_service as svc
from app.services.auth_service import get_current_user
from app.services.bitacora_service import obtener_ip_cliente

router = APIRouter(prefix="/ventas", tags=["Ventas y Carrito (CU15)"])


# ─────────────────────────────────────────────────────────────────────────────
# VALIDACIÓN DE CARRITO
# ─────────────────────────────────────────────────────────────────────────────

@router.post(
    "/validar-carrito",
    response_model=ValidarCarritoRespuesta,
    summary="Verificar disponibilidad de stock del carrito",
)
def validar_carrito(
    datos: ValidarCarritoPeticion,
    cursor=Depends(get_db),
    usuario=Depends(get_current_user),
):
    """Verifica si todos los artículos del carrito tienen stock suficiente
    en la sucursal seleccionada, antes de iniciar el checkout."""
    items = [
        {"id_variante_prenda": it.id_variante_prenda, "cantidad": it.cantidad}
        for it in datos.items
    ]
    return svc.validar_stock_carrito(cursor, items, datos.id_sucursal)


# ─────────────────────────────────────────────────────────────────────────────
# RESERVA
# ─────────────────────────────────────────────────────────────────────────────

@router.post(
    "/reserva",
    response_model=ReservaRespuesta,
    status_code=status.HTTP_201_CREATED,
    summary="Crear reserva desde el carrito (Checkout paso 1)",
)
@router.post("/reserva/", response_model=ReservaRespuesta, status_code=status.HTTP_201_CREATED, include_in_schema=False)
def crear_reserva(
    datos: ReservaPeticion,
    request: Request,
    cursor=Depends(get_db),
    usuario=Depends(get_current_user),
):
    """Crea una reserva bloqueando los artículos del carrito por 24 horas.

    El cliente debe completar el pago (Stripe o QR) dentro de ese plazo.
    Si el pago no se confirma, la reserva expira automáticamente.
    """
    ip = obtener_ip_cliente(request)
    id_usuario = usuario.get("id_usuario")
    return svc.crear_reserva(cursor=cursor, datos=datos, id_usuario=id_usuario, ip_address=ip)


@router.get(
    "/reserva/{id_reserva}",
    response_model=ReservaRespuesta,
    summary="Consultar estado de una reserva",
)
def obtener_reserva(
    id_reserva: int,
    cursor=Depends(get_db),
    usuario=Depends(get_current_user),
):
    """Devuelve el estado y detalle de una reserva específica."""
    return svc.obtener_reserva_por_id(cursor, id_reserva)


@router.get(
    "/mis-reservas/{id_cliente}",
    response_model=list[ReservaRespuesta],
    summary="Historial de reservas de un cliente",
)
def mis_reservas(
    id_cliente: int,
    cursor=Depends(get_db),
    usuario=Depends(get_current_user),
):
    """Lista todas las reservas de un cliente con su estado actual."""
    return svc.listar_reservas_cliente(cursor, id_cliente)


# ─────────────────────────────────────────────────────────────────────────────
# VENTA
# ─────────────────────────────────────────────────────────────────────────────

@router.post(
    "/confirmar",
    response_model=VentaDetalladaRespuesta,
    status_code=status.HTTP_201_CREATED,
    summary="Confirmar venta (cajero o integración interna post-pago)",
)
def confirmar_venta(
    datos: VentaConfirmarPeticion,
    request: Request,
    cursor=Depends(get_db),
    usuario=Depends(get_current_user),
):
    """Convierte una reserva en venta real y descuenta el inventario.

    Este endpoint es llamado internamente por el servicio de pagos
    (webhook de Stripe o confirmación de QR). También puede usarlo
    el cajero para ventas presenciales.
    """
    ip = obtener_ip_cliente(request)
    id_usuario = usuario.get("id_usuario")
    return svc.confirmar_venta(cursor=cursor, datos=datos, id_usuario=id_usuario, ip_address=ip)


@router.get(
    "/",
    response_model=list[VentaRespuesta],
    summary="Listar ventas (panel administrativo)",
)
@router.get("", response_model=list[VentaRespuesta], include_in_schema=False)
def listar_ventas(
    id_cliente: int | None = Query(default=None, description="Filtrar por cliente"),
    id_sucursal: int | None = Query(default=None, description="Filtrar por sucursal"),
    skip: int = Query(default=0, ge=0),
    limit: int = Query(default=50, ge=1, le=200),
    cursor=Depends(get_db),
    usuario=Depends(get_current_user),
):
    """Retorna el historial paginado de ventas con filtros opcionales."""
    return svc.listar_ventas(
        cursor=cursor,
        id_cliente=id_cliente,
        id_sucursal=id_sucursal,
        skip=skip,
        limit=limit,
    )


@router.get(
    "/{id_venta}",
    response_model=VentaDetalladaRespuesta,
    summary="Detalle de una venta",
)
def obtener_venta(
    id_venta: int,
    cursor=Depends(get_db),
    usuario=Depends(get_current_user),
):
    """Devuelve la cabecera y el desglose completo de una venta."""
    return svc.obtener_venta_por_id(cursor, id_venta)


@router.get(
    "/mis-pedidos/{id_cliente}",
    response_model=list[VentaRespuesta],
    summary="Historial de pedidos de un cliente",
)
def mis_pedidos(
    id_cliente: int,
    skip: int = Query(default=0, ge=0),
    limit: int = Query(default=20, ge=1, le=100),
    cursor=Depends(get_db),
    usuario=Depends(get_current_user),
):
    """Retorna todos los pedidos históricos del cliente autenticado."""
    return svc.listar_ventas(
        cursor=cursor,
        id_cliente=id_cliente,
        skip=skip,
        limit=limit,
    )
