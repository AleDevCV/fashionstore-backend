"""
=============================================================================
FASHIONSTORE - SCRIPT DE SIEMBRA DE PERMISOS Y ROLES BASE (CU03)
Sistemas de Información II - UAGRM
-----------------------------------------------------------------------------
Puebla el catálogo maestro de permisos agrupados por módulo en la tabla
`permiso`, enlaza los permisos por defecto a los roles base en `rol_permiso`
y asegura la creación de los índices requeridos en `usuario_token`.

Ejecución: python database/seed_permisos.py
=============================================================================
"""

import os
import sys
import psycopg2
from psycopg2.extras import RealDictCursor
from dotenv import load_dotenv

load_dotenv()

DB_HOST = os.getenv("DB_HOST", "localhost")
DB_PORT = os.getenv("DB_PORT", "5432")
DB_NAME = os.getenv("DB_NAME", "fashionstore")
DB_USER = os.getenv("DB_USER", "postgres")
DB_PASSWORD = os.getenv("DB_PASSWORD", "fashionstore123")


PERMISOS_SISTEMA = [
    # Módulo: Usuarios
    ("Ver Usuarios", "usuarios.ver", "Usuarios", "Permite listar y consultar detalles de usuarios"),
    ("Crear Usuarios", "usuarios.crear", "Usuarios", "Permite registrar nuevas cuentas de usuario"),
    ("Editar Usuarios", "usuarios.editar", "Usuarios", "Permite actualizar datos y estados de usuarios"),
    ("Inactivar Usuarios", "usuarios.inactivar", "Usuarios", "Permite dar de baja lógica a usuarios"),

    # Módulo: Roles y Permisos
    ("Ver Roles y Permisos", "roles.ver", "Roles y Permisos", "Permite consultar roles y la matriz de permisos"),
    ("Asignar Permisos a Roles", "roles.asignar", "Roles y Permisos", "Permite modificar los permisos asociados a cada rol"),

    # Módulo: Clientes
    ("Ver Clientes", "clientes.ver", "Clientes", "Permite listar y consultar fichas de clientes"),
    ("Crear Clientes", "clientes.crear", "Clientes", "Permite registrar nuevos clientes"),
    ("Editar Clientes", "clientes.editar", "Clientes", "Permite actualizar información de clientes"),
    ("Inactivar Clientes", "clientes.inactivar", "Clientes", "Permite dar de baja lógica a clientes"),

    # Módulo: Sucursales
    ("Ver Geografía", "geografia.ver", "Sucursales", "Permite consultar ciudades y sucursales"),
    ("Gestionar Ciudades", "ciudades.gestionar", "Sucursales", "Permite crear y modificar ciudades"),
    ("Gestionar Sucursales", "sucursales.gestionar", "Sucursales", "Permite crear y actualizar sucursales"),

    # Módulo: Catálogo
    ("Ver Categorías", "categorias.ver", "Catálogo", "Permite consultar categorías del catálogo"),
    ("Gestionar Categorías", "categorias.gestionar", "Catálogo", "Permite crear, actualizar y dar baja a categorías"),
    ("Ver Prendas", "prendas.ver", "Catálogo", "Permite listar prendas del catálogo administrativo"),
    ("Gestionar Prendas", "prendas.gestionar", "Catálogo", "Permite crear, modificar y eliminar prendas y variantes"),

    # Módulo: Ventas/POS
    ("Realizar Ventas POS", "pos.vender", "Ventas/POS", "Permite registrar ventas presenciales en caja física"),
    ("Ver Reportes de Ventas", "ventas.ver", "Ventas/POS", "Permite consultar historial y reportes de ventas"),

    # Módulo: Auditoría/Bitácora
    ("Ver Bitácora", "bitacora.ver", "Auditoría/Bitácora", "Permite consultar registros inmutables de auditoría del sistema"),
]

