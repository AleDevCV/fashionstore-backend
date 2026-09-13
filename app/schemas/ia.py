"""
=============================================================================
FASHIONSTORE - ESQUEMAS DE INTELIGENCIA ARTIFICIAL (CU22, CU23)
Sistemas de Información II - UAGRM
-----------------------------------------------------------------------------
Modelos Pydantic v2 para validación y serialización de los endpoints de IA:
  - CU22: Asistente y Recomendador Virtual de Outfits (Gemini 2.5 Flash).
  - CU23: Consultas Analíticas Ejecutivas por Voz y Reportes PDF (fpdf2).
=============================================================================
"""

from typing import Any
from pydantic import BaseModel, ConfigDict, Field


class RecomendacionIAPeticion(BaseModel):
    """Payload de entrada para el recomendador de prendas/outfits por IA (CU22)."""

    estilo: str | None = Field(
        default=None,
        description="Estilo deseado (Casual, Formal, Fiesta, Deportivo, Urbano, Elegante)",
        examples=["Formal"],
    )
    ocasion: str | None = Field(
        default=None,
        description="Ocasión del evento (Boda, Trabajo, Salida nocturna, Diario)",
        examples=["Boda"],
    )
    genero: str | None = Field(
        default=None,
        description="Género objetivo (Femenino, Masculino, Unisex)",
        examples=["Femenino"],
    )
    talla: str | None = Field(
        default=None,
        description="Talla preferida (S, M, L, XL)",
        examples=["M"],
    )
    temporada: str | None = Field(
        default=None,
        description="Temporada o colección asociada",
        examples=["Verano 2026"],
    )
    clima: str | None = Field(
        default=None,
        description="Condición climática (Cálido, Frío, Lluvioso)",
        examples=["Cálido"],
    )
    limite: int = Field(
        default=6,
        ge=1,
        le=20,
        description="Cantidad máxima de prendas a recomendar",
    )


class PrendaRecomendada(BaseModel):
    """Detalle de una prenda recomendada con verificación de stock real."""

    model_config = ConfigDict(from_attributes=True)

    id_prenda: int = Field(description="Identificador único de la prenda en BD")
    nombre: str = Field(description="Nombre comercial de la prenda")
    precio: float = Field(description="Precio unitario actual")
    stock_total: int = Field(description="Existencias físicas consolidadas > 0")
    imagen_url: str | None = Field(default=None, description="URL de imagen principal")
    categoria: str | None = Field(default=None, description="Categoría de la prenda")
    justificacion: str = Field(description="Explicación de estilismo generada por IA")


class RecomendacionIARespuesta(BaseModel):
    """Respuesta estructurada del recomendador virtual (CU22)."""

    mensaje_estilista: str = Field(description="Consejo global y síntesis de estilismo")
    es_fallback: bool = Field(
        default=False,
        description="True si la respuesta se generó mediante el catálogo popular por falla o indisponibilidad de la IA",
    )
    prendas: list[PrendaRecomendada] = Field(
        default_factory=list,
        description="Prendas validadas físicamente en stock",
    )


class AnaliticaVozPeticion(BaseModel):
    """Payload de entrada para la consulta analítica por voz (CU23)."""

    texto_voz: str = Field(
        ...,
        min_length=1,
        description="Texto transcrito obtenido mediante Web Speech API",
        examples=["Total de ventas de la sucursal Central en verano 2026"],
    )
    generar_pdf: bool = Field(
        default=False,
        description="Indica si debe compilarse y adjuntarse un reporte ejecutivo en PDF",
    )


class ParametrosAnalitica(BaseModel):
    """Parámetros semánticos extraídos por Gemini a partir del lenguaje natural."""

    metrica: str | None = Field(
        default=None,
        description="Métrica detectada: ventas_total, inventario_stock, compras_total",
        examples=["ventas_total"],
    )
    sucursal: str | None = Field(
        default=None,
        description="Nombre o identificador de sucursal detectada",
        examples=["Central"],
    )
    temporada: str | None = Field(
        default=None,
        description="Nombre de la temporada detectada",
        examples=["Verano 2026"],
    )
    fecha_inicio: str | None = Field(
        default=None,
        description="Fecha límite inferior (YYYY-MM-DD)",
        examples=["2026-01-01"],
    )
    fecha_fin: str | None = Field(
        default=None,
        description="Fecha límite superior (YYYY-MM-DD)",
        examples=["2026-03-31"],
    )


class ResultadoFila(BaseModel):
    """Fila agregada de la consulta SQL ejecutada."""

    etiqueta: str = Field(description="Etiqueta agrupada (mes, sucursal, categoría, etc.)")
    valor: float = Field(description="Monto monetario o suma estadística")
    cantidad_operaciones: int = Field(
        default=0,
        description="Conteo de transacciones o registros agregados",
    )


class AnaliticaVozRespuesta(BaseModel):
    """Respuesta integral con resultados estadísticos 100% reales de PostgreSQL (CU23)."""

    interpretacion: ParametrosAnalitica = Field(
        description="Parámetros estructurados interpretados por la IA",
    )
    consulta_sql_ejecutada: str = Field(
        description="Consulta SQL parametrizada ejecutada de forma transparente",
    )
    resultados: list[ResultadoFila] = Field(
        default_factory=list,
        description="Datos estadísticos reales obtenidos de la base de datos",
    )
    resumen_ejecutivo: str = Field(
        description="Síntesis analítica ejecutiva del resultado",
    )
    pdf_base64: str | None = Field(
        default=None,
        description="Contenido del documento PDF codificado en Base64 si se solicitó generar_pdf=True",
    )
