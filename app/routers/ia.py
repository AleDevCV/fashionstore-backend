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

from fastapi import APIRouter, Depends, Request

from app.database import get_db
from app.schemas.ia import (
    AnaliticaVozPeticion,
    AnaliticaVozRespuesta,
    RecomendacionIAPeticion,
    RecomendacionIARespuesta,
)
from app.services.auth_service import get_current_user
from app.services.bitacora_service import obtener_ip_cliente
from app.services.ia_service import ai_service

router = APIRouter(prefix="/ia", tags=["Inteligencia Artificial"])


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
