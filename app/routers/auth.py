"""
=============================================================================
FASHIONSTORE - ROUTER DE AUTENTICACIÓN (CU01)
Sistemas de Información II - UAGRM
-----------------------------------------------------------------------------
Implementa el flujo principal del CU01 "Gestionar Inicio y Cierre de Sesión":
recibe las credenciales, las contrasta contra la tabla `usuario` de PostgreSQL
y devuelve un token JWT firmado con el rol jerárquico del usuario.

El cierre de sesión no requiere endpoint: el JWT no guarda estado en el
servidor, por lo que basta con que el frontend destruya el token (paso 10 del
flujo principal del caso de uso).
=============================================================================
"""

from fastapi import APIRouter, Depends, HTTPException, status

from app.database import get_db
from app.schemas.auth import RespuestaToken, SolicitudLogin
from app.services.auth_service import crear_token_acceso, verificar_password

router = APIRouter(tags=["Autenticación (CU01)"])

# Hash bcrypt de una contraseña arbitraria, usado como señuelo cuando el correo
# no existe. Permite ejecutar siempre una verificación bcrypt real y así igualar
# el tiempo de respuesta entre "correo inexistente" y "contraseña incorrecta".
# Sin esto, un atacante podría medir la latencia para deducir qué correos están
# registrados en el sistema (enumeración de usuarios).
_HASH_SEÑUELO = "$2b$12$zZo3V7AI.OyS0Nr3B.46Rev0BJawpm/pc9jSjS4u5anr.uEAleZX6"


@router.post(
    "/login/",
    response_model=RespuestaToken,
    status_code=status.HTTP_200_OK,
    summary="Iniciar sesión y obtener un token JWT",
)
def iniciar_sesion(credenciales: SolicitudLogin, cursor=Depends(get_db)):
    """Autentica a un usuario y emite su token de acceso.

    Lógica de seguridad aplicada, en orden:

      1. Se busca el correo en la tabla `usuario`, uniéndola con `rol` para
         recuperar el nombre textual del rol jerárquico en la misma consulta.
         La consulta es parametrizada (%s), lo que impide inyección SQL.
      2. Si el correo no existe, igualmente se ejecuta una verificación bcrypt
         contra un hash señuelo para no delatar por tiempo qué correos existen.
      3. Se compara la contraseña recibida con el hash bcrypt almacenado. Un
         fallo devuelve 401 sin precisar si falló el correo o la contraseña,
         para no dar pistas a un atacante.
      4. Solo después de validar las credenciales se comprueba el estado de la
         cuenta: una cuenta inactiva responde 403 (excepción B del CU01).
      5. Se firma el JWT con los claims que el frontend necesita pintar en la
         interfaz: id_usuario, correo, nombre completo y rol.

    Parámetros:
        credenciales: cuerpo JSON validado por Pydantic con `correo` y `password`.
        cursor: cursor de PostgreSQL inyectado por la dependencia `get_db`.

    Retorna:
        RespuestaToken: objeto con `access_token` (JWT) y `token_type` ("bearer").

    Errores:
        HTTP 401: correo inexistente o contraseña incorrecta.
        HTTP 403: credenciales válidas pero cuenta en estado 'Inactivo'.
    """
    # --- 1. Búsqueda del usuario y su rol -----------------------------------
    # LEFT JOIN: un usuario sin rol asignado debe poder autenticarse igualmente,
    # aunque quede sin privilegios en el panel.
    cursor.execute(
        """
        SELECT  u.id_usuario,
                u.nombre,
                u.apellido,
                u.correo,
                u.password_hash,
                u.estado,
                r.nombre AS rol
        FROM usuario u
        LEFT JOIN rol r ON u.id_role = r.id_rol
        WHERE u.correo = %s;
        """,
        (credenciales.correo,),
    )
    usuario = cursor.fetchone()

    # --- 2 y 3. Verificación de la contraseña -------------------------------
    # El hash a comparar es el real si el usuario existe, o el señuelo si no.
    # De este modo la operación bcrypt (deliberadamente lenta) se ejecuta
    # siempre y ambos caminos tardan lo mismo.
    hash_almacenado = usuario["password_hash"] if usuario else _HASH_SEÑUELO
    password_valida = verificar_password(credenciales.password, hash_almacenado)

    if usuario is None or not password_valida:
        raise HTTPException(
            status_code=status.HTTP_401_UNAUTHORIZED,
            detail="Credenciales incorrectas",
            # Cabecera exigida por el estándar HTTP para respuestas 401.
            headers={"WWW-Authenticate": "Bearer"},
        )

    # --- 4. Estado de la cuenta (excepción B del CU01) ----------------------
    # Se comprueba DESPUÉS de validar la contraseña: informar de una cuenta
    # suspendida a quien no conoce la clave sería filtrar información.
    if usuario["estado"] != "Activo":
        raise HTTPException(
            status_code=status.HTTP_403_FORBIDDEN,
            detail="Su cuenta se encuentra suspendida temporalmente",
        )

    # --- 5. Emisión del token -----------------------------------------------
    # El nombre viaja ya concatenado para que el frontend lo muestre tal cual
    # en la cabecera del panel, sin tener que componerlo.
    nombre_completo = f"{usuario['nombre']} {usuario['apellido']}".strip()

    token = crear_token_acceso({
        "id_usuario": usuario["id_usuario"],
        "correo": usuario["correo"],
        "nombre": nombre_completo,
        # Un usuario sin rol asignado recibe una etiqueta explícita en lugar de
        # un valor nulo, que rompería el tipado del frontend.
        "rol": usuario["rol"] or "Sin rol asignado",
        # `sub` (subject) es el claim estándar del RFC 7519 para identificar al
        # titular del token; debe ser una cadena.
        "sub": str(usuario["id_usuario"]),
    })

    return RespuestaToken(access_token=token, token_type="bearer")


# -----------------------------------------------------------------------------
# ALIAS SIN BARRA FINAL
# -----------------------------------------------------------------------------
# FastAPI redirige /api/login hacia /api/login/ con un 307, pero un redirect en
# una petición POST con CORS puede fallar en algunos navegadores. Registrar la
# ruta explícitamente evita ese riesgo. Se oculta de Swagger (include_in_schema)
# para no duplicar la misma operación en la documentación.
@router.post(
    "/login",
    response_model=RespuestaToken,
    status_code=status.HTTP_200_OK,
    include_in_schema=False,
)
def iniciar_sesion_sin_barra(credenciales: SolicitudLogin, cursor=Depends(get_db)):
    """Alias de `iniciar_sesion` para la ruta sin barra final.

    Parámetros:
        credenciales: mismo cuerpo JSON que el endpoint principal.
        cursor: cursor de PostgreSQL inyectado por `get_db`.

    Retorna:
        RespuestaToken: idéntica a la del endpoint /api/login/.
    """
    return iniciar_sesion(credenciales, cursor)
