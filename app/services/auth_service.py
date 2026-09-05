"""
=============================================================================
FASHIONSTORE - SERVICIO DE SEGURIDAD Y AUTENTICACIÓN (CU01)
Sistemas de Información II - UAGRM
-----------------------------------------------------------------------------
Concentra toda la criptografía del sistema, separada de los routers para
cumplir el RNF06 (mantenibilidad por capas):

  - Verificación de contraseñas contra los hashes bcrypt de PostgreSQL.
  - Generación de hashes para nuevas contraseñas (se usará en el CU02).
  - Firma y validación de los tokens JWT que autorizan cada petición.

RNF01 (Seguridad de la Información): las contraseñas NUNCA se guardan ni se
comparan en texto plano; solo se contrasta el hash bcrypt almacenado.
=============================================================================
"""

import os
from datetime import datetime, timedelta, timezone
from typing import Any

from jose import JWTError, jwt
from passlib.context import CryptContext
from dotenv import load_dotenv

load_dotenv()

# -----------------------------------------------------------------------------
# CONFIGURACIÓN CRIPTOGRÁFICA
# -----------------------------------------------------------------------------

# Clave con la que se firman los tokens. Se lee del .env y jamás se escribe en
# el código fuente. Si cambia, todas las sesiones emitidas quedan invalidadas.
SECRET_KEY = os.getenv("SECRET_KEY", "")
JWT_ALGORITHM = os.getenv("JWT_ALGORITHM", "HS256")
ACCESS_TOKEN_EXPIRE_MINUTES = int(os.getenv("ACCESS_TOKEN_EXPIRE_MINUTES", "480"))

# Falla al arrancar en lugar de firmar tokens con una clave vacía, que sería
# trivial de falsificar por un atacante.
if not SECRET_KEY:
    raise RuntimeError(
        "SECRET_KEY no está definida en el archivo .env. "
        "Genere una con: python -c \"import secrets; print(secrets.token_urlsafe(48))\""
    )

# Contexto de hashing de passlib.
#   schemes=["bcrypt"] -> algoritmo de hash lento y con sal, resistente a
#                         ataques de fuerza bruta por GPU.
#   deprecated="auto"  -> marca como obsoleto cualquier esquema antiguo si en
#                         el futuro se migra a otro algoritmo (ej: argon2).
#
# NOTA DE COMPATIBILIDAD: passlib 1.7.4 solo funciona con bcrypt < 5.0. La
# versión está fijada en requirements.txt; ver el aviso de ese archivo.
pwd_context = CryptContext(schemes=["bcrypt"], deprecated="auto")


# -----------------------------------------------------------------------------
# GESTIÓN DE CONTRASEÑAS
# -----------------------------------------------------------------------------

def verificar_password(password_plano: str, password_hash: str) -> bool:
    """Compara una contraseña en texto plano contra su hash bcrypt.

    passlib extrae la sal y el factor de coste incrustados en el propio hash,
    vuelve a derivar la contraseña recibida con esos mismos parámetros y
    compara ambos resultados en tiempo constante, evitando filtrar información
    mediante ataques de temporización.

    Parámetros:
        password_plano: contraseña tal como la escribió el usuario en el login.
        password_hash: hash bcrypt almacenado en `usuario.password_hash`.

    Retorna:
        bool: True si la contraseña corresponde al hash; False en caso contrario.
              También devuelve False si el hash está corrupto o tiene un formato
              que passlib no reconoce, de modo que un registro dañado en la base
              de datos nunca provoque un error 500 en el endpoint de login.
    """
    try:
        return pwd_context.verify(password_plano, password_hash)
    except ValueError:
        # El hash guardado no es un bcrypt válido (registro manipulado o semilla
        # mal generada). Se trata como credencial inválida, no como fallo del
        # servidor.
        return False


def generar_hash_password(password_plano: str) -> str:
    """Genera el hash bcrypt de una contraseña nueva.

    Se usará al registrar usuarios desde el CU02 y al restablecer contraseñas
    en el CU04. passlib genera una sal aleatoria distinta en cada llamada, por
    lo que dos usuarios con la misma contraseña producen hashes diferentes.

    Parámetros:
        password_plano: contraseña elegida por el administrador o el usuario.

    Retorna:
        str: hash bcrypt listo para guardarse en la columna `password_hash`.
    """
    return pwd_context.hash(password_plano)


# -----------------------------------------------------------------------------
# GESTIÓN DE TOKENS JWT
# -----------------------------------------------------------------------------

def crear_token_acceso(
    datos: dict[str, Any],
    expiracion_minutos: int | None = None,
) -> str:
    """Firma un token JWT con los datos de la sesión del usuario.

    El token se compone de tres partes codificadas en Base64Url y separadas por
    puntos: cabecera, carga útil (claims) y firma HMAC-SHA256. Cualquier
    modificación del payload por parte del cliente invalida la firma, por lo
    que el contenido es legible pero NO manipulable.

    Parámetros:
        datos: claims propios de la aplicación (id_usuario, correo, nombre, rol).
        expiracion_minutos: vigencia del token. Si se omite, usa el valor de
                            ACCESS_TOKEN_EXPIRE_MINUTES del .env (8 horas).

    Retorna:
        str: token JWT firmado, listo para enviarse al frontend de Angular.
    """
    claims = datos.copy()

    minutos = expiracion_minutos or ACCESS_TOKEN_EXPIRE_MINUTES

    # Se usa UTC explícito: si se usara la hora local del contenedor, el token
    # expiraría antes o después de lo previsto según la zona horaria del host.
    emitido_en = datetime.now(timezone.utc)
    expira_en = emitido_en + timedelta(minutes=minutos)

    # Claims estándar del RFC 7519. `exp` e `iat` viajan como enteros Unix en
    # SEGUNDOS, que es lo que espera el AuthService de Angular.
    claims.update({
        "exp": int(expira_en.timestamp()),
        "iat": int(emitido_en.timestamp()),
    })

    return jwt.encode(claims, SECRET_KEY, algorithm=JWT_ALGORITHM)


def decodificar_token_acceso(token: str) -> dict[str, Any] | None:
    """Verifica la firma de un token JWT y devuelve sus claims.

    A diferencia del frontend (que solo lee el payload sin comprobar nada),
    aquí SÍ se valida criptográficamente la firma y la fecha de expiración.
    Esta función será la base de la dependencia `get_current_user` que protegerá
    los endpoints del CU02 en adelante.

    Parámetros:
        token: cadena JWT recibida en la cabecera `Authorization: Bearer <token>`.

    Retorna:
        dict | None: los claims del token si la firma es válida y no ha
                     expirado; None si el token fue manipulado, está mal
                     formado o ya venció.
    """
    try:
        return jwt.decode(token, SECRET_KEY, algorithms=[JWT_ALGORITHM])
    except JWTError:
        # Cubre firma inválida, algoritmo no permitido y token expirado.
        return None
