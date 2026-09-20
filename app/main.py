"""
=============================================================================
FASHIONSTORE - PUNTO DE ARRANQUE DE LA API REST
Sistemas de Información II - UAGRM
-----------------------------------------------------------------------------
Crea la instancia de FastAPI, configura CORS para los clientes Angular y
Flutter, registra los routers de cada módulo y administra el ciclo de vida del
pool de conexiones a PostgreSQL.

Ejecución local:      uvicorn app.main:app --reload
Ejecución en Docker:  docker compose up -d --build
=============================================================================
"""

import os
from contextlib import asynccontextmanager
from pathlib import Path

from fastapi import FastAPI, Request
from fastapi.middleware.cors import CORSMiddleware
from fastapi.responses import JSONResponse
from fastapi.staticfiles import StaticFiles
from psycopg2 import OperationalError
from dotenv import load_dotenv

from app.database import close_pool
from app.routers import (
    auth,
    catalogo,
    categorias,
    clientes,
    compras,
    comprobantes,
    geografia,
    ia,
    inventario,
    movimientos,
    pagos,
    prendas,
    proveedores,
    roles,
    temporadas,
    test_db,
    usuarios,
    ventas,
)

# Carga las variables definidas en el archivo .env hacia os.environ
load_dotenv()


@asynccontextmanager
async def lifespan(app: FastAPI):
    """Administra el ciclo de vida de la aplicación.

    El código anterior al `yield` se ejecuta al arrancar la API y el posterior
    al apagarla. Aquí se libera el pool de conexiones para que PostgreSQL no
    quede con sesiones huérfanas abiertas al detener el contenedor.

    Parámetros:
        app: instancia de FastAPI administrada por Uvicorn.

    Retorna:
        Generador asíncrono que cede el control mientras la API está activa.
    """
    yield
    close_pool()


# -----------------------------------------------------------------------------
# Instancia principal de la API. Los metadatos (title, description, version)
# son los que se muestran como encabezado en la documentación Swagger de /docs.
# -----------------------------------------------------------------------------
app = FastAPI(
    title="FashionStore API",
    description=(
        "API REST de la plataforma inteligente de comercio electrónico "
        "FashionStore. Iteración 1 (MVP): seguridad, clientes, geografía y "
        "catálogo maestro."
    ),
    version="0.1.0",
    lifespan=lifespan,
)

# -----------------------------------------------------------------------------
# CONFIGURACIÓN DE CORS
# Habilita que el frontend web (Angular) y la app móvil (Flutter), servidos
# desde un origen distinto al de la API, puedan consumir los endpoints.
# Los orígenes se leen del .env para restringirlos al desplegar en la nube.
# -----------------------------------------------------------------------------
allowed_origins = os.getenv("ALLOWED_ORIGINS", "*").split(",")

app.add_middleware(
    CORSMiddleware,
    allow_origins=allowed_origins,
    allow_credentials=True,
    allow_methods=["*"],
    allow_headers=["*"],
)


@app.exception_handler(OperationalError)
async def error_conexion_bd(request: Request, exc: OperationalError):
    """Traduce los fallos de conexión con PostgreSQL a una respuesta legible.

    Si el contenedor de la base de datos está apagado o las credenciales del
    .env son incorrectas, psycopg2 lanza OperationalError antes de que el
    endpoint llegue a ejecutarse. Sin este manejador, FastAPI respondería con
    un error 500 y un stacktrace crudo poco útil para diagnosticar.

    Parámetros:
        request: petición HTTP que provocó el error.
        exc: excepción OperationalError emitida por psycopg2.

    Retorna:
        JSONResponse con código HTTP 503 (Service Unavailable) y la causa.
    """
    return JSONResponse(
        status_code=503,
        content={
            "estado": "sin_conexion",
            "mensaje": (
                "No se pudo conectar con PostgreSQL. Verifique que el "
                "contenedor este levantado con 'docker compose ps'."
            ),
            "detalle": str(exc).strip(),
        },
    )


