"""
=============================================================================
FASHIONSTORE - ROUTER DE INTELIGENCIA ARTIFICIAL (CU22, CU23, CU25)
Sistemas de Información II - UAGRM
-----------------------------------------------------------------------------
Expone los endpoints protegidos para:
  - CU22: Asistente y Recomendador Virtual de Outfits.
  - CU23: Consultas Analíticas Ejecutivas por Voz y Reportes PDF.
Ambos endpoints integran trazabilidad forense e inmutable en bitácora (CU25).
=============================================================================
"""

from typing import Any
from fastapi import APIRouter, Depends, Request
from fastapi.security import HTTPAuthorizationCredentials, HTTPBearer

from app.database import get_db
from app.schemas.ia import (
    AnaliticaVozPeticion,
    AnaliticaVozRespuesta,
    RecomendacionIAPeticion,
    RecomendacionIARespuesta,
    TryOnPeticion,
    TryOnRespuesta,
)
from app.services.auth_service import decodificar_token_acceso, get_current_user
from app.services.bitacora_service import (
    ACCION_IA_TRYON,
    obtener_ip_cliente,
    registrar_bitacora,
)
from app.services.ia_service import ai_service
from app.services.tryon_service import tryon_service

router = APIRouter(prefix="/ia", tags=["Inteligencia Artificial"])

esquema_bearer_opcional = HTTPBearer(auto_error=False, description="Token JWT opcional para catálogo")


def get_current_user_opcional(
    credenciales: HTTPAuthorizationCredentials | None = Depends(esquema_bearer_opcional),
    cursor=Depends(get_db),
) -> dict[str, Any] | None:
    """Resuelve la sesión del usuario si se incluye token Bearer válido,

    o devuelve None para permitir el uso público desde el catálogo de prendas (CU14).
    """
    if not credenciales or not credenciales.credentials:
        return None
    claims = decodificar_token_acceso(credenciales.credentials)
    if not claims or "id_usuario" not in claims:
        return None
    cursor.execute(
        """
        SELECT u.id_usuario, u.nombre, u.apellido, u.correo, u.estado, u.id_role
        FROM usuario u
        WHERE u.id_usuario = %s AND u.estado = 'Activo';
        """,
        (claims["id_usuario"],),
    )
    usuario = cursor.fetchone()
    return dict(usuario) if usuario else None


@router.post(
    "/recomendar/",
    response_model=RecomendacionIARespuesta,
    summary="Consultar asistente y recomendador virtual de prendas vía IA (CU22)",
)
@router.post(
    "/recomendar",
    response_model=RecomendacionIARespuesta,
    include_in_schema=False,
)
def recomendar_outfit(
    peticion: RecomendacionIAPeticion,
    request: Request,
    cursor=Depends(get_db),
    usuario=Depends(get_current_user),
):
    """Genera recomendaciones personalizadas de prendas a partir de las preferencias del cliente.

    Integra validación estricta anti-alucinación sobre el catálogo real con stock físico
    y activa fallback automático ante indisponibilidad de la IA externa.
    """
    ip_address = obtener_ip_cliente(request)
    id_usuario = usuario.get("id_usuario") if isinstance(usuario, dict) else None
    return ai_service.recomendar_outfit(
        cursor=cursor,
        peticion=peticion,
        id_usuario=id_usuario,
        ip_address=ip_address,
    )


@router.post(
    "/analitica-voz/",
    response_model=AnaliticaVozRespuesta,
    summary="Realizar consultas analíticas generativas por voz vía IA (CU23)",
)
@router.post(
    "/analitica-voz",
    response_model=AnaliticaVozRespuesta,
    include_in_schema=False,
)
def analizar_voz(
    peticion: AnaliticaVozPeticion,
    request: Request,
    cursor=Depends(get_db),
    usuario=Depends(get_current_user),
):
    """Interpreta consultas ejecutivas dictadas en lenguaje natural, ejecuta consultas SQL

    estadísticas reales sobre PostgreSQL y genera reportes ejecutivos con opción a PDF.
    """
    ip_address = obtener_ip_cliente(request)
    id_usuario = usuario.get("id_usuario") if isinstance(usuario, dict) else None
    return ai_service.analizar_voz(
        cursor=cursor,
        peticion=peticion,
        id_usuario=id_usuario,
        ip_address=ip_address,
    )


@router.post(
    "/try-on/",
    response_model=TryOnRespuesta,
    summary="Generar vestidor virtual fotorealista con IA (Fase 2 / Try-On)",
)
@router.post(
    "/try-on",
    response_model=TryOnRespuesta,
    include_in_schema=False,
)
def probar_prenda_virtual(
    peticion: TryOnPeticion,
    request: Request,
    cursor=Depends(get_db),
    usuario: dict[str, Any] | None = Depends(get_current_user_opcional),
):
    """Procesa una composición fotorealista de la prenda elegida sobre la foto del usuario.

    Integra detección anatómica, warping afín tridimensional, sombra de contacto,
    ecualización ambiental en espacio HSV y refinamiento con Gemini Vision o respaldo instantáneo.
    Audita cada operación en la bitácora inmutable (CU25) con acción IA_TRYON.
    """
    ip_address = obtener_ip_cliente(request)
    id_usuario = usuario.get("id_usuario") if isinstance(usuario, dict) else None

    respuesta = tryon_service.procesar_tryon(cursor=cursor, peticion=peticion)

    id_prenda_audit = respuesta.metadatos_calce.prenda_id or peticion.id_prenda or peticion.id_variante_prenda
    if respuesta.metadatos_calce.es_fallback or not respuesta.es_generativo:
        metodo_audit = "opencv_fallback"
    elif respuesta.metodo_usado == "fashn_vton_ai":
        metodo_audit = "fashn_vton_ai"
    else:
        metodo_audit = "gemini_multimodal_tryon"
    id_prenda_texto = f"ID {id_prenda_audit}" if id_prenda_audit is not None else "externa personalizada"
    detalle = (
        f"Vestidor Virtual IA ({metodo_audit}, {respuesta.tiempo_procesamiento_ms}ms) "
        f"para prenda {id_prenda_texto}."
    )
    try:
        registrar_bitacora(
            cursor=cursor,
            accion=ACCION_IA_TRYON,
            tabla_afectada="prenda",
            registro_id=id_prenda_audit,
            detalle=detalle,
            id_usuario=id_usuario,
            ip_address=ip_address,
        )
    except Exception as e_bit:
        import logging
        logging.getLogger(__name__).error("Error registrando auditoría en bitácora para Try-On: %s", e_bit)

    return respuesta
