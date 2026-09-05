"""
=============================================================================
FASHIONSTORE - ESQUEMAS DE VALIDACIÓN DEL LOGIN (CU01)
Sistemas de Información II - UAGRM
-----------------------------------------------------------------------------
Modelos de Pydantic que definen el contrato de datos entre el frontend
(Angular / Flutter) y el endpoint POST /api/login/.

FastAPI usa estas clases para tres cosas a la vez:
  1. Validar automáticamente el cuerpo JSON de la petición (error 422 si falla).
  2. Serializar la respuesta con exactamente los campos declarados.
  3. Generar la documentación interactiva de Swagger en /docs.
=============================================================================
"""

from pydantic import BaseModel, EmailStr, Field


class SolicitudLogin(BaseModel):
    """Credenciales que envía el formulario de inicio de sesión.

    Campos:
        correo: correo electrónico registrado. `EmailStr` rechaza cadenas sin
                formato de email antes de que lleguen a la base de datos.
        password: contraseña en texto plano, que solo vive en memoria durante
                  la comparación contra el hash bcrypt. Nunca se registra en
                  logs ni se devuelve en ninguna respuesta.
    """

    correo: EmailStr = Field(
        ...,
        description="Correo electrónico del usuario registrado.",
        examples=["admin@fashionstore.com"],
    )
    password: str = Field(
        ...,
        min_length=1,
        max_length=72,  # Límite estructural del algoritmo bcrypt (72 bytes)
        description="Contraseña del usuario.",
        examples=["admin123"],
    )


class RespuestaToken(BaseModel):
    """Respuesta HTTP 200 con el token de acceso.

    La estructura reproduce la convención de OAuth2 y coincide con la interfaz
    `RespuestaLogin` que consume el AuthService de Angular.

    Campos:
        access_token: token JWT firmado por el backend.
        token_type: esquema de autorización; siempre "bearer".
    """

    access_token: str = Field(
        ...,
        description="Token JWT firmado que autoriza las peticiones siguientes.",
    )
    token_type: str = Field(
        default="bearer",
        description="Esquema de autorización esperado en la cabecera Authorization.",
    )


class UsuarioAutenticado(BaseModel):
    """Datos del usuario que viajan dentro del payload del JWT.

    Se declara como modelo aparte para documentar de forma explícita qué
    claims contiene el token, ya que el frontend los decodifica para mostrar
    el nombre y el rol en la cabecera del panel administrativo.

    Campos:
        id_usuario: clave primaria en la tabla `usuario`.
        correo: correo electrónico del usuario autenticado.
        nombre: nombre y apellido concatenados (ej: "Alejandro Sistemas").
        rol: nombre textual del rol (ej: "Administrador").
    """

    id_usuario: int
    correo: EmailStr
    nombre: str
    rol: str
