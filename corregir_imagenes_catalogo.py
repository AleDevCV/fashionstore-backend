"""
corregir_imagenes_catalogo.py
=============================================================================
Script para actualizar el catálogo de prendas en la base de datos PostgreSQL:
1. Reemplaza todas las imágenes previas (Unsplash JPEG cuadradas con modelos)
   por imágenes PNG reales con fondo 100% transparente (recorte puro de prenda).
2. Sincroniza y renombra exactamente las prendas en la tabla `prenda` para que
   coincidan con la prenda PNG asignada.
3. Limpia registros duplicados en `imagen_prenda` y asegura consistencia.
=============================================================================
"""

import os
import sys
from urllib.parse import urlparse

# Permitir importar la app
sys.path.append(os.path.abspath(os.path.dirname(__file__)))

from dotenv import load_dotenv
import psycopg2
from psycopg2.extras import RealDictCursor

load_dotenv()

DB_HOST = os.getenv("DB_HOST", "localhost")
DB_PORT = os.getenv("DB_PORT", "5432")
DB_NAME = os.getenv("DB_NAME", "fashionstore")
DB_USER = os.getenv("DB_USER", "postgres")
DB_PASSWORD = os.getenv("DB_PASSWORD", "fashionstore123")


def es_url_unsplash(url: str) -> bool:
    """Valida si la URL pertenece al dominio Unsplash."""
    hostname = (urlparse(url).hostname or "").lower()
    return hostname == "unsplash.com" or hostname.endswith(".unsplash.com")