# -----------------------------------------------------------------------------
# REGISTRO DE ROUTERS
# Cada módulo funcional del sistema se registra aquí. A medida que avancen los
# Casos de Uso de la Iteración 1 se irán sumando: clientes (CU05), sucursales
# (CU06), categorias (CU07), prendas (CU08) y catalogo (CU14).
# -----------------------------------------------------------------------------
# CU01 - Inicio y cierre de sesion. Se monta bajo /api, por lo que sus rutas
# quedan expuestas como /api/login/ y /api/login.
app.include_router(auth.router, prefix="/api")

# CU02 - Administrar usuarios y asignar roles. El router ya declara su propio
# prefijo interno "/usuarios", por lo que las rutas quedan en /api/usuarios/.
app.include_router(usuarios.router, prefix="/api")

# CU03 - Roles y Permisos (RBAC) -> /api/permisos, /api/roles/...
app.include_router(roles.router, prefix="/api")

# CU06 - Ciudades y sucursales. El router declara /ciudades y /sucursales, por
# lo que quedan expuestas como /api/ciudades y /api/sucursales.
app.include_router(geografia.router, prefix="/api")

# CU05 - Fichas de clientes -> /api/clientes/
app.include_router(clientes.router, prefix="/api")

# CU07 - Categorias de prendas -> /api/categorias/
app.include_router(categorias.router, prefix="/api")

# CU08 - Prendas del catalogo -> /api/prendas/
app.include_router(prendas.router, prefix="/api")

# CU14 - Catalogo publico -> /api/catalogo/  (SIN token, acceso abierto)
app.include_router(catalogo.router, prefix="/api")

# CU12 - Directorio y administracion de proveedores -> /api/proveedores/
app.include_router(proveedores.router, prefix="/api")

# CU11 - Movimientos de inventario -> /api/movimientos-inventario/ y /api/inventario/movimientos/
app.include_router(movimientos.router, prefix="/api")

# CU13 - Adquisicion y compras transaccionales -> /api/compras/
app.include_router(compras.router, prefix="/api")

# CU09 - Temporadas y colecciones del catalogo -> /api/temporadas/
app.include_router(temporadas.router, prefix="/api")

# CU10 - Monitoreo y analitica multisucursal de inventario -> /api/inventario/resumen y /api/inventario/monitoreo
app.include_router(inventario.router, prefix="/api")

# CU22 & CU23 - Inteligencia Artificial (Recomendador y Analítica de Voz) -> /api/ia/
app.include_router(ia.router, prefix="/api")

# CU15 - Carrito de Compras, Reservas y Ventas Online -> /api/ventas/
app.include_router(ventas.router, prefix="/api")

# CU20 - Pasarela de Pagos (Stripe + QR Bolivia) -> /api/pagos/
app.include_router(pagos.router, prefix="/api")

# CU21 - Comprobantes Fiscales Digitales PDF -> /api/comprobantes/
app.include_router(comprobantes.router, prefix="/api")

app.include_router(test_db.router)

# Archivos estáticos: comprobantes PDF descargables desde /static/comprobantes/<archivo>.pdf
_static_dir = Path(__file__).parent / "static" / "comprobantes"
_static_dir.mkdir(parents=True, exist_ok=True)
app.mount("/static/comprobantes", StaticFiles(directory=str(_static_dir)), name="comprobantes")


@app.get("/", tags=["Estado del Servicio"], summary="Mensaje de bienvenida")
def read_root():
    """Endpoint raíz de la API.

    Retorna:
        dict: nombre, versión de la API y enlace a la documentación Swagger.
    """
    return {
        "mensaje": "FashionStore API",
        "version": "0.1.0",
        "documentacion": "/docs",
    }


@app.get("/health", tags=["Estado del Servicio"], summary="Chequeo de salud")
def health_check():
    """Comprueba que el proceso de la API responde peticiones HTTP.

    No consulta la base de datos a propósito: sirve para que Docker o el
    proveedor de nube distingan una caída de la API de una caída de PostgreSQL.

    Retorna:
        dict: estado del servicio.
    """
    return {"estado": "ok"}
