"""Punto de arranque de la API de FashionStore.

Ejecutar en desarrollo:
    uvicorn app.main:app --reload
"""

import os
from contextlib import asynccontextmanager

from fastapi import FastAPI
from fastapi.middleware.cors import CORSMiddleware
from dotenv import load_dotenv

from app.database import close_pool

load_dotenv()


@asynccontextmanager
async def lifespan(app: FastAPI):
    """Ciclo de vida de la aplicación: libera el pool de conexiones al apagar."""
    yield
    close_pool()


app = FastAPI(
    title="FashionStore API",
    description="API de la tienda de moda FashionStore",
    version="0.1.0",
    lifespan=lifespan,
)

# Orígenes permitidos para el frontend web y la app móvil.
allowed_origins = os.getenv("ALLOWED_ORIGINS", "*").split(",")

app.add_middleware(
    CORSMiddleware,
    allow_origins=allowed_origins,
    allow_credentials=True,
    allow_methods=["*"],
    allow_headers=["*"],
)


@app.get("/", tags=["health"])
def read_root():
    """Mensaje de bienvenida de la API."""
    return {"message": "FashionStore API", "version": "0.1.0"}


@app.get("/health", tags=["health"])
def health_check():
    """Comprueba que la API responde."""
    return {"status": "ok"}


# Los routers se registran aquí a medida que se creen en app/routers/.
# Ejemplo:
# from app.routers import productos
# app.include_router(productos.router)