# Asignación por rol (usando los códigos de permisos)
PERMISOS_POR_ROL = {
    "Administrador": [p[1] for p in PERMISOS_SISTEMA],  # Todos los permisos
    "Encargado de Sucursal": [
        "usuarios.ver",
        "clientes.ver",
        "geografia.ver",
        "sucursales.gestionar",
        "categorias.ver",
        "prendas.ver",
        "prendas.gestionar",
        "ventas.ver",
    ],
    "Cajero (POS)": [
        "clientes.ver",
        "clientes.crear",
        "prendas.ver",
        "pos.vender",
    ],
    "Cliente": [],  # Sin permisos administrativos
}


def ejecutar_seeding():
    print(f"Conectando a PostgreSQL en {DB_HOST}:{DB_PORT}/{DB_NAME}...")
    conn = psycopg2.connect(
        host=DB_HOST,
        port=DB_PORT,
        dbname=DB_NAME,
        user=DB_USER,
        password=DB_PASSWORD,
    )
    conn.autocommit = False

    try:
        with conn.cursor(cursor_factory=RealDictCursor) as cur:
            # 1. Asegurar columna modulo en tabla permiso
            print("1. Verificando esquema de la tabla 'permiso'...")
            cur.execute("""
                ALTER TABLE permiso ADD COLUMN IF NOT EXISTS modulo VARCHAR(100);
            """)

            # 2. Asegurar índices en usuario_token
            print("2. Creando índices en 'usuario_token'...")
            cur.execute("""
                CREATE UNIQUE INDEX IF NOT EXISTS idx_usuario_token_recuperacion 
                ON usuario_token(token_recuperacion);
            """)
            cur.execute("""
                CREATE INDEX IF NOT EXISTS idx_usuario_token_id_usuario 
                ON usuario_token(id_usuario);
            """)
            cur.execute("""
                CREATE INDEX IF NOT EXISTS idx_usuario_token_usuario_usado 
                ON usuario_token(id_usuario, usado);
            """)

            # 3. Insertar / Actualizar catálogo de permisos
            print("3. Sembrando catálogo de permisos...")
            for nombre, codigo, modulo, descripcion in PERMISOS_SISTEMA:
                cur.execute("""
                    INSERT INTO permiso (nombre, codigo, modulo, descripcion)
                    VALUES (%s, %s, %s, %s)
                    ON CONFLICT (codigo) DO UPDATE
                    SET nombre = EXCLUDED.nombre,
                        modulo = EXCLUDED.modulo,
                        descripcion = EXCLUDED.descripcion;
                """, (nombre, codigo, modulo, descripcion))

            # 4. Obtener mapeo de códigos a IDs de permisos
            cur.execute("SELECT id_permiso, codigo FROM permiso;")
            permiso_map = {row["codigo"]: row["id_permiso"] for row in cur.fetchall()}

            # 5. Obtener roles existentes
            cur.execute("SELECT id_rol, nombre FROM rol;")
            roles_existentes = {row["nombre"]: row["id_rol"] for row in cur.fetchall()}

            # 6. Sembrar rol_permiso por defecto
            print("4. Enlazando permisos por defecto a los roles...")
            for rol_nombre, codigos in PERMISOS_POR_ROL.items():
                if rol_nombre not in roles_existentes:
                    print(f"   [AVISO] Rol '{rol_nombre}' no encontrado en la BD. Omitiendo.")
                    continue

                id_rol = roles_existentes[rol_nombre]
                for cod in codigos:
                    if cod in permiso_map:
                        id_permiso = permiso_map[cod]
                        cur.execute("""
                            INSERT INTO rol_permiso (id_rol, id_permiso)
                            VALUES (%s, %s)
                            ON CONFLICT (id_rol, id_permiso) DO NOTHING;
                        """, (id_rol, id_permiso))

            # 7. Sincronizar secuencia de permiso
            cur.execute("SELECT setval('permiso_id_permiso_seq', COALESCE((SELECT MAX(id_permiso) FROM permiso), 1));")

            conn.commit()
            print("[OK] Seeding de permisos, roles e indices completado con exito.")
    except Exception as e:
        conn.rollback()
        print(f"[ERROR] Error durante el seeding: {e}", file=sys.stderr)
        raise
    finally:
        conn.close()


if __name__ == "__main__":
    ejecutar_seeding()