# Catálogo maestro con prendas PNG recortadas y transparentes
PRENDAS_ACTUALIZACION = [
    {
        "id_prenda": 3,
        "sku": "CHQ-CUERO-001",
        "nombre": "Chaqueta Biker de Cuero Negro",
        "descripcion": "Chaqueta estilo biker confeccionada en cuero vacuno negro genuino con cremalleras metálicas reforzadas, solapas cruzadas y corte ajustado.",
        "url_png": "https://pngimg.com/uploads/leather_jacket/leather_jacket_PNG51.png",
    },
    {
        "id_prenda": 4,
        "sku": "CALZ-URB-001",
        "nombre": "Zapatillas Urbanas Running Sport",
        "descripcion": "Calzado deportivo urbano con amortiguación ligera, suela antideslizante y diseño ergonómico transpirable.",
        "url_png": "https://pngimg.com/uploads/running_shoes/running_shoes_PNG5821.png",
    },
    {
        "id_prenda": 171,
        "sku": "CHQ-DENIM-002",
        "nombre": "Chaqueta Casual Azul con Cremallera",
        "descripcion": "Chaqueta ligera de corte regular en tono azul con cierre de cremallera frontal, bolsillos laterales y terminaciones elásticas.",
        "url_png": "https://pngimg.com/uploads/jacket/jacket_PNG8056.png",
    },
    {
        "id_prenda": 172,
        "sku": "BLZ-EJE-001",
        "nombre": "Chaqueta Formal Ejecutiva Negra",
        "descripcion": "Chaqueta sastrera ejecutiva en color negro estructurada con solapas clásicas, forro interior satinado y ajuste contemporáneo.",
        "url_png": "https://pngimg.com/uploads/jacket/jacket_PNG8059.png",
    },
    {
        "id_prenda": 173,
        "sku": "CAM-OXF-001",
        "nombre": "Camisa Oxford Manga Larga Celeste",
        "descripcion": "Camisa de vestir slim fit en algodón suave color celeste cielo con cuello camisero abotonado y botones perlados.",
        "url_png": "https://pngimg.com/uploads/dress_shirt/dress_shirt_PNG8110.png",
    },
    {
        "id_prenda": 174,
        "sku": "CAM-BLA-002",
        "nombre": "Camisa Formal Blanca Manga Larga",
        "descripcion": "Camisa clásica formal en popelina de algodón blanco puro con cuello reforzado para corbata y puños dobles.",
        "url_png": "https://pngimg.com/uploads/dress_shirt/dress_shirt_PNG8112.png",
    },
    {
        "id_prenda": 175,
        "sku": "CAM-LEN-003",
        "nombre": "Polera Polo Clásica Roja",
        "descripcion": "Polera estilo polo en piqué de algodón color rojo intenso con cuello acanalado y tapeta de tres botones.",
        "url_png": "https://pngimg.com/uploads/polo_shirt/polo_shirt_PNG8165.png",
    },
    {
        "id_prenda": 176,
        "sku": "BLU-FLO-001",
        "nombre": "Blusa Camisera Rosa Pastel",
        "descripcion": "Blusa femenina de corte estilizado en algodón fino color rosa pastel con botones al tono y cuello refinado.",
        "url_png": "https://pngimg.com/uploads/dress_shirt/dress_shirt_PNG8108.png",
    },
    {
        "id_prenda": 177,
        "sku": "BLU-HAL-002",
        "nombre": "Blusa Polo Piqué Blanca",
        "descripcion": "Blusa tipo polo confeccionada en piqué suave de algodón blanco con corte femenino entallado y cuello abotonado.",
        "url_png": "https://pngimg.com/uploads/polo_shirt/polo_shirt_PNG8166.png",
    },
    {
        "id_prenda": 178,
        "sku": "VES-GALA-001",
        "nombre": "Vestido Elegante de Noche Negro",
        "descripcion": "Vestido de cocktail de corte midi en tono negro satinado con silueta estilizada y diseño refinado para ocasiones formales.",
        "url_png": "https://pngimg.com/uploads/dress/dress_PNG196.png",
    },
    {
        "id_prenda": 179,
        "sku": "VES-MIDI-002",
        "nombre": "Vestido Cocktail Rojo Pasión",
        "descripcion": "Vestido de fiesta en tono rojo carmesí con escote en V y falda con caída natural para celebraciones.",
        "url_png": "https://pngimg.com/uploads/dress/dress_PNG188.png",
    },
    {
        "id_prenda": 180,
        "sku": "SWT-HOD-001",
        "nombre": "Suéter Tejido Urbano Marrón",
        "descripcion": "Suéter abrigado tejido en punto fino de color marrón avellana con cuello redondo acanalado y calce confortable.",
        "url_png": "https://pngimg.com/uploads/sweater/sweater_PNG83.png",
    },
    {
        "id_prenda": 181,
        "sku": "SWT-TOR-002",
        "nombre": "Suéter Tejido de Lana Gris",
        "descripcion": "Suéter clásico de cuello redondo confeccionado en mezcla de lana gris con puños y pretina reforzados.",
        "url_png": "https://pngimg.com/uploads/sweater/sweater_PNG80.png",
    },
    {
        "id_prenda": 182,
        "sku": "ABR-CAM-001",
        "nombre": "Abrigo Largo Elegante Camel",
        "descripcion": "Abrigo clásico de corte largo confeccionado en paño de lana tono camel con solapas anchas y abotonadura frontal simple.",
        "url_png": "https://pngimg.com/uploads/coat/coat_PNG72.png",
    },
    {
        "id_prenda": 183,
        "sku": "JEA-SLIM-001",
        "nombre": "Jeans Clásicos Azul Índigo",
        "descripcion": "Pantalón denim corte regular fit en mezclilla de algodón elastano con lavado clásico azul índigo.",
        "url_png": "https://pngimg.com/uploads/jeans/jeans_PNG5771.png",
    },
    {
        "id_prenda": 184,
        "sku": "JEA-WIDE-002",
        "nombre": "Jeans Rectos Clásicos Denim",
        "descripcion": "Jeans de corte recto en mezclilla resistente azul medio con tiro regular y costuras reforzadas en ocre.",
        "url_png": "https://pngimg.com/uploads/jeans/jeans_PNG5776.png",
    },
    {
        "id_prenda": 185,
        "sku": "PAN-CHI-001",
        "nombre": "Pantalón Casual Denim Oscuro",
        "descripcion": "Pantalón casual confeccionado en sarga resistente de algodón oscuro con bolsillos diagonales y calce moderno.",
        "url_png": "https://pngimg.com/uploads/jeans/jeans_PNG5778.png",
    },
    {
        "id_prenda": 186,
        "sku": "POL-BAS-001",
        "nombre": "Polera Básica Cuello Redondo Blanca",
        "descripcion": "Polera manga corta elaborada en 100% algodón suave peinado de color blanco con cuello redondo acanalado.",
        "url_png": "https://pngimg.com/uploads/tshirt/tshirt_PNG5452.png",
    },
    {
        "id_prenda": 187,
        "sku": "POL-GRA-002",
        "nombre": "Polera Básica Cuello Redondo Verde",
        "descripcion": "Polera casual de algodón peinado en tono verde esmeralda con calce regular y tejido fresco y transpirable.",
        "url_png": "https://pngimg.com/uploads/tshirt/tshirt_PNG5454.png",
    },
    {
        "id_prenda": 188,
        "sku": "CALZ-RUN-002",
        "nombre": "Zapatillas Running Deportivas Pro",
        "descripcion": "Zapatillas para correr de alto rendimiento con amortiguación reactiva, tejido de malla transpirable y suela de tracción.",
        "url_png": "https://pngimg.com/uploads/running_shoes/running_shoes_PNG5824.png",
    },
]


