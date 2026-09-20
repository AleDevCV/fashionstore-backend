"""Script para poblar el catálogo de FashionStore con variedad de prendas reales,
imágenes en alta resolución, variantes y stock distribuido por sucursales.
"""

import sys
import os

# Permitir importar desde app
sys.path.append(os.path.abspath(os.path.join(os.path.dirname(__file__), "..")))

from app.database import get_connection
from psycopg2.extras import RealDictCursor


def poblar_catalogo():
    with get_connection() as conn:
        with conn.cursor(cursor_factory=RealDictCursor) as cur:
            print("1. Verificando y creando colores adicionales...")
            colores = [
                ("Negro", "#000000"),
                ("Blanco", "#FFFFFF"),
                ("Azul Denim", "#4682B4"),
                ("Rojo Borgoña", "#800020"),
                ("Camel", "#C19A6B"),
                ("Verde Oliva", "#556B2F"),
                ("Gris Melange", "#808080"),
                ("Azul Marino", "#000080"),
            ]
            for nombre, hex_val in colores:
                cur.execute(
                    """
                    INSERT INTO color (nombre, codigo_hex)
                    VALUES (%s, %s)
                    ON CONFLICT (nombre) DO UPDATE SET codigo_hex = EXCLUDED.codigo_hex;
                    """,
                    (nombre, hex_val),
                )

            # Mapeo de colores a sus IDs
            cur.execute("SELECT id_color, nombre FROM color;")
            color_map = {row["nombre"]: row["id_color"] for row in cur.fetchall()}

            print("2. Verificando y creando tallas...")
            cur.execute("SELECT id_talla, nombre FROM talla;")
            talla_map = {row["nombre"]: row["id_talla"] for row in cur.fetchall()}

            print("3. Verificando y creando categorías...")
            categorias = [
                ("Damas", "Prendas exclusivas y moda femenina"),
                ("Caballeros", "Moda masculina ejecutiva, casual y urbana"),
                ("Blusas", "Blusas formales, de seda, lino y tops elegantes"),
                ("Camisas", "Camisas de vestir, slim fit, casuales y lino"),
                ("Jeans", "Pantalones denim, cortes straight, slim y wide leg"),
                ("Chaquetas", "Casacas de cuero, denim, blazers y abrigos"),
                ("Vestidos", "Vestidos de gala, cocktail, midi y casuales"),
                ("Poleras & Remeras", "Remeras de algodon pima, estampadas y basicas"),
                ("Abrigos & Sweaters", "Sueteres tejidos, hoodies y abrigos pesados"),
                ("Pantalones & Chinos", "Pantalones de vestir, sastreros y chinos"),
                ("Calzados", "Sneakers urbanos, zapatillas running y calzado casual"),
            ]
            for nombre, desc in categorias:
                cur.execute(
                    """
                    INSERT INTO categoria (nombre, descripcion, estado)
                    VALUES (%s, %s, 'Activo')
                    ON CONFLICT (nombre) DO UPDATE SET descripcion = EXCLUDED.descripcion, estado = 'Activo';
                    """,
                    (nombre, desc),
                )

            cur.execute("SELECT id_categoria, nombre FROM categoria;")
            cat_map = {row["nombre"]: row["id_categoria"] for row in cur.fetchall()}

            print("4. Verificando sucursales...")
            cur.execute("SELECT id_sucursal, nombre FROM sucursal;")
            sucursales = [row["id_sucursal"] for row in cur.fetchall()]
            if not sucursales:
                print("Error: no hay sucursales registradas.")
                return

            print("5. Actualizando prenda 3 (Chaqueta de cuero auténtico)...")
            cur.execute(
                """
                UPDATE prenda
                SET nombre = 'Chaqueta Biker de Cuero Negro',
                    descripcion = 'Chaqueta estilo biker confeccionada en cuero vacuno negro genuino con cremalleras metálicas reforzadas, solapas cruzadas y corte ajustado.',
                    marca = 'Urban Leather Co.',
                    sku = 'CHQ-CUERO-001',
                    precio_base = 489.00,
                    id_categoria = %s,
                    genero = 'Unisex',
                    estado = 'Activo'
                WHERE id_prenda = 3;
                """,
                (cat_map.get("Chaquetas", 6),),
            )
            cur.execute("DELETE FROM imagen_prenda WHERE id_prenda = 3;")
            cur.execute(
                """
                INSERT INTO imagen_prenda (id_prenda, url_imagen, es_principal)
                VALUES (3, 'https://pngimg.com/uploads/leather_jacket/leather_jacket_PNG51.png', true);
                """
            )

            print("6. Actualizando prenda 4 (Zapatillas con imagen real)...")
            cur.execute(
                """
                UPDATE prenda
                SET nombre = 'Zapatillas Urbanas Running Sport',
                    descripcion = 'Calzado deportivo urbano con amortiguación ligera, suela antideslizante y diseño ergonómico transpirable.',
                    marca = 'Vogue Footwear',
                    sku = 'CALZ-URB-001',
                    precio_base = 319.00,
                    id_categoria = %s,
                    genero = 'Unisex',
                    estado = 'Activo'
                WHERE id_prenda = 4;
                """,
                (cat_map.get("Calzados", 7),),
            )
            cur.execute("DELETE FROM imagen_prenda WHERE id_prenda = 4;")
            cur.execute(
                """
                INSERT INTO imagen_prenda (id_prenda, url_imagen, es_principal)
                VALUES (4, 'https://pngimg.com/uploads/running_shoes/running_shoes_PNG5821.png', true);
                """
            )

            print("7. Insertando colección completa de prendas de moda...")
            prendas_seed = [
                {
                    "sku": "CHQ-DENIM-002",
                    "nombre": "Chaqueta Casual Azul con Cremallera",
                    "descripcion": "Chaqueta ligera de corte regular en tono azul con cierre de cremallera frontal, bolsillos laterales y terminaciones elásticas.",
                    "marca": "Denim Lab",
                    "precio_base": 329.00,
                    "categoria": "Chaquetas",
                    "genero": "Unisex",
                    "imagen": "https://pngimg.com/uploads/jacket/jacket_PNG8056.png",
                    "tallas": ["S", "M", "L", "XL"],
                    "colores": ["Azul Denim", "Negro"],
                },
                {
                    "sku": "BLZ-EJE-001",
                    "nombre": "Chaqueta Formal Ejecutiva Negra",
                    "descripcion": "Chaqueta sastrera ejecutiva en color negro estructurada con solapas clásicas, forro interior satinado y ajuste contemporáneo.",
                    "marca": "Zara Studio",
                    "precio_base": 389.00,
                    "categoria": "Chaquetas",
                    "genero": "Dama",
                    "imagen": "https://pngimg.com/uploads/jacket/jacket_PNG8059.png",
                    "tallas": ["S", "M", "L"],
                    "colores": ["Negro", "Azul Marino"],
                },
                {
                    "sku": "CAM-OXF-001",
                    "nombre": "Camisa Oxford Manga Larga Celeste",
                    "descripcion": "Camisa de vestir slim fit en algodón suave color celeste cielo con cuello camisero abotonado y botones perlados.",
                    "marca": "Nordic Line",
                    "precio_base": 189.00,
                    "categoria": "Camisas",
                    "genero": "Caballero",
                    "imagen": "https://pngimg.com/uploads/dress_shirt/dress_shirt_PNG8110.png",
                    "tallas": ["S", "M", "L", "XL"],
                    "colores": ["Azul Denim", "Blanco"],
                },
                {
                    "sku": "CAM-BLA-002",
                    "nombre": "Camisa Formal Blanca Manga Larga",
                    "descripcion": "Camisa clásica formal en popelina de algodón blanco puro con cuello reforzado para corbata y puños dobles.",
                    "marca": "FashionStore Signature",
                    "precio_base": 219.00,
                    "categoria": "Camisas",
                    "genero": "Caballero",
                    "imagen": "https://pngimg.com/uploads/dress_shirt/dress_shirt_PNG8112.png",
                    "tallas": ["M", "L", "XL"],
                    "colores": ["Blanco"],
                },
                {
                    "sku": "CAM-LEN-003",
                    "nombre": "Polera Polo Clásica Roja",
                    "descripcion": "Polera estilo polo en piqué de algodón color rojo intenso con cuello acanalado y tapeta de tres botones.",
                    "marca": "Urban Outfitter",
                    "precio_base": 179.00,
                    "categoria": "Camisas",
                    "genero": "Unisex",
                    "imagen": "https://pngimg.com/uploads/polo_shirt/polo_shirt_PNG8165.png",
                    "tallas": ["S", "M", "L", "XL"],
                    "colores": ["Rojo Borgoña", "Camel"],
                },
                {
                    "sku": "BLU-FLO-001",
                    "nombre": "Blusa Camisera Rosa Pastel",
                    "descripcion": "Blusa femenina de corte estilizado en algodón fino color rosa pastel con botones al tono y cuello refinado.",
                    "marca": "Atelier Dama",
                    "precio_base": 175.00,
                    "categoria": "Blusas",
                    "genero": "Dama",
                    "imagen": "https://pngimg.com/uploads/dress_shirt/dress_shirt_PNG8108.png",
                    "tallas": ["S", "M", "L"],
                    "colores": ["Blanco", "Camel"],
                },
                {
                    "sku": "BLU-HAL-002",
                    "nombre": "Blusa Polo Piqué Blanca",
                    "descripcion": "Blusa tipo polo confeccionada en piqué suave de algodón blanco con corte femenino entallado y cuello abotonado.",
                    "marca": "Atelier Dama",
                    "precio_base": 160.00,
                    "categoria": "Blusas",
                    "genero": "Dama",
                    "imagen": "https://pngimg.com/uploads/polo_shirt/polo_shirt_PNG8166.png",
                    "tallas": ["S", "M", "L"],
                    "colores": ["Blanco", "Negro"],
                },
                {
                    "sku": "VES-GALA-001",
                    "nombre": "Vestido Elegante de Noche Negro",
                    "descripcion": "Vestido de cocktail de corte midi en tono negro satinado con silueta estilizada y diseño refinado para ocasiones formales.",
                    "marca": "Vogue Evening",
                    "precio_base": 449.00,
                    "categoria": "Vestidos",
                    "genero": "Dama",
                    "imagen": "https://pngimg.com/uploads/dress/dress_PNG196.png",
                    "tallas": ["S", "M", "L"],
                    "colores": ["Negro", "Rojo Borgoña"],
                },
                {
                    "sku": "VES-MIDI-002",
                    "nombre": "Vestido Cocktail Rojo Pasión",
                    "descripcion": "Vestido de fiesta en tono rojo carmesí con escote en V y falda con caída natural para celebraciones.",
                    "marca": "Vogue Evening",
                    "precio_base": 269.00,
                    "categoria": "Vestidos",
                    "genero": "Dama",
                    "imagen": "https://pngimg.com/uploads/dress/dress_PNG188.png",
                    "tallas": ["S", "M", "L"],
                    "colores": ["Camel", "Verde Oliva"],
                },
                {
                    "sku": "SWT-HOD-001",
                    "nombre": "Suéter Tejido Urbano Marrón",
                    "descripcion": "Suéter abrigado tejido en punto fino de color marrón avellana con cuello redondo acanalado y calce confortable.",
                    "marca": "Urban Outfitter",
                    "precio_base": 249.00,
                    "categoria": "Abrigos & Sweaters",
                    "genero": "Unisex",
                    "imagen": "https://pngimg.com/uploads/sweater/sweater_PNG83.png",
                    "tallas": ["S", "M", "L", "XL"],
                    "colores": ["Camel", "Gris Melange", "Negro"],
                },
                {
                    "sku": "SWT-TOR-002",
                    "nombre": "Suéter Tejido de Lana Gris",
                    "descripcion": "Suéter clásico de cuello redondo confeccionado en mezcla de lana gris con puños y pretina reforzados.",
                    "marca": "Nordic Line",
                    "precio_base": 279.00,
                    "categoria": "Abrigos & Sweaters",
                    "genero": "Caballero",
                    "imagen": "https://pngimg.com/uploads/sweater/sweater_PNG80.png",
                    "tallas": ["M", "L", "XL"],
                    "colores": ["Negro", "Gris Melange"],
                },
                {
                    "sku": "ABR-CAM-001",
                    "nombre": "Abrigo Largo Elegante Camel",
                    "descripcion": "Abrigo clásico de corte largo confeccionado en paño de lana tono camel con solapas anchas y abotonadura frontal simple.",
                    "marca": "FashionStore Signature",
                    "precio_base": 520.00,
                    "categoria": "Abrigos & Sweaters",
                    "genero": "Dama",
                    "imagen": "https://pngimg.com/uploads/coat/coat_PNG72.png",
                    "tallas": ["S", "M", "L"],
                    "colores": ["Camel", "Negro"],
                },
                {
                    "sku": "JEA-SLIM-001",
                    "nombre": "Jeans Clásicos Azul Índigo",
                    "descripcion": "Pantalón denim corte regular fit en mezclilla de algodón elastano con lavado clásico azul índigo.",
                    "marca": "Denim Lab",
                    "precio_base": 239.00,
                    "categoria": "Jeans",
                    "genero": "Caballero",
                    "imagen": "https://pngimg.com/uploads/jeans/jeans_PNG5771.png",
                    "tallas": ["S", "M", "L", "XL"],
                    "colores": ["Azul Denim", "Negro"],
                },
                {
                    "sku": "JEA-WIDE-002",
                    "nombre": "Jeans Rectos Clásicos Denim",
                    "descripcion": "Jeans de corte recto en mezclilla resistente azul medio con tiro regular y costuras reforzadas en ocre.",
                    "marca": "Denim Lab",
                    "precio_base": 249.00,
                    "categoria": "Jeans",
                    "genero": "Dama",
                    "imagen": "https://pngimg.com/uploads/jeans/jeans_PNG5776.png",
                    "tallas": ["S", "M", "L"],
                    "colores": ["Azul Denim"],
                },
                {
                    "sku": "PAN-CHI-001",
                    "nombre": "Pantalón Casual Denim Oscuro",
                    "descripcion": "Pantalón casual confeccionado en sarga resistente de algodón oscuro con bolsillos diagonales y calce moderno.",
                    "marca": "Nordic Line",
                    "precio_base": 210.00,
                    "categoria": "Pantalones & Chinos",
                    "genero": "Caballero",
                    "imagen": "https://pngimg.com/uploads/jeans/jeans_PNG5778.png",
                    "tallas": ["S", "M", "L", "XL"],
                    "colores": ["Camel", "Azul Marino", "Verde Oliva"],
                },
                {
                    "sku": "POL-BAS-001",
                    "nombre": "Polera Básica Cuello Redondo Blanca",
                    "descripcion": "Polera manga corta elaborada en 100% algodón suave peinado de color blanco con cuello redondo acanalado.",
                    "marca": "Urban Outfitter",
                    "precio_base": 95.00,
                    "categoria": "Poleras & Remeras",
                    "genero": "Unisex",
                    "imagen": "https://pngimg.com/uploads/tshirt/tshirt_PNG5452.png",
                    "tallas": ["S", "M", "L", "XL"],
                    "colores": ["Blanco", "Negro", "Gris Melange"],
                },
                {
                    "sku": "POL-GRA-002",
                    "nombre": "Polera Básica Cuello Redondo Verde",
                    "descripcion": "Polera casual de algodón peinado en tono verde esmeralda con calce regular y tejido fresco y transpirable.",
                    "marca": "Urban Outfitter",
                    "precio_base": 120.00,
                    "categoria": "Poleras & Remeras",
                    "genero": "Caballero",
                    "imagen": "https://pngimg.com/uploads/tshirt/tshirt_PNG5454.png",
                    "tallas": ["S", "M", "L", "XL"],
                    "colores": ["Negro", "Blanco"],
                },
                {
                    "sku": "CALZ-RUN-002",
                    "nombre": "Zapatillas Running Deportivas Pro",
                    "descripcion": "Zapatillas para correr de alto rendimiento con amortiguación reactiva, tejido de malla transpirable y suela de tracción.",
                    "marca": "Vogue Footwear",
                    "precio_base": 399.00,
                    "categoria": "Calzados",
                    "genero": "Unisex",
                    "imagen": "https://pngimg.com/uploads/running_shoes/running_shoes_PNG5824.png",
                    "tallas": ["M", "L", "XL"],
                    "colores": ["Blanco", "Negro"],
                },
            ]

            total_prendas_creadas = 0
            total_variantes_creadas = 0
            total_inventario_creado = 0

            for p in prendas_seed:
                id_cat = cat_map.get(p["categoria"], 1)
                cur.execute(
                    """
                    INSERT INTO prenda (sku, nombre, descripcion, marca, precio_base, id_categoria, id_temporada, estado, genero)
                    VALUES (%s, %s, %s, %s, %s, %s, 1, 'Activo', %s)
                    ON CONFLICT (sku) DO UPDATE SET
                        nombre = EXCLUDED.nombre,
                        descripcion = EXCLUDED.descripcion,
                        marca = EXCLUDED.marca,
                        precio_base = EXCLUDED.precio_base,
                        id_categoria = EXCLUDED.id_categoria,
                        genero = EXCLUDED.genero,
                        estado = 'Activo'
                    RETURNING id_prenda;
                    """,
                    (
                        p["sku"],
                        p["nombre"],
                        p["descripcion"],
                        p["marca"],
                        p["precio_base"],
                        id_cat,
                        p["genero"],
                    ),
                )
                id_prenda = cur.fetchone()["id_prenda"]
                total_prendas_creadas += 1

                # Imagen de portada
                cur.execute(
                    "DELETE FROM imagen_prenda WHERE id_prenda = %s;", (id_prenda,)
                )
                cur.execute(
                    """
                    INSERT INTO imagen_prenda (id_prenda, url_imagen, es_principal)
                    VALUES (%s, %s, true);
                    """,
                    (id_prenda, p["imagen"]),
                )

                # Generar variantes
                for nom_talla in p["tallas"]:
                    id_talla = talla_map.get(nom_talla)
                    if not id_talla:
                        continue
                    for nom_color in p["colores"]:
                        id_color = color_map.get(nom_color)
                        if not id_color:
                            continue
                        sku_var = f"{p['sku']}-{nom_talla}-{nom_color[:3].upper()}"

                        cur.execute(
                            """
                            INSERT INTO variante_prenda (id_prenda, id_talla, id_color, sku_variante, precio_adicional)
                            VALUES (%s, %s, %s, %s, 0.00)
                            ON CONFLICT (sku_variante) DO UPDATE SET id_prenda = EXCLUDED.id_prenda
                            RETURNING id_variante_prenda;
                            """,
                            (id_prenda, id_talla, id_color, sku_var),
                        )
                        id_variante = cur.fetchone()["id_variante_prenda"]
                        total_variantes_creadas += 1

                        # Repartir stock en cada sucursal
                        for idx_suc, id_suc in enumerate(sucursales):
                            # Variar un poco el stock por sucursal y talla
                            stock_cantidad = 10 + (idx_suc * 4) + (id_talla * 2)
                            if nom_talla == "XL" and idx_suc == 2:
                                stock_cantidad = 3  # Ej. bajo stock para testing de alertas
                            cur.execute(
                                """
                                INSERT INTO inventario (id_sucursal, id_variante_prenda, stock)
                                VALUES (%s, %s, %s)
                                ON CONFLICT (id_sucursal, id_variante_prenda)
                                DO UPDATE SET stock = EXCLUDED.stock;
                                """,
                                (id_suc, id_variante, stock_cantidad),
                            )
                            total_inventario_creado += 1

            print("==================================================")
            print(f"Catálogo poblado exitosamente:")
            print(f"  - Nuevas prendas procesadas: {total_prendas_creadas}")
            print(f"  - Variantes de talla/color creadas: {total_variantes_creadas}")
            print(f"  - Registros de inventario actualizados: {total_inventario_creado}")
            print("==================================================")


if __name__ == "__main__":
    poblar_catalogo()
