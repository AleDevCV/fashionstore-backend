# =============================================================================
# FASHIONSTORE - IMAGEN DE LA API REST (FastAPI + Uvicorn)
# Sistemas de Información II - UAGRM
# -----------------------------------------------------------------------------
# Construye el contenedor que ejecuta el backend. Se usa python:3.12-slim porque
# es la misma versión del venv local (3.12.4), evitando diferencias de runtime
# entre el entorno de desarrollo y el contenedor.
# =============================================================================

FROM python:3.12-slim

# -----------------------------------------------------------------------------
# Variables de entorno del intérprete:
#   PYTHONDONTWRITEBYTECODE -> evita generar archivos .pyc dentro del contenedor
#   PYTHONUNBUFFERED        -> fuerza que los logs salgan al instante (sin buffer),
#                              necesario para ver la salida en "docker compose logs"
# -----------------------------------------------------------------------------
ENV PYTHONDONTWRITEBYTECODE=1 \
    PYTHONUNBUFFERED=1

# Directorio de trabajo dentro del contenedor
WORKDIR /code

# -----------------------------------------------------------------------------
# Instalación de dependencias en una capa separada del código fuente.
# Copiar primero requirements.txt aprovecha la caché de Docker: mientras no
# cambien las dependencias, no se reinstalan al modificar el código de la API.
# psycopg2-binary trae su propia libpq compilada, por eso no se instalan
# librerías de sistema adicionales (imagen más liviana).
# -----------------------------------------------------------------------------
COPY requirements.txt .
RUN pip install --no-cache-dir --upgrade pip && \
    pip install --no-cache-dir -r requirements.txt

# -----------------------------------------------------------------------------
# Copia del código de la aplicación (routers, models, schemas, services...).
# El .dockerignore excluye venv/, .git/ y .env para no inflar la imagen ni
# filtrar credenciales dentro del contenedor.
# -----------------------------------------------------------------------------
COPY ./app ./app

# Puerto interno donde Uvicorn escucha dentro del contenedor
EXPOSE 8000

# -----------------------------------------------------------------------------
# Arranque de la API. Se usa --host 0.0.0.0 (y no 127.0.0.1) para que el puerto
# quede expuesto fuera del contenedor y Docker pueda publicarlo hacia Windows.
# -----------------------------------------------------------------------------
CMD ["uvicorn", "app.main:app", "--host", "0.0.0.0", "--port", "8000"]