def ejecutar_correccion():
    print(f"Conectando a PostgreSQL ({DB_HOST}:{DB_PORT}/{DB_NAME})...")
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
            print("Iniciando actualización de prendas e imágenes transparentes PNG...")
            total_actualizados = 0

            for item in PRENDAS_ACTUALIZACION:
                # 1. Actualizar nombre, descripción y estado en tabla `prenda`
                cur.execute(
                    """
                    UPDATE prenda
                    SET nombre = %s,
                        descripcion = %s,
                        estado = 'Activo'
                    WHERE id_prenda = %s OR sku = %s
                    RETURNING id_prenda, nombre;
                    """,
                    (item["nombre"], item["descripcion"], item["id_prenda"], item["sku"]),
                )
                row = cur.fetchone()
                if not row:
                    print(f"  [WARN] Prenda {item['sku']} (ID {item['id_prenda']}) no encontrada en BD.")
                    continue

                actual_id = row["id_prenda"]

                # 2. Eliminar imágenes anteriores para evitar duplicados huérfanos
                cur.execute(
                    "DELETE FROM imagen_prenda WHERE id_prenda = %s;",
                    (actual_id,),
                )

                # 3. Insertar la nueva URL en PNG transparente como imagen principal
                cur.execute(
                    """
                    INSERT INTO imagen_prenda (id_prenda, url_imagen, es_principal)
                    VALUES (%s, %s, true);
                    """,
                    (actual_id, item["url_png"]),
                )

                total_actualizados += 1
                print(f"  [OK] Prenda #{actual_id} -> '{item['nombre']}' | PNG: {item['url_png']}")

            # Commit transaccional
            conn.commit()
            print(f"\n¡Actualización completada con éxito! {total_actualizados} prendas actualizadas.")

            # 4. Verificación exhaustiva
            print("\n--- Verificación en Base de Datos ---")
            cur.execute(
                """
                SELECT p.id_prenda, p.nombre, p.sku, p.estado, ip.url_imagen
                FROM prenda p
                LEFT JOIN imagen_prenda ip ON p.id_prenda = ip.id_prenda AND ip.es_principal = true
                ORDER BY p.id_prenda;
                """
            )
            rows = cur.fetchall()

            unsplash_count = 0
            png_count = 0
            activas_count = 0
            for r in rows:
                url = r["url_imagen"] or ""
                if es_url_unsplash(url):
                    unsplash_count += 1
                if url.lower().endswith(".png"):
                    png_count += 1
                if r["estado"] == "Activo":
                    activas_count += 1

            print(f"Total prendas en catálogo: {len(rows)}")
            print(f"Prendas con estado 'Activo': {activas_count}/{len(rows)}")
            print(f"Imágenes PNG transparentes: {png_count}/{len(rows)}")
            print(f"Imágenes Unsplash restantes: {unsplash_count}")

            if unsplash_count == 0 and png_count == len(rows) and activas_count == len(rows):
                print(">>> VERIFICACIÓN EXITOSA: 100% de prendas poseen PNG transparente, estado Activo y 0 URLs de Unsplash.")
            else:
                print(">>> ALERTA: Aún existen imágenes sin formato PNG, inactivas o con Unsplash.")

    except Exception as e:
        conn.rollback()
        print(f"Error durante la actualización: {e}")
        raise
    finally:
        conn.close()


if __name__ == "__main__":
    ejecutar_correccion()
