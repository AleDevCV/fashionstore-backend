--
-- PostgreSQL database dump
--

\restrict ePzbOxa20W98saZz7uao2UT7bl0UxY9yZexmct4KcKI9c6CHEtnehhltOysfrpk

-- Dumped from database version 15.17 (Debian 15.17-0+deb12u1)
-- Dumped by pg_dump version 15.17 (Debian 15.17-0+deb12u1)

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

ALTER TABLE IF EXISTS ONLY public.venta DROP CONSTRAINT IF EXISTS venta_id_sucursal_fkey;
ALTER TABLE IF EXISTS ONLY public.venta DROP CONSTRAINT IF EXISTS venta_id_reserva_fkey;
ALTER TABLE IF EXISTS ONLY public.venta DROP CONSTRAINT IF EXISTS venta_id_cliente_fkey;
ALTER TABLE IF EXISTS ONLY public.venta DROP CONSTRAINT IF EXISTS venta_id_cajero_fkey;
ALTER TABLE IF EXISTS ONLY public.variante_prenda DROP CONSTRAINT IF EXISTS variante_prenda_id_talla_fkey;
ALTER TABLE IF EXISTS ONLY public.variante_prenda DROP CONSTRAINT IF EXISTS variante_prenda_id_prenda_fkey;
ALTER TABLE IF EXISTS ONLY public.variante_prenda DROP CONSTRAINT IF EXISTS variante_prenda_id_color_fkey;
ALTER TABLE IF EXISTS ONLY public.usuario_token DROP CONSTRAINT IF EXISTS usuario_token_id_usuario_fkey;
ALTER TABLE IF EXISTS ONLY public.usuario DROP CONSTRAINT IF EXISTS usuario_id_role_fkey;
ALTER TABLE IF EXISTS ONLY public.sucursal DROP CONSTRAINT IF EXISTS sucursal_id_encargado_fkey;
ALTER TABLE IF EXISTS ONLY public.sucursal DROP CONSTRAINT IF EXISTS sucursal_id_ciudad_fkey;
ALTER TABLE IF EXISTS ONLY public.rol_permiso DROP CONSTRAINT IF EXISTS rol_permiso_id_rol_fkey;
ALTER TABLE IF EXISTS ONLY public.rol_permiso DROP CONSTRAINT IF EXISTS rol_permiso_id_permiso_fkey;
ALTER TABLE IF EXISTS ONLY public.reserva DROP CONSTRAINT IF EXISTS reserva_id_sucursal_fkey;
ALTER TABLE IF EXISTS ONLY public.reserva DROP CONSTRAINT IF EXISTS reserva_id_cliente_fkey;
ALTER TABLE IF EXISTS ONLY public.prenda DROP CONSTRAINT IF EXISTS prenda_id_temporada_fkey;
ALTER TABLE IF EXISTS ONLY public.prenda DROP CONSTRAINT IF EXISTS prenda_id_categoria_fkey;
ALTER TABLE IF EXISTS ONLY public.pago_transaccion DROP CONSTRAINT IF EXISTS pago_transaccion_id_venta_fkey;
ALTER TABLE IF EXISTS ONLY public.movimiento_inventario DROP CONSTRAINT IF EXISTS movimiento_inventario_id_variante_prenda_fkey;
ALTER TABLE IF EXISTS ONLY public.movimiento_inventario DROP CONSTRAINT IF EXISTS movimiento_inventario_id_usuario_fkey;
ALTER TABLE IF EXISTS ONLY public.movimiento_inventario DROP CONSTRAINT IF EXISTS movimiento_inventario_id_sucursal_fkey;
ALTER TABLE IF EXISTS ONLY public.inventario DROP CONSTRAINT IF EXISTS inventario_id_variante_prenda_fkey;
ALTER TABLE IF EXISTS ONLY public.inventario DROP CONSTRAINT IF EXISTS inventario_id_sucursal_fkey;
ALTER TABLE IF EXISTS ONLY public.imagen_prenda DROP CONSTRAINT IF EXISTS imagen_prenda_id_prenda_fkey;
ALTER TABLE IF EXISTS ONLY public.detalle_venta DROP CONSTRAINT IF EXISTS detalle_venta_id_venta_fkey;
ALTER TABLE IF EXISTS ONLY public.detalle_venta DROP CONSTRAINT IF EXISTS detalle_venta_id_variante_prenda_fkey;
ALTER TABLE IF EXISTS ONLY public.detalle_reserva DROP CONSTRAINT IF EXISTS detalle_reserva_id_variante_prenda_fkey;
ALTER TABLE IF EXISTS ONLY public.detalle_reserva DROP CONSTRAINT IF EXISTS detalle_reserva_id_reserva_fkey;
ALTER TABLE IF EXISTS ONLY public.detalle_compra DROP CONSTRAINT IF EXISTS detalle_compra_id_variante_prenda_fkey;
ALTER TABLE IF EXISTS ONLY public.detalle_compra DROP CONSTRAINT IF EXISTS detalle_compra_id_compra_fkey;
ALTER TABLE IF EXISTS ONLY public.comprobante DROP CONSTRAINT IF EXISTS comprobante_id_venta_fkey;
ALTER TABLE IF EXISTS ONLY public.compra DROP CONSTRAINT IF EXISTS compra_id_usuario_fkey;
ALTER TABLE IF EXISTS ONLY public.compra DROP CONSTRAINT IF EXISTS compra_id_sucursal_fkey;
ALTER TABLE IF EXISTS ONLY public.compra DROP CONSTRAINT IF EXISTS compra_id_proveedor_fkey;
ALTER TABLE IF EXISTS ONLY public.categoria DROP CONSTRAINT IF EXISTS categoria_id_categoria_padre_fkey;
ALTER TABLE IF EXISTS ONLY public.bitacora DROP CONSTRAINT IF EXISTS bitacora_id_usuario_fkey;
DROP TRIGGER IF EXISTS trg_movimiento_inventario ON public.movimiento_inventario;
DROP TRIGGER IF EXISTS trg_auditoria_prendas ON public.prenda;
DROP INDEX IF EXISTS public.idx_variante_prenda_id_prenda;
DROP INDEX IF EXISTS public.idx_usuario_token_usuario_usado;
DROP INDEX IF EXISTS public.idx_usuario_token_recuperacion;
DROP INDEX IF EXISTS public.idx_usuario_token_id_usuario;
DROP INDEX IF EXISTS public.idx_temporada_fechas;
DROP INDEX IF EXISTS public.idx_proveedor_razon_social;
DROP INDEX IF EXISTS public.idx_proveedor_nit;
DROP INDEX IF EXISTS public.idx_prenda_id_temporada;
DROP INDEX IF EXISTS public.idx_movimiento_variante;
DROP INDEX IF EXISTS public.idx_movimiento_sucursal;
DROP INDEX IF EXISTS public.idx_movimiento_fecha;
DROP INDEX IF EXISTS public.idx_inventario_sucursal_variante;
DROP INDEX IF EXISTS public.idx_detalle_compra_variante;
DROP INDEX IF EXISTS public.idx_compra_sucursal;
DROP INDEX IF EXISTS public.idx_compra_proveedor;
DROP INDEX IF EXISTS public.idx_compra_fecha;
ALTER TABLE IF EXISTS ONLY public.venta DROP CONSTRAINT IF EXISTS venta_pkey;
ALTER TABLE IF EXISTS ONLY public.variante_prenda DROP CONSTRAINT IF EXISTS variante_prenda_sku_variante_key;
ALTER TABLE IF EXISTS ONLY public.variante_prenda DROP CONSTRAINT IF EXISTS variante_prenda_pkey;
ALTER TABLE IF EXISTS ONLY public.variante_prenda DROP CONSTRAINT IF EXISTS variante_prenda_id_prenda_id_talla_id_color_key;
ALTER TABLE IF EXISTS ONLY public.usuario_token DROP CONSTRAINT IF EXISTS usuario_token_pkey;
ALTER TABLE IF EXISTS ONLY public.usuario DROP CONSTRAINT IF EXISTS usuario_pkey;
ALTER TABLE IF EXISTS ONLY public.usuario DROP CONSTRAINT IF EXISTS usuario_correo_key;
ALTER TABLE IF EXISTS ONLY public.temporada DROP CONSTRAINT IF EXISTS temporada_pkey;
ALTER TABLE IF EXISTS ONLY public.temporada DROP CONSTRAINT IF EXISTS temporada_nombre_key;
ALTER TABLE IF EXISTS ONLY public.talla DROP CONSTRAINT IF EXISTS talla_pkey;
ALTER TABLE IF EXISTS ONLY public.talla DROP CONSTRAINT IF EXISTS talla_nombre_key;
ALTER TABLE IF EXISTS ONLY public.sucursal DROP CONSTRAINT IF EXISTS sucursal_pkey;
ALTER TABLE IF EXISTS ONLY public.rol DROP CONSTRAINT IF EXISTS rol_pkey;
ALTER TABLE IF EXISTS ONLY public.rol_permiso DROP CONSTRAINT IF EXISTS rol_permiso_pkey;
ALTER TABLE IF EXISTS ONLY public.rol DROP CONSTRAINT IF EXISTS rol_nombre_key;
ALTER TABLE IF EXISTS ONLY public.reserva DROP CONSTRAINT IF EXISTS reserva_pkey;
ALTER TABLE IF EXISTS ONLY public.proveedor DROP CONSTRAINT IF EXISTS proveedor_pkey;
ALTER TABLE IF EXISTS ONLY public.proveedor DROP CONSTRAINT IF EXISTS proveedor_nit_key;
ALTER TABLE IF EXISTS ONLY public.prenda DROP CONSTRAINT IF EXISTS prenda_sku_key;
ALTER TABLE IF EXISTS ONLY public.prenda DROP CONSTRAINT IF EXISTS prenda_pkey;
ALTER TABLE IF EXISTS ONLY public.permiso DROP CONSTRAINT IF EXISTS permiso_pkey;
ALTER TABLE IF EXISTS ONLY public.permiso DROP CONSTRAINT IF EXISTS permiso_nombre_key;
ALTER TABLE IF EXISTS ONLY public.permiso DROP CONSTRAINT IF EXISTS permiso_codigo_key;
ALTER TABLE IF EXISTS ONLY public.pago_transaccion DROP CONSTRAINT IF EXISTS pago_transaccion_transaccion_id_key;
ALTER TABLE IF EXISTS ONLY public.pago_transaccion DROP CONSTRAINT IF EXISTS pago_transaccion_pkey;
ALTER TABLE IF EXISTS ONLY public.movimiento_inventario DROP CONSTRAINT IF EXISTS movimiento_inventario_pkey;
ALTER TABLE IF EXISTS ONLY public.inventario DROP CONSTRAINT IF EXISTS inventario_pkey;
ALTER TABLE IF EXISTS ONLY public.imagen_prenda DROP CONSTRAINT IF EXISTS imagen_prenda_pkey;
ALTER TABLE IF EXISTS ONLY public.detalle_venta DROP CONSTRAINT IF EXISTS detalle_venta_pkey;
ALTER TABLE IF EXISTS ONLY public.detalle_reserva DROP CONSTRAINT IF EXISTS detalle_reserva_pkey;
ALTER TABLE IF EXISTS ONLY public.detalle_compra DROP CONSTRAINT IF EXISTS detalle_compra_pkey;
ALTER TABLE IF EXISTS ONLY public.comprobante DROP CONSTRAINT IF EXISTS comprobante_pkey;
ALTER TABLE IF EXISTS ONLY public.comprobante DROP CONSTRAINT IF EXISTS comprobante_numero_comprobante_key;
ALTER TABLE IF EXISTS ONLY public.compra DROP CONSTRAINT IF EXISTS compra_pkey;
ALTER TABLE IF EXISTS ONLY public.color DROP CONSTRAINT IF EXISTS color_pkey;
ALTER TABLE IF EXISTS ONLY public.color DROP CONSTRAINT IF EXISTS color_nombre_key;
ALTER TABLE IF EXISTS ONLY public.cliente DROP CONSTRAINT IF EXISTS cliente_pkey;
ALTER TABLE IF EXISTS ONLY public.cliente DROP CONSTRAINT IF EXISTS cliente_correo_key;
ALTER TABLE IF EXISTS ONLY public.cliente DROP CONSTRAINT IF EXISTS cliente_ci_key;
ALTER TABLE IF EXISTS ONLY public.ciudad DROP CONSTRAINT IF EXISTS ciudad_pkey;
ALTER TABLE IF EXISTS ONLY public.ciudad DROP CONSTRAINT IF EXISTS ciudad_nombre_key;
ALTER TABLE IF EXISTS ONLY public.categoria DROP CONSTRAINT IF EXISTS categoria_pkey;
ALTER TABLE IF EXISTS ONLY public.categoria DROP CONSTRAINT IF EXISTS categoria_nombre_key;
ALTER TABLE IF EXISTS ONLY public.bitacora DROP CONSTRAINT IF EXISTS bitacora_pkey;
ALTER TABLE IF EXISTS public.venta ALTER COLUMN id_venta DROP DEFAULT;
ALTER TABLE IF EXISTS public.variante_prenda ALTER COLUMN id_variante_prenda DROP DEFAULT;
ALTER TABLE IF EXISTS public.usuario_token ALTER COLUMN id_token DROP DEFAULT;
ALTER TABLE IF EXISTS public.usuario ALTER COLUMN id_usuario DROP DEFAULT;
ALTER TABLE IF EXISTS public.temporada ALTER COLUMN id_temporada DROP DEFAULT;
ALTER TABLE IF EXISTS public.talla ALTER COLUMN id_talla DROP DEFAULT;
ALTER TABLE IF EXISTS public.sucursal ALTER COLUMN id_sucursal DROP DEFAULT;
ALTER TABLE IF EXISTS public.rol ALTER COLUMN id_rol DROP DEFAULT;
ALTER TABLE IF EXISTS public.reserva ALTER COLUMN id_reserva DROP DEFAULT;
ALTER TABLE IF EXISTS public.proveedor ALTER COLUMN id_proveedor DROP DEFAULT;
ALTER TABLE IF EXISTS public.prenda ALTER COLUMN id_prenda DROP DEFAULT;
ALTER TABLE IF EXISTS public.permiso ALTER COLUMN id_permiso DROP DEFAULT;
ALTER TABLE IF EXISTS public.pago_transaccion ALTER COLUMN id_pago DROP DEFAULT;
ALTER TABLE IF EXISTS public.movimiento_inventario ALTER COLUMN id_movimiento DROP DEFAULT;
ALTER TABLE IF EXISTS public.imagen_prenda ALTER COLUMN id_imagen DROP DEFAULT;
ALTER TABLE IF EXISTS public.comprobante ALTER COLUMN id_comprobante DROP DEFAULT;
ALTER TABLE IF EXISTS public.compra ALTER COLUMN id_compra DROP DEFAULT;
ALTER TABLE IF EXISTS public.color ALTER COLUMN id_color DROP DEFAULT;
ALTER TABLE IF EXISTS public.cliente ALTER COLUMN id_cliente DROP DEFAULT;
ALTER TABLE IF EXISTS public.ciudad ALTER COLUMN id_ciudad DROP DEFAULT;
ALTER TABLE IF EXISTS public.categoria ALTER COLUMN id_categoria DROP DEFAULT;
ALTER TABLE IF EXISTS public.bitacora ALTER COLUMN id_bitacora DROP DEFAULT;
DROP SEQUENCE IF EXISTS public.venta_id_venta_seq;
DROP TABLE IF EXISTS public.venta;
DROP SEQUENCE IF EXISTS public.variante_prenda_id_variante_prenda_seq;
DROP TABLE IF EXISTS public.variante_prenda;
DROP SEQUENCE IF EXISTS public.usuario_token_id_token_seq;
DROP TABLE IF EXISTS public.usuario_token;
DROP SEQUENCE IF EXISTS public.usuario_id_usuario_seq;
DROP TABLE IF EXISTS public.usuario;
DROP SEQUENCE IF EXISTS public.temporada_id_temporada_seq;
DROP TABLE IF EXISTS public.temporada;
DROP SEQUENCE IF EXISTS public.talla_id_talla_seq;
DROP TABLE IF EXISTS public.talla;
DROP SEQUENCE IF EXISTS public.sucursal_id_sucursal_seq;
DROP TABLE IF EXISTS public.sucursal;
DROP TABLE IF EXISTS public.rol_permiso;
DROP SEQUENCE IF EXISTS public.rol_id_rol_seq;
DROP TABLE IF EXISTS public.rol;
DROP SEQUENCE IF EXISTS public.reserva_id_reserva_seq;
DROP TABLE IF EXISTS public.reserva;
DROP SEQUENCE IF EXISTS public.proveedor_id_proveedor_seq;
DROP TABLE IF EXISTS public.proveedor;
DROP SEQUENCE IF EXISTS public.prenda_id_prenda_seq;
DROP TABLE IF EXISTS public.prenda;
DROP SEQUENCE IF EXISTS public.permiso_id_permiso_seq;
DROP TABLE IF EXISTS public.permiso;
DROP SEQUENCE IF EXISTS public.pago_transaccion_id_pago_seq;
DROP TABLE IF EXISTS public.pago_transaccion;
DROP SEQUENCE IF EXISTS public.movimiento_inventario_id_movimiento_seq;
DROP TABLE IF EXISTS public.movimiento_inventario;
DROP TABLE IF EXISTS public.inventario;
DROP SEQUENCE IF EXISTS public.imagen_prenda_id_imagen_seq;
DROP TABLE IF EXISTS public.imagen_prenda;
DROP TABLE IF EXISTS public.detalle_venta;
DROP TABLE IF EXISTS public.detalle_reserva;
DROP TABLE IF EXISTS public.detalle_compra;
DROP SEQUENCE IF EXISTS public.comprobante_id_comprobante_seq;
DROP TABLE IF EXISTS public.comprobante;
DROP SEQUENCE IF EXISTS public.compra_id_compra_seq;
DROP TABLE IF EXISTS public.compra;
DROP SEQUENCE IF EXISTS public.color_id_color_seq;
DROP TABLE IF EXISTS public.color;
DROP SEQUENCE IF EXISTS public.cliente_id_cliente_seq;
DROP TABLE IF EXISTS public.cliente;
DROP SEQUENCE IF EXISTS public.ciudad_id_ciudad_seq;
DROP TABLE IF EXISTS public.ciudad;
DROP SEQUENCE IF EXISTS public.categoria_id_categoria_seq;
DROP TABLE IF EXISTS public.categoria;
DROP SEQUENCE IF EXISTS public.bitacora_id_bitacora_seq;
DROP TABLE IF EXISTS public.bitacora;
DROP FUNCTION IF EXISTS public.auditar_prendas();
DROP FUNCTION IF EXISTS public.actualizar_stock_por_movimiento();
DROP EXTENSION IF EXISTS "uuid-ossp";
--
-- Name: uuid-ossp; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS "uuid-ossp" WITH SCHEMA public;


--
-- Name: EXTENSION "uuid-ossp"; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION "uuid-ossp" IS 'generate universally unique identifiers (UUIDs)';


--
-- Name: actualizar_stock_por_movimiento(); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.actualizar_stock_por_movimiento() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
BEGIN
    IF NEW.tipo = 'Entrada' THEN
        INSERT INTO inventario (id_sucursal, id_variante_prenda, stock)
        VALUES (NEW.id_sucursal, NEW.id_variante_prenda, NEW.cantidad)
        ON CONFLICT (id_sucursal, id_variante_prenda)
        DO UPDATE SET stock = inventario.stock + NEW.cantidad;
    ELSIF NEW.tipo IN ('Salida', 'Traspaso') THEN
        IF COALESCE((SELECT stock FROM inventario
            WHERE id_sucursal = NEW.id_sucursal AND id_variante_prenda = NEW.id_variante_prenda), 0) < NEW.cantidad THEN
            RAISE EXCEPTION 'Stock insuficiente en la sucursal para realizar este movimiento.';
        END IF;
        UPDATE inventario
        SET stock = stock - NEW.cantidad
        WHERE id_sucursal = NEW.id_sucursal AND id_variante_prenda = NEW.id_variante_prenda;
    END IF;
    RETURN NEW;
END;
$$;


ALTER FUNCTION public.actualizar_stock_por_movimiento() OWNER TO postgres;

--
-- Name: auditar_prendas(); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.auditar_prendas() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
BEGIN
    IF (TG_OP = 'INSERT') THEN
        INSERT INTO bitacora (accion, tabla_afectada, registro_id, detalle)
        VALUES ('INSERT', 'prenda', NEW.id_prenda, 'Se registró una nueva prenda con SKU: ' || NEW.sku || ', Nombre: ' || NEW.nombre);
        RETURN NEW;
    ELSIF (TG_OP = 'UPDATE') THEN
        INSERT INTO bitacora (accion, tabla_afectada, registro_id, detalle)
        VALUES ('UPDATE', 'prenda', NEW.id_prenda, 'Se modificó la prenda. SKU anterior: ' || OLD.sku || ' -> SKU nuevo: ' || NEW.sku);
        RETURN NEW;
    ELSIF (TG_OP = 'DELETE') THEN
        INSERT INTO bitacora (accion, tabla_afectada, registro_id, detalle)
        VALUES ('DELETE', 'prenda', OLD.id_prenda, 'Se eliminó la prenda con SKU: ' || OLD.sku);
        RETURN OLD;
    END IF;
    RETURN NULL;
END;
$$;


ALTER FUNCTION public.auditar_prendas() OWNER TO postgres;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: bitacora; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.bitacora (
    id_bitacora integer NOT NULL,
    id_usuario integer,
    accion character varying(100) NOT NULL,
    tabla_afectada character varying(100) NOT NULL,
    registro_id integer,
    detalle text,
    ip_address character varying(45),
    fecha timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);


ALTER TABLE public.bitacora OWNER TO postgres;

--
-- Name: bitacora_id_bitacora_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.bitacora_id_bitacora_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.bitacora_id_bitacora_seq OWNER TO postgres;

--
-- Name: bitacora_id_bitacora_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.bitacora_id_bitacora_seq OWNED BY public.bitacora.id_bitacora;


--
-- Name: categoria; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.categoria (
    id_categoria integer NOT NULL,
    nombre character varying(100) NOT NULL,
    descripcion character varying(255),
    id_categoria_padre integer,
    estado character varying(20) DEFAULT 'Activo'::character varying,
    CONSTRAINT categoria_estado_check CHECK (((estado)::text = ANY (ARRAY[('Activo'::character varying)::text, ('Inactivo'::character varying)::text])))
);


ALTER TABLE public.categoria OWNER TO postgres;

--
-- Name: categoria_id_categoria_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.categoria_id_categoria_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.categoria_id_categoria_seq OWNER TO postgres;

--
-- Name: categoria_id_categoria_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.categoria_id_categoria_seq OWNED BY public.categoria.id_categoria;


--
-- Name: ciudad; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.ciudad (
    id_ciudad integer NOT NULL,
    nombre character varying(100) NOT NULL
);


ALTER TABLE public.ciudad OWNER TO postgres;

--
-- Name: ciudad_id_ciudad_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.ciudad_id_ciudad_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.ciudad_id_ciudad_seq OWNER TO postgres;

--
-- Name: ciudad_id_ciudad_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.ciudad_id_ciudad_seq OWNED BY public.ciudad.id_ciudad;


--
-- Name: cliente; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.cliente (
    id_cliente integer NOT NULL,
    ci character varying(20) NOT NULL,
    nombre_completo character varying(200) NOT NULL,
    telefono character varying(20),
    correo character varying(150),
    direccion_envio character varying(255),
    estado character varying(20) DEFAULT 'Activo'::character varying,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    updated_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT cliente_estado_check CHECK (((estado)::text = ANY (ARRAY[('Activo'::character varying)::text, ('Inactivo'::character varying)::text])))
);


ALTER TABLE public.cliente OWNER TO postgres;

--
-- Name: cliente_id_cliente_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.cliente_id_cliente_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.cliente_id_cliente_seq OWNER TO postgres;

--
-- Name: cliente_id_cliente_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.cliente_id_cliente_seq OWNED BY public.cliente.id_cliente;


--
-- Name: color; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.color (
    id_color integer NOT NULL,
    nombre character varying(50) NOT NULL,
    codigo_hex character varying(10)
);


ALTER TABLE public.color OWNER TO postgres;

--
-- Name: color_id_color_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.color_id_color_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.color_id_color_seq OWNER TO postgres;

--
-- Name: color_id_color_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.color_id_color_seq OWNED BY public.color.id_color;


--
-- Name: compra; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.compra (
    id_compra integer NOT NULL,
    id_proveedor integer,
    id_sucursal integer,
    fecha timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    total numeric(12,2) DEFAULT 0.00 NOT NULL,
    id_usuario integer
);


ALTER TABLE public.compra OWNER TO postgres;

--
-- Name: compra_id_compra_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.compra_id_compra_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.compra_id_compra_seq OWNER TO postgres;

--
-- Name: compra_id_compra_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.compra_id_compra_seq OWNED BY public.compra.id_compra;


--
-- Name: comprobante; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.comprobante (
    id_comprobante integer NOT NULL,
    id_venta integer,
    numero_comprobante character varying(50) NOT NULL,
    nit_ci character varying(20) NOT NULL,
    razon_social character varying(150) NOT NULL,
    fecha_emision timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    url_pdf character varying(255)
);


ALTER TABLE public.comprobante OWNER TO postgres;

--
-- Name: comprobante_id_comprobante_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.comprobante_id_comprobante_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.comprobante_id_comprobante_seq OWNER TO postgres;

--
-- Name: comprobante_id_comprobante_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.comprobante_id_comprobante_seq OWNED BY public.comprobante.id_comprobante;


--
-- Name: detalle_compra; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.detalle_compra (
    id_compra integer NOT NULL,
    id_variante_prenda integer NOT NULL,
    cantidad integer NOT NULL,
    costo_unitario numeric(10,2) NOT NULL,
    CONSTRAINT detalle_compra_cantidad_check CHECK ((cantidad > 0)),
    CONSTRAINT detalle_compra_costo_unitario_check CHECK ((costo_unitario >= (0)::numeric))
);


ALTER TABLE public.detalle_compra OWNER TO postgres;

--
-- Name: detalle_reserva; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.detalle_reserva (
    id_reserva integer NOT NULL,
    id_variante_prenda integer NOT NULL,
    cantidad integer DEFAULT 1 NOT NULL,
    precio_unitario numeric(10,2) NOT NULL,
    CONSTRAINT detalle_reserva_cantidad_check CHECK ((cantidad > 0))
);


ALTER TABLE public.detalle_reserva OWNER TO postgres;

--
-- Name: detalle_venta; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.detalle_venta (
    id_venta integer NOT NULL,
    id_variante_prenda integer NOT NULL,
    cantidad integer NOT NULL,
    precio_unitario numeric(10,2) NOT NULL,
    subtotal numeric(10,2) NOT NULL,
    CONSTRAINT detalle_venta_cantidad_check CHECK ((cantidad > 0))
);


ALTER TABLE public.detalle_venta OWNER TO postgres;

--
-- Name: imagen_prenda; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.imagen_prenda (
    id_imagen integer NOT NULL,
    id_prenda integer,
    url_imagen character varying(255) NOT NULL,
    es_principal boolean DEFAULT false,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);


ALTER TABLE public.imagen_prenda OWNER TO postgres;

--
-- Name: imagen_prenda_id_imagen_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.imagen_prenda_id_imagen_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.imagen_prenda_id_imagen_seq OWNER TO postgres;

--
-- Name: imagen_prenda_id_imagen_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.imagen_prenda_id_imagen_seq OWNED BY public.imagen_prenda.id_imagen;


--
-- Name: inventario; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.inventario (
    id_sucursal integer NOT NULL,
    id_variante_prenda integer NOT NULL,
    stock integer DEFAULT 0 NOT NULL,
    CONSTRAINT inventario_stock_check CHECK ((stock >= 0))
);


ALTER TABLE public.inventario OWNER TO postgres;

--
-- Name: movimiento_inventario; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.movimiento_inventario (
    id_movimiento integer NOT NULL,
    id_sucursal integer,
    id_variante_prenda integer,
    tipo character varying(20) NOT NULL,
    cantidad integer NOT NULL,
    motivo character varying(255) NOT NULL,
    id_usuario integer,
    fecha timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT movimiento_inventario_cantidad_check CHECK ((cantidad > 0)),
    CONSTRAINT movimiento_inventario_tipo_check CHECK (((tipo)::text = ANY (ARRAY[('Entrada'::character varying)::text, ('Salida'::character varying)::text, ('Traspaso'::character varying)::text])))
);


ALTER TABLE public.movimiento_inventario OWNER TO postgres;

--
-- Name: movimiento_inventario_id_movimiento_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.movimiento_inventario_id_movimiento_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.movimiento_inventario_id_movimiento_seq OWNER TO postgres;

--
-- Name: movimiento_inventario_id_movimiento_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.movimiento_inventario_id_movimiento_seq OWNED BY public.movimiento_inventario.id_movimiento;


--
-- Name: pago_transaccion; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.pago_transaccion (
    id_pago integer NOT NULL,
    id_venta integer,
    pasarela character varying(50) NOT NULL,
    transaccion_id character varying(100) NOT NULL,
    monto numeric(10,2) NOT NULL,
    estado_pago character varying(50) NOT NULL,
    payload_respuesta jsonb,
    fecha timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);


ALTER TABLE public.pago_transaccion OWNER TO postgres;

--
-- Name: pago_transaccion_id_pago_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.pago_transaccion_id_pago_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.pago_transaccion_id_pago_seq OWNER TO postgres;

--
-- Name: pago_transaccion_id_pago_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.pago_transaccion_id_pago_seq OWNED BY public.pago_transaccion.id_pago;


--
-- Name: permiso; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.permiso (
    id_permiso integer NOT NULL,
    nombre character varying(100) NOT NULL,
    codigo character varying(100) NOT NULL,
    descripcion character varying(255),
    modulo character varying(100)
);


ALTER TABLE public.permiso OWNER TO postgres;

--
-- Name: permiso_id_permiso_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.permiso_id_permiso_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.permiso_id_permiso_seq OWNER TO postgres;

--
-- Name: permiso_id_permiso_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.permiso_id_permiso_seq OWNED BY public.permiso.id_permiso;


--
-- Name: prenda; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.prenda (
    id_prenda integer NOT NULL,
    sku character varying(50) NOT NULL,
    nombre character varying(150) NOT NULL,
    descripcion text,
    marca character varying(100) DEFAULT 'FashionStore'::character varying,
    precio_base numeric(10,2) NOT NULL,
    id_categoria integer,
    id_temporada integer,
    estado character varying(20) DEFAULT 'Activo'::character varying,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    updated_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    genero character varying(20) DEFAULT 'Unisex'::character varying,
    CONSTRAINT prenda_estado_check CHECK (((estado)::text = ANY (ARRAY[('Activo'::character varying)::text, ('Inactivo'::character varying)::text, ('Borrador'::character varying)::text]))),
    CONSTRAINT prenda_genero_check CHECK (((genero)::text = ANY (ARRAY[('Dama'::character varying)::text, ('Caballero'::character varying)::text, ('Unisex'::character varying)::text, ('Nino'::character varying)::text]))),
    CONSTRAINT prenda_precio_base_check CHECK ((precio_base >= (0)::numeric))
);


ALTER TABLE public.prenda OWNER TO postgres;

--
-- Name: prenda_id_prenda_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.prenda_id_prenda_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.prenda_id_prenda_seq OWNER TO postgres;

--
-- Name: prenda_id_prenda_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.prenda_id_prenda_seq OWNED BY public.prenda.id_prenda;


--
-- Name: proveedor; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.proveedor (
    id_proveedor integer NOT NULL,
    nit character varying(30) NOT NULL,
    razon_social character varying(150) NOT NULL,
    contacto character varying(100),
    telefono character varying(20),
    correo character varying(150),
    direccion character varying(255),
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);


ALTER TABLE public.proveedor OWNER TO postgres;

--
-- Name: proveedor_id_proveedor_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.proveedor_id_proveedor_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.proveedor_id_proveedor_seq OWNER TO postgres;

--
-- Name: proveedor_id_proveedor_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.proveedor_id_proveedor_seq OWNED BY public.proveedor.id_proveedor;


--
-- Name: reserva; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.reserva (
    id_reserva integer NOT NULL,
    id_cliente integer,
    id_sucursal integer,
    fecha_reserva timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    fecha_limite timestamp without time zone NOT NULL,
    estado character varying(30) DEFAULT 'Pendiente'::character varying,
    total numeric(10,2) DEFAULT 0.00 NOT NULL,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    updated_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT reserva_estado_check CHECK (((estado)::text = ANY (ARRAY[('Pendiente'::character varying)::text, ('Preparado'::character varying)::text, ('Atendido'::character varying)::text, ('Cancelado'::character varying)::text])))
);


ALTER TABLE public.reserva OWNER TO postgres;

--
-- Name: reserva_id_reserva_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.reserva_id_reserva_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.reserva_id_reserva_seq OWNER TO postgres;

--
-- Name: reserva_id_reserva_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.reserva_id_reserva_seq OWNED BY public.reserva.id_reserva;


--
-- Name: rol; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.rol (
    id_rol integer NOT NULL,
    nombre character varying(50) NOT NULL,
    descripcion character varying(255),
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    updated_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);


ALTER TABLE public.rol OWNER TO postgres;

--
-- Name: rol_id_rol_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.rol_id_rol_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.rol_id_rol_seq OWNER TO postgres;

--
-- Name: rol_id_rol_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.rol_id_rol_seq OWNED BY public.rol.id_rol;


--
-- Name: rol_permiso; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.rol_permiso (
    id_rol integer NOT NULL,
    id_permiso integer NOT NULL
);


ALTER TABLE public.rol_permiso OWNER TO postgres;

--
-- Name: sucursal; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.sucursal (
    id_sucursal integer NOT NULL,
    nombre character varying(100) NOT NULL,
    direccion character varying(255) NOT NULL,
    telefono character varying(20),
    id_ciudad integer,
    id_encargado integer,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    updated_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);


ALTER TABLE public.sucursal OWNER TO postgres;

--
-- Name: sucursal_id_sucursal_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.sucursal_id_sucursal_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.sucursal_id_sucursal_seq OWNER TO postgres;

--
-- Name: sucursal_id_sucursal_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.sucursal_id_sucursal_seq OWNED BY public.sucursal.id_sucursal;


--
-- Name: talla; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.talla (
    id_talla integer NOT NULL,
    nombre character varying(10) NOT NULL,
    descripcion character varying(50)
);


ALTER TABLE public.talla OWNER TO postgres;

--
-- Name: talla_id_talla_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.talla_id_talla_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.talla_id_talla_seq OWNER TO postgres;

--
-- Name: talla_id_talla_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.talla_id_talla_seq OWNED BY public.talla.id_talla;


--
-- Name: temporada; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.temporada (
    id_temporada integer NOT NULL,
    nombre character varying(100) NOT NULL,
    descripcion character varying(255),
    fecha_inicio date NOT NULL,
    fecha_fin date NOT NULL,
    estado boolean DEFAULT true NOT NULL,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT chk_temporada_fechas CHECK ((fecha_inicio <= fecha_fin))
);


ALTER TABLE public.temporada OWNER TO postgres;

--
-- Name: temporada_id_temporada_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.temporada_id_temporada_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.temporada_id_temporada_seq OWNER TO postgres;

--
-- Name: temporada_id_temporada_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.temporada_id_temporada_seq OWNED BY public.temporada.id_temporada;


--
-- Name: usuario; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.usuario (
    id_usuario integer NOT NULL,
    nombre character varying(100) NOT NULL,
    apellido character varying(100) NOT NULL,
    correo character varying(150) NOT NULL,
    password_hash character varying(255) NOT NULL,
    telefono character varying(20),
    estado character varying(20) DEFAULT 'Activo'::character varying,
    id_role integer,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    updated_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT usuario_estado_check CHECK (((estado)::text = ANY (ARRAY[('Activo'::character varying)::text, ('Inactivo'::character varying)::text])))
);


ALTER TABLE public.usuario OWNER TO postgres;

--
-- Name: usuario_id_usuario_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.usuario_id_usuario_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.usuario_id_usuario_seq OWNER TO postgres;

--
-- Name: usuario_id_usuario_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.usuario_id_usuario_seq OWNED BY public.usuario.id_usuario;


--
-- Name: usuario_token; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.usuario_token (
    id_token integer NOT NULL,
    id_usuario integer,
    token_recuperacion character varying(255),
    expiracion timestamp without time zone,
    usado boolean DEFAULT false,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);


ALTER TABLE public.usuario_token OWNER TO postgres;

--
-- Name: usuario_token_id_token_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.usuario_token_id_token_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.usuario_token_id_token_seq OWNER TO postgres;

--
-- Name: usuario_token_id_token_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.usuario_token_id_token_seq OWNED BY public.usuario_token.id_token;


--
-- Name: variante_prenda; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.variante_prenda (
    id_variante_prenda integer NOT NULL,
    id_prenda integer,
    id_talla integer,
    id_color integer,
    sku_variante character varying(100) NOT NULL,
    precio_adicional numeric(10,2) DEFAULT 0.00
);


ALTER TABLE public.variante_prenda OWNER TO postgres;

--
-- Name: variante_prenda_id_variante_prenda_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.variante_prenda_id_variante_prenda_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.variante_prenda_id_variante_prenda_seq OWNER TO postgres;

--
-- Name: variante_prenda_id_variante_prenda_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.variante_prenda_id_variante_prenda_seq OWNED BY public.variante_prenda.id_variante_prenda;


--
-- Name: venta; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.venta (
    id_venta integer NOT NULL,
    id_cliente integer,
    id_sucursal integer,
    id_cajero integer,
    id_reserva integer,
    tipo_venta character varying(20) NOT NULL,
    metodo_pago character varying(30) NOT NULL,
    subtotal numeric(10,2) NOT NULL,
    descuento numeric(10,2) DEFAULT 0.00,
    total numeric(10,2) NOT NULL,
    fecha_venta timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT venta_metodo_pago_check CHECK (((metodo_pago)::text = ANY (ARRAY[('Efectivo'::character varying)::text, ('Tarjeta'::character varying)::text, ('QR'::character varying)::text, ('Transferencia'::character varying)::text]))),
    CONSTRAINT venta_tipo_venta_check CHECK (((tipo_venta)::text = ANY (ARRAY[('Presencial'::character varying)::text, ('Online'::character varying)::text])))
);


ALTER TABLE public.venta OWNER TO postgres;

--
-- Name: venta_id_venta_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.venta_id_venta_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.venta_id_venta_seq OWNER TO postgres;

--
-- Name: venta_id_venta_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.venta_id_venta_seq OWNED BY public.venta.id_venta;


--
-- Name: bitacora id_bitacora; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.bitacora ALTER COLUMN id_bitacora SET DEFAULT nextval('public.bitacora_id_bitacora_seq'::regclass);


--
-- Name: categoria id_categoria; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.categoria ALTER COLUMN id_categoria SET DEFAULT nextval('public.categoria_id_categoria_seq'::regclass);


--
-- Name: ciudad id_ciudad; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ciudad ALTER COLUMN id_ciudad SET DEFAULT nextval('public.ciudad_id_ciudad_seq'::regclass);


--
-- Name: cliente id_cliente; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cliente ALTER COLUMN id_cliente SET DEFAULT nextval('public.cliente_id_cliente_seq'::regclass);


--
-- Name: color id_color; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.color ALTER COLUMN id_color SET DEFAULT nextval('public.color_id_color_seq'::regclass);


--
-- Name: compra id_compra; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.compra ALTER COLUMN id_compra SET DEFAULT nextval('public.compra_id_compra_seq'::regclass);


--
-- Name: comprobante id_comprobante; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.comprobante ALTER COLUMN id_comprobante SET DEFAULT nextval('public.comprobante_id_comprobante_seq'::regclass);


--
-- Name: imagen_prenda id_imagen; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.imagen_prenda ALTER COLUMN id_imagen SET DEFAULT nextval('public.imagen_prenda_id_imagen_seq'::regclass);


--
-- Name: movimiento_inventario id_movimiento; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movimiento_inventario ALTER COLUMN id_movimiento SET DEFAULT nextval('public.movimiento_inventario_id_movimiento_seq'::regclass);


--
-- Name: pago_transaccion id_pago; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.pago_transaccion ALTER COLUMN id_pago SET DEFAULT nextval('public.pago_transaccion_id_pago_seq'::regclass);


--
-- Name: permiso id_permiso; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.permiso ALTER COLUMN id_permiso SET DEFAULT nextval('public.permiso_id_permiso_seq'::regclass);


--
-- Name: prenda id_prenda; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.prenda ALTER COLUMN id_prenda SET DEFAULT nextval('public.prenda_id_prenda_seq'::regclass);


--
-- Name: proveedor id_proveedor; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.proveedor ALTER COLUMN id_proveedor SET DEFAULT nextval('public.proveedor_id_proveedor_seq'::regclass);


--
-- Name: reserva id_reserva; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.reserva ALTER COLUMN id_reserva SET DEFAULT nextval('public.reserva_id_reserva_seq'::regclass);


--
-- Name: rol id_rol; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.rol ALTER COLUMN id_rol SET DEFAULT nextval('public.rol_id_rol_seq'::regclass);


--
-- Name: sucursal id_sucursal; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sucursal ALTER COLUMN id_sucursal SET DEFAULT nextval('public.sucursal_id_sucursal_seq'::regclass);


--
-- Name: talla id_talla; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.talla ALTER COLUMN id_talla SET DEFAULT nextval('public.talla_id_talla_seq'::regclass);


--
-- Name: temporada id_temporada; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.temporada ALTER COLUMN id_temporada SET DEFAULT nextval('public.temporada_id_temporada_seq'::regclass);


--
-- Name: usuario id_usuario; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.usuario ALTER COLUMN id_usuario SET DEFAULT nextval('public.usuario_id_usuario_seq'::regclass);


--
-- Name: usuario_token id_token; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.usuario_token ALTER COLUMN id_token SET DEFAULT nextval('public.usuario_token_id_token_seq'::regclass);


--
-- Name: variante_prenda id_variante_prenda; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.variante_prenda ALTER COLUMN id_variante_prenda SET DEFAULT nextval('public.variante_prenda_id_variante_prenda_seq'::regclass);


--
-- Name: venta id_venta; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.venta ALTER COLUMN id_venta SET DEFAULT nextval('public.venta_id_venta_seq'::regclass);


--
-- Data for Name: bitacora; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.bitacora (id_bitacora, id_usuario, accion, tabla_afectada, registro_id, detalle, ip_address, fecha) FROM stdin;
1	1	LOGIN_EXITOSO	usuario	1	Inicio de sesión exitoso de 'Alejandro Sistemas' (admin@fashionstore.com) con rol 'Administrador'.	172.20.0.1	2026-09-05 09:22:43.99758
2	1	INSERT	usuario	3	Alta de usuario 'Camila Rojas' (camila.rojas@fashionstore.com) con rol id=3.	172.20.0.1	2026-09-05 09:22:55.222211
3	3	LOGIN_EXITOSO	usuario	3	Inicio de sesión exitoso de 'Camila Rojas' (camila.rojas@fashionstore.com) con rol 'Cajero (POS)'.	172.20.0.1	2026-09-05 09:23:08.169836
4	1	UPDATE	usuario	3	Modificación del usuario 'camila.rojas@fashionstore.com'. Campos actualizados: telefono=70099887, id_role=2.	172.20.0.1	2026-09-05 09:23:20.339532
5	1	INACTIVAR	usuario	3	Baja lógica del usuario 'camila.rojas@fashionstore.com': estado cambiado de 'Activo' a 'Inactivo'.	172.20.0.1	2026-09-05 09:23:20.538573
6	3	LOGIN_FALLIDO	usuario	3	Intento de inicio de sesión rechazado para el correo: camila.rojas@fashionstore.com (cuenta en estado 'Inactivo').	172.20.0.1	2026-09-05 09:23:30.628125
7	1	LOGIN_FALLIDO	usuario	1	Intento de inicio de sesión fallido para el correo: admin@fashionstore.com (contraseña incorrecta).	172.20.0.1	2026-09-05 09:23:49.527562
8	\N	LOGIN_FALLIDO	usuario	\N	Intento de inicio de sesión fallido para el correo: intruso@hacker.com (correo no registrado).	172.20.0.1	2026-09-05 09:23:49.789012
9	1	UPDATE	usuario	3	Modificación del usuario 'camila.rojas@fashionstore.com'. Campos actualizados: estado=Activo, id_role=3.	172.20.0.1	2026-09-05 09:24:08.447436
10	3	LOGIN_EXITOSO	usuario	3	Inicio de sesión exitoso de 'Camila Rojas' (camila.rojas@fashionstore.com) con rol 'Cajero (POS)'.	172.20.0.1	2026-09-05 09:24:08.500948
11	1	LOGIN_FALLIDO	usuario	1	Intento de inicio de sesión fallido para el correo: admin@fashionstore.com (contraseña incorrecta).	172.20.0.1	2026-09-05 09:24:26.652156
12	1	LOGIN_EXITOSO	usuario	1	Inicio de sesión exitoso de 'Alejandro Sistemas' (admin@fashionstore.com) con rol 'Administrador'.	172.20.0.1	2026-09-05 09:24:27.143
13	1	LOGIN_EXITOSO	usuario	1	Inicio de sesión exitoso de 'Alejandro Sistemas' (admin@fashionstore.com) con rol 'Administrador'.	172.20.0.1	2026-09-05 13:43:18.052321
14	1	LOGIN_EXITOSO	usuario	1	Inicio de sesión exitoso de 'Alejandro Sistemas' (admin@fashionstore.com) con rol 'Administrador'.	172.20.0.1	2026-09-05 13:56:54.196696
15	3	LOGIN_EXITOSO	usuario	3	Inicio de sesión exitoso de 'Camila Rojas' (camila.rojas@fashionstore.com) con rol 'Cajero (POS)'.	172.20.0.1	2026-09-05 13:59:01.805738
16	1	LOGIN_EXITOSO	usuario	1	Inicio de sesión exitoso de 'Alejandro Sistemas' (admin@fashionstore.com) con rol 'Administrador'.	172.20.0.1	2026-09-05 14:18:11.679947
17	1	LOGIN_EXITOSO	usuario	1	Inicio de sesión exitoso de 'Alejandro Sistemas' (admin@fashionstore.com) con rol 'Administrador'.	172.20.0.1	2026-09-05 14:19:32.439525
18	1	INSERT	usuario	4	Alta de usuario 'Bruno Terceros' (bruno.e2e@fashionstore.com) con rol id=2.	172.20.0.1	2026-09-05 14:19:36.510665
19	1	INACTIVAR	usuario	4	Baja lógica del usuario 'bruno.e2e@fashionstore.com': estado cambiado de 'Activo' a 'Inactivo'.	172.20.0.1	2026-09-05 14:19:38.528154
20	3	LOGIN_EXITOSO	usuario	3	Inicio de sesión exitoso de 'Camila Rojas' (camila.rojas@fashionstore.com) con rol 'Cajero (POS)'.	172.20.0.1	2026-09-05 14:19:41.963404
21	1	LOGIN_EXITOSO	usuario	1	Inicio de sesión exitoso de 'Alejandro Sistemas' (admin@fashionstore.com) con rol 'Administrador'.	172.20.0.1	2026-09-05 14:26:09.98278
22	3	LOGIN_EXITOSO	usuario	3	Inicio de sesión exitoso de 'Camila Rojas' (camila.rojas@fashionstore.com) con rol 'Cajero (POS)'.	172.20.0.1	2026-09-05 14:27:41.079969
23	1	LOGIN_EXITOSO	usuario	1	Inicio de sesión exitoso de 'Alejandro Sistemas' (admin@fashionstore.com) con rol 'Administrador'.	172.20.0.1	2026-09-05 14:27:52.675747
24	1	LOGIN_EXITOSO	usuario	1	Inicio de sesión exitoso de 'Alejandro Sistemas' (admin@fashionstore.com) con rol 'Administrador'.	172.20.0.1	2026-09-05 14:32:47.915933
25	1	LOGIN_EXITOSO	usuario	1	Inicio de sesión exitoso de 'Alejandro Sistemas' (admin@fashionstore.com) con rol 'Administrador'.	172.20.0.1	2026-09-05 21:30:16.409601
26	1	INSERT	ciudad	4	Alta de la ciudad 'Tarija'.	172.20.0.1	2026-09-05 21:30:16.740203
27	1	INSERT	sucursal	3	Alta de la sucursal 'Sucursal Tarija Centro' en la ciudad id=4.	172.20.0.1	2026-09-05 21:30:16.900525
28	1	UPDATE	sucursal	3	Modificación de la sucursal 'Sucursal Tarija Centro'. Campos: telefono=46699999.	172.20.0.1	2026-09-05 21:30:17.004358
29	1	INSERT	cliente	2	Alta del cliente 'Jorge Melgar Vaca' (CI 7654321).	172.20.0.1	2026-09-05 21:30:33.909434
30	1	UPDATE	cliente	2	Modificación del cliente CI 7654321. Campos: telefono=70099999.	172.20.0.1	2026-09-05 21:30:34.760984
31	1	INACTIVAR	cliente	2	Baja lógica del cliente 'Jorge Melgar Vaca' (CI 7654321).	172.20.0.1	2026-09-05 21:30:34.821289
32	1	UPDATE	cliente	2	Modificación del cliente CI 7654321. Campos: estado=Activo.	172.20.0.1	2026-09-05 21:30:34.934446
33	1	INSERT	categoria	6	Alta de la categoría 'Chaquetas'.	172.20.0.1	2026-09-05 21:30:49.528382
34	1	INACTIVAR	categoria	6	Baja lógica de la categoría 'Chaquetas' (0 prenda(s) asociadas).	172.20.0.1	2026-09-05 21:30:49.815084
35	1	UPDATE	categoria	6	Modificación de la categoría 'Chaquetas'. Campos: estado=Activo.	172.20.0.1	2026-09-05 21:30:49.965431
292	1	LOGIN_EXITOSO	usuario	1	Inicio de sesión exitoso de 'Alejandro Sistemas' (admin@fashionstore.com) con rol 'Administrador'.	192.168.10.101	2026-09-13 03:57:05.762025
293	1	LOGIN_EXITOSO	usuario	1	Inicio de sesión exitoso de 'Alejandro Sistemas' (admin@fashionstore.com) con rol 'Administrador'.	172.20.0.1	2026-09-13 03:57:05.991702
294	1	LOGIN_FALLIDO	usuario	1	Intento de inicio de sesión fallido para el correo: admin@fashionstore.com (contraseña incorrecta).	192.168.10.102	2026-09-13 03:57:06.261364
40	\N	INSERT	prenda	3	Se registró una nueva prenda con SKU: CHQ-JEAN-001, Nombre: Chaqueta de Jean Clasica	\N	2026-09-05 21:31:55.700791
41	1	INSERT	prenda	3	Alta de la prenda 'Chaqueta de Jean Clasica' (SKU CHQ-JEAN-001) con 3 variante(s).	172.20.0.1	2026-09-05 21:31:55.700791
42	3	LOGIN_EXITOSO	usuario	3	Inicio de sesión exitoso de 'Camila Rojas' (camila.rojas@fashionstore.com) con rol 'Cajero (POS)'.	172.20.0.1	2026-09-05 21:32:41.747688
43	3	INSERT	cliente	3	Alta del cliente 'Cliente de Mostrador' (CI 1122334).	172.20.0.1	2026-09-05 21:32:42.144345
44	1	LOGIN_EXITOSO	usuario	1	Inicio de sesión exitoso de 'Alejandro Sistemas' (admin@fashionstore.com) con rol 'Administrador'.	172.20.0.1	2026-09-05 22:35:53.370765
45	1	LOGIN_EXITOSO	usuario	1	Inicio de sesión exitoso de 'Alejandro Sistemas' (admin@fashionstore.com) con rol 'Administrador'.	172.20.0.1	2026-09-05 22:58:10.789115
46	1	LOGIN_EXITOSO	usuario	1	Inicio de sesión exitoso de 'Alejandro Sistemas' (admin@fashionstore.com) con rol 'Administrador'.	172.20.0.1	2026-09-05 23:02:59.453154
47	1	INSERT	categoria	7	Alta de la categoría 'Calzado E2E 1788649379'.	172.20.0.1	2026-09-05 23:02:59.771101
48	\N	INSERT	prenda	4	Se registró una nueva prenda con SKU: E2E-CALZADO-1788649379, Nombre: Zapatilla E2E	\N	2026-09-05 23:02:59.837562
49	1	INSERT	prenda	4	Alta de la prenda 'Zapatilla E2E' (SKU E2E-CALZADO-1788649379) con 1 variante(s).	172.20.0.1	2026-09-05 23:02:59.837562
50	1	LOGIN_EXITOSO	usuario	1	Inicio de sesión exitoso de 'Alejandro Sistemas' (admin@fashionstore.com) con rol 'Administrador'.	172.20.0.1	2026-09-05 23:03:40.620336
51	1	LOGIN_EXITOSO	usuario	1	Inicio de sesión exitoso de 'Alejandro Sistemas' (admin@fashionstore.com) con rol 'Administrador'.	172.20.0.1	2026-09-05 23:06:57.646224
52	1	LOGIN_EXITOSO	usuario	1	Inicio de sesión exitoso de 'Alejandro Sistemas' (admin@fashionstore.com) con rol 'Administrador'.	192.168.10.101	2026-09-11 19:16:24.495719
53	1	LOGIN_EXITOSO	usuario	1	Inicio de sesión exitoso de 'Alejandro Sistemas' (admin@fashionstore.com) con rol 'Administrador'.	172.20.0.1	2026-09-11 19:16:24.889274
54	1	LOGIN_FALLIDO	usuario	1	Intento de inicio de sesión fallido para el correo: admin@fashionstore.com (contraseña incorrecta).	192.168.10.102	2026-09-11 19:16:25.158355
55	\N	LOGIN_FALLIDO	usuario	\N	Intento de inicio de sesión fallido para el correo: no_existe_qa_999@fashionstore.com (correo no registrado).	192.168.10.103	2026-09-11 19:16:25.433027
56	1	LOGIN_EXITOSO	usuario	1	Inicio de sesión exitoso de 'Alejandro Sistemas' (admin@fashionstore.com) con rol 'Administrador'.	172.20.0.1	2026-09-11 19:16:25.699592
295	\N	LOGIN_FALLIDO	usuario	\N	Intento de inicio de sesión fallido para el correo: no_existe_qa_999@fashionstore.com (correo no registrado).	192.168.10.103	2026-09-13 03:57:06.527048
58	1	LOGIN_EXITOSO	usuario	1	Inicio de sesión exitoso de 'Alejandro Sistemas' (admin@fashionstore.com) con rol 'Administrador'.	172.20.0.1	2026-09-11 19:16:44.855229
4127	1	LOGIN_EXITOSO	usuario	1	Inicio de sesión exitoso de 'Alejandro Sistemas' (admin@fashionstore.com) con rol 'Administrador'.	172.20.0.1	2026-09-13 10:16:49.39944
296	1	LOGIN_EXITOSO	usuario	1	Inicio de sesión exitoso de 'Alejandro Sistemas' (admin@fashionstore.com) con rol 'Administrador'.	172.20.0.1	2026-09-13 03:57:06.791753
4941	1	LOGIN_EXITOSO	usuario	1	Inicio de sesión exitoso de 'Alejandro Sistemas' (admin@fashionstore.com) con rol 'Administrador'.	172.20.0.1	2026-09-13 19:06:45.21241
62	1	UPDATE	usuario	7	Modificación del usuario 'qa_nuevo_cajero@fashionstore.com'. Campos actualizados: nombre=Carlos Alberto, telefono=71122334.	192.168.20.2	2026-09-11 19:16:46.429956
63	1	INACTIVAR	usuario	7	Baja lógica del usuario 'qa_nuevo_cajero@fashionstore.com': estado cambiado de 'Activo' a 'Inactivo'.	192.168.20.3	2026-09-11 19:16:46.714179
64	1	LOGIN_EXITOSO	usuario	1	Inicio de sesión exitoso de 'Alejandro Sistemas' (admin@fashionstore.com) con rol 'Administrador'.	172.20.0.1	2026-09-11 19:17:04.768761
619	1	SOLICITUD_RECUPERACION_PASSWORD	usuario_token	51	Solicitud de recuperación de contraseña para el correo: admin@fashionstore.com.	172.20.0.1	2026-09-13 04:14:49.666848
70	1	LOGIN_EXITOSO	usuario	1	Inicio de sesión exitoso de 'Alejandro Sistemas' (admin@fashionstore.com) con rol 'Administrador'.	172.20.0.1	2026-09-11 19:17:20.393318
71	1	INSERT	cliente	4	Alta del cliente 'Lucía Morales Paz' (CI 88997711).	192.168.40.1	2026-09-11 19:17:20.772916
72	1	UPDATE	cliente	4	Modificación del cliente CI 88997711. Campos: nombre_completo=Lucía Morales de Mendoza, telefono=78999999.	192.168.40.2	2026-09-11 19:17:21.208888
73	1	INACTIVAR	cliente	4	Baja lógica del cliente 'Lucía Morales de Mendoza' (CI 88997711).	192.168.40.3	2026-09-11 19:17:21.262797
74	1	LOGIN_EXITOSO	usuario	1	Inicio de sesión exitoso de 'Alejandro Sistemas' (admin@fashionstore.com) con rol 'Administrador'.	172.20.0.1	2026-09-11 19:17:37.7402
4135	1	LOGIN_EXITOSO	usuario	1	Inicio de sesión exitoso de 'Alejandro Sistemas' (admin@fashionstore.com) con rol 'Administrador'.	192.168.10.101	2026-09-13 10:17:08.257399
4136	1	LOGIN_EXITOSO	usuario	1	Inicio de sesión exitoso de 'Alejandro Sistemas' (admin@fashionstore.com) con rol 'Administrador'.	172.20.0.1	2026-09-13 10:17:08.482518
4137	1	LOGIN_FALLIDO	usuario	1	Intento de inicio de sesión fallido para el correo: admin@fashionstore.com (contraseña incorrecta).	192.168.10.102	2026-09-13 10:17:08.743306
80	1	LOGIN_EXITOSO	usuario	1	Inicio de sesión exitoso de 'Alejandro Sistemas' (admin@fashionstore.com) con rol 'Administrador'.	172.20.0.1	2026-09-11 19:18:01.589896
4138	\N	LOGIN_FALLIDO	usuario	\N	Intento de inicio de sesión fallido para el correo: no_existe_qa_999@fashionstore.com (correo no registrado).	192.168.10.103	2026-09-13 10:17:09.007539
4139	1	LOGIN_EXITOSO	usuario	1	Inicio de sesión exitoso de 'Alejandro Sistemas' (admin@fashionstore.com) con rol 'Administrador'.	172.20.0.1	2026-09-13 10:17:09.27055
4141	1	INSERT	usuario	966	Alta de usuario 'Usuario Cliente QA' (qa_cliente_rbac@fashionstore.com) con rol id=4.	192.168.1.50	2026-09-13 10:17:10.231283
301	1	UPDATE	usuario	31	Modificación del usuario 'qa_nuevo_cajero@fashionstore.com'. Campos actualizados: nombre=Carlos Alberto, telefono=71122334.	192.168.20.2	2026-09-13 03:57:08.982432
302	1	INACTIVAR	usuario	31	Baja lógica del usuario 'qa_nuevo_cajero@fashionstore.com': estado cambiado de 'Activo' a 'Inactivo'.	192.168.20.3	2026-09-13 03:57:09.262803
4143	1	INSERT	usuario	967	Alta de usuario 'Carlos Cajero QA' (qa_nuevo_cajero@fashionstore.com) con rol id=3.	192.168.20.1	2026-09-13 10:17:10.906866
4144	1	UPDATE	usuario	967	Modificación del usuario 'qa_nuevo_cajero@fashionstore.com'. Campos actualizados: nombre=Carlos Alberto, telefono=71122334.	192.168.20.2	2026-09-13 10:17:11.45886
90	1	LOGIN_EXITOSO	usuario	1	Inicio de sesión exitoso de 'Alejandro Sistemas' (admin@fashionstore.com) con rol 'Administrador'.	172.20.0.1	2026-09-11 19:18:46.792561
4145	1	INACTIVAR	usuario	967	Baja lógica del usuario 'qa_nuevo_cajero@fashionstore.com': estado cambiado de 'Activo' a 'Inactivo'.	192.168.20.3	2026-09-13 10:17:11.735885
92	\N	LOGIN_FALLIDO	usuario	\N	Intento de inicio de sesión fallido para el correo: no_existe_seguro@fashionstore.com (correo no registrado).	192.168.99.99	2026-09-11 19:18:47.195192
93	1	LOGIN_EXITOSO	usuario	1	Inicio de sesión exitoso de 'Alejandro Sistemas' (admin@fashionstore.com) con rol 'Administrador'.	192.168.10.101	2026-09-11 19:18:52.168069
94	1	LOGIN_EXITOSO	usuario	1	Inicio de sesión exitoso de 'Alejandro Sistemas' (admin@fashionstore.com) con rol 'Administrador'.	172.20.0.1	2026-09-11 19:18:52.391792
95	1	LOGIN_FALLIDO	usuario	1	Intento de inicio de sesión fallido para el correo: admin@fashionstore.com (contraseña incorrecta).	192.168.10.102	2026-09-11 19:18:52.649783
96	\N	LOGIN_FALLIDO	usuario	\N	Intento de inicio de sesión fallido para el correo: no_existe_qa_999@fashionstore.com (correo no registrado).	192.168.10.103	2026-09-11 19:18:52.908319
97	1	LOGIN_EXITOSO	usuario	1	Inicio de sesión exitoso de 'Alejandro Sistemas' (admin@fashionstore.com) con rol 'Administrador'.	172.20.0.1	2026-09-11 19:18:53.16779
4146	1	UPDATE	rol_permiso	3	Se actualizaron los permisos del rol 'Cajero (POS)' (ID: 3). Total asignados: 2.	192.168.1.50	2026-09-13 10:17:12.135397
4147	1	UPDATE	rol_permiso	3	Se actualizaron los permisos del rol 'Cajero (POS)' (ID: 3). Total asignados: 4.	192.168.1.50	2026-09-13 10:17:12.47528
4148	1	UPDATE	rol_permiso	3	Se actualizaron los permisos del rol 'Cajero (POS)' (ID: 3). Total asignados: 0.	192.168.1.50	2026-09-13 10:17:12.594988
4149	1	INSERT	usuario	968	Alta de usuario 'Cajero POS QA' (qa_cajero_rbac@fashionstore.com) con rol id=3.	192.168.1.50	2026-09-13 10:17:12.983185
4265	1	INSERT	cliente	51	Alta del cliente 'Lucía Morales Paz' (CI 88997711).	192.168.40.1	2026-09-13 10:20:10.370875
102	1	UPDATE	usuario	12	Modificación del usuario 'qa_nuevo_cajero@fashionstore.com'. Campos actualizados: nombre=Carlos Alberto, telefono=71122334.	192.168.20.2	2026-09-11 19:18:55.335371
103	1	INACTIVAR	usuario	12	Baja lógica del usuario 'qa_nuevo_cajero@fashionstore.com': estado cambiado de 'Activo' a 'Inactivo'.	192.168.20.3	2026-09-11 19:18:55.612061
104	1	INSERT	cliente	5	Alta del cliente 'Lucía Morales Paz' (CI 88997711).	192.168.40.1	2026-09-11 19:18:55.903236
105	1	UPDATE	cliente	5	Modificación del cliente CI 88997711. Campos: nombre_completo=Lucía Morales de Mendoza, telefono=78999999.	192.168.40.2	2026-09-11 19:18:56.327335
106	1	INACTIVAR	cliente	5	Baja lógica del cliente 'Lucía Morales de Mendoza' (CI 88997711).	192.168.40.3	2026-09-11 19:18:56.380514
4151	1	UPDATE	rol_permiso	3	Se actualizaron los permisos del rol 'Cajero (POS)' (ID: 3). Total asignados: 5.	192.168.1.50	2026-09-13 10:17:13.583092
4152	1	UPDATE	rol_permiso	3	Se actualizaron los permisos del rol 'Cajero (POS)' (ID: 3). Total asignados: 4.	192.168.1.50	2026-09-13 10:17:13.731115
4153	1	INSERT	usuario	969	Alta de usuario 'Cajero POS QA' (qa_cajero_rbac@fashionstore.com) con rol id=3.	192.168.1.50	2026-09-13 10:17:13.889932
4155	1	UPDATE	rol_permiso	3	Se actualizaron los permisos del rol 'Cajero (POS)' (ID: 3). Total asignados: 5.	192.168.1.50	2026-09-13 10:17:14.54632
303	1	INSERT	cliente	10	Alta del cliente 'Lucía Morales Paz' (CI 88997711).	192.168.40.1	2026-09-13 03:57:09.550553
304	1	UPDATE	cliente	10	Modificación del cliente CI 88997711. Campos: nombre_completo=Lucía Morales de Mendoza, telefono=78999999.	192.168.40.2	2026-09-13 03:57:09.970611
305	1	INACTIVAR	cliente	10	Baja lógica del cliente 'Lucía Morales de Mendoza' (CI 88997711).	192.168.40.3	2026-09-13 03:57:10.020462
4156	1	INSERT	usuario	970	Alta de usuario 'Carlos Recuperador' (qa_recovery_user@fashionstore.com) con rol id=4.	192.168.1.50	2026-09-13 10:17:14.801792
118	\N	LOGIN_FALLIDO	usuario	\N	Intento de inicio de sesión fallido para el correo: no_existe_seguro@fashionstore.com (correo no registrado).	192.168.99.99	2026-09-11 19:18:59.529651
4158	1	INSERT	usuario	971	Alta de usuario 'Carlos Recuperador' (qa_recovery_user@fashionstore.com) con rol id=4.	192.168.1.50	2026-09-13 10:17:15.249968
120	1	LOGIN_EXITOSO	usuario	1	Inicio de sesión exitoso de 'Alejandro Sistemas' (admin@fashionstore.com) con rol 'Administrador'.	172.20.0.1	2026-09-11 19:19:34.216237
121	1	LOGIN_EXITOSO	usuario	1	Inicio de sesión exitoso de 'Alejandro Sistemas' (admin@fashionstore.com) con rol 'Administrador'.	172.20.0.1	2026-09-11 19:19:57.720424
4161	1	INSERT	usuario	972	Alta de usuario 'Carlos Recuperador' (qa_recovery_user@fashionstore.com) con rol id=4.	192.168.1.50	2026-09-13 10:17:15.698371
4163	1	INSERT	usuario	973	Alta de usuario 'Carlos Recuperador' (qa_recovery_user@fashionstore.com) con rol id=4.	192.168.1.50	2026-09-13 10:17:16.153798
4168	1	INSERT	usuario	974	Alta de usuario 'Carlos Recuperador' (qa_recovery_user@fashionstore.com) con rol id=4.	192.168.1.50	2026-09-13 10:17:17.382402
4170	1	INSERT	usuario	975	Alta de usuario 'Carlos Recuperador' (qa_recovery_user@fashionstore.com) con rol id=4.	192.168.1.50	2026-09-13 10:17:17.834147
4171	1	INSERT	usuario	976	Alta de usuario 'Carlos Recuperador' (qa_recovery_user@fashionstore.com) con rol id=4.	192.168.1.50	2026-09-13 10:17:18.205745
136	1	LOGIN_EXITOSO	usuario	1	Inicio de sesión exitoso de 'Alejandro Sistemas' (admin@fashionstore.com) con rol 'Administrador'.	192.168.10.101	2026-09-11 19:20:17.540402
137	1	LOGIN_EXITOSO	usuario	1	Inicio de sesión exitoso de 'Alejandro Sistemas' (admin@fashionstore.com) con rol 'Administrador'.	172.20.0.1	2026-09-11 19:20:17.767575
138	1	LOGIN_FALLIDO	usuario	1	Intento de inicio de sesión fallido para el correo: admin@fashionstore.com (contraseña incorrecta).	192.168.10.102	2026-09-11 19:20:18.021814
139	\N	LOGIN_FALLIDO	usuario	\N	Intento de inicio de sesión fallido para el correo: no_existe_qa_999@fashionstore.com (correo no registrado).	192.168.10.103	2026-09-11 19:20:18.287111
140	1	LOGIN_EXITOSO	usuario	1	Inicio de sesión exitoso de 'Alejandro Sistemas' (admin@fashionstore.com) con rol 'Administrador'.	172.20.0.1	2026-09-11 19:20:18.546222
4174	1	INSERT	usuario	977	Alta de usuario 'Carlos Recuperador' (qa_recovery_user@fashionstore.com) con rol id=4.	192.168.1.50	2026-09-13 10:17:18.91025
4175	1	INSERT	usuario	978	Alta de usuario 'Inactivo QA' (qa_user_inactivo_recovery@fashionstore.com) con rol id=4.	192.168.1.50	2026-09-13 10:17:19.538337
4176	1	INSERT	usuario	979	Alta de usuario 'Carlos Recuperador' (qa_recovery_user@fashionstore.com) con rol id=4.	192.168.1.50	2026-09-13 10:17:19.941715
145	1	UPDATE	usuario	16	Modificación del usuario 'qa_nuevo_cajero@fashionstore.com'. Campos actualizados: nombre=Carlos Alberto, telefono=71122334.	192.168.20.2	2026-09-11 19:20:20.714879
146	1	INACTIVAR	usuario	16	Baja lógica del usuario 'qa_nuevo_cajero@fashionstore.com': estado cambiado de 'Activo' a 'Inactivo'.	192.168.20.3	2026-09-11 19:20:20.998537
147	1	INSERT	cliente	6	Alta del cliente 'Lucía Morales Paz' (CI 88997711).	192.168.40.1	2026-09-11 19:20:21.29443
148	1	UPDATE	cliente	6	Modificación del cliente CI 88997711. Campos: nombre_completo=Lucía Morales de Mendoza, telefono=78999999.	192.168.40.2	2026-09-11 19:20:21.710544
149	1	INACTIVAR	cliente	6	Baja lógica del cliente 'Lucía Morales de Mendoza' (CI 88997711).	192.168.40.3	2026-09-11 19:20:21.75927
4178	1	INSERT	usuario	980	Alta de usuario 'Carlos Recuperador' (qa_recovery_user@fashionstore.com) con rol id=4.	192.168.1.50	2026-09-13 10:17:20.482185
4183	1	INSERT	usuario	981	Alta de usuario 'Carlos Recuperador' (qa_recovery_user@fashionstore.com) con rol id=4.	192.168.1.50	2026-09-13 10:17:21.713906
4187	1	INSERT	cliente	50	Alta del cliente 'Lucía Morales Paz' (CI 88997711).	192.168.40.1	2026-09-13 10:17:22.977765
4188	1	UPDATE	cliente	50	Modificación del cliente CI 88997711. Campos: nombre_completo=Lucía Morales de Mendoza, telefono=78999999.	192.168.40.2	2026-09-13 10:17:23.401813
4189	1	INACTIVAR	cliente	50	Baja lógica del cliente 'Lucía Morales de Mendoza' (CI 88997711).	192.168.40.3	2026-09-13 10:17:23.451868
4190	1	INSERT	ciudad	118	Alta de la ciudad 'Tarija QA'.	192.168.30.1	2026-09-13 10:17:23.698037
4191	1	INSERT	sucursal	108	Alta de la sucursal 'Sucursal Tarija Centro QA' en la ciudad id=118.	192.168.30.2	2026-09-13 10:17:24.077702
4192	1	UPDATE	sucursal	108	Modificación de la sucursal 'Sucursal Tarija Centro QA'. Campos: direccion=Calle Sucre #789 (Modificado), telefono=66449988.	192.168.30.3	2026-09-13 10:17:24.366084
4193	1	INSERT	categoria	100	Alta de la categoría 'Deportes QA'.	192.168.50.1	2026-09-13 10:17:24.662257
4194	1	INSERT	categoria	101	Alta de la categoría 'Calzado Deportivo QA'.	192.168.1.50	2026-09-13 10:17:24.758118
4195	1	UPDATE	categoria	100	Modificación de la categoría 'Deportes QA'. Campos: descripcion=Ropa de running y fitness.	192.168.50.2	2026-09-13 10:17:25.121898
4196	1	INACTIVAR	categoria	101	Baja lógica de la categoría 'Calzado Deportivo QA' (0 prenda(s) asociadas).	192.168.50.3	2026-09-13 10:17:25.232544
4197	1	INACTIVAR	categoria	100	Baja lógica de la categoría 'Deportes QA' (0 prenda(s) asociadas).	192.168.50.3	2026-09-13 10:17:25.27923
5627	1	LOGIN_EXITOSO	usuario	1	Inicio de sesión exitoso de 'Alejandro Sistemas' (admin@fashionstore.com) con rol 'Administrador'.	172.20.0.1	2026-09-13 19:21:09.469484
167	\N	LOGIN_FALLIDO	usuario	\N	Intento de inicio de sesión fallido para el correo: no_existe_seguro@fashionstore.com (correo no registrado).	192.168.99.99	2026-09-11 19:20:25.134509
169	1	LOGIN_EXITOSO	usuario	1	Inicio de sesión exitoso de 'Alejandro Sistemas' (admin@fashionstore.com) con rol 'Administrador'.	172.20.0.1	2026-09-13 03:42:17.834504
170	1	LOGIN_EXITOSO	usuario	1	Inicio de sesión exitoso de 'Alejandro Sistemas' (admin@fashionstore.com) con rol 'Administrador'.	192.168.10.101	2026-09-13 03:51:06.426101
171	1	LOGIN_EXITOSO	usuario	1	Inicio de sesión exitoso de 'Alejandro Sistemas' (admin@fashionstore.com) con rol 'Administrador'.	172.20.0.1	2026-09-13 03:51:06.688
172	1	LOGIN_FALLIDO	usuario	1	Intento de inicio de sesión fallido para el correo: admin@fashionstore.com (contraseña incorrecta).	192.168.10.102	2026-09-13 03:51:06.941825
173	\N	LOGIN_FALLIDO	usuario	\N	Intento de inicio de sesión fallido para el correo: no_existe_qa_999@fashionstore.com (correo no registrado).	192.168.10.103	2026-09-13 03:51:07.213856
174	1	LOGIN_EXITOSO	usuario	1	Inicio de sesión exitoso de 'Alejandro Sistemas' (admin@fashionstore.com) con rol 'Administrador'.	172.20.0.1	2026-09-13 03:51:07.482004
5628	1	INSERT	ciudad	161	Alta de la ciudad 'Pando QA IP Test'.	200.87.100.45	2026-09-13 19:21:09.698498
179	1	LOGIN_EXITOSO	usuario	1	Inicio de sesión exitoso de 'Alejandro Sistemas' (admin@fashionstore.com) con rol 'Administrador'.	192.168.10.101	2026-09-13 03:51:09.927558
180	1	INSERT	cliente	7	Alta del cliente 'Lucía Morales Paz' (CI 88997711).	192.168.40.1	2026-09-13 03:51:10.249782
181	1	LOGIN_EXITOSO	usuario	1	Inicio de sesión exitoso de 'Alejandro Sistemas' (admin@fashionstore.com) con rol 'Administrador'.	172.20.0.1	2026-09-13 03:51:10.157449
182	1	LOGIN_FALLIDO	usuario	1	Intento de inicio de sesión fallido para el correo: admin@fashionstore.com (contraseña incorrecta).	192.168.10.102	2026-09-13 03:51:10.417307
183	1	UPDATE	cliente	7	Modificación del cliente CI 88997711. Campos: nombre_completo=Lucía Morales de Mendoza, telefono=78999999.	192.168.40.2	2026-09-13 03:51:10.715608
184	1	INACTIVAR	cliente	7	Baja lógica del cliente 'Lucía Morales de Mendoza' (CI 88997711).	192.168.40.3	2026-09-13 03:51:10.773425
185	\N	LOGIN_FALLIDO	usuario	\N	Intento de inicio de sesión fallido para el correo: no_existe_qa_999@fashionstore.com (correo no registrado).	192.168.10.103	2026-09-13 03:51:10.685772
187	1	LOGIN_EXITOSO	usuario	1	Inicio de sesión exitoso de 'Alejandro Sistemas' (admin@fashionstore.com) con rol 'Administrador'.	172.20.0.1	2026-09-13 03:51:10.956585
4207	\N	LOGIN_FALLIDO	usuario	\N	Intento de inicio de sesión fallido para el correo: no_existe_seguro@fashionstore.com (correo no registrado).	192.168.99.99	2026-09-13 10:17:26.881857
4208	1	UPDATE	rol_permiso	3	Se actualizaron los permisos del rol 'Cajero (POS)' (ID: 3). Total asignados: 3.	198.51.100.22	2026-09-13 10:17:27.140242
4209	1	INSERT	usuario	982	Alta de usuario 'Audit CU04' (qa_bitacora_cu04@fashionstore.com) con rol id=4.	192.168.1.50	2026-09-13 10:17:27.253789
4213	1	LOGIN_EXITOSO	usuario	1	Inicio de sesión exitoso de 'Alejandro Sistemas' (admin@fashionstore.com) con rol 'Administrador'.	192.168.10.101	2026-09-13 10:19:55.362159
4214	1	LOGIN_EXITOSO	usuario	1	Inicio de sesión exitoso de 'Alejandro Sistemas' (admin@fashionstore.com) con rol 'Administrador'.	172.20.0.1	2026-09-13 10:19:55.597739
4215	1	LOGIN_FALLIDO	usuario	1	Intento de inicio de sesión fallido para el correo: admin@fashionstore.com (contraseña incorrecta).	192.168.10.102	2026-09-13 10:19:55.862566
4216	\N	LOGIN_FALLIDO	usuario	\N	Intento de inicio de sesión fallido para el correo: no_existe_qa_999@fashionstore.com (correo no registrado).	192.168.10.103	2026-09-13 10:19:56.130855
4217	1	LOGIN_EXITOSO	usuario	1	Inicio de sesión exitoso de 'Alejandro Sistemas' (admin@fashionstore.com) con rol 'Administrador'.	172.20.0.1	2026-09-13 10:19:56.399198
4219	1	INSERT	usuario	984	Alta de usuario 'Usuario Cliente QA' (qa_cliente_rbac@fashionstore.com) con rol id=4.	192.168.1.50	2026-09-13 10:19:57.383044
202	1	UPDATE	usuario	22	Modificación del usuario 'qa_nuevo_cajero@fashionstore.com'. Campos actualizados: nombre=Carlos Alberto, telefono=71122334.	192.168.20.2	2026-09-13 03:51:13.166169
203	1	INACTIVAR	usuario	22	Baja lógica del usuario 'qa_nuevo_cajero@fashionstore.com': estado cambiado de 'Activo' a 'Inactivo'.	192.168.20.3	2026-09-13 03:51:13.451586
4221	1	INSERT	usuario	985	Alta de usuario 'Carlos Cajero QA' (qa_nuevo_cajero@fashionstore.com) con rol id=3.	192.168.20.1	2026-09-13 10:19:58.054902
4222	1	UPDATE	usuario	985	Modificación del usuario 'qa_nuevo_cajero@fashionstore.com'. Campos actualizados: nombre=Carlos Alberto, telefono=71122334.	192.168.20.2	2026-09-13 10:19:58.618915
4223	1	INACTIVAR	usuario	985	Baja lógica del usuario 'qa_nuevo_cajero@fashionstore.com': estado cambiado de 'Activo' a 'Inactivo'.	192.168.20.3	2026-09-13 10:19:58.903508
4224	1	UPDATE	rol_permiso	3	Se actualizaron los permisos del rol 'Cajero (POS)' (ID: 3). Total asignados: 2.	192.168.1.50	2026-09-13 10:19:59.2948
4225	1	UPDATE	rol_permiso	3	Se actualizaron los permisos del rol 'Cajero (POS)' (ID: 3). Total asignados: 4.	192.168.1.50	2026-09-13 10:19:59.65121
209	1	INSERT	cliente	8	Alta del cliente 'Lucía Morales Paz' (CI 88997711).	192.168.40.1	2026-09-13 03:51:13.763002
4226	1	UPDATE	rol_permiso	3	Se actualizaron los permisos del rol 'Cajero (POS)' (ID: 3). Total asignados: 0.	192.168.1.50	2026-09-13 10:19:59.76264
211	1	UPDATE	cliente	8	Modificación del cliente CI 88997711. Campos: nombre_completo=Lucía Morales de Mendoza, telefono=78999999.	192.168.40.2	2026-09-13 03:51:14.244234
212	1	INACTIVAR	cliente	8	Baja lógica del cliente 'Lucía Morales de Mendoza' (CI 88997711).	192.168.40.3	2026-09-13 03:51:14.29634
213	\N	LOGIN_FALLIDO	usuario	\N	Intento de inicio de sesión fallido para el correo: no_existe_seguro@fashionstore.com (correo no registrado).	192.168.99.99	2026-09-13 03:51:14.316067
4227	1	INSERT	usuario	986	Alta de usuario 'Cajero POS QA' (qa_cajero_rbac@fashionstore.com) con rol id=3.	192.168.1.50	2026-09-13 10:20:00.142955
4229	1	UPDATE	rol_permiso	3	Se actualizaron los permisos del rol 'Cajero (POS)' (ID: 3). Total asignados: 5.	192.168.1.50	2026-09-13 10:20:00.78268
4230	1	UPDATE	rol_permiso	3	Se actualizaron los permisos del rol 'Cajero (POS)' (ID: 3). Total asignados: 4.	192.168.1.50	2026-09-13 10:20:00.931191
4231	1	INSERT	usuario	987	Alta de usuario 'Cajero POS QA' (qa_cajero_rbac@fashionstore.com) con rol id=3.	192.168.1.50	2026-09-13 10:20:01.098567
4233	1	UPDATE	rol_permiso	3	Se actualizaron los permisos del rol 'Cajero (POS)' (ID: 3). Total asignados: 5.	192.168.1.50	2026-09-13 10:20:01.767907
4234	1	INSERT	usuario	988	Alta de usuario 'Carlos Recuperador' (qa_recovery_user@fashionstore.com) con rol id=4.	192.168.1.50	2026-09-13 10:20:02.042535
4236	1	INSERT	usuario	989	Alta de usuario 'Carlos Recuperador' (qa_recovery_user@fashionstore.com) con rol id=4.	192.168.1.50	2026-09-13 10:20:02.494735
5629	\N	LOGIN_FALLIDO	usuario	\N	Intento de inicio de sesión fallido para el correo: no_existe_seguro@fashionstore.com (correo no registrado).	192.168.99.99	2026-09-13 19:21:09.88699
5630	1	UPDATE	rol_permiso	3	Se actualizaron los permisos del rol 'Cajero (POS)' (ID: 3). Total asignados: 3.	198.51.100.22	2026-09-13 19:21:10.14449
5631	1	INSERT	usuario	1074	Alta de usuario 'Audit CU04' (qa_bitacora_cu04@fashionstore.com) con rol id=4.	192.168.1.50	2026-09-13 19:21:10.255125
4946	\N	LOGIN_FALLIDO	usuario	\N	Intento de inicio de sesión fallido para el correo: no_existe_seguro@fashionstore.com (correo no registrado).	192.168.99.99	2026-09-13 19:06:46.103363
5161	1	LOGIN_EXITOSO	usuario	1	Inicio de sesión exitoso de 'Alejandro Sistemas' (admin@fashionstore.com) con rol 'Administrador'.	172.20.0.1	2026-09-13 19:08:08.384951
6595	1	IA_RECOMENDACION	inventario	4	Recomendación IA (Fallback Catálogo): 1 prendas sugeridas para estilo 'Formal' y ocasión 'Trabajo'.	192.168.1.50	2026-09-13 22:18:49.008712
233	\N	LOGIN_FALLIDO	usuario	\N	Intento de inicio de sesión fallido para el correo: no_existe_seguro@fashionstore.com (correo no registrado).	192.168.99.99	2026-09-13 03:51:17.784319
6596	1	IA_RECOMENDACION	inventario	4	Recomendación IA (Fallback Catálogo): 1 prendas sugeridas para estilo 'Deportivo' y ocasión 'General'.	192.168.1.50	2026-09-13 22:18:49.10092
235	1	LOGIN_EXITOSO	usuario	1	Inicio de sesión exitoso de 'Alejandro Sistemas' (admin@fashionstore.com) con rol 'Administrador'.	172.20.0.1	2026-09-13 03:51:40.202233
5634	1	LOGIN_EXITOSO	usuario	1	Inicio de sesión exitoso de 'Alejandro Sistemas' (admin@fashionstore.com) con rol 'Administrador'.	172.20.0.1	2026-09-13 19:21:14.466074
5637	1	LOGIN_EXITOSO	usuario	1	Inicio de sesión exitoso de 'Alejandro Sistemas' (admin@fashionstore.com) con rol 'Administrador'.	172.20.0.1	2026-09-13 19:21:39.834507
5638	1	INSERT	ciudad	162	Alta de la ciudad 'Pando QA IP Test'.	200.87.100.45	2026-09-13 19:21:40.041592
5639	\N	LOGIN_FALLIDO	usuario	\N	Intento de inicio de sesión fallido para el correo: no_existe_seguro@fashionstore.com (correo no registrado).	192.168.99.99	2026-09-13 19:21:40.229342
5640	1	UPDATE	rol_permiso	3	Se actualizaron los permisos del rol 'Cajero (POS)' (ID: 3). Total asignados: 3.	198.51.100.22	2026-09-13 19:21:40.484652
241	1	LOGIN_EXITOSO	usuario	1	Inicio de sesión exitoso de 'Alejandro Sistemas' (admin@fashionstore.com) con rol 'Administrador'.	172.20.0.1	2026-09-13 03:51:46.15286
5641	1	INSERT	usuario	1075	Alta de usuario 'Audit CU04' (qa_bitacora_cu04@fashionstore.com) con rol id=4.	192.168.1.50	2026-09-13 19:21:40.595148
323	\N	LOGIN_FALLIDO	usuario	\N	Intento de inicio de sesión fallido para el correo: no_existe_seguro@fashionstore.com (correo no registrado).	192.168.99.99	2026-09-13 03:57:13.412373
6597	1	IA_RECOMENDACION	inventario	4	Recomendación IA (Fallback Catálogo): 1 prendas sugeridas para estilo 'Urbano' y ocasión 'General'.	192.168.1.50	2026-09-13 22:18:49.196728
6598	1	IA_RECOMENDACION	inventario	4	Recomendación IA (Fallback Catálogo): 1 prendas sugeridas para estilo 'Elegante' y ocasión 'Cena'.	10.0.0.77	2026-09-13 22:18:49.288448
325	1	LOGIN_EXITOSO	usuario	1	Inicio de sesión exitoso de 'Alejandro Sistemas' (admin@fashionstore.com) con rol 'Administrador'.	192.168.10.101	2026-09-13 04:02:06.183838
326	1	LOGIN_EXITOSO	usuario	1	Inicio de sesión exitoso de 'Alejandro Sistemas' (admin@fashionstore.com) con rol 'Administrador'.	172.20.0.1	2026-09-13 04:02:06.442931
327	1	LOGIN_FALLIDO	usuario	1	Intento de inicio de sesión fallido para el correo: admin@fashionstore.com (contraseña incorrecta).	192.168.10.102	2026-09-13 04:02:06.711175
328	\N	LOGIN_FALLIDO	usuario	\N	Intento de inicio de sesión fallido para el correo: no_existe_qa_999@fashionstore.com (correo no registrado).	192.168.10.103	2026-09-13 04:02:06.972487
329	1	LOGIN_EXITOSO	usuario	1	Inicio de sesión exitoso de 'Alejandro Sistemas' (admin@fashionstore.com) con rol 'Administrador'.	172.20.0.1	2026-09-13 04:02:07.241483
5644	1	LOGIN_EXITOSO	usuario	1	Inicio de sesión exitoso de 'Alejandro Sistemas' (admin@fashionstore.com) con rol 'Administrador'.	172.20.0.1	2026-09-13 19:21:52.014355
5645	1	INSERT	ciudad	163	Alta de la ciudad 'Pando QA IP Test'.	200.87.100.45	2026-09-13 19:21:52.223389
253	1	LOGIN_EXITOSO	usuario	1	Inicio de sesión exitoso de 'Alejandro Sistemas' (admin@fashionstore.com) con rol 'Administrador'.	172.20.0.1	2026-09-13 03:52:07.641058
5646	\N	LOGIN_FALLIDO	usuario	\N	Intento de inicio de sesión fallido para el correo: no_existe_seguro@fashionstore.com (correo no registrado).	192.168.99.99	2026-09-13 19:21:52.418857
5647	1	UPDATE	rol_permiso	3	Se actualizaron los permisos del rol 'Cajero (POS)' (ID: 3). Total asignados: 3.	198.51.100.22	2026-09-13 19:21:52.685366
5648	1	INSERT	usuario	1076	Alta de usuario 'Audit CU04' (qa_bitacora_cu04@fashionstore.com) con rol id=4.	192.168.1.50	2026-09-13 19:21:52.795234
259	1	LOGIN_EXITOSO	usuario	1	Inicio de sesión exitoso de 'Alejandro Sistemas' (admin@fashionstore.com) con rol 'Administrador'.	192.168.10.101	2026-09-13 03:52:15.689723
260	1	LOGIN_EXITOSO	usuario	1	Inicio de sesión exitoso de 'Alejandro Sistemas' (admin@fashionstore.com) con rol 'Administrador'.	172.20.0.1	2026-09-13 03:52:15.920083
261	1	LOGIN_FALLIDO	usuario	1	Intento de inicio de sesión fallido para el correo: admin@fashionstore.com (contraseña incorrecta).	192.168.10.102	2026-09-13 03:52:16.187057
262	\N	LOGIN_FALLIDO	usuario	\N	Intento de inicio de sesión fallido para el correo: no_existe_qa_999@fashionstore.com (correo no registrado).	192.168.10.103	2026-09-13 03:52:16.459904
263	1	LOGIN_EXITOSO	usuario	1	Inicio de sesión exitoso de 'Alejandro Sistemas' (admin@fashionstore.com) con rol 'Administrador'.	172.20.0.1	2026-09-13 03:52:16.756212
5651	1	LOGIN_EXITOSO	usuario	1	Inicio de sesión exitoso de 'Alejandro Sistemas' (admin@fashionstore.com) con rol 'Administrador'.	172.20.0.1	2026-09-13 19:22:27.953558
334	1	UPDATE	usuario	34	Modificación del usuario 'qa_nuevo_cajero@fashionstore.com'. Campos actualizados: nombre=Carlos Alberto, telefono=71122334.	192.168.20.2	2026-09-13 04:02:09.412255
268	1	UPDATE	usuario	28	Modificación del usuario 'qa_nuevo_cajero@fashionstore.com'. Campos actualizados: nombre=Carlos Alberto, telefono=71122334.	192.168.20.2	2026-09-13 03:52:19.132441
269	1	INACTIVAR	usuario	28	Baja lógica del usuario 'qa_nuevo_cajero@fashionstore.com': estado cambiado de 'Activo' a 'Inactivo'.	192.168.20.3	2026-09-13 03:52:19.416156
270	1	INSERT	cliente	9	Alta del cliente 'Lucía Morales Paz' (CI 88997711).	192.168.40.1	2026-09-13 03:52:19.708352
271	1	UPDATE	cliente	9	Modificación del cliente CI 88997711. Campos: nombre_completo=Lucía Morales de Mendoza, telefono=78999999.	192.168.40.2	2026-09-13 03:52:20.139903
272	1	INACTIVAR	cliente	9	Baja lógica del cliente 'Lucía Morales de Mendoza' (CI 88997711).	192.168.40.3	2026-09-13 03:52:20.188225
561	1	UPDATE	rol_permiso	3	Se actualizaron los permisos del rol 'Cajero (POS)' (ID: 3). Total asignados: 5.	192.168.1.50	2026-09-13 04:08:59.37274
562	1	INSERT	usuario	85	Alta de usuario 'Carlos Recuperador' (qa_recovery_user@fashionstore.com) con rol id=4.	192.168.1.50	2026-09-13 04:08:59.62807
290	\N	LOGIN_FALLIDO	usuario	\N	Intento de inicio de sesión fallido para el correo: no_existe_seguro@fashionstore.com (correo no registrado).	192.168.99.99	2026-09-13 03:52:23.52811
335	1	INACTIVAR	usuario	34	Baja lógica del usuario 'qa_nuevo_cajero@fashionstore.com': estado cambiado de 'Activo' a 'Inactivo'.	192.168.20.3	2026-09-13 04:02:09.700696
336	1	INSERT	cliente	11	Alta del cliente 'Lucía Morales Paz' (CI 88997711).	192.168.40.1	2026-09-13 04:02:09.99253
337	1	UPDATE	cliente	11	Modificación del cliente CI 88997711. Campos: nombre_completo=Lucía Morales de Mendoza, telefono=78999999.	192.168.40.2	2026-09-13 04:02:10.408428
338	1	INACTIVAR	cliente	11	Baja lógica del cliente 'Lucía Morales de Mendoza' (CI 88997711).	192.168.40.3	2026-09-13 04:02:10.459544
4947	1	UPDATE	rol_permiso	3	Se actualizaron los permisos del rol 'Cajero (POS)' (ID: 3). Total asignados: 3.	198.51.100.22	2026-09-13 19:06:46.416326
4949	1	LOGIN_EXITOSO	usuario	1	Inicio de sesión exitoso de 'Alejandro Sistemas' (admin@fashionstore.com) con rol 'Administrador'.	172.20.0.1	2026-09-13 19:06:46.516284
4239	1	INSERT	usuario	990	Alta de usuario 'Carlos Recuperador' (qa_recovery_user@fashionstore.com) con rol id=4.	192.168.1.50	2026-09-13 10:20:02.950497
6701	\N	UPDATE	prenda	3	Se modificó la prenda. SKU anterior: CHQ-CUERO-001 -> SKU nuevo: CHQ-CUERO-001	\N	2026-09-20 10:18:22.658994
4241	1	INSERT	usuario	991	Alta de usuario 'Carlos Recuperador' (qa_recovery_user@fashionstore.com) con rol id=4.	192.168.1.50	2026-09-13 10:20:03.410612
620	1	LOGIN_EXITOSO	usuario	1	Inicio de sesión exitoso de 'Alejandro Sistemas' (admin@fashionstore.com) con rol 'Administrador'.	172.20.0.1	2026-09-13 04:19:59.309276
5393	\N	LOGIN_FALLIDO	usuario	\N	Intento de inicio de sesión fallido para el correo: no_existe_seguro@fashionstore.com (correo no registrado).	192.168.99.99	2026-09-13 19:09:41.225047
4246	1	INSERT	usuario	992	Alta de usuario 'Carlos Recuperador' (qa_recovery_user@fashionstore.com) con rol id=4.	192.168.1.50	2026-09-13 10:20:04.663379
4248	1	INSERT	usuario	993	Alta de usuario 'Carlos Recuperador' (qa_recovery_user@fashionstore.com) con rol id=4.	192.168.1.50	2026-09-13 10:20:05.131125
4249	1	INSERT	usuario	994	Alta de usuario 'Carlos Recuperador' (qa_recovery_user@fashionstore.com) con rol id=4.	192.168.1.50	2026-09-13 10:20:05.498928
356	\N	LOGIN_FALLIDO	usuario	\N	Intento de inicio de sesión fallido para el correo: no_existe_seguro@fashionstore.com (correo no registrado).	192.168.99.99	2026-09-13 04:02:13.898599
358	1	LOGIN_EXITOSO	usuario	1	Inicio de sesión exitoso de 'Alejandro Sistemas' (admin@fashionstore.com) con rol 'Administrador'.	172.20.0.1	2026-09-13 04:02:29.670265
4252	1	INSERT	usuario	995	Alta de usuario 'Carlos Recuperador' (qa_recovery_user@fashionstore.com) con rol id=4.	192.168.1.50	2026-09-13 10:20:06.222897
4253	1	INSERT	usuario	996	Alta de usuario 'Inactivo QA' (qa_user_inactivo_recovery@fashionstore.com) con rol id=4.	192.168.1.50	2026-09-13 10:20:06.878604
361	1	UPDATE	rol_permiso	3	Se actualizaron los permisos del rol 'Cajero (POS)' (ID: 3). Total asignados: 2.	192.168.1.50	2026-09-13 04:02:30.774338
362	1	LOGIN_EXITOSO	usuario	1	Inicio de sesión exitoso de 'Alejandro Sistemas' (admin@fashionstore.com) con rol 'Administrador'.	172.20.0.1	2026-09-13 04:02:49.93171
363	1	INSERT	usuario	36	Alta de usuario 'Carlos Recuperador' (qa_recovery_user@fashionstore.com) con rol id=4.	192.168.1.50	2026-09-13 04:02:50.162364
4254	1	INSERT	usuario	997	Alta de usuario 'Carlos Recuperador' (qa_recovery_user@fashionstore.com) con rol id=4.	192.168.1.50	2026-09-13 10:20:07.235192
365	1	INSERT	usuario	37	Alta de usuario 'Carlos Recuperador' (qa_recovery_user@fashionstore.com) con rol id=4.	192.168.1.50	2026-09-13 04:02:50.628244
4256	1	INSERT	usuario	998	Alta de usuario 'Carlos Recuperador' (qa_recovery_user@fashionstore.com) con rol id=4.	192.168.1.50	2026-09-13 10:20:07.794856
368	1	INSERT	usuario	38	Alta de usuario 'Carlos Recuperador' (qa_recovery_user@fashionstore.com) con rol id=4.	192.168.1.50	2026-09-13 04:02:51.080745
370	1	INSERT	usuario	39	Alta de usuario 'Carlos Recuperador' (qa_recovery_user@fashionstore.com) con rol id=4.	192.168.1.50	2026-09-13 04:02:51.616236
372	1	INSERT	usuario	40	Alta de usuario 'Carlos Recuperador' (qa_recovery_user@fashionstore.com) con rol id=4.	192.168.1.50	2026-09-13 04:02:52.068631
373	1	INSERT	usuario	41	Alta de usuario 'Carlos Recuperador' (qa_recovery_user@fashionstore.com) con rol id=4.	192.168.1.50	2026-09-13 04:02:52.436732
378	1	INSERT	usuario	42	Alta de usuario 'Carlos Recuperador' (qa_recovery_user@fashionstore.com) con rol id=4.	192.168.1.50	2026-09-13 04:02:53.679
381	1	LOGIN_EXITOSO	usuario	1	Inicio de sesión exitoso de 'Alejandro Sistemas' (admin@fashionstore.com) con rol 'Administrador'.	192.168.10.101	2026-09-13 04:03:00.725163
382	1	LOGIN_EXITOSO	usuario	1	Inicio de sesión exitoso de 'Alejandro Sistemas' (admin@fashionstore.com) con rol 'Administrador'.	172.20.0.1	2026-09-13 04:03:00.945965
383	1	LOGIN_FALLIDO	usuario	1	Intento de inicio de sesión fallido para el correo: admin@fashionstore.com (contraseña incorrecta).	192.168.10.102	2026-09-13 04:03:01.207492
384	\N	LOGIN_FALLIDO	usuario	\N	Intento de inicio de sesión fallido para el correo: no_existe_qa_999@fashionstore.com (correo no registrado).	192.168.10.103	2026-09-13 04:03:01.469012
385	1	LOGIN_EXITOSO	usuario	1	Inicio de sesión exitoso de 'Alejandro Sistemas' (admin@fashionstore.com) con rol 'Administrador'.	172.20.0.1	2026-09-13 04:03:01.727923
390	1	UPDATE	usuario	45	Modificación del usuario 'qa_nuevo_cajero@fashionstore.com'. Campos actualizados: nombre=Carlos Alberto, telefono=71122334.	192.168.20.2	2026-09-13 04:03:03.900535
391	1	INACTIVAR	usuario	45	Baja lógica del usuario 'qa_nuevo_cajero@fashionstore.com': estado cambiado de 'Activo' a 'Inactivo'.	192.168.20.3	2026-09-13 04:03:04.188291
392	1	UPDATE	rol_permiso	3	Se actualizaron los permisos del rol 'Cajero (POS)' (ID: 3). Total asignados: 2.	192.168.1.50	2026-09-13 04:03:04.628787
393	1	INSERT	usuario	46	Alta de usuario 'Carlos Recuperador' (qa_recovery_user@fashionstore.com) con rol id=4.	192.168.1.50	2026-09-13 04:03:04.932315
395	1	INSERT	usuario	47	Alta de usuario 'Carlos Recuperador' (qa_recovery_user@fashionstore.com) con rol id=4.	192.168.1.50	2026-09-13 04:03:05.380346
398	1	INSERT	usuario	48	Alta de usuario 'Carlos Recuperador' (qa_recovery_user@fashionstore.com) con rol id=4.	192.168.1.50	2026-09-13 04:03:05.832703
400	1	INSERT	usuario	49	Alta de usuario 'Carlos Recuperador' (qa_recovery_user@fashionstore.com) con rol id=4.	192.168.1.50	2026-09-13 04:03:06.376692
402	1	INSERT	usuario	50	Alta de usuario 'Carlos Recuperador' (qa_recovery_user@fashionstore.com) con rol id=4.	192.168.1.50	2026-09-13 04:03:06.848537
403	1	INSERT	usuario	51	Alta de usuario 'Carlos Recuperador' (qa_recovery_user@fashionstore.com) con rol id=4.	192.168.1.50	2026-09-13 04:03:07.208483
408	1	INSERT	usuario	52	Alta de usuario 'Carlos Recuperador' (qa_recovery_user@fashionstore.com) con rol id=4.	192.168.1.50	2026-09-13 04:03:08.334961
411	1	INSERT	cliente	12	Alta del cliente 'Lucía Morales Paz' (CI 88997711).	192.168.40.1	2026-09-13 04:03:09.132493
412	1	UPDATE	cliente	12	Modificación del cliente CI 88997711. Campos: nombre_completo=Lucía Morales de Mendoza, telefono=78999999.	192.168.40.2	2026-09-13 04:03:09.568403
413	1	INACTIVAR	cliente	12	Baja lógica del cliente 'Lucía Morales de Mendoza' (CI 88997711).	192.168.40.3	2026-09-13 04:03:09.617931
6599	1	IA_ANALITICA_VOZ	inventario	\N	Analítica por voz CU23: 'Cuántas prendas tenemos en stock en todas las sucursales' -> Métrica 'inventario_stock', Resultados=4, PDF=False.	192.168.1.50	2026-09-13 22:18:49.476697
4261	1	INSERT	usuario	999	Alta de usuario 'Carlos Recuperador' (qa_recovery_user@fashionstore.com) con rol id=4.	192.168.1.50	2026-09-13 10:20:09.066965
6702	\N	UPDATE	prenda	3	Se modificó la prenda. SKU anterior: CHQ-CUERO-001 -> SKU nuevo: CHQ-CUERO-001	\N	2026-09-20 10:19:50.59881
6703	\N	UPDATE	prenda	4	Se modificó la prenda. SKU anterior: CALZ-URB-001 -> SKU nuevo: CALZ-URB-001	\N	2026-09-20 10:19:50.59881
621	1	LOGIN_EXITOSO	usuario	1	Inicio de sesión exitoso de 'Alejandro Sistemas' (admin@fashionstore.com) con rol 'Administrador'.	192.168.10.101	2026-09-13 04:38:09.676921
622	1	LOGIN_EXITOSO	usuario	1	Inicio de sesión exitoso de 'Alejandro Sistemas' (admin@fashionstore.com) con rol 'Administrador'.	172.20.0.1	2026-09-13 04:38:09.908567
623	1	LOGIN_FALLIDO	usuario	1	Intento de inicio de sesión fallido para el correo: admin@fashionstore.com (contraseña incorrecta).	192.168.10.102	2026-09-13 04:38:10.166513
624	\N	LOGIN_FALLIDO	usuario	\N	Intento de inicio de sesión fallido para el correo: no_existe_qa_999@fashionstore.com (correo no registrado).	192.168.10.103	2026-09-13 04:38:10.425922
625	1	LOGIN_EXITOSO	usuario	1	Inicio de sesión exitoso de 'Alejandro Sistemas' (admin@fashionstore.com) con rol 'Administrador'.	172.20.0.1	2026-09-13 04:38:10.688026
1787	1	LOGIN_EXITOSO	usuario	1	Inicio de sesión exitoso de 'Alejandro Sistemas' (admin@fashionstore.com) con rol 'Administrador'.	172.20.0.1	2026-09-13 04:49:49.190868
4266	1	UPDATE	cliente	51	Modificación del cliente CI 88997711. Campos: nombre_completo=Lucía Morales de Mendoza, telefono=78999999.	192.168.40.2	2026-09-13 10:20:10.790697
4267	1	INACTIVAR	cliente	51	Baja lógica del cliente 'Lucía Morales de Mendoza' (CI 88997711).	192.168.40.3	2026-09-13 10:20:10.844439
431	\N	LOGIN_FALLIDO	usuario	\N	Intento de inicio de sesión fallido para el correo: no_existe_seguro@fashionstore.com (correo no registrado).	192.168.99.99	2026-09-13 04:03:12.952513
433	1	LOGIN_EXITOSO	usuario	1	Inicio de sesión exitoso de 'Alejandro Sistemas' (admin@fashionstore.com) con rol 'Administrador'.	172.20.0.1	2026-09-13 04:05:25.949728
4268	1	INSERT	ciudad	120	Alta de la ciudad 'Tarija QA'.	192.168.30.1	2026-09-13 10:20:11.086802
4269	1	INSERT	sucursal	110	Alta de la sucursal 'Sucursal Tarija Centro QA' en la ciudad id=120.	192.168.30.2	2026-09-13 10:20:11.462735
436	1	UPDATE	rol_permiso	3	Se actualizaron los permisos del rol 'Cajero (POS)' (ID: 3). Total asignados: 2.	192.168.1.50	2026-09-13 04:05:27.031622
437	1	LOGIN_EXITOSO	usuario	1	Inicio de sesión exitoso de 'Alejandro Sistemas' (admin@fashionstore.com) con rol 'Administrador'.	192.168.10.101	2026-09-13 04:05:36.774835
438	1	LOGIN_EXITOSO	usuario	1	Inicio de sesión exitoso de 'Alejandro Sistemas' (admin@fashionstore.com) con rol 'Administrador'.	172.20.0.1	2026-09-13 04:05:37.001061
439	1	LOGIN_FALLIDO	usuario	1	Intento de inicio de sesión fallido para el correo: admin@fashionstore.com (contraseña incorrecta).	192.168.10.102	2026-09-13 04:05:37.259811
440	\N	LOGIN_FALLIDO	usuario	\N	Intento de inicio de sesión fallido para el correo: no_existe_qa_999@fashionstore.com (correo no registrado).	192.168.10.103	2026-09-13 04:05:37.523575
441	1	LOGIN_EXITOSO	usuario	1	Inicio de sesión exitoso de 'Alejandro Sistemas' (admin@fashionstore.com) con rol 'Administrador'.	172.20.0.1	2026-09-13 04:05:37.779218
4270	1	UPDATE	sucursal	110	Modificación de la sucursal 'Sucursal Tarija Centro QA'. Campos: direccion=Calle Sucre #789 (Modificado), telefono=66449988.	192.168.30.3	2026-09-13 10:20:11.743405
4271	1	INSERT	categoria	102	Alta de la categoría 'Deportes QA'.	192.168.50.1	2026-09-13 10:20:12.030694
4272	1	INSERT	categoria	103	Alta de la categoría 'Calzado Deportivo QA'.	192.168.1.50	2026-09-13 10:20:12.126948
4273	1	UPDATE	categoria	102	Modificación de la categoría 'Deportes QA'. Campos: descripcion=Ropa de running y fitness.	192.168.50.2	2026-09-13 10:20:12.491532
446	1	UPDATE	usuario	56	Modificación del usuario 'qa_nuevo_cajero@fashionstore.com'. Campos actualizados: nombre=Carlos Alberto, telefono=71122334.	192.168.20.2	2026-09-13 04:05:39.936473
447	1	INACTIVAR	usuario	56	Baja lógica del usuario 'qa_nuevo_cajero@fashionstore.com': estado cambiado de 'Activo' a 'Inactivo'.	192.168.20.3	2026-09-13 04:05:40.220207
448	1	UPDATE	rol_permiso	3	Se actualizaron los permisos del rol 'Cajero (POS)' (ID: 3). Total asignados: 2.	192.168.1.50	2026-09-13 04:05:40.671919
449	1	INSERT	usuario	57	Alta de usuario 'Carlos Recuperador' (qa_recovery_user@fashionstore.com) con rol id=4.	192.168.1.50	2026-09-13 04:05:40.971485
4274	1	INACTIVAR	categoria	103	Baja lógica de la categoría 'Calzado Deportivo QA' (0 prenda(s) asociadas).	192.168.50.3	2026-09-13 10:20:12.599792
451	1	INSERT	usuario	58	Alta de usuario 'Carlos Recuperador' (qa_recovery_user@fashionstore.com) con rol id=4.	192.168.1.50	2026-09-13 04:05:41.423973
4275	1	INACTIVAR	categoria	102	Baja lógica de la categoría 'Deportes QA' (0 prenda(s) asociadas).	192.168.50.3	2026-09-13 10:20:12.651552
6704	\N	UPDATE	prenda	171	Se modificó la prenda. SKU anterior: CHQ-DENIM-002 -> SKU nuevo: CHQ-DENIM-002	\N	2026-09-20 10:19:50.59881
454	1	INSERT	usuario	59	Alta de usuario 'Carlos Recuperador' (qa_recovery_user@fashionstore.com) con rol id=4.	192.168.1.50	2026-09-13 04:05:41.871935
456	1	INSERT	usuario	60	Alta de usuario 'Carlos Recuperador' (qa_recovery_user@fashionstore.com) con rol id=4.	192.168.1.50	2026-09-13 04:05:42.415579
458	1	INSERT	usuario	61	Alta de usuario 'Carlos Recuperador' (qa_recovery_user@fashionstore.com) con rol id=4.	192.168.1.50	2026-09-13 04:05:42.887769
459	1	INSERT	usuario	62	Alta de usuario 'Carlos Recuperador' (qa_recovery_user@fashionstore.com) con rol id=4.	192.168.1.50	2026-09-13 04:05:43.246513
6058	1	UPDATE	rol_permiso	3	Se actualizaron los permisos del rol 'Cajero (POS)' (ID: 3). Total asignados: 5.	192.168.1.50	2026-09-13 19:34:56.251055
6059	1	INSERT	usuario	1136	Alta de usuario 'Carlos Recuperador' (qa_recovery_user@fashionstore.com) con rol id=4.	192.168.1.50	2026-09-13 19:34:56.507233
6061	1	INSERT	usuario	1137	Alta de usuario 'Carlos Recuperador' (qa_recovery_user@fashionstore.com) con rol id=4.	192.168.1.50	2026-09-13 19:34:56.966882
464	1	INSERT	usuario	63	Alta de usuario 'Carlos Recuperador' (qa_recovery_user@fashionstore.com) con rol id=4.	192.168.1.50	2026-09-13 04:05:44.372073
467	1	INSERT	cliente	13	Alta del cliente 'Lucía Morales Paz' (CI 88997711).	192.168.40.1	2026-09-13 04:05:45.193948
468	1	UPDATE	cliente	13	Modificación del cliente CI 88997711. Campos: nombre_completo=Lucía Morales de Mendoza, telefono=78999999.	192.168.40.2	2026-09-13 04:05:45.622331
469	1	INACTIVAR	cliente	13	Baja lógica del cliente 'Lucía Morales de Mendoza' (CI 88997711).	192.168.40.3	2026-09-13 04:05:45.676579
6064	1	INSERT	usuario	1138	Alta de usuario 'Carlos Recuperador' (qa_recovery_user@fashionstore.com) con rol id=4.	192.168.1.50	2026-09-13 19:34:57.415411
6066	1	INSERT	usuario	1139	Alta de usuario 'Carlos Recuperador' (qa_recovery_user@fashionstore.com) con rol id=4.	192.168.1.50	2026-09-13 19:34:57.879131
487	\N	LOGIN_FALLIDO	usuario	\N	Intento de inicio de sesión fallido para el correo: no_existe_seguro@fashionstore.com (correo no registrado).	192.168.99.99	2026-09-13 04:05:49.025804
489	1	LOGIN_EXITOSO	usuario	1	Inicio de sesión exitoso de 'Alejandro Sistemas' (admin@fashionstore.com) con rol 'Administrador'.	172.20.0.1	2026-09-13 04:07:47.436161
4951	1	INSERT	usuario	1046	Alta de usuario 'Audit CU04' (qa_bitacora_cu04@fashionstore.com) con rol id=4.	192.168.1.50	2026-09-13 19:06:46.540408
630	1	UPDATE	usuario	100	Modificación del usuario 'qa_nuevo_cajero@fashionstore.com'. Campos actualizados: nombre=Carlos Alberto, telefono=71122334.	192.168.20.2	2026-09-13 04:38:12.832291
492	1	UPDATE	rol_permiso	3	Se actualizaron los permisos del rol 'Cajero (POS)' (ID: 3). Total asignados: 2.	192.168.1.50	2026-09-13 04:07:48.47082
493	1	UPDATE	rol_permiso	3	Se actualizaron los permisos del rol 'Cajero (POS)' (ID: 3). Total asignados: 4.	192.168.1.50	2026-09-13 04:07:48.822797
494	1	UPDATE	rol_permiso	3	Se actualizaron los permisos del rol 'Cajero (POS)' (ID: 3). Total asignados: 0.	192.168.1.50	2026-09-13 04:07:48.930776
6705	\N	UPDATE	prenda	172	Se modificó la prenda. SKU anterior: BLZ-EJE-001 -> SKU nuevo: BLZ-EJE-001	\N	2026-09-20 10:19:50.59881
631	1	INACTIVAR	usuario	100	Baja lógica del usuario 'qa_nuevo_cajero@fashionstore.com': estado cambiado de 'Activo' a 'Inactivo'.	192.168.20.3	2026-09-13 04:38:13.111691
497	1	UPDATE	rol_permiso	3	Se actualizaron los permisos del rol 'Cajero (POS)' (ID: 3). Total asignados: 5.	192.168.1.50	2026-09-13 04:07:49.918744
498	1	UPDATE	rol_permiso	3	Se actualizaron los permisos del rol 'Cajero (POS)' (ID: 3). Total asignados: 4.	192.168.1.50	2026-09-13 04:07:50.063157
5395	1	UPDATE	rol_permiso	3	Se actualizaron los permisos del rol 'Cajero (POS)' (ID: 3). Total asignados: 3.	198.51.100.22	2026-09-13 19:09:41.486491
501	1	UPDATE	rol_permiso	3	Se actualizaron los permisos del rol 'Cajero (POS)' (ID: 3). Total asignados: 5.	192.168.1.50	2026-09-13 04:07:50.898799
502	1	LOGIN_EXITOSO	usuario	1	Inicio de sesión exitoso de 'Alejandro Sistemas' (admin@fashionstore.com) con rol 'Administrador'.	172.20.0.1	2026-09-13 04:08:17.96942
503	1	INSERT	usuario	67	Alta de usuario 'Carlos Recuperador' (qa_recovery_user@fashionstore.com) con rol id=4.	192.168.1.50	2026-09-13 04:08:18.189714
5396	\N	UPDATE	prenda	4	Se modificó la prenda. SKU anterior: E2E-CALZADO-1788649379 -> SKU nuevo: E2E-CALZADO-1788649379	\N	2026-09-13 19:09:41.556758
505	1	INSERT	usuario	68	Alta de usuario 'Carlos Recuperador' (qa_recovery_user@fashionstore.com) con rol id=4.	192.168.1.50	2026-09-13 04:08:18.649653
5397	1	UPDATE	prenda	4	Modificación de la prenda SKU E2E-CALZADO-1788649379. Campos: id_temporada=25.	172.20.0.1	2026-09-13 19:09:41.556758
5400	1	INSERT	usuario	1062	Alta de usuario 'Audit CU04' (qa_bitacora_cu04@fashionstore.com) con rol id=4.	192.168.1.50	2026-09-13 19:09:41.596839
508	1	INSERT	usuario	69	Alta de usuario 'Carlos Recuperador' (qa_recovery_user@fashionstore.com) con rol id=4.	192.168.1.50	2026-09-13 04:08:19.093591
510	1	INSERT	usuario	70	Alta de usuario 'Carlos Recuperador' (qa_recovery_user@fashionstore.com) con rol id=4.	192.168.1.50	2026-09-13 04:08:19.538002
6071	1	INSERT	usuario	1140	Alta de usuario 'Carlos Recuperador' (qa_recovery_user@fashionstore.com) con rol id=4.	192.168.1.50	2026-09-13 19:34:59.10328
6073	1	INSERT	usuario	1141	Alta de usuario 'Carlos Recuperador' (qa_recovery_user@fashionstore.com) con rol id=4.	192.168.1.50	2026-09-13 19:34:59.551579
6074	1	INSERT	usuario	1142	Alta de usuario 'Carlos Recuperador' (qa_recovery_user@fashionstore.com) con rol id=4.	192.168.1.50	2026-09-13 19:34:59.91082
515	1	INSERT	usuario	71	Alta de usuario 'Carlos Recuperador' (qa_recovery_user@fashionstore.com) con rol id=4.	192.168.1.50	2026-09-13 04:08:20.769815
517	1	INSERT	usuario	72	Alta de usuario 'Carlos Recuperador' (qa_recovery_user@fashionstore.com) con rol id=4.	192.168.1.50	2026-09-13 04:08:21.218128
518	1	INSERT	usuario	73	Alta de usuario 'Carlos Recuperador' (qa_recovery_user@fashionstore.com) con rol id=4.	192.168.1.50	2026-09-13 04:08:21.585516
521	1	INSERT	usuario	74	Alta de usuario 'Carlos Recuperador' (qa_recovery_user@fashionstore.com) con rol id=4.	192.168.1.50	2026-09-13 04:08:22.286049
523	1	INSERT	usuario	76	Alta de usuario 'Carlos Recuperador' (qa_recovery_user@fashionstore.com) con rol id=4.	192.168.1.50	2026-09-13 04:08:23.277948
525	1	INSERT	usuario	77	Alta de usuario 'Carlos Recuperador' (qa_recovery_user@fashionstore.com) con rol id=4.	192.168.1.50	2026-09-13 04:08:23.829772
530	1	INSERT	usuario	78	Alta de usuario 'Carlos Recuperador' (qa_recovery_user@fashionstore.com) con rol id=4.	192.168.1.50	2026-09-13 04:08:25.053866
534	1	LOGIN_EXITOSO	usuario	1	Inicio de sesión exitoso de 'Alejandro Sistemas' (admin@fashionstore.com) con rol 'Administrador'.	172.20.0.1	2026-09-13 04:08:46.670497
536	\N	LOGIN_FALLIDO	usuario	\N	Intento de inicio de sesión fallido para el correo: no_existe_seguro@fashionstore.com (correo no registrado).	192.168.99.99	2026-09-13 04:08:47.075712
537	1	UPDATE	rol_permiso	3	Se actualizaron los permisos del rol 'Cajero (POS)' (ID: 3). Total asignados: 3.	198.51.100.22	2026-09-13 04:08:47.33858
538	1	INSERT	usuario	79	Alta de usuario 'Audit CU04' (qa_bitacora_cu04@fashionstore.com) con rol id=4.	192.168.1.50	2026-09-13 04:08:47.452078
541	1	LOGIN_EXITOSO	usuario	1	Inicio de sesión exitoso de 'Alejandro Sistemas' (admin@fashionstore.com) con rol 'Administrador'.	192.168.10.101	2026-09-13 04:08:53.111676
542	1	LOGIN_EXITOSO	usuario	1	Inicio de sesión exitoso de 'Alejandro Sistemas' (admin@fashionstore.com) con rol 'Administrador'.	172.20.0.1	2026-09-13 04:08:53.336621
543	1	LOGIN_FALLIDO	usuario	1	Intento de inicio de sesión fallido para el correo: admin@fashionstore.com (contraseña incorrecta).	192.168.10.102	2026-09-13 04:08:53.595277
544	\N	LOGIN_FALLIDO	usuario	\N	Intento de inicio de sesión fallido para el correo: no_existe_qa_999@fashionstore.com (correo no registrado).	192.168.10.103	2026-09-13 04:08:53.860913
545	1	LOGIN_EXITOSO	usuario	1	Inicio de sesión exitoso de 'Alejandro Sistemas' (admin@fashionstore.com) con rol 'Administrador'.	172.20.0.1	2026-09-13 04:08:54.119867
550	1	UPDATE	usuario	82	Modificación del usuario 'qa_nuevo_cajero@fashionstore.com'. Campos actualizados: nombre=Carlos Alberto, telefono=71122334.	192.168.20.2	2026-09-13 04:08:56.28407
551	1	INACTIVAR	usuario	82	Baja lógica del usuario 'qa_nuevo_cajero@fashionstore.com': estado cambiado de 'Activo' a 'Inactivo'.	192.168.20.3	2026-09-13 04:08:56.569164
552	1	UPDATE	rol_permiso	3	Se actualizaron los permisos del rol 'Cajero (POS)' (ID: 3). Total asignados: 2.	192.168.1.50	2026-09-13 04:08:56.960247
553	1	UPDATE	rol_permiso	3	Se actualizaron los permisos del rol 'Cajero (POS)' (ID: 3). Total asignados: 4.	192.168.1.50	2026-09-13 04:08:57.307727
554	1	UPDATE	rol_permiso	3	Se actualizaron los permisos del rol 'Cajero (POS)' (ID: 3). Total asignados: 0.	192.168.1.50	2026-09-13 04:08:57.420327
557	1	UPDATE	rol_permiso	3	Se actualizaron los permisos del rol 'Cajero (POS)' (ID: 3). Total asignados: 5.	192.168.1.50	2026-09-13 04:08:58.40816
558	1	UPDATE	rol_permiso	3	Se actualizaron los permisos del rol 'Cajero (POS)' (ID: 3). Total asignados: 4.	192.168.1.50	2026-09-13 04:08:58.552095
632	1	UPDATE	rol_permiso	3	Se actualizaron los permisos del rol 'Cajero (POS)' (ID: 3). Total asignados: 2.	192.168.1.50	2026-09-13 04:38:13.498917
564	1	INSERT	usuario	86	Alta de usuario 'Carlos Recuperador' (qa_recovery_user@fashionstore.com) con rol id=4.	192.168.1.50	2026-09-13 04:09:00.075852
633	1	UPDATE	rol_permiso	3	Se actualizaron los permisos del rol 'Cajero (POS)' (ID: 3). Total asignados: 4.	192.168.1.50	2026-09-13 04:38:13.842899
634	1	UPDATE	rol_permiso	3	Se actualizaron los permisos del rol 'Cajero (POS)' (ID: 3). Total asignados: 0.	192.168.1.50	2026-09-13 04:38:13.950705
567	1	INSERT	usuario	87	Alta de usuario 'Carlos Recuperador' (qa_recovery_user@fashionstore.com) con rol id=4.	192.168.1.50	2026-09-13 04:09:00.519964
4285	\N	LOGIN_FALLIDO	usuario	\N	Intento de inicio de sesión fallido para el correo: no_existe_seguro@fashionstore.com (correo no registrado).	192.168.99.99	2026-09-13 10:20:14.225549
569	1	INSERT	usuario	88	Alta de usuario 'Carlos Recuperador' (qa_recovery_user@fashionstore.com) con rol id=4.	192.168.1.50	2026-09-13 04:09:00.972522
4286	1	UPDATE	rol_permiso	3	Se actualizaron los permisos del rol 'Cajero (POS)' (ID: 3). Total asignados: 3.	198.51.100.22	2026-09-13 10:20:14.49594
637	1	UPDATE	rol_permiso	3	Se actualizaron los permisos del rol 'Cajero (POS)' (ID: 3). Total asignados: 5.	192.168.1.50	2026-09-13 04:38:14.947359
638	1	UPDATE	rol_permiso	3	Se actualizaron los permisos del rol 'Cajero (POS)' (ID: 3). Total asignados: 4.	192.168.1.50	2026-09-13 04:38:15.090525
4287	1	INSERT	usuario	1000	Alta de usuario 'Audit CU04' (qa_bitacora_cu04@fashionstore.com) con rol id=4.	192.168.1.50	2026-09-13 10:20:14.613434
574	1	INSERT	usuario	89	Alta de usuario 'Carlos Recuperador' (qa_recovery_user@fashionstore.com) con rol id=4.	192.168.1.50	2026-09-13 04:09:02.199861
6601	1	IA_ANALITICA_VOZ	venta	\N	Analítica por voz CU23: 'Generar reporte ejecutivo de ventas globales del mes' -> Métrica 'ventas_total', Resultados=0, PDF=True.	192.168.1.50	2026-09-13 22:18:49.664587
576	1	INSERT	usuario	90	Alta de usuario 'Carlos Recuperador' (qa_recovery_user@fashionstore.com) con rol id=4.	192.168.1.50	2026-09-13 04:09:02.657099
577	1	INSERT	usuario	91	Alta de usuario 'Carlos Recuperador' (qa_recovery_user@fashionstore.com) con rol id=4.	192.168.1.50	2026-09-13 04:09:03.028205
641	1	UPDATE	rol_permiso	3	Se actualizaron los permisos del rol 'Cajero (POS)' (ID: 3). Total asignados: 5.	192.168.1.50	2026-09-13 04:38:15.9147
642	1	INSERT	usuario	103	Alta de usuario 'Carlos Recuperador' (qa_recovery_user@fashionstore.com) con rol id=4.	192.168.1.50	2026-09-13 04:38:16.171033
580	1	INSERT	usuario	92	Alta de usuario 'Carlos Recuperador' (qa_recovery_user@fashionstore.com) con rol id=4.	192.168.1.50	2026-09-13 04:09:03.740497
6602	1	IA_ANALITICA_VOZ	inventario	\N	Analítica por voz CU23: 'Reporte de existencias para auditoria' -> Métrica 'inventario_stock', Resultados=4, PDF=False.	172.16.5.99	2026-09-13 22:18:49.724789
582	1	INSERT	usuario	94	Alta de usuario 'Carlos Recuperador' (qa_recovery_user@fashionstore.com) con rol id=4.	192.168.1.50	2026-09-13 04:09:04.724023
6603	1	INSERT	ciudad	179	Alta de la ciudad 'Pando QA IP Test'.	200.87.100.45	2026-09-13 22:18:49.824876
584	1	INSERT	usuario	95	Alta de usuario 'Carlos Recuperador' (qa_recovery_user@fashionstore.com) con rol id=4.	192.168.1.50	2026-09-13 04:09:05.271794
644	1	INSERT	usuario	104	Alta de usuario 'Carlos Recuperador' (qa_recovery_user@fashionstore.com) con rol id=4.	192.168.1.50	2026-09-13 04:38:16.62765
647	1	INSERT	usuario	105	Alta de usuario 'Carlos Recuperador' (qa_recovery_user@fashionstore.com) con rol id=4.	192.168.1.50	2026-09-13 04:38:17.083129
589	1	INSERT	usuario	96	Alta de usuario 'Carlos Recuperador' (qa_recovery_user@fashionstore.com) con rol id=4.	192.168.1.50	2026-09-13 04:09:06.511966
4856	\N	LOGIN_FALLIDO	usuario	\N	Intento de inicio de sesión fallido para el correo: no_existe_seguro@fashionstore.com (correo no registrado).	192.168.99.99	2026-09-13 19:06:11.214847
649	1	INSERT	usuario	106	Alta de usuario 'Carlos Recuperador' (qa_recovery_user@fashionstore.com) con rol id=4.	192.168.1.50	2026-09-13 04:38:17.530812
4857	1	UPDATE	rol_permiso	3	Se actualizaron los permisos del rol 'Cajero (POS)' (ID: 3). Total asignados: 3.	198.51.100.22	2026-09-13 19:06:11.482532
593	1	INSERT	cliente	14	Alta del cliente 'Lucía Morales Paz' (CI 88997711).	192.168.40.1	2026-09-13 04:09:07.771944
594	1	UPDATE	cliente	14	Modificación del cliente CI 88997711. Campos: nombre_completo=Lucía Morales de Mendoza, telefono=78999999.	192.168.40.2	2026-09-13 04:09:08.211924
595	1	INACTIVAR	cliente	14	Baja lógica del cliente 'Lucía Morales de Mendoza' (CI 88997711).	192.168.40.3	2026-09-13 04:09:08.265755
4858	1	INSERT	usuario	1044	Alta de usuario 'Audit CU04' (qa_bitacora_cu04@fashionstore.com) con rol id=4.	192.168.1.50	2026-09-13 19:06:11.599001
4861	1	LOGIN_EXITOSO	usuario	1	Inicio de sesión exitoso de 'Alejandro Sistemas' (admin@fashionstore.com) con rol 'Administrador'.	172.20.0.1	2026-09-13 19:06:19.996693
4862	1	LOGIN_EXITOSO	usuario	1	Inicio de sesión exitoso de 'Alejandro Sistemas' (admin@fashionstore.com) con rol 'Administrador'.	172.20.0.1	2026-09-13 19:06:22.10513
4966	1	LOGIN_EXITOSO	usuario	1	Inicio de sesión exitoso de 'Alejandro Sistemas' (admin@fashionstore.com) con rol 'Administrador'.	172.20.0.1	2026-09-13 19:06:48.277356
654	1	INSERT	usuario	107	Alta de usuario 'Carlos Recuperador' (qa_recovery_user@fashionstore.com) con rol id=4.	192.168.1.50	2026-09-13 04:38:18.762642
656	1	INSERT	usuario	108	Alta de usuario 'Carlos Recuperador' (qa_recovery_user@fashionstore.com) con rol id=4.	192.168.1.50	2026-09-13 04:38:19.216544
657	1	INSERT	usuario	109	Alta de usuario 'Carlos Recuperador' (qa_recovery_user@fashionstore.com) con rol id=4.	192.168.1.50	2026-09-13 04:38:19.575058
613	\N	LOGIN_FALLIDO	usuario	\N	Intento de inicio de sesión fallido para el correo: no_existe_seguro@fashionstore.com (correo no registrado).	192.168.99.99	2026-09-13 04:09:11.583882
614	1	UPDATE	rol_permiso	3	Se actualizaron los permisos del rol 'Cajero (POS)' (ID: 3). Total asignados: 3.	198.51.100.22	2026-09-13 04:09:11.846309
615	1	INSERT	usuario	97	Alta de usuario 'Audit CU04' (qa_bitacora_cu04@fashionstore.com) con rol id=4.	192.168.1.50	2026-09-13 04:09:11.955743
660	1	INSERT	usuario	110	Alta de usuario 'Carlos Recuperador' (qa_recovery_user@fashionstore.com) con rol id=4.	192.168.1.50	2026-09-13 04:38:20.274908
662	1	INSERT	usuario	112	Alta de usuario 'Carlos Recuperador' (qa_recovery_user@fashionstore.com) con rol id=4.	192.168.1.50	2026-09-13 04:38:21.254556
664	1	INSERT	usuario	113	Alta de usuario 'Carlos Recuperador' (qa_recovery_user@fashionstore.com) con rol id=4.	192.168.1.50	2026-09-13 04:38:21.798757
669	1	INSERT	usuario	114	Alta de usuario 'Carlos Recuperador' (qa_recovery_user@fashionstore.com) con rol id=4.	192.168.1.50	2026-09-13 04:38:23.043051
673	1	INSERT	cliente	15	Alta del cliente 'Lucía Morales Paz' (CI 88997711).	192.168.40.1	2026-09-13 04:38:24.294958
674	1	UPDATE	cliente	15	Modificación del cliente CI 88997711. Campos: nombre_completo=Lucía Morales de Mendoza, telefono=78999999.	192.168.40.2	2026-09-13 04:38:24.722759
675	1	INACTIVAR	cliente	15	Baja lógica del cliente 'Lucía Morales de Mendoza' (CI 88997711).	192.168.40.3	2026-09-13 04:38:24.777021
4291	1	LOGIN_EXITOSO	usuario	1	Inicio de sesión exitoso de 'Alejandro Sistemas' (admin@fashionstore.com) con rol 'Administrador'.	172.20.0.1	2026-09-13 10:21:42.02904
6604	\N	LOGIN_FALLIDO	usuario	\N	Intento de inicio de sesión fallido para el correo: no_existe_seguro@fashionstore.com (correo no registrado).	192.168.99.99	2026-09-13 22:18:50.020627
6605	1	UPDATE	rol_permiso	3	Se actualizaron los permisos del rol 'Cajero (POS)' (ID: 3). Total asignados: 3.	198.51.100.22	2026-09-13 22:18:50.30349
6606	1	INSERT	usuario	1207	Alta de usuario 'Audit CU04' (qa_bitacora_cu04@fashionstore.com) con rol id=4.	192.168.1.50	2026-09-13 22:18:50.420468
8309	1	LOGIN_EXITOSO	usuario	1	Inicio de sesión exitoso de 'Alejandro Sistemas' (admin@fashionstore.com) con rol 'Administrador'.	192.168.10.101	2026-09-20 19:34:50.761104
5398	\N	UPDATE	prenda	4	Se modificó la prenda. SKU anterior: E2E-CALZADO-1788649379 -> SKU nuevo: E2E-CALZADO-1788649379	\N	2026-09-13 19:09:41.725843
1109	1	INSERT	usuario	227	Alta de usuario 'Adv Tester' (qa_adv_cli_esc@fashionstore.com) con rol id=4.	192.168.1.50	2026-09-13 04:46:41.828059
5666	1	INSERT	usuario	1077	Alta de usuario 'Usuario Cliente QA' (qa_cliente_rbac@fashionstore.com) con rol id=4.	192.168.1.50	2026-09-13 19:22:29.550694
4304	1	LOGIN_EXITOSO	usuario	1	Inicio de sesión exitoso de 'Alejandro Sistemas' (admin@fashionstore.com) con rol 'Administrador'.	172.20.0.1	2026-09-13 10:22:07.111778
693	\N	LOGIN_FALLIDO	usuario	\N	Intento de inicio de sesión fallido para el correo: no_existe_seguro@fashionstore.com (correo no registrado).	192.168.99.99	2026-09-13 04:38:28.114763
694	1	UPDATE	rol_permiso	3	Se actualizaron los permisos del rol 'Cajero (POS)' (ID: 3). Total asignados: 3.	198.51.100.22	2026-09-13 04:38:28.377729
695	1	INSERT	usuario	115	Alta de usuario 'Audit CU04' (qa_bitacora_cu04@fashionstore.com) con rol id=4.	192.168.1.50	2026-09-13 04:38:28.490898
699	1	LOGIN_EXITOSO	usuario	1	Inicio de sesión exitoso de 'Alejandro Sistemas' (admin@fashionstore.com) con rol 'Administrador'.	172.20.0.1	2026-09-13 04:44:18.136491
4308	1	LOGIN_EXITOSO	usuario	1	Inicio de sesión exitoso de 'Alejandro Sistemas' (admin@fashionstore.com) con rol 'Administrador'.	172.20.0.1	2026-09-13 10:22:35.650395
702	1	UPDATE	rol_permiso	3	Se actualizaron los permisos del rol 'Cajero (POS)' (ID: 3). Total asignados: 2.	192.168.1.50	2026-09-13 04:44:19.191789
703	1	UPDATE	rol_permiso	3	Se actualizaron los permisos del rol 'Cajero (POS)' (ID: 3). Total asignados: 4.	192.168.1.50	2026-09-13 04:44:19.535589
704	1	UPDATE	rol_permiso	3	Se actualizaron los permisos del rol 'Cajero (POS)' (ID: 3). Total asignados: 0.	192.168.1.50	2026-09-13 04:44:19.647051
707	1	UPDATE	rol_permiso	3	Se actualizaron los permisos del rol 'Cajero (POS)' (ID: 3). Total asignados: 5.	192.168.1.50	2026-09-13 04:44:20.671245
708	1	UPDATE	rol_permiso	3	Se actualizaron los permisos del rol 'Cajero (POS)' (ID: 3). Total asignados: 4.	192.168.1.50	2026-09-13 04:44:20.815739
711	1	UPDATE	rol_permiso	3	Se actualizaron los permisos del rol 'Cajero (POS)' (ID: 3). Total asignados: 5.	192.168.1.50	2026-09-13 04:44:21.64714
712	1	INSERT	usuario	119	Alta de usuario 'Carlos Recuperador' (qa_recovery_user@fashionstore.com) con rol id=4.	192.168.1.50	2026-09-13 04:44:21.903048
4317	1	LOGIN_EXITOSO	usuario	1	Inicio de sesión exitoso de 'Alejandro Sistemas' (admin@fashionstore.com) con rol 'Administrador'.	172.20.0.1	2026-09-13 10:22:47.997482
714	1	INSERT	usuario	120	Alta de usuario 'Carlos Recuperador' (qa_recovery_user@fashionstore.com) con rol id=4.	192.168.1.50	2026-09-13 04:44:22.351586
717	1	INSERT	usuario	121	Alta de usuario 'Carlos Recuperador' (qa_recovery_user@fashionstore.com) con rol id=4.	192.168.1.50	2026-09-13 04:44:22.803287
4868	1	LOGIN_EXITOSO	usuario	1	Inicio de sesión exitoso de 'Alejandro Sistemas' (admin@fashionstore.com) con rol 'Administrador'.	172.20.0.1	2026-09-13 19:06:26.805556
719	1	INSERT	usuario	122	Alta de usuario 'Carlos Recuperador' (qa_recovery_user@fashionstore.com) con rol id=4.	192.168.1.50	2026-09-13 04:44:23.255428
724	1	INSERT	usuario	123	Alta de usuario 'Carlos Recuperador' (qa_recovery_user@fashionstore.com) con rol id=4.	192.168.1.50	2026-09-13 04:44:24.515614
4877	1	LOGIN_EXITOSO	usuario	1	Inicio de sesión exitoso de 'Alejandro Sistemas' (admin@fashionstore.com) con rol 'Administrador'.	172.20.0.1	2026-09-13 19:06:29.290761
726	1	INSERT	usuario	124	Alta de usuario 'Carlos Recuperador' (qa_recovery_user@fashionstore.com) con rol id=4.	192.168.1.50	2026-09-13 04:44:24.979641
727	1	INSERT	usuario	125	Alta de usuario 'Carlos Recuperador' (qa_recovery_user@fashionstore.com) con rol id=4.	192.168.1.50	2026-09-13 04:44:25.351035
4880	1	LOGIN_EXITOSO	usuario	1	Inicio de sesión exitoso de 'Alejandro Sistemas' (admin@fashionstore.com) con rol 'Administrador'.	172.20.0.1	2026-09-13 19:06:33.590313
730	1	INSERT	usuario	126	Alta de usuario 'Carlos Recuperador' (qa_recovery_user@fashionstore.com) con rol id=4.	192.168.1.50	2026-09-13 04:44:26.06707
732	1	INSERT	usuario	128	Alta de usuario 'Carlos Recuperador' (qa_recovery_user@fashionstore.com) con rol id=4.	192.168.1.50	2026-09-13 04:44:27.083784
734	1	INSERT	usuario	129	Alta de usuario 'Carlos Recuperador' (qa_recovery_user@fashionstore.com) con rol id=4.	192.168.1.50	2026-09-13 04:44:27.639205
739	1	INSERT	usuario	130	Alta de usuario 'Carlos Recuperador' (qa_recovery_user@fashionstore.com) con rol id=4.	192.168.1.50	2026-09-13 04:44:28.87962
743	1	LOGIN_EXITOSO	usuario	1	Inicio de sesión exitoso de 'Alejandro Sistemas' (admin@fashionstore.com) con rol 'Administrador'.	192.168.10.101	2026-09-13 04:44:54.448563
744	1	LOGIN_EXITOSO	usuario	1	Inicio de sesión exitoso de 'Alejandro Sistemas' (admin@fashionstore.com) con rol 'Administrador'.	172.20.0.1	2026-09-13 04:44:54.717166
745	1	LOGIN_FALLIDO	usuario	1	Intento de inicio de sesión fallido para el correo: admin@fashionstore.com (contraseña incorrecta).	192.168.10.102	2026-09-13 04:44:54.982422
746	\N	LOGIN_FALLIDO	usuario	\N	Intento de inicio de sesión fallido para el correo: no_existe_qa_999@fashionstore.com (correo no registrado).	192.168.10.103	2026-09-13 04:44:55.25468
747	1	LOGIN_EXITOSO	usuario	1	Inicio de sesión exitoso de 'Alejandro Sistemas' (admin@fashionstore.com) con rol 'Administrador'.	172.20.0.1	2026-09-13 04:44:55.525625
4893	1	LOGIN_FALLIDO	usuario	1	Intento de inicio de sesión fallido para el correo: admin@fashionstore.com (contraseña incorrecta).	172.20.0.1	2026-09-13 19:06:36.10378
752	1	UPDATE	usuario	133	Modificación del usuario 'qa_nuevo_cajero@fashionstore.com'. Campos actualizados: nombre=Carlos Alberto, telefono=71122334.	192.168.20.2	2026-09-13 04:44:57.697863
753	1	INACTIVAR	usuario	133	Baja lógica del usuario 'qa_nuevo_cajero@fashionstore.com': estado cambiado de 'Activo' a 'Inactivo'.	192.168.20.3	2026-09-13 04:44:57.981715
754	1	UPDATE	rol_permiso	3	Se actualizaron los permisos del rol 'Cajero (POS)' (ID: 3). Total asignados: 2.	192.168.1.50	2026-09-13 04:44:58.369786
755	1	UPDATE	rol_permiso	3	Se actualizaron los permisos del rol 'Cajero (POS)' (ID: 3). Total asignados: 4.	192.168.1.50	2026-09-13 04:44:58.706177
756	1	UPDATE	rol_permiso	3	Se actualizaron los permisos del rol 'Cajero (POS)' (ID: 3). Total asignados: 0.	192.168.1.50	2026-09-13 04:44:58.817897
759	1	UPDATE	rol_permiso	3	Se actualizaron los permisos del rol 'Cajero (POS)' (ID: 3). Total asignados: 5.	192.168.1.50	2026-09-13 04:44:59.842114
760	1	UPDATE	rol_permiso	3	Se actualizaron los permisos del rol 'Cajero (POS)' (ID: 3). Total asignados: 4.	192.168.1.50	2026-09-13 04:45:00.010131
763	1	UPDATE	rol_permiso	3	Se actualizaron los permisos del rol 'Cajero (POS)' (ID: 3). Total asignados: 5.	192.168.1.50	2026-09-13 04:45:00.841864
764	1	INSERT	usuario	136	Alta de usuario 'Carlos Recuperador' (qa_recovery_user@fashionstore.com) con rol id=4.	192.168.1.50	2026-09-13 04:45:01.102852
766	1	INSERT	usuario	137	Alta de usuario 'Carlos Recuperador' (qa_recovery_user@fashionstore.com) con rol id=4.	192.168.1.50	2026-09-13 04:45:01.554344
6077	1	INSERT	usuario	1143	Alta de usuario 'Carlos Recuperador' (qa_recovery_user@fashionstore.com) con rol id=4.	192.168.1.50	2026-09-13 19:35:00.60317
769	1	INSERT	usuario	138	Alta de usuario 'Carlos Recuperador' (qa_recovery_user@fashionstore.com) con rol id=4.	192.168.1.50	2026-09-13 04:45:02.022392
6078	1	INSERT	usuario	1144	Alta de usuario 'Inactivo QA' (qa_user_inactivo_recovery@fashionstore.com) con rol id=4.	192.168.1.50	2026-09-13 19:35:01.219301
771	1	INSERT	usuario	139	Alta de usuario 'Carlos Recuperador' (qa_recovery_user@fashionstore.com) con rol id=4.	192.168.1.50	2026-09-13 04:45:02.469823
772	\N	SOLICITUD_RECUPERACION_PASSWORD	usuario_token	81	Solicitud de recuperación de contraseña para el correo: qa_recovery_user@fashionstore.com.	172.20.0.1	2026-09-13 04:45:02.731489
6079	1	INSERT	usuario	1145	Alta de usuario 'Carlos Recuperador' (qa_recovery_user@fashionstore.com) con rol id=4.	192.168.1.50	2026-09-13 19:35:01.578905
774	1	INSERT	usuario	140	Alta de usuario 'Carlos Recuperador' (qa_recovery_user@fashionstore.com) con rol id=4.	192.168.1.50	2026-09-13 04:45:03.266082
776	1	LOGIN_EXITOSO	usuario	1	Inicio de sesión exitoso de 'Alejandro Sistemas' (admin@fashionstore.com) con rol 'Administrador'.	192.168.10.101	2026-09-13 04:45:03.333088
777	1	LOGIN_EXITOSO	usuario	1	Inicio de sesión exitoso de 'Alejandro Sistemas' (admin@fashionstore.com) con rol 'Administrador'.	172.20.0.1	2026-09-13 04:45:03.591592
778	1	INSERT	usuario	141	Alta de usuario 'Carlos Recuperador' (qa_recovery_user@fashionstore.com) con rol id=4.	192.168.1.50	2026-09-13 04:45:03.754255
779	1	LOGIN_FALLIDO	usuario	1	Intento de inicio de sesión fallido para el correo: admin@fashionstore.com (contraseña incorrecta).	192.168.10.102	2026-09-13 04:45:03.856705
780	\N	LOGIN_FALLIDO	usuario	\N	Intento de inicio de sesión fallido para el correo: no_existe_qa_999@fashionstore.com (correo no registrado).	192.168.10.103	2026-09-13 04:45:04.122791
781	1	INSERT	usuario	142	Alta de usuario 'Carlos Recuperador' (qa_recovery_user@fashionstore.com) con rol id=4.	192.168.1.50	2026-09-13 04:45:04.135388
6081	1	INSERT	usuario	1146	Alta de usuario 'Carlos Recuperador' (qa_recovery_user@fashionstore.com) con rol id=4.	192.168.1.50	2026-09-13 19:35:02.126928
783	1	LOGIN_EXITOSO	usuario	1	Inicio de sesión exitoso de 'Alejandro Sistemas' (admin@fashionstore.com) con rol 'Administrador'.	172.20.0.1	2026-09-13 04:45:04.385762
785	1	INSERT	usuario	144	Alta de usuario 'Carlos Recuperador' (qa_recovery_user@fashionstore.com) con rol id=4.	192.168.1.50	2026-09-13 04:45:04.882274
5189	1	LOGIN_EXITOSO	usuario	1	Inicio de sesión exitoso de 'Alejandro Sistemas' (admin@fashionstore.com) con rol 'Administrador'.	172.20.0.1	2026-09-13 19:08:22.608801
790	1	INSERT	usuario	147	Alta de usuario 'Carlos Recuperador' (qa_recovery_user@fashionstore.com) con rol id=4.	192.168.1.50	2026-09-13 04:45:05.885704
6086	1	INSERT	usuario	1147	Alta de usuario 'Carlos Recuperador' (qa_recovery_user@fashionstore.com) con rol id=4.	192.168.1.50	2026-09-13 19:35:03.338971
793	1	UPDATE	usuario	148	Modificación del usuario 'qa_nuevo_cajero@fashionstore.com'. Campos actualizados: nombre=Carlos Alberto, telefono=71122334.	192.168.20.2	2026-09-13 04:45:06.641742
794	1	INSERT	usuario	149	Alta de usuario 'Carlos Recuperador' (qa_recovery_user@fashionstore.com) con rol id=4.	192.168.1.50	2026-09-13 04:45:06.4403
5193	1	LOGIN_EXITOSO	usuario	1	Inicio de sesión exitoso de 'Alejandro Sistemas' (admin@fashionstore.com) con rol 'Administrador'.	172.20.0.1	2026-09-13 19:08:28.909412
796	1	INACTIVAR	usuario	148	Baja lógica del usuario 'qa_nuevo_cajero@fashionstore.com': estado cambiado de 'Activo' a 'Inactivo'.	192.168.20.3	2026-09-13 04:45:06.941863
799	1	UPDATE	rol_permiso	3	Se actualizaron los permisos del rol 'Cajero (POS)' (ID: 3). Total asignados: 2.	192.168.1.50	2026-09-13 04:45:07.363545
6090	1	LOGIN_EXITOSO	usuario	1	Inicio de sesión exitoso de 'Alejandro Sistemas' (admin@fashionstore.com) con rol 'Administrador'.	172.20.0.1	2026-09-13 19:35:09.724259
801	1	UPDATE	rol_permiso	3	Se actualizaron los permisos del rol 'Cajero (POS)' (ID: 3). Total asignados: 4.	192.168.1.50	2026-09-13 04:45:07.715021
802	1	UPDATE	rol_permiso	3	Se actualizaron los permisos del rol 'Cajero (POS)' (ID: 3). Total asignados: 0.	192.168.1.50	2026-09-13 04:45:07.825839
803	1	INSERT	usuario	150	Alta de usuario 'Carlos Recuperador' (qa_recovery_user@fashionstore.com) con rol id=4.	192.168.1.50	2026-09-13 04:45:07.702112
6091	1	INSERT	cliente	56	Alta del cliente 'Lucía Morales Paz' (CI 88997711).	192.168.40.1	2026-09-13 19:35:10.087003
6092	1	UPDATE	cliente	56	Modificación del cliente CI 88997711. Campos: nombre_completo=Lucía Morales de Mendoza, telefono=78999999.	192.168.40.2	2026-09-13 19:35:10.50553
6093	1	INACTIVAR	cliente	56	Baja lógica del cliente 'Lucía Morales de Mendoza' (CI 88997711).	192.168.40.3	2026-09-13 19:35:10.558202
6094	1	INSERT	ciudad	170	Alta de la ciudad 'Tarija QA'.	192.168.30.1	2026-09-13 19:35:10.801632
6095	1	INSERT	usuario	1148	Alta de usuario 'Usuario Cliente QA' (qa_cliente_rbac@fashionstore.com) con rol id=4.	192.168.1.50	2026-09-13 19:35:10.977466
809	1	UPDATE	rol_permiso	3	Se actualizaron los permisos del rol 'Cajero (POS)' (ID: 3). Total asignados: 5.	192.168.1.50	2026-09-13 04:45:08.849791
810	1	INSERT	cliente	16	Alta del cliente 'Lucía Morales Paz' (CI 88997711).	192.168.40.1	2026-09-13 04:45:08.958057
811	1	UPDATE	rol_permiso	3	Se actualizaron los permisos del rol 'Cajero (POS)' (ID: 3). Total asignados: 4.	192.168.1.50	2026-09-13 04:45:08.993737
813	1	UPDATE	cliente	16	Modificación del cliente CI 88997711. Campos: nombre_completo=Lucía Morales de Mendoza, telefono=78999999.	192.168.40.2	2026-09-13 04:45:09.405764
814	1	INACTIVAR	cliente	16	Baja lógica del cliente 'Lucía Morales de Mendoza' (CI 88997711).	192.168.40.3	2026-09-13 04:45:09.47261
817	1	UPDATE	rol_permiso	3	Se actualizaron los permisos del rol 'Cajero (POS)' (ID: 3). Total asignados: 5.	192.168.1.50	2026-09-13 04:45:09.862068
819	1	INSERT	usuario	153	Alta de usuario 'Carlos Recuperador' (qa_recovery_user@fashionstore.com) con rol id=4.	192.168.1.50	2026-09-13 04:45:10.123646
823	1	INSERT	usuario	154	Alta de usuario 'Carlos Recuperador' (qa_recovery_user@fashionstore.com) con rol id=4.	192.168.1.50	2026-09-13 04:45:10.582947
828	1	INSERT	usuario	155	Alta de usuario 'Carlos Recuperador' (qa_recovery_user@fashionstore.com) con rol id=4.	192.168.1.50	2026-09-13 04:45:11.034127
1122	1	LOGIN_EXITOSO	usuario	1	Inicio de sesión exitoso de 'Alejandro Sistemas' (admin@fashionstore.com) con rol 'Administrador'.	192.168.10.101	2026-09-13 04:46:43.005827
834	1	INSERT	usuario	156	Alta de usuario 'Carlos Recuperador' (qa_recovery_user@fashionstore.com) con rol id=4.	192.168.1.50	2026-09-13 04:45:11.493718
1823	1	INSERT	usuario	406	Alta de usuario 'Carlos Recuperador' (qa_recovery_user@fashionstore.com) con rol id=4.	192.168.1.50	2026-09-13 04:49:56.405154
1130	1	UPDATE	rol_permiso	3	Se actualizaron los permisos del rol 'Cajero (POS)' (ID: 3). Total asignados: 4.	192.168.1.50	2026-09-13 04:46:43.817708
1131	1	UPDATE	rol_permiso	3	Se actualizaron los permisos del rol 'Cajero (POS)' (ID: 3). Total asignados: 5.	192.168.1.50	2026-09-13 04:46:43.984726
5202	1	LOGIN_EXITOSO	usuario	1	Inicio de sesión exitoso de 'Alejandro Sistemas' (admin@fashionstore.com) con rol 'Administrador'.	172.20.0.1	2026-09-13 19:08:32.286828
5205	1	LOGIN_EXITOSO	usuario	1	Inicio de sesión exitoso de 'Alejandro Sistemas' (admin@fashionstore.com) con rol 'Administrador'.	172.20.0.1	2026-09-13 19:08:33.223436
5405	1	LOGIN_EXITOSO	usuario	1	Inicio de sesión exitoso de 'Alejandro Sistemas' (admin@fashionstore.com) con rol 'Administrador'.	172.20.0.1	2026-09-13 19:09:48.746247
5407	\N	LOGIN_FALLIDO	usuario	\N	Intento de inicio de sesión fallido para el correo: no_existe_seguro@fashionstore.com (correo no registrado).	192.168.99.99	2026-09-13 19:09:49.168867
5408	1	UPDATE	rol_permiso	3	Se actualizaron los permisos del rol 'Cajero (POS)' (ID: 3). Total asignados: 3.	198.51.100.22	2026-09-13 19:09:49.439498
835	\N	SOLICITUD_RECUPERACION_PASSWORD	usuario_token	93	Solicitud de recuperación de contraseña para el correo: qa_recovery_user@fashionstore.com.	172.20.0.1	2026-09-13 04:45:11.775634
837	\N	RESTABLECER_PASSWORD_EXITOSO	usuario	156	Restablecimiento exitoso de contraseña para la cuenta 'qa_recovery_user@fashionstore.com' (ID: 156).	192.168.1.77	2026-09-13 04:45:11.869844
843	\N	LOGIN_EXITOSO	usuario	156	Inicio de sesión exitoso de 'Carlos Recuperador' (qa_recovery_user@fashionstore.com) con rol 'Cliente'.	172.20.0.1	2026-09-13 04:45:12.128765
5409	1	INSERT	usuario	1063	Alta de usuario 'Audit CU04' (qa_bitacora_cu04@fashionstore.com) con rol id=4.	192.168.1.50	2026-09-13 19:09:49.553118
846	\N	UPDATE	prenda	3	Se modificó la prenda. SKU anterior: CHQ-JEAN-001 -> SKU nuevo: CHQ-JEAN-001	\N	2026-09-13 04:45:12.655435
848	1	INSERT	usuario	157	Alta de usuario 'Carlos Recuperador' (qa_recovery_user@fashionstore.com) con rol id=4.	192.168.1.50	2026-09-13 04:45:12.849717
850	1	LOGIN_EXITOSO	usuario	1	Inicio de sesión exitoso de 'Alejandro Sistemas' (admin@fashionstore.com) con rol 'Administrador'.	172.20.0.1	2026-09-13 04:45:12.928381
851	\N	LOGIN_FALLIDO	usuario	\N	Intento de inicio de sesión fallido para el correo: no_existe_seguro@fashionstore.com (correo no registrado).	192.168.99.99	2026-09-13 04:45:13.023013
852	1	UPDATE	rol_permiso	3	Se actualizaron los permisos del rol 'Cajero (POS)' (ID: 3). Total asignados: 3.	198.51.100.22	2026-09-13 04:45:13.291505
853	1	INSERT	usuario	158	Alta de usuario 'Cajero Adv' (qa_adv_cajero@fashionstore.com) con rol id=3.	192.168.1.50	2026-09-13 04:45:13.156549
854	1	INSERT	usuario	159	Alta de usuario 'Carlos Recuperador' (qa_recovery_user@fashionstore.com) con rol id=4.	192.168.1.50	2026-09-13 04:45:13.328456
855	1	INSERT	usuario	160	Alta de usuario 'Audit CU04' (qa_bitacora_cu04@fashionstore.com) con rol id=4.	192.168.1.50	2026-09-13 04:45:13.400377
856	1	INSERT	usuario	161	Alta de usuario 'Cliente Adv' (qa_adv_cliente@fashionstore.com) con rol id=4.	192.168.1.50	2026-09-13 04:45:13.427069
5413	1	LOGIN_EXITOSO	usuario	1	Inicio de sesión exitoso de 'Alejandro Sistemas' (admin@fashionstore.com) con rol 'Administrador'.	172.20.0.1	2026-09-13 19:09:56.690791
858	1	INSERT	usuario	162	Alta de usuario 'Carlos Recuperador' (qa_recovery_user@fashionstore.com) con rol id=4.	192.168.1.50	2026-09-13 04:45:13.688749
859	\N	LOGIN_EXITOSO	usuario	158	Inicio de sesión exitoso de 'Cajero Adv' (qa_adv_cajero@fashionstore.com) con rol 'Cajero (POS)'.	172.20.0.1	2026-09-13 04:45:13.706893
860	\N	SOLICITUD_RECUPERACION_PASSWORD	usuario_token	97	Solicitud de recuperación de contraseña para el correo: qa_recovery_user@fashionstore.com.	172.20.0.1	2026-09-13 04:45:13.95363
5415	\N	LOGIN_FALLIDO	usuario	\N	Intento de inicio de sesión fallido para el correo: no_existe_seguro@fashionstore.com (correo no registrado).	192.168.99.99	2026-09-13 19:09:57.100564
5416	1	UPDATE	rol_permiso	3	Se actualizaron los permisos del rol 'Cajero (POS)' (ID: 3). Total asignados: 3.	198.51.100.22	2026-09-13 19:09:57.363822
864	1	INSERT	usuario	163	Alta de usuario 'Carlos Recuperador' (qa_recovery_user@fashionstore.com) con rol id=4.	192.168.1.50	2026-09-13 04:45:14.296927
865	1	INSERT	usuario	164	Alta de usuario 'Cajero Adv' (qa_adv_cajero@fashionstore.com) con rol id=3.	192.168.1.50	2026-09-13 04:45:14.427117
866	1	INSERT	usuario	165	Alta de usuario 'Cliente Adv' (qa_adv_cliente@fashionstore.com) con rol id=4.	192.168.1.50	2026-09-13 04:45:14.682208
869	1	INSERT	usuario	167	Alta de usuario 'Carlos Recuperador' (qa_recovery_user@fashionstore.com) con rol id=4.	192.168.1.50	2026-09-13 04:45:15.200661
872	1	UPDATE	rol_permiso	3	Se actualizaron los permisos del rol 'Cajero (POS)' (ID: 3). Total asignados: 4.	192.168.1.50	2026-09-13 04:45:15.508458
873	1	UPDATE	rol_permiso	3	Se actualizaron los permisos del rol 'Cajero (POS)' (ID: 3). Total asignados: 5.	192.168.1.50	2026-09-13 04:45:15.644345
874	1	UPDATE	rol_permiso	3	Se actualizaron los permisos del rol 'Cajero (POS)' (ID: 3). Total asignados: 4.	192.168.1.50	2026-09-13 04:45:15.745087
875	1	UPDATE	rol_permiso	3	Se actualizaron los permisos del rol 'Cajero (POS)' (ID: 3). Total asignados: 0.	192.168.1.50	2026-09-13 04:45:15.936667
876	1	INSERT	usuario	168	Alta de usuario 'Carlos Recuperador' (qa_recovery_user@fashionstore.com) con rol id=4.	192.168.1.50	2026-09-13 04:45:15.77647
877	1	UPDATE	rol_permiso	3	Se actualizaron los permisos del rol 'Cajero (POS)' (ID: 3). Total asignados: 3.	192.168.1.50	2026-09-13 04:45:16.028465
881	1	INSERT	usuario	169	Alta de usuario 'Cajero Adv' (qa_adv_cajero@fashionstore.com) con rol id=3.	192.168.1.50	2026-09-13 04:45:16.434503
883	1	INSERT	usuario	170	Alta de usuario 'Cliente Adv' (qa_adv_cliente@fashionstore.com) con rol id=4.	192.168.1.50	2026-09-13 04:45:16.713997
885	1	INSERT	usuario	171	Alta de usuario 'Carlos Recuperador' (qa_recovery_user@fashionstore.com) con rol id=4.	192.168.1.50	2026-09-13 04:45:17.054062
890	1	INSERT	cliente	17	Alta del cliente 'Lucía Morales Paz' (CI 88997711).	192.168.40.1	2026-09-13 04:45:18.32854
891	1	UPDATE	cliente	17	Modificación del cliente CI 88997711. Campos: nombre_completo=Lucía Morales de Mendoza, telefono=78999999.	192.168.40.2	2026-09-13 04:45:18.752375
892	1	INACTIVAR	cliente	17	Baja lógica del cliente 'Lucía Morales de Mendoza' (CI 88997711).	192.168.40.3	2026-09-13 04:45:18.810402
893	1	INSERT	usuario	172	Alta de usuario 'Cajero Adv' (qa_adv_cajero@fashionstore.com) con rol id=3.	192.168.1.50	2026-09-13 04:45:18.840768
895	1	INSERT	usuario	173	Alta de usuario 'Cliente Adv' (qa_adv_cliente@fashionstore.com) con rol id=4.	192.168.1.50	2026-09-13 04:45:19.106159
897	\N	LOGIN_EXITOSO	usuario	172	Inicio de sesión exitoso de 'Cajero Adv' (qa_adv_cajero@fashionstore.com) con rol 'Cajero (POS)'.	172.20.0.1	2026-09-13 04:45:19.365747
899	\N	LOGIN_EXITOSO	usuario	173	Inicio de sesión exitoso de 'Cliente Adv' (qa_adv_cliente@fashionstore.com) con rol 'Cliente'.	172.20.0.1	2026-09-13 04:45:19.633708
900	\N	SOLICITUD_RECUPERACION_PASSWORD	usuario_token	104	Solicitud de recuperación de contraseña para el correo: qa_adv_cliente@fashionstore.com.	172.20.0.1	2026-09-13 04:45:19.918197
903	\N	RESTABLECER_PASSWORD_EXITOSO	usuario	173	Restablecimiento exitoso de contraseña para la cuenta 'qa_adv_cliente@fashionstore.com' (ID: 173).	172.20.0.1	2026-09-13 04:45:20.012119
904	\N	LOGIN_FALLIDO	usuario	173	Intento de inicio de sesión fallido para el correo: qa_adv_cliente@fashionstore.com (contraseña incorrecta).	172.20.0.1	2026-09-13 04:45:20.269686
6706	\N	UPDATE	prenda	173	Se modificó la prenda. SKU anterior: CAM-OXF-001 -> SKU nuevo: CAM-OXF-001	\N	2026-09-20 10:19:50.59881
5669	1	LOGIN_EXITOSO	usuario	1	Inicio de sesión exitoso de 'Alejandro Sistemas' (admin@fashionstore.com) con rol 'Administrador'.	172.20.0.1	2026-09-13 19:22:42.276412
4983	\N	LOGIN_FALLIDO	usuario	\N	Intento de inicio de sesión fallido para el correo: no_existe_seguro@fashionstore.com (correo no registrado).	192.168.99.99	2026-09-13 19:06:51.754142
4984	1	UPDATE	rol_permiso	3	Se actualizaron los permisos del rol 'Cajero (POS)' (ID: 3). Total asignados: 3.	198.51.100.22	2026-09-13 19:06:52.022239
4985	1	INSERT	usuario	1047	Alta de usuario 'Audit CU04' (qa_bitacora_cu04@fashionstore.com) con rol id=4.	192.168.1.50	2026-09-13 19:06:52.138658
6707	\N	UPDATE	prenda	174	Se modificó la prenda. SKU anterior: CAM-BLA-002 -> SKU nuevo: CAM-BLA-002	\N	2026-09-20 10:19:50.59881
913	1	LOGIN_EXITOSO	usuario	1	Inicio de sesión exitoso de 'Alejandro Sistemas' (admin@fashionstore.com) con rol 'Administrador'.	172.20.0.1	2026-09-13 04:45:20.970248
914	1	INSERT	usuario	174	Alta de usuario 'Carlos Recuperador' (qa_recovery_user@fashionstore.com) con rol id=4.	192.168.1.50	2026-09-13 04:45:21.191443
6708	\N	UPDATE	prenda	175	Se modificó la prenda. SKU anterior: CAM-LEN-003 -> SKU nuevo: CAM-LEN-003	\N	2026-09-20 10:19:50.59881
4988	1	LOGIN_EXITOSO	usuario	1	Inicio de sesión exitoso de 'Alejandro Sistemas' (admin@fashionstore.com) con rol 'Administrador'.	172.20.0.1	2026-09-13 19:06:56.382385
6709	\N	UPDATE	prenda	176	Se modificó la prenda. SKU anterior: BLU-FLO-001 -> SKU nuevo: BLU-FLO-001	\N	2026-09-20 10:19:50.59881
926	\N	LOGIN_FALLIDO	usuario	\N	Intento de inicio de sesión fallido para el correo: no_existe_seguro@fashionstore.com (correo no registrado).	192.168.99.99	2026-09-13 04:45:22.305788
927	1	UPDATE	rol_permiso	3	Se actualizaron los permisos del rol 'Cajero (POS)' (ID: 3). Total asignados: 3.	198.51.100.22	2026-09-13 04:45:22.583065
928	1	INSERT	usuario	175	Alta de usuario 'Audit CU04' (qa_bitacora_cu04@fashionstore.com) con rol id=4.	192.168.1.50	2026-09-13 04:45:22.692414
931	\N	LOGIN_FALLIDO	usuario	\N	Intento de inicio de sesión fallido para el correo: qa_adv_cliente@fashionstore.com (correo no registrado).	172.20.0.1	2026-09-13 04:45:25.51156
932	1	LOGIN_EXITOSO	usuario	1	Inicio de sesión exitoso de 'Alejandro Sistemas' (admin@fashionstore.com) con rol 'Administrador'.	172.20.0.1	2026-09-13 04:45:41.522366
933	1	INSERT	usuario	176	Alta de usuario 'Carlos Recuperador' (qa_recovery_user@fashionstore.com) con rol id=4.	192.168.1.50	2026-09-13 04:45:41.754519
938	1	LOGIN_EXITOSO	usuario	1	Inicio de sesión exitoso de 'Alejandro Sistemas' (admin@fashionstore.com) con rol 'Administrador'.	172.20.0.1	2026-09-13 04:45:46.16271
939	1	INSERT	usuario	177	Alta de usuario 'Repro User' (qa_repro_500@fashionstore.com) con rol id=4.	172.20.0.1	2026-09-13 04:45:46.411745
945	1	LOGIN_EXITOSO	usuario	1	Inicio de sesión exitoso de 'Alejandro Sistemas' (admin@fashionstore.com) con rol 'Administrador'.	172.20.0.1	2026-09-13 04:45:52.728839
946	1	INSERT	usuario	178	Alta de usuario 'Repro User' (qa_repro_500@fashionstore.com) con rol id=4.	172.20.0.1	2026-09-13 04:45:52.966831
952	1	LOGIN_EXITOSO	usuario	1	Inicio de sesión exitoso de 'Alejandro Sistemas' (admin@fashionstore.com) con rol 'Administrador'.	172.20.0.1	2026-09-13 04:46:02.820825
953	1	INSERT	usuario	179	Alta de usuario 'Carlos Recuperador' (qa_recovery_user@fashionstore.com) con rol id=4.	192.168.1.50	2026-09-13 04:46:03.043829
955	1	INSERT	usuario	180	Alta de usuario 'Carlos Recuperador' (qa_recovery_user@fashionstore.com) con rol id=4.	192.168.1.50	2026-09-13 04:46:03.518979
958	1	INSERT	usuario	181	Alta de usuario 'Carlos Recuperador' (qa_recovery_user@fashionstore.com) con rol id=4.	192.168.1.50	2026-09-13 04:46:03.994551
960	1	INSERT	usuario	182	Alta de usuario 'Carlos Recuperador' (qa_recovery_user@fashionstore.com) con rol id=4.	192.168.1.50	2026-09-13 04:46:04.438563
965	1	INSERT	usuario	183	Alta de usuario 'Carlos Recuperador' (qa_recovery_user@fashionstore.com) con rol id=4.	192.168.1.50	2026-09-13 04:46:05.68295
967	1	INSERT	usuario	184	Alta de usuario 'Carlos Recuperador' (qa_recovery_user@fashionstore.com) con rol id=4.	192.168.1.50	2026-09-13 04:46:06.143287
968	1	INSERT	usuario	185	Alta de usuario 'Carlos Recuperador' (qa_recovery_user@fashionstore.com) con rol id=4.	192.168.1.50	2026-09-13 04:46:06.530681
971	1	INSERT	usuario	186	Alta de usuario 'Carlos Recuperador' (qa_recovery_user@fashionstore.com) con rol id=4.	192.168.1.50	2026-09-13 04:46:07.246598
973	1	INSERT	usuario	188	Alta de usuario 'Carlos Recuperador' (qa_recovery_user@fashionstore.com) con rol id=4.	192.168.1.50	2026-09-13 04:46:08.254614
975	1	INSERT	usuario	189	Alta de usuario 'Carlos Recuperador' (qa_recovery_user@fashionstore.com) con rol id=4.	192.168.1.50	2026-09-13 04:46:08.798866
980	1	INSERT	usuario	190	Alta de usuario 'Carlos Recuperador' (qa_recovery_user@fashionstore.com) con rol id=4.	192.168.1.50	2026-09-13 04:46:10.035448
984	1	LOGIN_EXITOSO	usuario	1	Inicio de sesión exitoso de 'Alejandro Sistemas' (admin@fashionstore.com) con rol 'Administrador'.	172.20.0.1	2026-09-13 04:46:16.734839
987	1	UPDATE	rol_permiso	3	Se actualizaron los permisos del rol 'Cajero (POS)' (ID: 3). Total asignados: 2.	192.168.1.50	2026-09-13 04:46:17.761771
988	1	UPDATE	rol_permiso	3	Se actualizaron los permisos del rol 'Cajero (POS)' (ID: 3). Total asignados: 4.	192.168.1.50	2026-09-13 04:46:18.111659
989	1	UPDATE	rol_permiso	3	Se actualizaron los permisos del rol 'Cajero (POS)' (ID: 3). Total asignados: 0.	192.168.1.50	2026-09-13 04:46:18.225561
990	1	LOGIN_EXITOSO	usuario	1	Inicio de sesión exitoso de 'Alejandro Sistemas' (admin@fashionstore.com) con rol 'Administrador'.	172.20.0.1	2026-09-13 04:46:18.036039
995	1	UPDATE	rol_permiso	3	Se actualizaron los permisos del rol 'Cajero (POS)' (ID: 3). Total asignados: 5.	192.168.1.50	2026-09-13 04:46:19.357524
996	1	UPDATE	rol_permiso	3	Se actualizaron los permisos del rol 'Cajero (POS)' (ID: 3). Total asignados: 4.	192.168.1.50	2026-09-13 04:46:19.501525
998	1	LOGIN_EXITOSO	usuario	1	Inicio de sesión exitoso de 'Alejandro Sistemas' (admin@fashionstore.com) con rol 'Administrador'.	172.20.0.1	2026-09-13 04:46:19.922205
4318	1	LOGIN_EXITOSO	usuario	1	Inicio de sesión exitoso de 'Alejandro Sistemas' (admin@fashionstore.com) con rol 'Administrador'.	172.20.0.1	2026-09-13 10:22:59.540224
1001	1	UPDATE	rol_permiso	3	Se actualizaron los permisos del rol 'Cajero (POS)' (ID: 3). Total asignados: 5.	192.168.1.50	2026-09-13 04:46:20.353215
2618	1	LOGIN_EXITOSO	usuario	1	Inicio de sesión exitoso de 'Alejandro Sistemas' (admin@fashionstore.com) con rol 'Administrador'.	192.168.10.101	2026-09-13 09:44:44.935009
1115	1	INSERT	usuario	228	Alta de usuario 'Adv Tester' (qa_adv_caj_esc@fashionstore.com) con rol id=3.	192.168.1.50	2026-09-13 04:46:42.354077
4324	1	LOGIN_EXITOSO	usuario	1	Inicio de sesión exitoso de 'Alejandro Sistemas' (admin@fashionstore.com) con rol 'Administrador'.	172.20.0.1	2026-09-13 10:23:37.346377
5412	1	LOGIN_EXITOSO	usuario	1	Inicio de sesión exitoso de 'Alejandro Sistemas' (admin@fashionstore.com) con rol 'Administrador'.	172.20.0.1	2026-09-13 19:09:50.059
1125	1	INSERT	usuario	229	Alta de usuario 'Adv Tester' (qa_adv_caj_dyn@fashionstore.com) con rol id=3.	192.168.1.50	2026-09-13 04:46:43.275107
6710	\N	UPDATE	prenda	177	Se modificó la prenda. SKU anterior: BLU-HAL-002 -> SKU nuevo: BLU-HAL-002	\N	2026-09-20 10:19:50.59881
6711	\N	UPDATE	prenda	178	Se modificó la prenda. SKU anterior: VES-GALA-001 -> SKU nuevo: VES-GALA-001	\N	2026-09-20 10:19:50.59881
1134	1	UPDATE	rol_permiso	3	Se actualizaron los permisos del rol 'Cajero (POS)' (ID: 3). Total asignados: 4.	192.168.1.50	2026-09-13 04:46:44.0844
4330	1	LOGIN_EXITOSO	usuario	1	Inicio de sesión exitoso de 'Alejandro Sistemas' (admin@fashionstore.com) con rol 'Administrador'.	172.20.0.1	2026-09-13 10:23:52.861562
4331	1	LOGIN_EXITOSO	usuario	1	Inicio de sesión exitoso de 'Alejandro Sistemas' (admin@fashionstore.com) con rol 'Administrador'.	172.20.0.1	2026-09-13 10:24:14.926134
6712	\N	UPDATE	prenda	179	Se modificó la prenda. SKU anterior: VES-MIDI-002 -> SKU nuevo: VES-MIDI-002	\N	2026-09-20 10:19:50.59881
1139	1	UPDATE	rol_permiso	3	Se actualizaron los permisos del rol 'Cajero (POS)' (ID: 3). Total asignados: 0.	192.168.1.50	2026-09-13 04:46:44.252314
1140	1	UPDATE	rol_permiso	3	Se actualizaron los permisos del rol 'Cajero (POS)' (ID: 3). Total asignados: 3.	192.168.1.50	2026-09-13 04:46:44.344407
6713	\N	UPDATE	prenda	180	Se modificó la prenda. SKU anterior: SWT-HOD-001 -> SKU nuevo: SWT-HOD-001	\N	2026-09-20 10:19:50.59881
1143	1	INSERT	usuario	231	Alta de usuario 'Adv Tester' (qa_adv_tok_bounds@fashionstore.com) con rol id=4.	192.168.1.50	2026-09-13 04:46:44.792397
1144	\N	LOGIN_FALLIDO	usuario	\N	Intento de inicio de sesión fallido para el correo: no_existe_seguro@fashionstore.com (correo no registrado).	192.168.99.99	2026-09-13 04:46:44.844063
1145	1	UPDATE	rol_permiso	3	Se actualizaron los permisos del rol 'Cajero (POS)' (ID: 3). Total asignados: 3.	198.51.100.22	2026-09-13 04:46:45.123679
4337	1	LOGIN_EXITOSO	usuario	1	Inicio de sesión exitoso de 'Alejandro Sistemas' (admin@fashionstore.com) con rol 'Administrador'.	172.20.0.1	2026-09-13 10:24:29.153559
1149	1	INSERT	usuario	233	Alta de usuario 'Audit CU04' (qa_bitacora_cu04@fashionstore.com) con rol id=4.	192.168.1.50	2026-09-13 04:46:45.245592
6714	\N	UPDATE	prenda	181	Se modificó la prenda. SKU anterior: SWT-TOR-002 -> SKU nuevo: SWT-TOR-002	\N	2026-09-20 10:19:50.59881
6715	\N	UPDATE	prenda	182	Se modificó la prenda. SKU anterior: ABR-CAM-001 -> SKU nuevo: ABR-CAM-001	\N	2026-09-20 10:19:50.59881
4669	1	LOGIN_EXITOSO	usuario	1	Inicio de sesión exitoso de 'Alejandro Sistemas' (admin@fashionstore.com) con rol 'Administrador'.	172.20.0.1	2026-09-13 19:01:18.98737
1147	\N	LOGIN_EXITOSO	usuario	231	Inicio de sesión exitoso de 'Adv Tester' (qa_adv_tok_bounds@fashionstore.com) con rol 'Cliente'.	172.20.0.1	2026-09-13 04:46:45.057075
6716	\N	UPDATE	prenda	183	Se modificó la prenda. SKU anterior: JEA-SLIM-001 -> SKU nuevo: JEA-SLIM-001	\N	2026-09-20 10:19:50.59881
1154	1	INSERT	usuario	235	Alta de usuario 'Adv Tester' (qa_adv_hash_inv@fashionstore.com) con rol id=4.	192.168.1.50	2026-09-13 04:46:46.596812
1158	1	UPDATE	rol_permiso	3	Se actualizaron los permisos del rol 'Cajero (POS)' (ID: 3). Total asignados: 4.	192.168.1.50	2026-09-13 04:46:47.192836
1165	1	UPDATE	rol_permiso	3	Se actualizaron los permisos del rol 'Cajero (POS)' (ID: 3). Total asignados: 5.	192.168.1.50	2026-09-13 04:46:48.348243
1168	1	LOGIN_EXITOSO	usuario	1	Inicio de sesión exitoso de 'Alejandro Sistemas' (admin@fashionstore.com) con rol 'Administrador'.	172.20.0.1	2026-09-13 04:46:48.493309
1170	1	LOGIN_FALLIDO	usuario	1	Intento de inicio de sesión fallido para el correo: admin@fashionstore.com (contraseña incorrecta).	192.168.10.102	2026-09-13 04:46:48.763333
1172	\N	LOGIN_FALLIDO	usuario	\N	Intento de inicio de sesión fallido para el correo: no_existe_qa_999@fashionstore.com (correo no registrado).	192.168.10.103	2026-09-13 04:46:49.029482
1175	1	INSERT	usuario	239	Alta de usuario 'Carlos Recuperador' (qa_recovery_user@fashionstore.com) con rol id=4.	192.168.1.50	2026-09-13 04:46:49.624834
1188	1	INACTIVAR	usuario	243	Baja lógica del usuario 'qa_nuevo_cajero@fashionstore.com': estado cambiado de 'Activo' a 'Inactivo'.	192.168.20.3	2026-09-13 04:46:51.564676
1200	1	INSERT	usuario	248	Alta de usuario 'Carlos Recuperador' (qa_recovery_user@fashionstore.com) con rol id=4.	192.168.1.50	2026-09-13 04:46:53.165261
1202	1	UPDATE	rol_permiso	3	Se actualizaron los permisos del rol 'Cajero (POS)' (ID: 3). Total asignados: 5.	192.168.1.50	2026-09-13 04:46:53.488286
1203	1	UPDATE	rol_permiso	3	Se actualizaron los permisos del rol 'Cajero (POS)' (ID: 3). Total asignados: 4.	192.168.1.50	2026-09-13 04:46:53.652344
1206	1	INSERT	usuario	250	Alta de usuario 'Carlos Recuperador' (qa_recovery_user@fashionstore.com) con rol id=4.	192.168.1.50	2026-09-13 04:46:53.897822
1208	1	UPDATE	rol_permiso	3	Se actualizaron los permisos del rol 'Cajero (POS)' (ID: 3). Total asignados: 5.	192.168.1.50	2026-09-13 04:46:54.504174
1210	1	INSERT	usuario	252	Alta de usuario 'Carlos Recuperador' (qa_recovery_user@fashionstore.com) con rol id=4.	192.168.1.50	2026-09-13 04:46:54.776816
1212	1	INSERT	usuario	253	Alta de usuario 'Carlos Recuperador' (qa_recovery_user@fashionstore.com) con rol id=4.	192.168.1.50	2026-09-13 04:46:54.936115
1213	1	INSERT	usuario	254	Alta de usuario 'Carlos Recuperador' (qa_recovery_user@fashionstore.com) con rol id=4.	192.168.1.50	2026-09-13 04:46:55.224503
1214	\N	SOLICITUD_RECUPERACION_PASSWORD	usuario_token	157	Solicitud de recuperación de contraseña para el correo: qa_recovery_user@fashionstore.com.	192.168.1.88	2026-09-13 04:46:55.461805
1216	1	INSERT	usuario	256	Alta de usuario 'Carlos Recuperador' (qa_recovery_user@fashionstore.com) con rol id=4.	192.168.1.50	2026-09-13 04:46:55.707364
1219	1	INSERT	usuario	258	Alta de usuario 'Carlos Recuperador' (qa_recovery_user@fashionstore.com) con rol id=4.	192.168.1.50	2026-09-13 04:46:56.152525
1221	1	UPDATE	cliente	19	Modificación del cliente CI 88997711. Campos: nombre_completo=Lucía Morales de Mendoza, telefono=78999999.	192.168.40.2	2026-09-13 04:46:56.648736
1222	1	INACTIVAR	cliente	19	Baja lógica del cliente 'Lucía Morales de Mendoza' (CI 88997711).	192.168.40.3	2026-09-13 04:46:56.702625
1228	1	INSERT	usuario	259	Alta de usuario 'Carlos Recuperador' (qa_recovery_user@fashionstore.com) con rol id=4.	192.168.1.50	2026-09-13 04:46:57.420211
1000	1	INSERT	usuario	195	Alta de usuario 'Adv Tester' (qa_adv_cli_esc@fashionstore.com) con rol id=4.	192.168.1.50	2026-09-13 04:46:20.140526
6611	1	IA_RECOMENDACION	inventario	4	Recomendación IA (Fallback Catálogo): 1 prendas sugeridas para estilo 'Casual' y ocasión 'Diario'.	172.20.0.1	2026-09-13 22:20:37.686124
1003	1	LOGIN_EXITOSO	usuario	1	Inicio de sesión exitoso de 'Alejandro Sistemas' (admin@fashionstore.com) con rol 'Administrador'.	172.20.0.1	2026-09-13 04:46:20.647021
1004	1	INSERT	usuario	196	Alta de usuario 'Adv Tester' (qa_adv_caj_dyn@fashionstore.com) con rol id=3.	192.168.1.50	2026-09-13 04:46:20.771669
1005	1	INSERT	usuario	197	Alta de usuario 'Adv Tester' (qa_adv_cli_esc@fashionstore.com) con rol id=4.	192.168.1.50	2026-09-13 04:46:20.869539
1790	1	UPDATE	rol_permiso	3	Se actualizaron los permisos del rol 'Cajero (POS)' (ID: 3). Total asignados: 2.	192.168.1.50	2026-09-13 04:49:50.215823
1007	1	UPDATE	rol_permiso	3	Se actualizaron los permisos del rol 'Cajero (POS)' (ID: 3). Total asignados: 4.	192.168.1.50	2026-09-13 04:46:21.276634
1791	1	UPDATE	rol_permiso	3	Se actualizaron los permisos del rol 'Cajero (POS)' (ID: 3). Total asignados: 4.	192.168.1.50	2026-09-13 04:49:50.551764
1009	1	UPDATE	rol_permiso	3	Se actualizaron los permisos del rol 'Cajero (POS)' (ID: 3). Total asignados: 5.	192.168.1.50	2026-09-13 04:46:21.426413
1010	1	UPDATE	rol_permiso	3	Se actualizaron los permisos del rol 'Cajero (POS)' (ID: 3). Total asignados: 4.	192.168.1.50	2026-09-13 04:46:21.529405
1011	1	INSERT	usuario	198	Alta de usuario 'Adv Tester' (qa_adv_caj_esc@fashionstore.com) con rol id=3.	192.168.1.50	2026-09-13 04:46:21.401618
1012	1	UPDATE	rol_permiso	3	Se actualizaron los permisos del rol 'Cajero (POS)' (ID: 3). Total asignados: 0.	192.168.1.50	2026-09-13 04:46:21.701956
1013	1	UPDATE	rol_permiso	3	Se actualizaron los permisos del rol 'Cajero (POS)' (ID: 3). Total asignados: 3.	192.168.1.50	2026-09-13 04:46:21.797537
1015	1	INSERT	usuario	199	Alta de usuario 'Adv Tester' (qa_adv_tok_bounds@fashionstore.com) con rol id=4.	192.168.1.50	2026-09-13 04:46:22.190663
1016	1	INSERT	usuario	200	Alta de usuario 'Adv Tester' (qa_adv_caj_dyn@fashionstore.com) con rol id=3.	192.168.1.50	2026-09-13 04:46:22.298275
1019	1	UPDATE	rol_permiso	3	Se actualizaron los permisos del rol 'Cajero (POS)' (ID: 3). Total asignados: 4.	192.168.1.50	2026-09-13 04:46:22.848492
1020	1	UPDATE	rol_permiso	3	Se actualizaron los permisos del rol 'Cajero (POS)' (ID: 3). Total asignados: 5.	192.168.1.50	2026-09-13 04:46:22.989209
1021	1	UPDATE	rol_permiso	3	Se actualizaron los permisos del rol 'Cajero (POS)' (ID: 3). Total asignados: 4.	192.168.1.50	2026-09-13 04:46:23.085683
1017	\N	LOGIN_EXITOSO	usuario	199	Inicio de sesión exitoso de 'Adv Tester' (qa_adv_tok_bounds@fashionstore.com) con rol 'Cliente'.	172.20.0.1	2026-09-13 04:46:22.471023
1022	1	UPDATE	rol_permiso	3	Se actualizaron los permisos del rol 'Cajero (POS)' (ID: 3). Total asignados: 0.	192.168.1.50	2026-09-13 04:46:23.253982
1023	1	UPDATE	rol_permiso	3	Se actualizaron los permisos del rol 'Cajero (POS)' (ID: 3). Total asignados: 3.	192.168.1.50	2026-09-13 04:46:23.345371
1024	1	LOGIN_EXITOSO	usuario	1	Inicio de sesión exitoso de 'Alejandro Sistemas' (admin@fashionstore.com) con rol 'Administrador'.	172.20.0.1	2026-09-13 04:46:23.595034
1025	1	INSERT	usuario	201	Alta de usuario 'Adv Tester' (qa_adv_tok_bounds@fashionstore.com) con rol id=4.	192.168.1.50	2026-09-13 04:46:23.733374
5417	1	INSERT	usuario	1064	Alta de usuario 'Audit CU04' (qa_bitacora_cu04@fashionstore.com) con rol id=4.	192.168.1.50	2026-09-13 19:09:57.476925
1027	1	INSERT	usuario	203	Alta de usuario 'Adv Tester' (qa_adv_hash_inv@fashionstore.com) con rol id=4.	192.168.1.50	2026-09-13 04:46:23.997504
4694	\N	LOGIN_FALLIDO	usuario	\N	Intento de inicio de sesión fallido para el correo: no_existe_seguro@fashionstore.com (correo no registrado).	192.168.99.99	2026-09-13 19:01:26.331114
1028	\N	LOGIN_EXITOSO	usuario	201	Inicio de sesión exitoso de 'Adv Tester' (qa_adv_tok_bounds@fashionstore.com) con rol 'Cliente'.	172.20.0.1	2026-09-13 04:46:24.011963
4695	1	UPDATE	rol_permiso	3	Se actualizaron los permisos del rol 'Cajero (POS)' (ID: 3). Total asignados: 3.	198.51.100.22	2026-09-13 19:01:26.61701
1031	1	INSERT	usuario	204	Alta de usuario 'Adv Tester' (qa_adv_hash_inv@fashionstore.com) con rol id=4.	192.168.1.50	2026-09-13 04:46:24.762016
4696	1	INSERT	usuario	1039	Alta de usuario 'Audit CU04' (qa_bitacora_cu04@fashionstore.com) con rol id=4.	192.168.1.50	2026-09-13 19:01:26.778846
4699	1	LOGIN_EXITOSO	usuario	1	Inicio de sesión exitoso de 'Alejandro Sistemas' (admin@fashionstore.com) con rol 'Administrador'.	172.20.0.1	2026-09-13 19:02:11.802158
1037	1	LOGIN_EXITOSO	usuario	1	Inicio de sesión exitoso de 'Alejandro Sistemas' (admin@fashionstore.com) con rol 'Administrador'.	192.168.10.101	2026-09-13 04:46:26.32156
1038	1	LOGIN_EXITOSO	usuario	1	Inicio de sesión exitoso de 'Alejandro Sistemas' (admin@fashionstore.com) con rol 'Administrador'.	172.20.0.1	2026-09-13 04:46:26.590475
1039	1	LOGIN_FALLIDO	usuario	1	Intento de inicio de sesión fallido para el correo: admin@fashionstore.com (contraseña incorrecta).	192.168.10.102	2026-09-13 04:46:26.856574
1040	\N	LOGIN_FALLIDO	usuario	\N	Intento de inicio de sesión fallido para el correo: no_existe_qa_999@fashionstore.com (correo no registrado).	192.168.10.103	2026-09-13 04:46:27.120001
1045	1	UPDATE	usuario	207	Modificación del usuario 'qa_nuevo_cajero@fashionstore.com'. Campos actualizados: nombre=Carlos Alberto, telefono=71122334.	192.168.20.2	2026-09-13 04:46:29.301677
1046	1	INACTIVAR	usuario	207	Baja lógica del usuario 'qa_nuevo_cajero@fashionstore.com': estado cambiado de 'Activo' a 'Inactivo'.	192.168.20.3	2026-09-13 04:46:29.583334
1047	1	UPDATE	rol_permiso	3	Se actualizaron los permisos del rol 'Cajero (POS)' (ID: 3). Total asignados: 2.	192.168.1.50	2026-09-13 04:46:29.973307
1048	1	UPDATE	rol_permiso	3	Se actualizaron los permisos del rol 'Cajero (POS)' (ID: 3). Total asignados: 4.	192.168.1.50	2026-09-13 04:46:30.31346
1049	1	UPDATE	rol_permiso	3	Se actualizaron los permisos del rol 'Cajero (POS)' (ID: 3). Total asignados: 0.	192.168.1.50	2026-09-13 04:46:30.425263
1052	1	UPDATE	rol_permiso	3	Se actualizaron los permisos del rol 'Cajero (POS)' (ID: 3). Total asignados: 5.	192.168.1.50	2026-09-13 04:46:31.421583
1053	1	UPDATE	rol_permiso	3	Se actualizaron los permisos del rol 'Cajero (POS)' (ID: 3). Total asignados: 4.	192.168.1.50	2026-09-13 04:46:31.565548
1056	1	UPDATE	rol_permiso	3	Se actualizaron los permisos del rol 'Cajero (POS)' (ID: 3). Total asignados: 5.	192.168.1.50	2026-09-13 04:46:32.39385
1057	1	INSERT	usuario	210	Alta de usuario 'Carlos Recuperador' (qa_recovery_user@fashionstore.com) con rol id=4.	192.168.1.50	2026-09-13 04:46:32.645265
1059	1	INSERT	usuario	211	Alta de usuario 'Carlos Recuperador' (qa_recovery_user@fashionstore.com) con rol id=4.	192.168.1.50	2026-09-13 04:46:33.09747
1062	1	INSERT	usuario	212	Alta de usuario 'Carlos Recuperador' (qa_recovery_user@fashionstore.com) con rol id=4.	192.168.1.50	2026-09-13 04:46:33.549925
1064	1	INSERT	usuario	213	Alta de usuario 'Carlos Recuperador' (qa_recovery_user@fashionstore.com) con rol id=4.	192.168.1.50	2026-09-13 04:46:34.00135
1792	1	UPDATE	rol_permiso	3	Se actualizaron los permisos del rol 'Cajero (POS)' (ID: 3). Total asignados: 0.	192.168.1.50	2026-09-13 04:49:50.659859
1126	1	LOGIN_EXITOSO	usuario	1	Inicio de sesión exitoso de 'Alejandro Sistemas' (admin@fashionstore.com) con rol 'Administrador'.	172.20.0.1	2026-09-13 04:46:43.287253
1069	1	INSERT	usuario	214	Alta de usuario 'Carlos Recuperador' (qa_recovery_user@fashionstore.com) con rol id=4.	192.168.1.50	2026-09-13 04:46:35.269763
1129	1	LOGIN_FALLIDO	usuario	1	Intento de inicio de sesión fallido para el correo: admin@fashionstore.com (contraseña incorrecta).	192.168.10.102	2026-09-13 04:46:43.567974
1071	1	INSERT	usuario	215	Alta de usuario 'Carlos Recuperador' (qa_recovery_user@fashionstore.com) con rol id=4.	192.168.1.50	2026-09-13 04:46:35.733519
1072	1	INSERT	usuario	216	Alta de usuario 'Carlos Recuperador' (qa_recovery_user@fashionstore.com) con rol id=4.	192.168.1.50	2026-09-13 04:46:36.09332
1135	\N	LOGIN_FALLIDO	usuario	\N	Intento de inicio de sesión fallido para el correo: no_existe_qa_999@fashionstore.com (correo no registrado).	192.168.10.103	2026-09-13 04:46:43.840955
1074	1	LOGIN_EXITOSO	usuario	1	Inicio de sesión exitoso de 'Alejandro Sistemas' (admin@fashionstore.com) con rol 'Administrador'.	172.20.0.1	2026-09-13 04:46:36.413148
6612	1	IA_ANALITICA_VOZ	inventario	\N	Analítica por voz CU23: 'Total de existencias de inventario en todas las sucursales' -> Métrica 'inventario_stock', Resultados=3, PDF=True.	172.20.0.1	2026-09-13 22:21:28.43354
1076	1	INSERT	usuario	217	Alta de usuario 'Adv Tester' (qa_adv_cli_esc@fashionstore.com) con rol id=4.	192.168.1.50	2026-09-13 04:46:36.636597
1077	1	INSERT	usuario	218	Alta de usuario 'Carlos Recuperador' (qa_recovery_user@fashionstore.com) con rol id=4.	192.168.1.50	2026-09-13 04:46:36.83793
1079	1	INSERT	usuario	219	Alta de usuario 'Adv Tester' (qa_adv_caj_esc@fashionstore.com) con rol id=3.	192.168.1.50	2026-09-13 04:46:37.177036
6097	1	INSERT	sucursal	120	Alta de la sucursal 'Sucursal Tarija Centro QA' en la ciudad id=170.	192.168.30.2	2026-09-13 19:35:11.665373
1082	1	INSERT	usuario	221	Alta de usuario 'Carlos Recuperador' (qa_recovery_user@fashionstore.com) con rol id=4.	192.168.1.50	2026-09-13 04:46:37.861613
1155	1	UPDATE	rol_permiso	3	Se actualizaron los permisos del rol 'Cajero (POS)' (ID: 3). Total asignados: 2.	192.168.1.50	2026-09-13 04:46:46.832137
1084	1	INSERT	usuario	222	Alta de usuario 'Adv Tester' (qa_adv_caj_dyn@fashionstore.com) con rol id=3.	192.168.1.50	2026-09-13 04:46:38.089392
6098	1	UPDATE	sucursal	120	Modificación de la sucursal 'Sucursal Tarija Centro QA'. Campos: direccion=Calle Sucre #789 (Modificado), telefono=66449988.	192.168.30.3	2026-09-13 19:35:11.93752
1086	1	UPDATE	rol_permiso	3	Se actualizaron los permisos del rol 'Cajero (POS)' (ID: 3). Total asignados: 4.	192.168.1.50	2026-09-13 04:46:38.609511
1087	1	INSERT	usuario	223	Alta de usuario 'Carlos Recuperador' (qa_recovery_user@fashionstore.com) con rol id=4.	192.168.1.50	2026-09-13 04:46:38.426631
1159	1	UPDATE	rol_permiso	3	Se actualizaron los permisos del rol 'Cajero (POS)' (ID: 3). Total asignados: 0.	192.168.1.50	2026-09-13 04:46:47.310182
1089	1	UPDATE	rol_permiso	3	Se actualizaron los permisos del rol 'Cajero (POS)' (ID: 3). Total asignados: 5.	192.168.1.50	2026-09-13 04:46:38.749517
1090	1	UPDATE	rol_permiso	3	Se actualizaron los permisos del rol 'Cajero (POS)' (ID: 3). Total asignados: 4.	192.168.1.50	2026-09-13 04:46:38.861352
6099	1	INSERT	categoria	112	Alta de la categoría 'Deportes QA'.	192.168.50.1	2026-09-13 19:35:12.225696
1092	1	UPDATE	rol_permiso	3	Se actualizaron los permisos del rol 'Cajero (POS)' (ID: 3). Total asignados: 0.	192.168.1.50	2026-09-13 04:46:39.029749
1093	1	UPDATE	rol_permiso	3	Se actualizaron los permisos del rol 'Cajero (POS)' (ID: 3). Total asignados: 3.	192.168.1.50	2026-09-13 04:46:39.130605
6100	1	INSERT	categoria	113	Alta de la categoría 'Calzado Deportivo QA'.	192.168.1.50	2026-09-13 19:35:12.321559
1166	1	LOGIN_EXITOSO	usuario	1	Inicio de sesión exitoso de 'Alejandro Sistemas' (admin@fashionstore.com) con rol 'Administrador'.	192.168.10.101	2026-09-13 04:46:48.220156
1096	1	INSERT	usuario	224	Alta de usuario 'Adv Tester' (qa_adv_tok_bounds@fashionstore.com) con rol id=4.	192.168.1.50	2026-09-13 04:46:39.533595
1097	1	INSERT	usuario	225	Alta de usuario 'Carlos Recuperador' (qa_recovery_user@fashionstore.com) con rol id=4.	192.168.1.50	2026-09-13 04:46:39.693742
1167	1	UPDATE	rol_permiso	3	Se actualizaron los permisos del rol 'Cajero (POS)' (ID: 3). Total asignados: 4.	192.168.1.50	2026-09-13 04:46:48.504435
6101	1	UPDATE	categoria	112	Modificación de la categoría 'Deportes QA'. Campos: descripcion=Ropa de running y fitness.	192.168.50.2	2026-09-13 19:35:12.686034
6102	1	INACTIVAR	categoria	113	Baja lógica de la categoría 'Calzado Deportivo QA' (0 prenda(s) asociadas).	192.168.50.3	2026-09-13 19:35:12.785723
1102	1	INSERT	cliente	18	Alta del cliente 'Lucía Morales Paz' (CI 88997711).	192.168.40.1	2026-09-13 04:46:40.963128
1099	\N	LOGIN_EXITOSO	usuario	224	Inicio de sesión exitoso de 'Adv Tester' (qa_adv_tok_bounds@fashionstore.com) con rol 'Cliente'.	172.20.0.1	2026-09-13 04:46:39.822614
6103	1	INACTIVAR	categoria	112	Baja lógica de la categoría 'Deportes QA' (0 prenda(s) asociadas).	192.168.50.3	2026-09-13 19:35:12.830786
1104	1	INSERT	usuario	226	Alta de usuario 'Adv Tester' (qa_adv_hash_inv@fashionstore.com) con rol id=4.	192.168.1.50	2026-09-13 04:46:41.365765
1105	1	LOGIN_EXITOSO	usuario	1	Inicio de sesión exitoso de 'Alejandro Sistemas' (admin@fashionstore.com) con rol 'Administrador'.	172.20.0.1	2026-09-13 04:46:41.600887
1173	1	UPDATE	rol_permiso	3	Se actualizaron los permisos del rol 'Cajero (POS)' (ID: 3). Total asignados: 5.	192.168.1.50	2026-09-13 04:46:49.360276
1178	1	INSERT	usuario	241	Alta de usuario 'Carlos Recuperador' (qa_recovery_user@fashionstore.com) con rol id=4.	192.168.1.50	2026-09-13 04:46:50.105109
1182	1	INSERT	usuario	242	Alta de usuario 'Carlos Recuperador' (qa_recovery_user@fashionstore.com) con rol id=4.	192.168.1.50	2026-09-13 04:46:50.560169
1185	1	INSERT	usuario	244	Alta de usuario 'Carlos Recuperador' (qa_recovery_user@fashionstore.com) con rol id=4.	192.168.1.50	2026-09-13 04:46:51.0251
1186	1	UPDATE	usuario	243	Modificación del usuario 'qa_nuevo_cajero@fashionstore.com'. Campos actualizados: nombre=Carlos Alberto, telefono=71122334.	192.168.20.2	2026-09-13 04:46:51.269053
1191	1	UPDATE	rol_permiso	3	Se actualizaron los permisos del rol 'Cajero (POS)' (ID: 3). Total asignados: 2.	192.168.1.50	2026-09-13 04:46:51.989678
1193	1	UPDATE	rol_permiso	3	Se actualizaron los permisos del rol 'Cajero (POS)' (ID: 3). Total asignados: 4.	192.168.1.50	2026-09-13 04:46:52.361186
1194	1	UPDATE	rol_permiso	3	Se actualizaron los permisos del rol 'Cajero (POS)' (ID: 3). Total asignados: 0.	192.168.1.50	2026-09-13 04:46:52.476387
1195	1	INSERT	usuario	245	Alta de usuario 'Carlos Recuperador' (qa_recovery_user@fashionstore.com) con rol id=4.	192.168.1.50	2026-09-13 04:46:52.320915
1197	1	INSERT	usuario	246	Alta de usuario 'Carlos Recuperador' (qa_recovery_user@fashionstore.com) con rol id=4.	192.168.1.50	2026-09-13 04:46:52.792273
1218	1	INSERT	cliente	19	Alta del cliente 'Lucía Morales Paz' (CI 88997711).	192.168.40.1	2026-09-13 04:46:56.213113
1233	1	INSERT	usuario	260	Alta de usuario 'Carlos Recuperador' (qa_recovery_user@fashionstore.com) con rol id=4.	192.168.1.50	2026-09-13 04:46:57.880204
4878	\N	UPDATE	prenda	3	Se modificó la prenda. SKU anterior: CHQ-JEAN-001 -> SKU nuevo: CHQ-JEAN-001	\N	2026-09-13 19:06:29.591375
4879	\N	UPDATE	prenda	3	Se modificó la prenda. SKU anterior: CHQ-JEAN-001 -> SKU nuevo: CHQ-JEAN-001	\N	2026-09-13 19:06:29.627059
1795	1	UPDATE	rol_permiso	3	Se actualizaron los permisos del rol 'Cajero (POS)' (ID: 3). Total asignados: 5.	192.168.1.50	2026-09-13 04:49:51.647935
1796	1	UPDATE	rol_permiso	3	Se actualizaron los permisos del rol 'Cajero (POS)' (ID: 3). Total asignados: 4.	192.168.1.50	2026-09-13 04:49:51.791754
5684	1	LOGIN_EXITOSO	usuario	1	Inicio de sesión exitoso de 'Alejandro Sistemas' (admin@fashionstore.com) con rol 'Administrador'.	172.20.0.1	2026-09-13 19:23:01.674833
5685	1	LOGIN_EXITOSO	usuario	1	Inicio de sesión exitoso de 'Alejandro Sistemas' (admin@fashionstore.com) con rol 'Administrador'.	192.168.10.101	2026-09-13 19:23:07.480613
1799	1	UPDATE	rol_permiso	3	Se actualizaron los permisos del rol 'Cajero (POS)' (ID: 3). Total asignados: 5.	192.168.1.50	2026-09-13 04:49:52.611778
1800	1	INSERT	usuario	398	Alta de usuario 'Carlos Recuperador' (qa_recovery_user@fashionstore.com) con rol id=4.	192.168.1.50	2026-09-13 04:49:52.864065
5686	1	LOGIN_EXITOSO	usuario	1	Inicio de sesión exitoso de 'Alejandro Sistemas' (admin@fashionstore.com) con rol 'Administrador'.	172.20.0.1	2026-09-13 19:23:07.713658
1802	1	INSERT	usuario	399	Alta de usuario 'Carlos Recuperador' (qa_recovery_user@fashionstore.com) con rol id=4.	192.168.1.50	2026-09-13 04:49:53.317126
5687	1	LOGIN_FALLIDO	usuario	1	Intento de inicio de sesión fallido para el correo: admin@fashionstore.com (contraseña incorrecta).	192.168.10.102	2026-09-13 19:23:07.971918
5220	1	LOGIN_EXITOSO	usuario	1	Inicio de sesión exitoso de 'Alejandro Sistemas' (admin@fashionstore.com) con rol 'Administrador'.	172.20.0.1	2026-09-13 19:08:36.432876
1805	1	INSERT	usuario	400	Alta de usuario 'Carlos Recuperador' (qa_recovery_user@fashionstore.com) con rol id=4.	192.168.1.50	2026-09-13 04:49:53.800093
5688	\N	LOGIN_FALLIDO	usuario	\N	Intento de inicio de sesión fallido para el correo: no_existe_qa_999@fashionstore.com (correo no registrado).	192.168.10.103	2026-09-13 19:23:08.232934
1807	1	INSERT	usuario	401	Alta de usuario 'Carlos Recuperador' (qa_recovery_user@fashionstore.com) con rol id=4.	192.168.1.50	2026-09-13 04:49:54.279997
5689	1	LOGIN_EXITOSO	usuario	1	Inicio de sesión exitoso de 'Alejandro Sistemas' (admin@fashionstore.com) con rol 'Administrador'.	172.20.0.1	2026-09-13 19:23:08.505615
1946	1	UPDATE	rol_permiso	3	Se actualizaron los permisos del rol 'Cajero (POS)' (ID: 3). Total asignados: 5.	192.168.1.50	2026-09-13 04:50:45.909486
1948	1	LOGIN_FALLIDO	usuario	1	Intento de inicio de sesión fallido para el correo: admin@fashionstore.com (contraseña incorrecta).	192.168.10.102	2026-09-13 04:50:45.980833
1951	\N	LOGIN_FALLIDO	usuario	\N	Intento de inicio de sesión fallido para el correo: no_existe_qa_999@fashionstore.com (correo no registrado).	192.168.10.103	2026-09-13 04:50:46.246995
1953	1	INSERT	usuario	436	Alta de usuario 'Carlos Recuperador' (qa_recovery_user@fashionstore.com) con rol id=4.	192.168.1.50	2026-09-13 04:50:46.649423
1960	1	INSERT	usuario	440	Alta de usuario 'Carlos Recuperador' (qa_recovery_user@fashionstore.com) con rol id=4.	192.168.1.50	2026-09-13 04:50:47.602281
1968	1	INACTIVAR	usuario	441	Baja lógica del usuario 'qa_nuevo_cajero@fashionstore.com': estado cambiado de 'Activo' a 'Inactivo'.	192.168.20.3	2026-09-13 04:50:49.012861
1972	1	INSERT	usuario	443	Alta de usuario 'Carlos Recuperador' (qa_recovery_user@fashionstore.com) con rol id=4.	192.168.1.50	2026-09-13 04:50:49.297342
1973	1	UPDATE	rol_permiso	3	Se actualizaron los permisos del rol 'Cajero (POS)' (ID: 3). Total asignados: 4.	192.168.1.50	2026-09-13 04:50:49.769411
1975	1	UPDATE	rol_permiso	3	Se actualizaron los permisos del rol 'Cajero (POS)' (ID: 3). Total asignados: 0.	192.168.1.50	2026-09-13 04:50:49.886039
5233	1	LOGIN_EXITOSO	usuario	1	Inicio de sesión exitoso de 'Alejandro Sistemas' (admin@fashionstore.com) con rol 'Administrador'.	172.20.0.1	2026-09-13 19:08:39.420338
1979	1	INSERT	usuario	446	Alta de usuario 'Carlos Recuperador' (qa_recovery_user@fashionstore.com) con rol id=4.	192.168.1.50	2026-09-13 04:50:50.405256
1983	1	LOGIN_EXITOSO	usuario	1	Inicio de sesión exitoso de 'Alejandro Sistemas' (admin@fashionstore.com) con rol 'Administrador'.	172.20.0.1	2026-09-13 04:50:51.169721
5236	1	LOGIN_EXITOSO	usuario	1	Inicio de sesión exitoso de 'Alejandro Sistemas' (admin@fashionstore.com) con rol 'Administrador'.	172.20.0.1	2026-09-13 19:08:39.956047
1993	1	INSERT	usuario	453	Alta de usuario 'Challenger2 Empirico' (ch2_empirico_user@fashionstore.com) con rol id=4.	192.168.1.50	2026-09-13 04:50:52.082444
5420	1	LOGIN_EXITOSO	usuario	1	Inicio de sesión exitoso de 'Alejandro Sistemas' (admin@fashionstore.com) con rol 'Administrador'.	172.20.0.1	2026-09-13 19:09:59.445122
2004	\N	LOGIN_FALLIDO	usuario	\N	Intento de inicio de sesión fallido para el correo: no_existe_seguro@fashionstore.com (correo no registrado).	192.168.99.99	2026-09-13 04:50:53.021637
2012	1	INSERT	usuario	458	Alta de usuario 'Audit CU04' (qa_bitacora_cu04@fashionstore.com) con rol id=4.	192.168.1.50	2026-09-13 04:50:53.405237
2015	\N	RESTABLECER_PASSWORD_EXITOSO	usuario	457	Restablecimiento exitoso de contraseña para la cuenta 'qa_recovery_user@fashionstore.com' (ID: 457).	192.168.1.77	2026-09-13 04:50:53.709219
5423	1	LOGIN_EXITOSO	usuario	1	Inicio de sesión exitoso de 'Alejandro Sistemas' (admin@fashionstore.com) con rol 'Administrador'.	172.20.0.1	2026-09-13 19:10:00.398582
2019	1	INSERT	usuario	459	Alta de usuario 'Carlos Recuperador' (qa_recovery_user@fashionstore.com) con rol id=4.	192.168.1.50	2026-09-13 04:50:54.261416
2021	1	INSERT	usuario	460	Alta de usuario 'Carlos Recuperador' (qa_recovery_user@fashionstore.com) con rol id=4.	192.168.1.50	2026-09-13 04:50:54.733546
2022	1	INSERT	usuario	461	Alta de usuario 'Carlos Recuperador' (qa_recovery_user@fashionstore.com) con rol id=4.	192.168.1.50	2026-09-13 04:50:55.109543
2025	1	INSERT	usuario	462	Alta de usuario 'Carlos Recuperador' (qa_recovery_user@fashionstore.com) con rol id=4.	192.168.1.50	2026-09-13 04:50:55.834169
2027	1	INSERT	usuario	464	Alta de usuario 'Carlos Recuperador' (qa_recovery_user@fashionstore.com) con rol id=4.	192.168.1.50	2026-09-13 04:50:56.817319
2029	1	INSERT	usuario	465	Alta de usuario 'Carlos Recuperador' (qa_recovery_user@fashionstore.com) con rol id=4.	192.168.1.50	2026-09-13 04:50:57.449972
2034	1	INSERT	usuario	466	Alta de usuario 'Carlos Recuperador' (qa_recovery_user@fashionstore.com) con rol id=4.	192.168.1.50	2026-09-13 04:50:58.682537
2038	1	INSERT	cliente	27	Alta del cliente 'Lucía Morales Paz' (CI 88997711).	192.168.40.1	2026-09-13 04:50:59.92921
2039	1	UPDATE	cliente	27	Modificación del cliente CI 88997711. Campos: nombre_completo=Lucía Morales de Mendoza, telefono=78999999.	192.168.40.2	2026-09-13 04:51:00.353485
2040	1	INACTIVAR	cliente	27	Baja lógica del cliente 'Lucía Morales de Mendoza' (CI 88997711).	192.168.40.3	2026-09-13 04:51:00.40614
1235	1	INSERT	usuario	261	Alta de usuario 'Carlos Recuperador' (qa_recovery_user@fashionstore.com) con rol id=4.	192.168.1.50	2026-09-13 04:46:58.248631
8310	1	LOGIN_EXITOSO	usuario	1	Inicio de sesión exitoso de 'Alejandro Sistemas' (admin@fashionstore.com) con rol 'Administrador'.	172.20.0.1	2026-09-20 19:34:50.990258
4997	1	LOGIN_EXITOSO	usuario	1	Inicio de sesión exitoso de 'Alejandro Sistemas' (admin@fashionstore.com) con rol 'Administrador'.	172.20.0.1	2026-09-13 19:07:03.462651
5691	1	INSERT	usuario	1079	Alta de usuario 'Usuario Cliente QA' (qa_cliente_rbac@fashionstore.com) con rol id=4.	192.168.1.50	2026-09-13 19:23:09.489886
8479	\N	IA_TRYON	prenda	3	Vestidor Virtual IA (opencv_fallback, 18.98ms) para prenda ID 3.	172.20.0.1	2026-09-20 19:43:08.800729
1243	1	INSERT	usuario	262	Alta de usuario 'Carlos Recuperador' (qa_recovery_user@fashionstore.com) con rol id=4.	192.168.1.50	2026-09-13 04:46:59.00052
5693	1	INSERT	usuario	1080	Alta de usuario 'Carlos Cajero QA' (qa_nuevo_cajero@fashionstore.com) con rol id=3.	192.168.20.1	2026-09-13 19:23:10.156754
5694	1	UPDATE	usuario	1080	Modificación del usuario 'qa_nuevo_cajero@fashionstore.com'. Campos actualizados: nombre=Carlos Alberto, telefono=71122334.	192.168.20.2	2026-09-13 19:23:10.724448
5695	1	INACTIVAR	usuario	1080	Baja lógica del usuario 'qa_nuevo_cajero@fashionstore.com': estado cambiado de 'Activo' a 'Inactivo'.	192.168.20.3	2026-09-13 19:23:11.017045
5696	1	UPDATE	rol_permiso	3	Se actualizaron los permisos del rol 'Cajero (POS)' (ID: 3). Total asignados: 2.	192.168.1.50	2026-09-13 19:23:11.443783
5697	1	UPDATE	rol_permiso	3	Se actualizaron los permisos del rol 'Cajero (POS)' (ID: 3). Total asignados: 4.	192.168.1.50	2026-09-13 19:23:11.787183
5698	1	UPDATE	rol_permiso	3	Se actualizaron los permisos del rol 'Cajero (POS)' (ID: 3). Total asignados: 0.	192.168.1.50	2026-09-13 19:23:11.895711
5699	1	INSERT	usuario	1081	Alta de usuario 'Cajero POS QA' (qa_cajero_rbac@fashionstore.com) con rol id=3.	192.168.1.50	2026-09-13 19:23:12.284451
1251	1	INSERT	usuario	264	Alta de usuario 'Carlos Recuperador' (qa_recovery_user@fashionstore.com) con rol id=4.	192.168.1.50	2026-09-13 04:46:59.996263
6615	1209	INSERT	cliente	61	Auto-registro de nuevo cliente: Camila Suárez Peña (camila.suarez@gmail.com) con CI 9123847	172.20.0.1	2026-09-19 21:25:53.169801
1253	\N	LOGIN_FALLIDO	usuario	\N	Intento de inicio de sesión fallido para el correo: no_existe_seguro@fashionstore.com (correo no registrado).	192.168.99.99	2026-09-13 04:47:00.284554
1254	1	UPDATE	rol_permiso	3	Se actualizaron los permisos del rol 'Cajero (POS)' (ID: 3). Total asignados: 3.	198.51.100.22	2026-09-13 04:47:00.545554
1255	1	INSERT	usuario	265	Alta de usuario 'Carlos Recuperador' (qa_recovery_user@fashionstore.com) con rol id=4.	192.168.1.50	2026-09-13 04:47:00.560349
1257	1	INSERT	usuario	266	Alta de usuario 'Audit CU04' (qa_bitacora_cu04@fashionstore.com) con rol id=4.	192.168.1.50	2026-09-13 04:47:00.670114
5701	1	UPDATE	rol_permiso	3	Se actualizaron los permisos del rol 'Cajero (POS)' (ID: 3). Total asignados: 5.	192.168.1.50	2026-09-13 19:23:12.903316
1256	\N	SOLICITUD_RECUPERACION_PASSWORD	usuario_token	165	Solicitud de recuperación de contraseña para el correo: qa_recovery_user@fashionstore.com.	192.168.1.88	2026-09-13 04:47:00.826003
1259	\N	RESTABLECER_PASSWORD_EXITOSO	usuario	265	Restablecimiento exitoso de contraseña para la cuenta 'qa_recovery_user@fashionstore.com' (ID: 265).	192.168.1.89	2026-09-13 04:47:00.91597
1263	1	INSERT	usuario	267	Alta de usuario 'Carlos Recuperador' (qa_recovery_user@fashionstore.com) con rol id=4.	192.168.1.50	2026-09-13 04:47:01.419917
4916	1	LOGIN_EXITOSO	usuario	1	Inicio de sesión exitoso de 'Alejandro Sistemas' (admin@fashionstore.com) con rol 'Administrador'.	172.20.0.1	2026-09-13 19:06:39.814005
1267	1	INSERT	cliente	20	Alta del cliente 'Lucía Morales Paz' (CI 88997711).	192.168.40.1	2026-09-13 04:47:02.65664
1268	1	UPDATE	cliente	20	Modificación del cliente CI 88997711. Campos: nombre_completo=Lucía Morales de Mendoza, telefono=78999999.	192.168.40.2	2026-09-13 04:47:03.08471
1269	1	INACTIVAR	cliente	20	Baja lógica del cliente 'Lucía Morales de Mendoza' (CI 88997711).	192.168.40.3	2026-09-13 04:47:03.137168
1285	1	LOGIN_EXITOSO	usuario	1	Inicio de sesión exitoso de 'Alejandro Sistemas' (admin@fashionstore.com) con rol 'Administrador'.	172.20.0.1	2026-09-13 04:47:05.634075
1290	1	INSERT	usuario	268	Alta de usuario 'Adv Tester' (adv_cli_esc@fashionstore.com) con rol id=4.	192.168.1.50	2026-09-13 04:47:05.85044
1293	1	INSERT	usuario	269	Alta de usuario 'Adv Tester' (adv_caj_esc@fashionstore.com) con rol id=3.	192.168.1.50	2026-09-13 04:47:06.388667
1294	\N	LOGIN_FALLIDO	usuario	\N	Intento de inicio de sesión fallido para el correo: no_existe_seguro@fashionstore.com (correo no registrado).	192.168.99.99	2026-09-13 04:47:06.664684
1296	1	UPDATE	rol_permiso	3	Se actualizaron los permisos del rol 'Cajero (POS)' (ID: 3). Total asignados: 3.	198.51.100.22	2026-09-13 04:47:06.957694
1297	1	INSERT	usuario	270	Alta de usuario 'Audit CU04' (qa_bitacora_cu04@fashionstore.com) con rol id=4.	192.168.1.50	2026-09-13 04:47:07.068775
1299	1	INSERT	usuario	271	Alta de usuario 'Adv Tester' (adv_caj_dyn@fashionstore.com) con rol id=3.	192.168.1.50	2026-09-13 04:47:07.376999
1303	1	UPDATE	rol_permiso	3	Se actualizaron los permisos del rol 'Cajero (POS)' (ID: 3). Total asignados: 4.	192.168.1.50	2026-09-13 04:47:07.907642
1304	1	UPDATE	rol_permiso	3	Se actualizaron los permisos del rol 'Cajero (POS)' (ID: 3). Total asignados: 5.	192.168.1.50	2026-09-13 04:47:08.056312
1305	1	UPDATE	rol_permiso	3	Se actualizaron los permisos del rol 'Cajero (POS)' (ID: 3). Total asignados: 4.	192.168.1.50	2026-09-13 04:47:08.152352
1306	1	UPDATE	rol_permiso	3	Se actualizaron los permisos del rol 'Cajero (POS)' (ID: 3). Total asignados: 0.	192.168.1.50	2026-09-13 04:47:08.320066
1307	1	UPDATE	rol_permiso	3	Se actualizaron los permisos del rol 'Cajero (POS)' (ID: 3). Total asignados: 3.	192.168.1.50	2026-09-13 04:47:08.412555
1308	1	INSERT	usuario	272	Alta de usuario 'Adv Tester' (adv_tok_bounds@fashionstore.com) con rol id=4.	192.168.1.50	2026-09-13 04:47:08.805098
1310	\N	LOGIN_FALLIDO	usuario	\N	Intento de inicio de sesión fallido para el correo: qa_cliente_rbac@fashionstore.com (correo no registrado).	172.20.0.1	2026-09-13 04:47:09.497034
1311	1	INSERT	usuario	273	Alta de usuario 'Adv Tester' (adv_hash_inv@fashionstore.com) con rol id=4.	192.168.1.50	2026-09-13 04:47:10.640226
1317	1	LOGIN_EXITOSO	usuario	1	Inicio de sesión exitoso de 'Alejandro Sistemas' (admin@fashionstore.com) con rol 'Administrador'.	172.20.0.1	2026-09-13 04:47:16.876758
1320	1	UPDATE	rol_permiso	3	Se actualizaron los permisos del rol 'Cajero (POS)' (ID: 3). Total asignados: 2.	192.168.1.50	2026-09-13 04:47:17.923107
1321	1	UPDATE	rol_permiso	3	Se actualizaron los permisos del rol 'Cajero (POS)' (ID: 3). Total asignados: 4.	192.168.1.50	2026-09-13 04:47:18.27486
1322	1	UPDATE	rol_permiso	3	Se actualizaron los permisos del rol 'Cajero (POS)' (ID: 3). Total asignados: 0.	192.168.1.50	2026-09-13 04:47:18.390603
1325	1	UPDATE	rol_permiso	3	Se actualizaron los permisos del rol 'Cajero (POS)' (ID: 3). Total asignados: 5.	192.168.1.50	2026-09-13 04:47:19.394797
1326	1	UPDATE	rol_permiso	3	Se actualizaron los permisos del rol 'Cajero (POS)' (ID: 3). Total asignados: 4.	192.168.1.50	2026-09-13 04:47:19.539005
5011	1	LOGIN_EXITOSO	usuario	1	Inicio de sesión exitoso de 'Alejandro Sistemas' (admin@fashionstore.com) con rol 'Administrador'.	172.20.0.1	2026-09-13 19:07:06.467347
4701	1	LOGIN_EXITOSO	usuario	1	Inicio de sesión exitoso de 'Alejandro Sistemas' (admin@fashionstore.com) con rol 'Administrador'.	172.20.0.1	2026-09-13 19:02:23.964131
1329	1	UPDATE	rol_permiso	3	Se actualizaron los permisos del rol 'Cajero (POS)' (ID: 3). Total asignados: 5.	192.168.1.50	2026-09-13 04:47:20.363054
1330	1	INSERT	usuario	277	Alta de usuario 'Carlos Recuperador' (qa_recovery_user@fashionstore.com) con rol id=4.	192.168.1.50	2026-09-13 04:47:20.61483
1332	1	INSERT	usuario	278	Alta de usuario 'Carlos Recuperador' (qa_recovery_user@fashionstore.com) con rol id=4.	192.168.1.50	2026-09-13 04:47:21.086521
1335	1	INSERT	usuario	279	Alta de usuario 'Carlos Recuperador' (qa_recovery_user@fashionstore.com) con rol id=4.	192.168.1.50	2026-09-13 04:47:21.551606
1337	1	INSERT	usuario	280	Alta de usuario 'Carlos Recuperador' (qa_recovery_user@fashionstore.com) con rol id=4.	192.168.1.50	2026-09-13 04:47:22.002565
1342	1	INSERT	usuario	281	Alta de usuario 'Carlos Recuperador' (qa_recovery_user@fashionstore.com) con rol id=4.	192.168.1.50	2026-09-13 04:47:23.274819
1344	1	INSERT	usuario	282	Alta de usuario 'Carlos Recuperador' (qa_recovery_user@fashionstore.com) con rol id=4.	192.168.1.50	2026-09-13 04:47:23.73924
1345	1	INSERT	usuario	283	Alta de usuario 'Carlos Recuperador' (qa_recovery_user@fashionstore.com) con rol id=4.	192.168.1.50	2026-09-13 04:47:24.110756
1348	1	INSERT	usuario	284	Alta de usuario 'Carlos Recuperador' (qa_recovery_user@fashionstore.com) con rol id=4.	192.168.1.50	2026-09-13 04:47:24.847337
1350	1	INSERT	usuario	286	Alta de usuario 'Carlos Recuperador' (qa_recovery_user@fashionstore.com) con rol id=4.	192.168.1.50	2026-09-13 04:47:25.843512
1352	1	INSERT	usuario	287	Alta de usuario 'Carlos Recuperador' (qa_recovery_user@fashionstore.com) con rol id=4.	192.168.1.50	2026-09-13 04:47:26.390546
1357	1	INSERT	usuario	288	Alta de usuario 'Carlos Recuperador' (qa_recovery_user@fashionstore.com) con rol id=4.	192.168.1.50	2026-09-13 04:47:27.646733
1361	1	LOGIN_EXITOSO	usuario	1	Inicio de sesión exitoso de 'Alejandro Sistemas' (admin@fashionstore.com) con rol 'Administrador'.	192.168.10.101	2026-09-13 04:47:42.081266
1362	1	LOGIN_EXITOSO	usuario	1	Inicio de sesión exitoso de 'Alejandro Sistemas' (admin@fashionstore.com) con rol 'Administrador'.	172.20.0.1	2026-09-13 04:47:42.306899
1363	1	LOGIN_FALLIDO	usuario	1	Intento de inicio de sesión fallido para el correo: admin@fashionstore.com (contraseña incorrecta).	192.168.10.102	2026-09-13 04:47:42.561726
1364	\N	LOGIN_FALLIDO	usuario	\N	Intento de inicio de sesión fallido para el correo: no_existe_qa_999@fashionstore.com (correo no registrado).	192.168.10.103	2026-09-13 04:47:42.828615
1365	1	LOGIN_EXITOSO	usuario	1	Inicio de sesión exitoso de 'Alejandro Sistemas' (admin@fashionstore.com) con rol 'Administrador'.	172.20.0.1	2026-09-13 04:47:43.090348
4726	\N	LOGIN_FALLIDO	usuario	\N	Intento de inicio de sesión fallido para el correo: no_existe_seguro@fashionstore.com (correo no registrado).	192.168.99.99	2026-09-13 19:02:30.544953
4727	1	UPDATE	rol_permiso	3	Se actualizaron los permisos del rol 'Cajero (POS)' (ID: 3). Total asignados: 3.	198.51.100.22	2026-09-13 19:02:30.833815
4728	1	INSERT	usuario	1040	Alta de usuario 'Audit CU04' (qa_bitacora_cu04@fashionstore.com) con rol id=4.	192.168.1.50	2026-09-13 19:02:30.956212
1370	1	UPDATE	usuario	291	Modificación del usuario 'qa_nuevo_cajero@fashionstore.com'. Campos actualizados: nombre=Carlos Alberto, telefono=71122334.	192.168.20.2	2026-09-13 04:47:45.36206
1371	1	INACTIVAR	usuario	291	Baja lógica del usuario 'qa_nuevo_cajero@fashionstore.com': estado cambiado de 'Activo' a 'Inactivo'.	192.168.20.3	2026-09-13 04:47:45.650675
1372	1	UPDATE	rol_permiso	3	Se actualizaron los permisos del rol 'Cajero (POS)' (ID: 3). Total asignados: 2.	192.168.1.50	2026-09-13 04:47:46.057189
1373	1	UPDATE	rol_permiso	3	Se actualizaron los permisos del rol 'Cajero (POS)' (ID: 3). Total asignados: 4.	192.168.1.50	2026-09-13 04:47:46.40935
1374	1	UPDATE	rol_permiso	3	Se actualizaron los permisos del rol 'Cajero (POS)' (ID: 3). Total asignados: 0.	192.168.1.50	2026-09-13 04:47:46.52939
4731	1	LOGIN_EXITOSO	usuario	1	Inicio de sesión exitoso de 'Alejandro Sistemas' (admin@fashionstore.com) con rol 'Administrador'.	172.20.0.1	2026-09-13 19:03:02.499153
1377	1	UPDATE	rol_permiso	3	Se actualizaron los permisos del rol 'Cajero (POS)' (ID: 3). Total asignados: 5.	192.168.1.50	2026-09-13 04:47:47.538438
1378	1	UPDATE	rol_permiso	3	Se actualizaron los permisos del rol 'Cajero (POS)' (ID: 3). Total asignados: 4.	192.168.1.50	2026-09-13 04:47:47.693394
4732	1	LOGIN_EXITOSO	usuario	1	Inicio de sesión exitoso de 'Alejandro Sistemas' (admin@fashionstore.com) con rol 'Administrador'.	172.20.0.1	2026-09-13 19:03:16.36817
1381	1	UPDATE	rol_permiso	3	Se actualizaron los permisos del rol 'Cajero (POS)' (ID: 3). Total asignados: 5.	192.168.1.50	2026-09-13 04:47:48.533738
1382	1	INSERT	usuario	294	Alta de usuario 'Carlos Recuperador' (qa_recovery_user@fashionstore.com) con rol id=4.	192.168.1.50	2026-09-13 04:47:48.789026
1384	1	INSERT	usuario	295	Alta de usuario 'Carlos Recuperador' (qa_recovery_user@fashionstore.com) con rol id=4.	192.168.1.50	2026-09-13 04:47:49.253787
1387	1	INSERT	usuario	296	Alta de usuario 'Carlos Recuperador' (qa_recovery_user@fashionstore.com) con rol id=4.	192.168.1.50	2026-09-13 04:47:49.725377
1389	1	INSERT	usuario	297	Alta de usuario 'Carlos Recuperador' (qa_recovery_user@fashionstore.com) con rol id=4.	192.168.1.50	2026-09-13 04:47:50.189141
1394	1	INSERT	usuario	298	Alta de usuario 'Carlos Recuperador' (qa_recovery_user@fashionstore.com) con rol id=4.	192.168.1.50	2026-09-13 04:47:51.441656
1396	1	INSERT	usuario	299	Alta de usuario 'Carlos Recuperador' (qa_recovery_user@fashionstore.com) con rol id=4.	192.168.1.50	2026-09-13 04:47:51.901044
1397	1	INSERT	usuario	300	Alta de usuario 'Carlos Recuperador' (qa_recovery_user@fashionstore.com) con rol id=4.	192.168.1.50	2026-09-13 04:47:52.273256
1400	1	INSERT	usuario	301	Alta de usuario 'Carlos Recuperador' (qa_recovery_user@fashionstore.com) con rol id=4.	192.168.1.50	2026-09-13 04:47:53.013205
1402	1	INSERT	usuario	303	Alta de usuario 'Carlos Recuperador' (qa_recovery_user@fashionstore.com) con rol id=4.	192.168.1.50	2026-09-13 04:47:54.032933
1404	1	INSERT	usuario	304	Alta de usuario 'Carlos Recuperador' (qa_recovery_user@fashionstore.com) con rol id=4.	192.168.1.50	2026-09-13 04:47:54.585802
1478	1	INSERT	usuario	318	Alta de usuario 'Carlos Recuperador' (qa_recovery_user@fashionstore.com) con rol id=4.	192.168.1.50	2026-09-13 04:48:05.483262
1483	1	INSERT	usuario	319	Alta de usuario 'Carlos Recuperador' (qa_recovery_user@fashionstore.com) con rol id=4.	192.168.1.50	2026-09-13 04:48:06.205313
1551	1	INSERT	usuario	336	Alta de usuario 'Carlos Recuperador' (qa_recovery_user@fashionstore.com) con rol id=4.	192.168.1.50	2026-09-13 04:48:15.260789
5702	1	UPDATE	rol_permiso	3	Se actualizaron los permisos del rol 'Cajero (POS)' (ID: 3). Total asignados: 4.	192.168.1.50	2026-09-13 19:23:13.047468
1407	1	LOGIN_EXITOSO	usuario	1	Inicio de sesión exitoso de 'Alejandro Sistemas' (admin@fashionstore.com) con rol 'Administrador'.	192.168.10.101	2026-09-13 04:47:55.204952
5703	1	INSERT	usuario	1082	Alta de usuario 'Cajero POS QA' (qa_cajero_rbac@fashionstore.com) con rol id=3.	192.168.1.50	2026-09-13 19:23:13.215349
1409	1	LOGIN_EXITOSO	usuario	1	Inicio de sesión exitoso de 'Alejandro Sistemas' (admin@fashionstore.com) con rol 'Administrador'.	172.20.0.1	2026-09-13 04:47:55.443457
4895	1	LOGIN_FALLIDO	usuario	1	Intento de inicio de sesión fallido para el correo: admin@fashionstore.com (contraseña incorrecta).	172.20.0.1	2026-09-13 19:06:36.395315
1411	1	LOGIN_FALLIDO	usuario	1	Intento de inicio de sesión fallido para el correo: admin@fashionstore.com (contraseña incorrecta).	192.168.10.102	2026-09-13 04:47:55.71181
1412	1	INSERT	usuario	305	Alta de usuario 'Carlos Recuperador' (qa_recovery_user@fashionstore.com) con rol id=4.	192.168.1.50	2026-09-13 04:47:55.897433
1414	\N	LOGIN_FALLIDO	usuario	\N	Intento de inicio de sesión fallido para el correo: no_existe_qa_999@fashionstore.com (correo no registrado).	192.168.10.103	2026-09-13 04:47:55.988102
1415	1	LOGIN_EXITOSO	usuario	1	Inicio de sesión exitoso de 'Alejandro Sistemas' (admin@fashionstore.com) con rol 'Administrador'.	172.20.0.1	2026-09-13 04:47:56.249078
5705	1	UPDATE	rol_permiso	3	Se actualizaron los permisos del rol 'Cajero (POS)' (ID: 3). Total asignados: 5.	192.168.1.50	2026-09-13 19:23:13.875397
5706	1	INSERT	usuario	1083	Alta de usuario 'Carlos Recuperador' (qa_recovery_user@fashionstore.com) con rol id=4.	192.168.1.50	2026-09-13 19:23:14.12747
1419	1	INSERT	cliente	21	Alta del cliente 'Lucía Morales Paz' (CI 88997711).	192.168.40.1	2026-09-13 04:47:57.181135
1421	1	UPDATE	cliente	21	Modificación del cliente CI 88997711. Campos: nombre_completo=Lucía Morales de Mendoza, telefono=78999999.	192.168.40.2	2026-09-13 04:47:57.637096
1422	1	INACTIVAR	cliente	21	Baja lógica del cliente 'Lucía Morales de Mendoza' (CI 88997711).	192.168.40.3	2026-09-13 04:47:57.689278
1427	1	UPDATE	usuario	308	Modificación del usuario 'qa_nuevo_cajero@fashionstore.com'. Campos actualizados: nombre=Carlos Alberto, telefono=71122334.	192.168.20.2	2026-09-13 04:47:58.4972
1429	1	INACTIVAR	usuario	308	Baja lógica del usuario 'qa_nuevo_cajero@fashionstore.com': estado cambiado de 'Activo' a 'Inactivo'.	192.168.20.3	2026-09-13 04:47:58.777874
1432	1	UPDATE	rol_permiso	3	Se actualizaron los permisos del rol 'Cajero (POS)' (ID: 3). Total asignados: 2.	192.168.1.50	2026-09-13 04:47:59.17741
1434	1	UPDATE	rol_permiso	3	Se actualizaron los permisos del rol 'Cajero (POS)' (ID: 3). Total asignados: 4.	192.168.1.50	2026-09-13 04:47:59.529422
1437	1	UPDATE	rol_permiso	3	Se actualizaron los permisos del rol 'Cajero (POS)' (ID: 3). Total asignados: 0.	192.168.1.50	2026-09-13 04:47:59.645003
5035	\N	LOGIN_FALLIDO	usuario	\N	Intento de inicio de sesión fallido para el correo: no_existe_seguro@fashionstore.com (correo no registrado).	192.168.99.99	2026-09-13 19:07:10.082485
5036	1	UPDATE	rol_permiso	3	Se actualizaron los permisos del rol 'Cajero (POS)' (ID: 3). Total asignados: 3.	198.51.100.22	2026-09-13 19:07:10.343179
5037	1	INSERT	usuario	1048	Alta de usuario 'Audit CU04' (qa_bitacora_cu04@fashionstore.com) con rol id=4.	192.168.1.50	2026-09-13 19:07:10.456264
5040	1	LOGIN_EXITOSO	usuario	1	Inicio de sesión exitoso de 'Alejandro Sistemas' (admin@fashionstore.com) con rol 'Administrador'.	172.20.0.1	2026-09-13 19:07:14.183271
1448	1	UPDATE	rol_permiso	3	Se actualizaron los permisos del rol 'Cajero (POS)' (ID: 3). Total asignados: 5.	192.168.1.50	2026-09-13 04:48:00.661184
1449	1	UPDATE	rol_permiso	3	Se actualizaron los permisos del rol 'Cajero (POS)' (ID: 3). Total asignados: 4.	192.168.1.50	2026-09-13 04:48:00.818172
1453	\N	LOGIN_FALLIDO	usuario	\N	Intento de inicio de sesión fallido para el correo: no_existe_seguro@fashionstore.com (correo no registrado).	192.168.99.99	2026-09-13 04:48:01.266594
1454	1	UPDATE	rol_permiso	3	Se actualizaron los permisos del rol 'Cajero (POS)' (ID: 3). Total asignados: 3.	198.51.100.22	2026-09-13 04:48:01.534995
1455	1	UPDATE	rol_permiso	3	Se actualizaron los permisos del rol 'Cajero (POS)' (ID: 3). Total asignados: 4.	192.168.1.50	2026-09-13 04:48:01.665589
1456	1	INSERT	usuario	311	Alta de usuario 'Audit CU04' (qa_bitacora_cu04@fashionstore.com) con rol id=4.	192.168.1.50	2026-09-13 04:48:01.645119
1458	1	INSERT	usuario	312	Alta de usuario 'Carlos Recuperador' (qa_recovery_user@fashionstore.com) con rol id=4.	192.168.1.50	2026-09-13 04:48:01.929755
1462	1	INSERT	usuario	313	Alta de usuario 'Carlos Recuperador' (qa_recovery_user@fashionstore.com) con rol id=4.	192.168.1.50	2026-09-13 04:48:02.393969
1465	1	INSERT	usuario	314	Alta de usuario 'Carlos Recuperador' (qa_recovery_user@fashionstore.com) con rol id=4.	192.168.1.50	2026-09-13 04:48:02.861459
1467	1	INSERT	usuario	315	Alta de usuario 'Carlos Recuperador' (qa_recovery_user@fashionstore.com) con rol id=4.	192.168.1.50	2026-09-13 04:48:03.329933
1468	\N	SOLICITUD_RECUPERACION_PASSWORD	usuario_token	201	Solicitud de recuperación de contraseña para el correo: qa_recovery_user@fashionstore.com.	172.20.0.1	2026-09-13 04:48:03.61056
1469	\N	RESTABLECER_PASSWORD_EXITOSO	usuario	315	Restablecimiento exitoso de contraseña para la cuenta 'qa_recovery_user@fashionstore.com' (ID: 315).	192.168.1.77	2026-09-13 04:48:03.700797
1470	\N	LOGIN_EXITOSO	usuario	315	Inicio de sesión exitoso de 'Carlos Recuperador' (qa_recovery_user@fashionstore.com) con rol 'Cliente'.	172.20.0.1	2026-09-13 04:48:03.972723
1471	\N	LOGIN_FALLIDO	usuario	315	Intento de inicio de sesión fallido para el correo: qa_recovery_user@fashionstore.com (contraseña incorrecta).	172.20.0.1	2026-09-13 04:48:04.242299
1472	1	INSERT	usuario	316	Alta de usuario 'Carlos Recuperador' (qa_recovery_user@fashionstore.com) con rol id=4.	192.168.1.50	2026-09-13 04:48:04.609614
1474	1	LOGIN_EXITOSO	usuario	1	Inicio de sesión exitoso de 'Alejandro Sistemas' (admin@fashionstore.com) con rol 'Administrador'.	192.168.10.101	2026-09-13 04:48:04.931349
1475	1	INSERT	usuario	317	Alta de usuario 'Carlos Recuperador' (qa_recovery_user@fashionstore.com) con rol id=4.	192.168.1.50	2026-09-13 04:48:05.109287
1476	1	LOGIN_EXITOSO	usuario	1	Inicio de sesión exitoso de 'Alejandro Sistemas' (admin@fashionstore.com) con rol 'Administrador'.	172.20.0.1	2026-09-13 04:48:05.15748
1477	1	LOGIN_FALLIDO	usuario	1	Intento de inicio de sesión fallido para el correo: admin@fashionstore.com (contraseña incorrecta).	192.168.10.102	2026-09-13 04:48:05.416336
5254	1	LOGIN_EXITOSO	usuario	1	Inicio de sesión exitoso de 'Alejandro Sistemas' (admin@fashionstore.com) con rol 'Administrador'.	172.20.0.1	2026-09-13 19:08:44.296185
5263	1	LOGIN_EXITOSO	usuario	1	Inicio de sesión exitoso de 'Alejandro Sistemas' (admin@fashionstore.com) con rol 'Administrador'.	172.20.0.1	2026-09-13 19:08:45.353261
5271	\N	LOGIN_FALLIDO	usuario	\N	Intento de inicio de sesión fallido para el correo: no_existe_seguro@fashionstore.com (correo no registrado).	192.168.99.99	2026-09-13 19:08:46.015922
1480	\N	LOGIN_FALLIDO	usuario	\N	Intento de inicio de sesión fallido para el correo: no_existe_qa_999@fashionstore.com (correo no registrado).	192.168.10.103	2026-09-13 04:48:05.685547
1482	1	LOGIN_EXITOSO	usuario	1	Inicio de sesión exitoso de 'Alejandro Sistemas' (admin@fashionstore.com) con rol 'Administrador'.	172.20.0.1	2026-09-13 04:48:05.944933
6616	1209	LOGIN_EXITOSO	usuario	1209	Inicio de sesión exitoso de 'Camila Suárez Peña' (camila.suarez@gmail.com) con rol 'Cliente'.	172.20.0.1	2026-09-19 21:25:53.379917
5708	1	INSERT	usuario	1084	Alta de usuario 'Carlos Recuperador' (qa_recovery_user@fashionstore.com) con rol id=4.	192.168.1.50	2026-09-13 19:23:14.567528
4896	1	LOGIN_EXITOSO	usuario	1	Inicio de sesión exitoso de 'Alejandro Sistemas' (admin@fashionstore.com) con rol 'Administrador'.	172.20.0.1	2026-09-13 19:06:36.55265
1488	1	INSERT	usuario	323	Alta de usuario 'Carlos Recuperador' (qa_recovery_user@fashionstore.com) con rol id=4.	192.168.1.50	2026-09-13 04:48:07.274843
1810	1	LOGIN_EXITOSO	usuario	1	Inicio de sesión exitoso de 'Alejandro Sistemas' (admin@fashionstore.com) con rol 'Administrador'.	172.20.0.1	2026-09-13 04:49:54.816528
5427	1	LOGIN_EXITOSO	usuario	1	Inicio de sesión exitoso de 'Alejandro Sistemas' (admin@fashionstore.com) con rol 'Administrador'.	172.20.0.1	2026-09-13 19:10:02.419939
1491	1	INSERT	usuario	325	Alta de usuario 'Carlos Recuperador' (qa_recovery_user@fashionstore.com) con rol id=4.	192.168.1.50	2026-09-13 04:48:07.857214
1811	1	UPDATE	rol_permiso	3	Se actualizaron los permisos del rol 'Cajero (POS)' (ID: 3). Total asignados: 3.	190.181.45.10	2026-09-13 04:49:55.053754
1493	1	UPDATE	usuario	324	Modificación del usuario 'qa_nuevo_cajero@fashionstore.com'. Campos actualizados: nombre=Carlos Alberto, telefono=71122334.	192.168.20.2	2026-09-13 04:48:08.238023
6717	\N	UPDATE	prenda	184	Se modificó la prenda. SKU anterior: JEA-WIDE-002 -> SKU nuevo: JEA-WIDE-002	\N	2026-09-20 10:19:50.59881
1495	1	INACTIVAR	usuario	324	Baja lógica del usuario 'qa_nuevo_cajero@fashionstore.com': estado cambiado de 'Activo' a 'Inactivo'.	192.168.20.3	2026-09-13 04:48:08.540869
1833	1	INSERT	usuario	409	Alta de usuario 'Carlos Recuperador' (qa_recovery_user@fashionstore.com) con rol id=4.	192.168.1.50	2026-09-13 04:49:58.136158
1498	1	UPDATE	rol_permiso	3	Se actualizaron los permisos del rol 'Cajero (POS)' (ID: 3). Total asignados: 2.	192.168.1.50	2026-09-13 04:48:08.952943
1499	1	UPDATE	rol_permiso	3	Se actualizaron los permisos del rol 'Cajero (POS)' (ID: 3). Total asignados: 4.	192.168.1.50	2026-09-13 04:48:09.301068
1500	1	INSERT	usuario	326	Alta de usuario 'Carlos Recuperador' (qa_recovery_user@fashionstore.com) con rol id=4.	192.168.1.50	2026-09-13 04:48:09.123798
1835	1	INSERT	usuario	410	Alta de usuario 'Carlos Recuperador' (qa_recovery_user@fashionstore.com) con rol id=4.	192.168.1.50	2026-09-13 04:49:58.696173
1502	1	UPDATE	rol_permiso	3	Se actualizaron los permisos del rol 'Cajero (POS)' (ID: 3). Total asignados: 0.	192.168.1.50	2026-09-13 04:48:09.413143
5711	1	INSERT	usuario	1085	Alta de usuario 'Carlos Recuperador' (qa_recovery_user@fashionstore.com) con rol id=4.	192.168.1.50	2026-09-13 19:23:15.020052
5713	1	INSERT	usuario	1086	Alta de usuario 'Carlos Recuperador' (qa_recovery_user@fashionstore.com) con rol id=4.	192.168.1.50	2026-09-13 19:23:15.475579
1507	1	UPDATE	rol_permiso	3	Se actualizaron los permisos del rol 'Cajero (POS)' (ID: 3). Total asignados: 5.	192.168.1.50	2026-09-13 04:48:10.421296
1508	1	INSERT	cliente	22	Alta del cliente 'Lucía Morales Paz' (CI 88997711).	192.168.40.1	2026-09-13 04:48:10.435481
1509	1	UPDATE	rol_permiso	3	Se actualizaron los permisos del rol 'Cajero (POS)' (ID: 3). Total asignados: 4.	192.168.1.50	2026-09-13 04:48:10.5654
1510	1	UPDATE	cliente	22	Modificación del cliente CI 88997711. Campos: nombre_completo=Lucía Morales de Mendoza, telefono=78999999.	192.168.40.2	2026-09-13 04:48:10.885549
1511	1	INACTIVAR	cliente	22	Baja lógica del cliente 'Lucía Morales de Mendoza' (CI 88997711).	192.168.40.3	2026-09-13 04:48:10.938324
1515	1	UPDATE	rol_permiso	3	Se actualizaron los permisos del rol 'Cajero (POS)' (ID: 3). Total asignados: 5.	192.168.1.50	2026-09-13 04:48:11.457749
5718	1	INSERT	usuario	1087	Alta de usuario 'Carlos Recuperador' (qa_recovery_user@fashionstore.com) con rol id=4.	192.168.1.50	2026-09-13 19:23:16.680172
1517	1	INSERT	usuario	329	Alta de usuario 'Carlos Recuperador' (qa_recovery_user@fashionstore.com) con rol id=4.	192.168.1.50	2026-09-13 04:48:11.71351
1840	1	INSERT	usuario	411	Alta de usuario 'Carlos Recuperador' (qa_recovery_user@fashionstore.com) con rol id=4.	192.168.1.50	2026-09-13 04:49:59.931858
5720	1	INSERT	usuario	1088	Alta de usuario 'Carlos Recuperador' (qa_recovery_user@fashionstore.com) con rol id=4.	192.168.1.50	2026-09-13 19:23:17.159926
1521	1	INSERT	usuario	330	Alta de usuario 'Carlos Recuperador' (qa_recovery_user@fashionstore.com) con rol id=4.	192.168.1.50	2026-09-13 04:48:12.172974
5440	1	LOGIN_EXITOSO	usuario	1	Inicio de sesión exitoso de 'Alejandro Sistemas' (admin@fashionstore.com) con rol 'Administrador'.	172.20.0.1	2026-09-13 19:10:06.106715
5721	1	INSERT	usuario	1089	Alta de usuario 'Carlos Recuperador' (qa_recovery_user@fashionstore.com) con rol id=4.	192.168.1.50	2026-09-13 19:23:17.527625
1526	1	INSERT	usuario	331	Alta de usuario 'Carlos Recuperador' (qa_recovery_user@fashionstore.com) con rol id=4.	192.168.1.50	2026-09-13 04:48:12.629696
5449	1	LOGIN_EXITOSO	usuario	1	Inicio de sesión exitoso de 'Alejandro Sistemas' (admin@fashionstore.com) con rol 'Administrador'.	172.20.0.1	2026-09-13 19:10:28.044397
1844	1	LOGIN_EXITOSO	usuario	1	Inicio de sesión exitoso de 'Alejandro Sistemas' (admin@fashionstore.com) con rol 'Administrador'.	192.168.10.101	2026-09-13 04:50:08.386862
1845	1	LOGIN_EXITOSO	usuario	1	Inicio de sesión exitoso de 'Alejandro Sistemas' (admin@fashionstore.com) con rol 'Administrador'.	172.20.0.1	2026-09-13 04:50:08.622
1532	1	INSERT	usuario	332	Alta de usuario 'Carlos Recuperador' (qa_recovery_user@fashionstore.com) con rol id=4.	192.168.1.50	2026-09-13 04:48:13.092899
1846	1	LOGIN_FALLIDO	usuario	1	Intento de inicio de sesión fallido para el correo: admin@fashionstore.com (contraseña incorrecta).	192.168.10.102	2026-09-13 04:50:08.887411
5453	1	LOGIN_EXITOSO	usuario	1	Inicio de sesión exitoso de 'Alejandro Sistemas' (admin@fashionstore.com) con rol 'Administrador'.	172.20.0.1	2026-09-13 19:10:29.383363
5458	\N	LOGIN_FALLIDO	usuario	\N	Intento de inicio de sesión fallido para el correo: no_existe_seguro@fashionstore.com (correo no registrado).	192.168.99.99	2026-09-13 19:10:29.811184
1544	1	INSERT	usuario	333	Alta de usuario 'Carlos Recuperador' (qa_recovery_user@fashionstore.com) con rol id=4.	192.168.1.50	2026-09-13 04:48:14.367733
1546	\N	LOGIN_FALLIDO	usuario	\N	Intento de inicio de sesión fallido para el correo: no_existe_seguro@fashionstore.com (correo no registrado).	192.168.99.99	2026-09-13 04:48:14.612541
1547	1	UPDATE	rol_permiso	3	Se actualizaron los permisos del rol 'Cajero (POS)' (ID: 3). Total asignados: 3.	198.51.100.22	2026-09-13 04:48:14.907531
1548	1	INSERT	usuario	334	Alta de usuario 'Carlos Recuperador' (qa_recovery_user@fashionstore.com) con rol id=4.	192.168.1.50	2026-09-13 04:48:14.875856
1549	1	INSERT	usuario	335	Alta de usuario 'Audit CU04' (qa_bitacora_cu04@fashionstore.com) con rol id=4.	192.168.1.50	2026-09-13 04:48:15.028071
1552	\N	SOLICITUD_RECUPERACION_PASSWORD	usuario_token	217	Solicitud de recuperación de contraseña para el correo: qa_recovery_user@fashionstore.com.	172.20.0.1	2026-09-13 04:48:15.525708
1813	\N	LOGIN_FALLIDO	usuario	\N	Intento de inicio de sesión fallido para el correo: qa_cliente_rbac@fashionstore.com (correo no registrado).	172.20.0.1	2026-09-13 04:49:54.931277
1847	\N	LOGIN_FALLIDO	usuario	\N	Intento de inicio de sesión fallido para el correo: no_existe_qa_999@fashionstore.com (correo no registrado).	192.168.10.103	2026-09-13 04:50:09.180694
1848	1	LOGIN_EXITOSO	usuario	1	Inicio de sesión exitoso de 'Alejandro Sistemas' (admin@fashionstore.com) con rol 'Administrador'.	172.20.0.1	2026-09-13 04:50:09.456022
2619	1	LOGIN_EXITOSO	usuario	1	Inicio de sesión exitoso de 'Alejandro Sistemas' (admin@fashionstore.com) con rol 'Administrador'.	172.20.0.1	2026-09-13 09:44:45.281871
2620	1	LOGIN_FALLIDO	usuario	1	Intento de inicio de sesión fallido para el correo: admin@fashionstore.com (contraseña incorrecta).	192.168.10.102	2026-09-13 09:44:45.541281
5724	1	INSERT	usuario	1090	Alta de usuario 'Carlos Recuperador' (qa_recovery_user@fashionstore.com) con rol id=4.	192.168.1.50	2026-09-13 19:23:18.232328
1853	1	UPDATE	usuario	414	Modificación del usuario 'qa_nuevo_cajero@fashionstore.com'. Campos actualizados: nombre=Carlos Alberto, telefono=71122334.	192.168.20.2	2026-09-13 04:50:11.644247
1854	1	INACTIVAR	usuario	414	Baja lógica del usuario 'qa_nuevo_cajero@fashionstore.com': estado cambiado de 'Activo' a 'Inactivo'.	192.168.20.3	2026-09-13 04:50:11.932419
1855	1	UPDATE	rol_permiso	3	Se actualizaron los permisos del rol 'Cajero (POS)' (ID: 3). Total asignados: 2.	192.168.1.50	2026-09-13 04:50:12.324349
1856	1	UPDATE	rol_permiso	3	Se actualizaron los permisos del rol 'Cajero (POS)' (ID: 3). Total asignados: 4.	192.168.1.50	2026-09-13 04:50:12.670661
1857	1	UPDATE	rol_permiso	3	Se actualizaron los permisos del rol 'Cajero (POS)' (ID: 3). Total asignados: 0.	192.168.1.50	2026-09-13 04:50:12.787887
5725	1	INSERT	usuario	1091	Alta de usuario 'Inactivo QA' (qa_user_inactivo_recovery@fashionstore.com) con rol id=4.	192.168.1.50	2026-09-13 19:23:18.87203
2621	\N	LOGIN_FALLIDO	usuario	\N	Intento de inicio de sesión fallido para el correo: no_existe_qa_999@fashionstore.com (correo no registrado).	192.168.10.103	2026-09-13 09:44:45.81941
1860	1	UPDATE	rol_permiso	3	Se actualizaron los permisos del rol 'Cajero (POS)' (ID: 3). Total asignados: 5.	192.168.1.50	2026-09-13 04:50:13.795042
1861	1	UPDATE	rol_permiso	3	Se actualizaron los permisos del rol 'Cajero (POS)' (ID: 3). Total asignados: 4.	192.168.1.50	2026-09-13 04:50:13.938455
5726	1	INSERT	usuario	1092	Alta de usuario 'Carlos Recuperador' (qa_recovery_user@fashionstore.com) con rol id=4.	192.168.1.50	2026-09-13 19:23:19.227378
2622	1	LOGIN_EXITOSO	usuario	1	Inicio de sesión exitoso de 'Alejandro Sistemas' (admin@fashionstore.com) con rol 'Administrador'.	172.20.0.1	2026-09-13 09:44:46.085685
1864	1	UPDATE	rol_permiso	3	Se actualizaron los permisos del rol 'Cajero (POS)' (ID: 3). Total asignados: 5.	192.168.1.50	2026-09-13 04:50:14.762699
1865	1	INSERT	usuario	417	Alta de usuario 'Carlos Recuperador' (qa_recovery_user@fashionstore.com) con rol id=4.	192.168.1.50	2026-09-13 04:50:15.018462
3964	1	INACTIVAR	usuario	931	Baja lógica del usuario 'qa_nuevo_cajero@fashionstore.com': estado cambiado de 'Activo' a 'Inactivo'.	192.168.20.3	2026-09-13 10:08:02.375481
1867	1	INSERT	usuario	418	Alta de usuario 'Carlos Recuperador' (qa_recovery_user@fashionstore.com) con rol id=4.	192.168.1.50	2026-09-13 04:50:15.47062
5728	1	INSERT	usuario	1093	Alta de usuario 'Carlos Recuperador' (qa_recovery_user@fashionstore.com) con rol id=4.	192.168.1.50	2026-09-13 19:23:19.767582
1870	1	INSERT	usuario	419	Alta de usuario 'Carlos Recuperador' (qa_recovery_user@fashionstore.com) con rol id=4.	192.168.1.50	2026-09-13 04:50:15.926528
1872	1	INSERT	usuario	420	Alta de usuario 'Carlos Recuperador' (qa_recovery_user@fashionstore.com) con rol id=4.	192.168.1.50	2026-09-13 04:50:16.383013
2627	1	UPDATE	usuario	620	Modificación del usuario 'qa_nuevo_cajero@fashionstore.com'. Campos actualizados: nombre=Carlos Alberto, telefono=71122334.	192.168.20.2	2026-09-13 09:44:48.361854
1877	1	INSERT	usuario	421	Alta de usuario 'Carlos Recuperador' (qa_recovery_user@fashionstore.com) con rol id=4.	192.168.1.50	2026-09-13 04:50:17.638653
5733	1	INSERT	usuario	1094	Alta de usuario 'Carlos Recuperador' (qa_recovery_user@fashionstore.com) con rol id=4.	192.168.1.50	2026-09-13 19:23:20.97542
1879	1	INSERT	usuario	422	Alta de usuario 'Carlos Recuperador' (qa_recovery_user@fashionstore.com) con rol id=4.	192.168.1.50	2026-09-13 04:50:18.106324
1880	1	INSERT	usuario	423	Alta de usuario 'Carlos Recuperador' (qa_recovery_user@fashionstore.com) con rol id=4.	192.168.1.50	2026-09-13 04:50:18.463577
1883	1	INSERT	usuario	424	Alta de usuario 'Carlos Recuperador' (qa_recovery_user@fashionstore.com) con rol id=4.	192.168.1.50	2026-09-13 04:50:19.182954
1885	1	INSERT	usuario	426	Alta de usuario 'Carlos Recuperador' (qa_recovery_user@fashionstore.com) con rol id=4.	192.168.1.50	2026-09-13 04:50:20.175238
5737	1	INSERT	cliente	54	Alta del cliente 'Lucía Morales Paz' (CI 88997711).	192.168.40.1	2026-09-13 19:23:22.235559
1887	1	INSERT	usuario	427	Alta de usuario 'Carlos Recuperador' (qa_recovery_user@fashionstore.com) con rol id=4.	192.168.1.50	2026-09-13 04:50:20.730901
5738	1	UPDATE	cliente	54	Modificación del cliente CI 88997711. Campos: nombre_completo=Lucía Morales de Mendoza, telefono=78999999.	192.168.40.2	2026-09-13 19:23:22.663399
5739	1	INACTIVAR	cliente	54	Baja lógica del cliente 'Lucía Morales de Mendoza' (CI 88997711).	192.168.40.3	2026-09-13 19:23:22.717868
5740	1	INSERT	ciudad	164	Alta de la ciudad 'Tarija QA'.	192.168.30.1	2026-09-13 19:23:22.959272
5741	1	INSERT	sucursal	116	Alta de la sucursal 'Sucursal Tarija Centro QA' en la ciudad id=164.	192.168.30.2	2026-09-13 19:23:23.347684
1892	1	INSERT	usuario	428	Alta de usuario 'Carlos Recuperador' (qa_recovery_user@fashionstore.com) con rol id=4.	192.168.1.50	2026-09-13 04:50:21.966868
5742	1	UPDATE	sucursal	116	Modificación de la sucursal 'Sucursal Tarija Centro QA'. Campos: direccion=Calle Sucre #789 (Modificado), telefono=66449988.	192.168.30.3	2026-09-13 19:23:23.631422
5743	1	INSERT	categoria	108	Alta de la categoría 'Deportes QA'.	192.168.50.1	2026-09-13 19:23:23.923348
5744	1	INSERT	categoria	109	Alta de la categoría 'Calzado Deportivo QA'.	192.168.1.50	2026-09-13 19:23:24.019344
1896	1	INSERT	cliente	26	Alta del cliente 'Lucía Morales Paz' (CI 88997711).	192.168.40.1	2026-09-13 04:50:23.198652
1897	1	UPDATE	cliente	26	Modificación del cliente CI 88997711. Campos: nombre_completo=Lucía Morales de Mendoza, telefono=78999999.	192.168.40.2	2026-09-13 04:50:23.63067
1898	1	INACTIVAR	cliente	26	Baja lógica del cliente 'Lucía Morales de Mendoza' (CI 88997711).	192.168.40.3	2026-09-13 04:50:23.68325
5745	1	UPDATE	categoria	108	Modificación de la categoría 'Deportes QA'. Campos: descripcion=Ropa de running y fitness.	192.168.50.2	2026-09-13 19:23:24.395188
5746	1	INACTIVAR	categoria	109	Baja lógica de la categoría 'Calzado Deportivo QA' (0 prenda(s) asociadas).	192.168.50.3	2026-09-13 19:23:24.496449
5747	1	INACTIVAR	categoria	108	Baja lógica de la categoría 'Deportes QA' (0 prenda(s) asociadas).	192.168.50.3	2026-09-13 19:23:24.544709
1815	1	INSERT	usuario	402	Alta de usuario 'Challenger2 Empirico' (qa_ch2_empirico@fashionstore.com) con rol id=4.	192.168.1.50	2026-09-13 04:49:55.317877
1556	1	INSERT	usuario	337	Alta de usuario 'Carlos Recuperador' (qa_recovery_user@fashionstore.com) con rol id=4.	192.168.1.50	2026-09-13 04:48:16.036199
6617	1210	INSERT	cliente	62	Auto-registro de nuevo cliente: Mateo Villagómez Arce (mateo.villagomez@gmail.com) con CI 8934120	172.20.0.1	2026-09-19 21:35:38.38968
1558	1	INSERT	usuario	339	Alta de usuario 'Carlos Recuperador' (qa_recovery_user@fashionstore.com) con rol id=4.	192.168.1.50	2026-09-13 04:48:16.936087
1818	1	INSERT	usuario	404	Alta de usuario 'Challenger2 Empirico' (qa_ch2_empirico@fashionstore.com) con rol id=4.	192.168.1.50	2026-09-13 04:49:55.651784
1560	1	INSERT	usuario	340	Alta de usuario 'Carlos Recuperador' (qa_recovery_user@fashionstore.com) con rol id=4.	192.168.1.50	2026-09-13 04:48:17.488361
4343	1	LOGIN_EXITOSO	usuario	1	Inicio de sesión exitoso de 'Alejandro Sistemas' (admin@fashionstore.com) con rol 'Administrador'.	172.20.0.1	2026-09-13 10:24:36.25513
4346	1	LOGIN_EXITOSO	usuario	1	Inicio de sesión exitoso de 'Alejandro Sistemas' (admin@fashionstore.com) con rol 'Administrador'.	172.20.0.1	2026-09-13 10:24:59.219231
1565	1	INSERT	usuario	341	Alta de usuario 'Carlos Recuperador' (qa_recovery_user@fashionstore.com) con rol id=4.	192.168.1.50	2026-09-13 04:48:18.792835
4348	1	LOGIN_EXITOSO	usuario	1	Inicio de sesión exitoso de 'Alejandro Sistemas' (admin@fashionstore.com) con rol 'Administrador'.	172.20.0.1	2026-09-13 10:25:46.510467
1569	1	INSERT	cliente	23	Alta del cliente 'Lucía Morales Paz' (CI 88997711).	192.168.40.1	2026-09-13 04:48:20.108077
1570	1	UPDATE	cliente	23	Modificación del cliente CI 88997711. Campos: nombre_completo=Lucía Morales de Mendoza, telefono=78999999.	192.168.40.2	2026-09-13 04:48:20.560377
1571	1	INACTIVAR	cliente	23	Baja lógica del cliente 'Lucía Morales de Mendoza' (CI 88997711).	192.168.40.3	2026-09-13 04:48:20.617059
4357	1	LOGIN_EXITOSO	usuario	1	Inicio de sesión exitoso de 'Alejandro Sistemas' (admin@fashionstore.com) con rol 'Administrador'.	172.20.0.1	2026-09-13 10:26:16.711575
4366	1	LOGIN_EXITOSO	usuario	1	Inicio de sesión exitoso de 'Alejandro Sistemas' (admin@fashionstore.com) con rol 'Administrador'.	172.20.0.1	2026-09-13 10:26:24.606064
1589	\N	LOGIN_FALLIDO	usuario	\N	Intento de inicio de sesión fallido para el correo: no_existe_seguro@fashionstore.com (correo no registrado).	192.168.99.99	2026-09-13 04:48:24.048168
1590	1	UPDATE	rol_permiso	3	Se actualizaron los permisos del rol 'Cajero (POS)' (ID: 3). Total asignados: 3.	198.51.100.22	2026-09-13 04:48:24.331196
1591	1	INSERT	usuario	342	Alta de usuario 'Audit CU04' (qa_bitacora_cu04@fashionstore.com) con rol id=4.	192.168.1.50	2026-09-13 04:48:24.440066
1595	1	LOGIN_EXITOSO	usuario	1	Inicio de sesión exitoso de 'Alejandro Sistemas' (admin@fashionstore.com) con rol 'Administrador'.	172.20.0.1	2026-09-13 04:48:31.083126
1596	1	INSERT	usuario	343	Alta de usuario 'Carlos Recuperador' (qa_recovery_user@fashionstore.com) con rol id=4.	192.168.1.50	2026-09-13 04:48:31.302206
1599	1	LOGIN_EXITOSO	usuario	1	Inicio de sesión exitoso de 'Alejandro Sistemas' (admin@fashionstore.com) con rol 'Administrador'.	172.20.0.1	2026-09-13 04:48:42.663432
1602	1	LOGIN_EXITOSO	usuario	1	Inicio de sesión exitoso de 'Alejandro Sistemas' (admin@fashionstore.com) con rol 'Administrador'.	192.168.10.101	2026-09-13 04:48:43.353394
1603	1	UPDATE	rol_permiso	3	Se actualizaron los permisos del rol 'Cajero (POS)' (ID: 3). Total asignados: 2.	192.168.1.50	2026-09-13 04:48:43.739107
1604	1	LOGIN_EXITOSO	usuario	1	Inicio de sesión exitoso de 'Alejandro Sistemas' (admin@fashionstore.com) con rol 'Administrador'.	172.20.0.1	2026-09-13 04:48:43.592871
1605	1	LOGIN_FALLIDO	usuario	1	Intento de inicio de sesión fallido para el correo: admin@fashionstore.com (contraseña incorrecta).	192.168.10.102	2026-09-13 04:48:43.85393
1606	1	UPDATE	rol_permiso	3	Se actualizaron los permisos del rol 'Cajero (POS)' (ID: 3). Total asignados: 4.	192.168.1.50	2026-09-13 04:48:44.102558
1607	1	UPDATE	rol_permiso	3	Se actualizaron los permisos del rol 'Cajero (POS)' (ID: 3). Total asignados: 0.	192.168.1.50	2026-09-13 04:48:44.2199
1608	\N	LOGIN_FALLIDO	usuario	\N	Intento de inicio de sesión fallido para el correo: no_existe_qa_999@fashionstore.com (correo no registrado).	192.168.10.103	2026-09-13 04:48:44.131343
1609	1	LOGIN_EXITOSO	usuario	1	Inicio de sesión exitoso de 'Alejandro Sistemas' (admin@fashionstore.com) con rol 'Administrador'.	172.20.0.1	2026-09-13 04:48:44.402222
1613	1	UPDATE	rol_permiso	3	Se actualizaron los permisos del rol 'Cajero (POS)' (ID: 3). Total asignados: 5.	192.168.1.50	2026-09-13 04:48:45.247011
1614	1	UPDATE	rol_permiso	3	Se actualizaron los permisos del rol 'Cajero (POS)' (ID: 3). Total asignados: 4.	192.168.1.50	2026-09-13 04:48:45.39071
1619	1	UPDATE	rol_permiso	3	Se actualizaron los permisos del rol 'Cajero (POS)' (ID: 3). Total asignados: 5.	192.168.1.50	2026-09-13 04:48:46.270855
1621	1	UPDATE	usuario	349	Modificación del usuario 'qa_nuevo_cajero@fashionstore.com'. Campos actualizados: nombre=Carlos Alberto, telefono=71122334.	192.168.20.2	2026-09-13 04:48:46.658635
1622	1	INSERT	usuario	350	Alta de usuario 'Carlos Recuperador' (qa_recovery_user@fashionstore.com) con rol id=4.	192.168.1.50	2026-09-13 04:48:46.539186
4390	1	LOGIN_EXITOSO	usuario	1	Inicio de sesión exitoso de 'Alejandro Sistemas' (admin@fashionstore.com) con rol 'Administrador'.	192.168.10.101	2026-09-13 10:26:37.532223
1624	1	INACTIVAR	usuario	349	Baja lógica del usuario 'qa_nuevo_cajero@fashionstore.com': estado cambiado de 'Activo' a 'Inactivo'.	192.168.20.3	2026-09-13 04:48:46.942777
1625	1	INSERT	usuario	351	Alta de usuario 'Carlos Recuperador' (qa_recovery_user@fashionstore.com) con rol id=4.	192.168.1.50	2026-09-13 04:48:46.99944
4391	1	LOGIN_EXITOSO	usuario	1	Inicio de sesión exitoso de 'Alejandro Sistemas' (admin@fashionstore.com) con rol 'Administrador'.	172.20.0.1	2026-09-13 10:26:37.786667
1627	1	UPDATE	rol_permiso	3	Se actualizaron los permisos del rol 'Cajero (POS)' (ID: 3). Total asignados: 2.	192.168.1.50	2026-09-13 04:48:47.346863
4392	1	LOGIN_FALLIDO	usuario	1	Intento de inicio de sesión fallido para el correo: admin@fashionstore.com (contraseña incorrecta).	192.168.10.102	2026-09-13 10:26:38.049263
4393	\N	LOGIN_FALLIDO	usuario	\N	Intento de inicio de sesión fallido para el correo: no_existe_qa_999@fashionstore.com (correo no registrado).	192.168.10.103	2026-09-13 10:26:38.314295
4394	1	LOGIN_EXITOSO	usuario	1	Inicio de sesión exitoso de 'Alejandro Sistemas' (admin@fashionstore.com) con rol 'Administrador'.	172.20.0.1	2026-09-13 10:26:38.580807
4396	1	INSERT	usuario	1002	Alta de usuario 'Usuario Cliente QA' (qa_cliente_rbac@fashionstore.com) con rol id=4.	192.168.1.50	2026-09-13 10:26:39.562082
4398	1	INSERT	usuario	1003	Alta de usuario 'Carlos Cajero QA' (qa_nuevo_cajero@fashionstore.com) con rol id=3.	192.168.20.1	2026-09-13 10:26:40.217974
4399	1	UPDATE	usuario	1003	Modificación del usuario 'qa_nuevo_cajero@fashionstore.com'. Campos actualizados: nombre=Carlos Alberto, telefono=71122334.	192.168.20.2	2026-09-13 10:26:40.762194
1816	1	INSERT	usuario	403	Alta de usuario 'Carlos Recuperador' (qa_recovery_user@fashionstore.com) con rol id=4.	192.168.1.50	2026-09-13 04:49:55.557083
1629	1	INSERT	usuario	352	Alta de usuario 'Carlos Recuperador' (qa_recovery_user@fashionstore.com) con rol id=4.	192.168.1.50	2026-09-13 04:48:47.463024
1630	1	UPDATE	rol_permiso	3	Se actualizaron los permisos del rol 'Cajero (POS)' (ID: 3). Total asignados: 4.	192.168.1.50	2026-09-13 04:48:47.726772
2007	1	INSERT	ciudad	65	Alta de la ciudad 'Ch2 MultiHop IP Test'.	190.104.220.15	2026-09-13 04:50:53.379185
1632	1	UPDATE	rol_permiso	3	Se actualizaron los permisos del rol 'Cajero (POS)' (ID: 3). Total asignados: 0.	192.168.1.50	2026-09-13 04:48:47.847893
1633	1	INSERT	usuario	353	Alta de usuario 'Carlos Recuperador' (qa_recovery_user@fashionstore.com) con rol id=4.	192.168.1.50	2026-09-13 04:48:47.939108
6618	1209	LOGIN_EXITOSO	usuario	1209	Inicio de sesión exitoso de 'Camila Suárez Peña' (camila.suarez@gmail.com) con rol 'Cliente'.	172.20.0.1	2026-09-19 22:39:28.602332
6718	\N	UPDATE	prenda	185	Se modificó la prenda. SKU anterior: PAN-CHI-001 -> SKU nuevo: PAN-CHI-001	\N	2026-09-20 10:19:50.59881
6719	\N	UPDATE	prenda	186	Se modificó la prenda. SKU anterior: POL-BAS-001 -> SKU nuevo: POL-BAS-001	\N	2026-09-20 10:19:50.59881
6720	\N	UPDATE	prenda	187	Se modificó la prenda. SKU anterior: POL-GRA-002 -> SKU nuevo: POL-GRA-002	\N	2026-09-20 10:19:50.59881
6721	\N	UPDATE	prenda	188	Se modificó la prenda. SKU anterior: CALZ-RUN-002 -> SKU nuevo: CALZ-RUN-002	\N	2026-09-20 10:19:50.59881
1639	1	UPDATE	rol_permiso	3	Se actualizaron los permisos del rol 'Cajero (POS)' (ID: 3). Total asignados: 5.	192.168.1.50	2026-09-13 04:48:48.870304
1640	1	UPDATE	rol_permiso	3	Se actualizaron los permisos del rol 'Cajero (POS)' (ID: 3). Total asignados: 4.	192.168.1.50	2026-09-13 04:48:49.026638
8311	1	LOGIN_FALLIDO	usuario	1	Intento de inicio de sesión fallido para el correo: admin@fashionstore.com (contraseña incorrecta).	192.168.10.102	2026-09-20 19:34:51.252389
6789	\N	UPDATE	prenda	3	Se modificó la prenda. SKU anterior: CHQ-CUERO-001 -> SKU nuevo: CHQ-CUERO-001	\N	2026-09-20 10:25:02.183521
1643	1	INSERT	usuario	356	Alta de usuario 'Carlos Recuperador' (qa_recovery_user@fashionstore.com) con rol id=4.	192.168.1.50	2026-09-13 04:48:49.203564
6790	\N	UPDATE	prenda	4	Se modificó la prenda. SKU anterior: CALZ-URB-001 -> SKU nuevo: CALZ-URB-001	\N	2026-09-20 10:25:02.183521
6791	\N	UPDATE	prenda	171	Se modificó la prenda. SKU anterior: CHQ-DENIM-002 -> SKU nuevo: CHQ-DENIM-002	\N	2026-09-20 10:25:02.183521
1646	1	UPDATE	rol_permiso	3	Se actualizaron los permisos del rol 'Cajero (POS)' (ID: 3). Total asignados: 5.	192.168.1.50	2026-09-13 04:48:49.858685
1647	1	INSERT	usuario	357	Alta de usuario 'Carlos Recuperador' (qa_recovery_user@fashionstore.com) con rol id=4.	192.168.1.50	2026-09-13 04:48:49.679224
1648	1	INSERT	usuario	358	Alta de usuario 'Carlos Recuperador' (qa_recovery_user@fashionstore.com) con rol id=4.	192.168.1.50	2026-09-13 04:48:50.052132
1649	\N	SOLICITUD_RECUPERACION_PASSWORD	usuario_token	231	Solicitud de recuperación de contraseña para el correo: qa_recovery_user@fashionstore.com.	172.20.0.1	2026-09-13 04:48:50.316533
6792	\N	UPDATE	prenda	172	Se modificó la prenda. SKU anterior: BLZ-EJE-001 -> SKU nuevo: BLZ-EJE-001	\N	2026-09-20 10:25:02.183521
1651	1	INSERT	usuario	360	Alta de usuario 'Carlos Recuperador' (qa_recovery_user@fashionstore.com) con rol id=4.	192.168.1.50	2026-09-13 04:48:50.614737
6793	\N	UPDATE	prenda	173	Se modificó la prenda. SKU anterior: CAM-OXF-001 -> SKU nuevo: CAM-OXF-001	\N	2026-09-20 10:25:02.183521
6794	\N	UPDATE	prenda	174	Se modificó la prenda. SKU anterior: CAM-BLA-002 -> SKU nuevo: CAM-BLA-002	\N	2026-09-20 10:25:02.183521
1654	1	INSERT	usuario	362	Alta de usuario 'Carlos Recuperador' (qa_recovery_user@fashionstore.com) con rol id=4.	192.168.1.50	2026-09-13 04:48:51.067612
6795	\N	UPDATE	prenda	175	Se modificó la prenda. SKU anterior: CAM-LEN-003 -> SKU nuevo: CAM-LEN-003	\N	2026-09-20 10:25:02.183521
6796	\N	UPDATE	prenda	176	Se modificó la prenda. SKU anterior: BLU-FLO-001 -> SKU nuevo: BLU-FLO-001	\N	2026-09-20 10:25:02.183521
1657	1	INSERT	usuario	364	Alta de usuario 'Carlos Recuperador' (qa_recovery_user@fashionstore.com) con rol id=4.	192.168.1.50	2026-09-13 04:48:51.530651
1658	\N	SOLICITUD_RECUPERACION_PASSWORD	usuario_token	235	Solicitud de recuperación de contraseña para el correo: qa_recovery_user@fashionstore.com.	172.20.0.1	2026-09-13 04:48:51.840059
6797	\N	UPDATE	prenda	177	Se modificó la prenda. SKU anterior: BLU-HAL-002 -> SKU nuevo: BLU-HAL-002	\N	2026-09-20 10:25:02.183521
1660	1	INSERT	usuario	366	Alta de usuario 'Carlos Recuperador' (qa_recovery_user@fashionstore.com) con rol id=4.	192.168.1.50	2026-09-13 04:48:51.952628
1661	\N	SOLICITUD_RECUPERACION_PASSWORD	usuario_token	236	Solicitud de recuperación de contraseña para el correo: qa_recovery_user@fashionstore.com.	192.168.1.88	2026-09-13 04:48:52.220385
1662	1	INSERT	usuario	367	Alta de usuario 'Carlos Recuperador' (qa_recovery_user@fashionstore.com) con rol id=4.	192.168.1.50	2026-09-13 04:48:52.332031
1663	1	INSERT	usuario	369	Alta de usuario 'Carlos Recuperador' (qa_recovery_user@fashionstore.com) con rol id=4.	192.168.1.50	2026-09-13 04:48:52.707744
1666	1	INSERT	usuario	370	Alta de usuario 'Carlos Recuperador' (qa_recovery_user@fashionstore.com) con rol id=4.	192.168.1.50	2026-09-13 04:48:53.419084
1668	1	INSERT	usuario	372	Alta de usuario 'Carlos Recuperador' (qa_recovery_user@fashionstore.com) con rol id=4.	192.168.1.50	2026-09-13 04:48:54.411098
1670	1	INSERT	usuario	373	Alta de usuario 'Carlos Recuperador' (qa_recovery_user@fashionstore.com) con rol id=4.	192.168.1.50	2026-09-13 04:48:54.986723
1675	1	INSERT	usuario	374	Alta de usuario 'Carlos Recuperador' (qa_recovery_user@fashionstore.com) con rol id=4.	192.168.1.50	2026-09-13 04:48:56.215065
1679	1	INSERT	cliente	24	Alta del cliente 'Lucía Morales Paz' (CI 88997711).	192.168.40.1	2026-09-13 04:48:57.458722
1680	1	UPDATE	cliente	24	Modificación del cliente CI 88997711. Campos: nombre_completo=Lucía Morales de Mendoza, telefono=78999999.	192.168.40.2	2026-09-13 04:48:57.878631
1681	1	INACTIVAR	cliente	24	Baja lógica del cliente 'Lucía Morales de Mendoza' (CI 88997711).	192.168.40.3	2026-09-13 04:48:57.927684
1700	1	LOGIN_EXITOSO	usuario	1	Inicio de sesión exitoso de 'Alejandro Sistemas' (admin@fashionstore.com) con rol 'Administrador'.	172.20.0.1	2026-09-13 04:49:01.348056
1701	\N	LOGIN_FALLIDO	usuario	\N	Intento de inicio de sesión fallido para el correo: no_existe_seguro@fashionstore.com (correo no registrado).	192.168.99.99	2026-09-13 04:49:01.363793
1702	1	UPDATE	rol_permiso	3	Se actualizaron los permisos del rol 'Cajero (POS)' (ID: 3). Total asignados: 3.	198.51.100.22	2026-09-13 04:49:01.648288
1704	1	INSERT	usuario	375	Alta de usuario 'Audit CU04' (qa_bitacora_cu04@fashionstore.com) con rol id=4.	192.168.1.50	2026-09-13 04:49:01.759463
1709	1	LOGIN_EXITOSO	usuario	1	Inicio de sesión exitoso de 'Alejandro Sistemas' (admin@fashionstore.com) con rol 'Administrador'.	192.168.10.101	2026-09-13 04:49:09.638105
1710	1	LOGIN_EXITOSO	usuario	1	Inicio de sesión exitoso de 'Alejandro Sistemas' (admin@fashionstore.com) con rol 'Administrador'.	172.20.0.1	2026-09-13 04:49:09.867576
1711	1	LOGIN_FALLIDO	usuario	1	Intento de inicio de sesión fallido para el correo: admin@fashionstore.com (contraseña incorrecta).	192.168.10.102	2026-09-13 04:49:10.133767
1712	\N	LOGIN_FALLIDO	usuario	\N	Intento de inicio de sesión fallido para el correo: no_existe_qa_999@fashionstore.com (correo no registrado).	192.168.10.103	2026-09-13 04:49:10.403033
1713	1	LOGIN_EXITOSO	usuario	1	Inicio de sesión exitoso de 'Alejandro Sistemas' (admin@fashionstore.com) con rol 'Administrador'.	172.20.0.1	2026-09-13 04:49:10.670709
2628	1	INACTIVAR	usuario	620	Baja lógica del usuario 'qa_nuevo_cajero@fashionstore.com': estado cambiado de 'Activo' a 'Inactivo'.	192.168.20.3	2026-09-13 09:44:48.653157
6619	1	LOGIN_FALLIDO	usuario	1	Intento de inicio de sesión fallido para el correo: admin@fashionstore.com (contraseña incorrecta).	127.0.0.1	2026-09-20 04:14:44.560039
6620	1	LOGIN_EXITOSO	usuario	1	Inicio de sesión exitoso de 'Alejandro Sistemas' (admin@fashionstore.com) con rol 'Administrador'.	127.0.0.1	2026-09-20 04:16:21.084343
6621	1	LOGIN_EXITOSO	usuario	1	Inicio de sesión exitoso de 'Alejandro Sistemas' (admin@fashionstore.com) con rol 'Administrador'.	127.0.0.1	2026-09-20 04:16:32.328558
1718	1	UPDATE	usuario	379	Modificación del usuario 'qa_nuevo_cajero@fashionstore.com'. Campos actualizados: nombre=Carlos Alberto, telefono=71122334.	192.168.20.2	2026-09-13 04:49:12.830782
1719	1	INACTIVAR	usuario	379	Baja lógica del usuario 'qa_nuevo_cajero@fashionstore.com': estado cambiado de 'Activo' a 'Inactivo'.	192.168.20.3	2026-09-13 04:49:13.110503
1720	1	UPDATE	rol_permiso	3	Se actualizaron los permisos del rol 'Cajero (POS)' (ID: 3). Total asignados: 2.	192.168.1.50	2026-09-13 04:49:13.49729
1721	1	UPDATE	rol_permiso	3	Se actualizaron los permisos del rol 'Cajero (POS)' (ID: 3). Total asignados: 4.	192.168.1.50	2026-09-13 04:49:13.837648
1722	1	UPDATE	rol_permiso	3	Se actualizaron los permisos del rol 'Cajero (POS)' (ID: 3). Total asignados: 0.	192.168.1.50	2026-09-13 04:49:13.953185
6622	1	LOGIN_EXITOSO	usuario	1	Inicio de sesión exitoso de 'Alejandro Sistemas' (admin@fashionstore.com) con rol 'Administrador'.	127.0.0.1	2026-09-20 04:17:15.677945
6722	\N	UPDATE	prenda	3	Se modificó la prenda. SKU anterior: CHQ-CUERO-001 -> SKU nuevo: CHQ-CUERO-001	\N	2026-09-20 10:19:53.521878
1725	1	UPDATE	rol_permiso	3	Se actualizaron los permisos del rol 'Cajero (POS)' (ID: 3). Total asignados: 5.	192.168.1.50	2026-09-13 04:49:14.972934
1726	1	UPDATE	rol_permiso	3	Se actualizaron los permisos del rol 'Cajero (POS)' (ID: 3). Total asignados: 4.	192.168.1.50	2026-09-13 04:49:15.121323
6723	\N	UPDATE	prenda	4	Se modificó la prenda. SKU anterior: CALZ-URB-001 -> SKU nuevo: CALZ-URB-001	\N	2026-09-20 10:19:53.521878
6724	\N	UPDATE	prenda	171	Se modificó la prenda. SKU anterior: CHQ-DENIM-002 -> SKU nuevo: CHQ-DENIM-002	\N	2026-09-20 10:19:53.521878
1729	1	UPDATE	rol_permiso	3	Se actualizaron los permisos del rol 'Cajero (POS)' (ID: 3). Total asignados: 5.	192.168.1.50	2026-09-13 04:49:15.989528
1730	1	INSERT	usuario	382	Alta de usuario 'Carlos Recuperador' (qa_recovery_user@fashionstore.com) con rol id=4.	192.168.1.50	2026-09-13 04:49:16.244949
6725	\N	UPDATE	prenda	172	Se modificó la prenda. SKU anterior: BLZ-EJE-001 -> SKU nuevo: BLZ-EJE-001	\N	2026-09-20 10:19:53.521878
1732	1	INSERT	usuario	383	Alta de usuario 'Carlos Recuperador' (qa_recovery_user@fashionstore.com) con rol id=4.	192.168.1.50	2026-09-13 04:49:16.700968
4742	1	LOGIN_EXITOSO	usuario	1	Inicio de sesión exitoso de 'Alejandro Sistemas' (admin@fashionstore.com) con rol 'Administrador'.	172.20.0.1	2026-09-13 19:03:29.304883
6726	\N	UPDATE	prenda	173	Se modificó la prenda. SKU anterior: CAM-OXF-001 -> SKU nuevo: CAM-OXF-001	\N	2026-09-20 10:19:53.521878
1735	1	INSERT	usuario	384	Alta de usuario 'Carlos Recuperador' (qa_recovery_user@fashionstore.com) con rol id=4.	192.168.1.50	2026-09-13 04:49:17.153353
6727	\N	UPDATE	prenda	174	Se modificó la prenda. SKU anterior: CAM-BLA-002 -> SKU nuevo: CAM-BLA-002	\N	2026-09-20 10:19:53.521878
1737	1	INSERT	usuario	385	Alta de usuario 'Carlos Recuperador' (qa_recovery_user@fashionstore.com) con rol id=4.	192.168.1.50	2026-09-13 04:49:17.605294
1831	1	INSERT	usuario	407	Alta de usuario 'Carlos Recuperador' (qa_recovery_user@fashionstore.com) con rol id=4.	192.168.1.50	2026-09-13 04:49:57.148113
6728	\N	UPDATE	prenda	175	Se modificó la prenda. SKU anterior: CAM-LEN-003 -> SKU nuevo: CAM-LEN-003	\N	2026-09-20 10:19:53.521878
6729	\N	UPDATE	prenda	176	Se modificó la prenda. SKU anterior: BLU-FLO-001 -> SKU nuevo: BLU-FLO-001	\N	2026-09-20 10:19:53.521878
1935	1	LOGIN_EXITOSO	usuario	1	Inicio de sesión exitoso de 'Alejandro Sistemas' (admin@fashionstore.com) con rol 'Administrador'.	172.20.0.1	2026-09-13 04:50:42.728164
1742	1	INSERT	usuario	386	Alta de usuario 'Carlos Recuperador' (qa_recovery_user@fashionstore.com) con rol id=4.	192.168.1.50	2026-09-13 04:49:18.84513
1744	1	INSERT	usuario	387	Alta de usuario 'Carlos Recuperador' (qa_recovery_user@fashionstore.com) con rol id=4.	192.168.1.50	2026-09-13 04:49:19.305107
1745	1	INSERT	usuario	388	Alta de usuario 'Carlos Recuperador' (qa_recovery_user@fashionstore.com) con rol id=4.	192.168.1.50	2026-09-13 04:49:19.661355
1938	1	UPDATE	rol_permiso	3	Se actualizaron los permisos del rol 'Cajero (POS)' (ID: 3). Total asignados: 2.	192.168.1.50	2026-09-13 04:50:43.761455
1748	1	INSERT	usuario	389	Alta de usuario 'Carlos Recuperador' (qa_recovery_user@fashionstore.com) con rol id=4.	192.168.1.50	2026-09-13 04:49:20.384915
6114	1	LOGIN_EXITOSO	usuario	1	Inicio de sesión exitoso de 'Alejandro Sistemas' (admin@fashionstore.com) con rol 'Administrador'.	172.20.0.1	2026-09-13 20:39:12.847124
1750	1	INSERT	usuario	391	Alta de usuario 'Carlos Recuperador' (qa_recovery_user@fashionstore.com) con rol id=4.	192.168.1.50	2026-09-13 04:49:21.392824
1939	1	UPDATE	rol_permiso	3	Se actualizaron los permisos del rol 'Cajero (POS)' (ID: 3). Total asignados: 4.	192.168.1.50	2026-09-13 04:50:44.109348
1752	1	INSERT	usuario	392	Alta de usuario 'Carlos Recuperador' (qa_recovery_user@fashionstore.com) con rol id=4.	192.168.1.50	2026-09-13 04:49:21.93723
1940	1	UPDATE	rol_permiso	3	Se actualizaron los permisos del rol 'Cajero (POS)' (ID: 3). Total asignados: 0.	192.168.1.50	2026-09-13 04:50:44.218104
1757	1	INSERT	usuario	393	Alta de usuario 'Carlos Recuperador' (qa_recovery_user@fashionstore.com) con rol id=4.	192.168.1.50	2026-09-13 04:49:23.177646
1761	1	INSERT	cliente	25	Alta del cliente 'Lucía Morales Paz' (CI 88997711).	192.168.40.1	2026-09-13 04:49:24.425984
1762	1	UPDATE	cliente	25	Modificación del cliente CI 88997711. Campos: nombre_completo=Lucía Morales de Mendoza, telefono=78999999.	192.168.40.2	2026-09-13 04:49:24.86911
1763	1	INACTIVAR	cliente	25	Baja lógica del cliente 'Lucía Morales de Mendoza' (CI 88997711).	192.168.40.3	2026-09-13 04:49:24.923743
4767	\N	LOGIN_FALLIDO	usuario	\N	Intento de inicio de sesión fallido para el correo: no_existe_seguro@fashionstore.com (correo no registrado).	192.168.99.99	2026-09-13 19:03:35.8812
4768	1	UPDATE	rol_permiso	3	Se actualizaron los permisos del rol 'Cajero (POS)' (ID: 3). Total asignados: 3.	198.51.100.22	2026-09-13 19:03:36.200011
4769	1	INSERT	usuario	1041	Alta de usuario 'Audit CU04' (qa_bitacora_cu04@fashionstore.com) con rol id=4.	192.168.1.50	2026-09-13 19:03:36.316841
1781	\N	LOGIN_FALLIDO	usuario	\N	Intento de inicio de sesión fallido para el correo: no_existe_seguro@fashionstore.com (correo no registrado).	192.168.99.99	2026-09-13 04:49:28.277115
1782	1	UPDATE	rol_permiso	3	Se actualizaron los permisos del rol 'Cajero (POS)' (ID: 3). Total asignados: 3.	198.51.100.22	2026-09-13 04:49:28.543381
1783	1	INSERT	usuario	394	Alta de usuario 'Audit CU04' (qa_bitacora_cu04@fashionstore.com) con rol id=4.	192.168.1.50	2026-09-13 04:49:28.653063
1821	1	INSERT	usuario	405	Alta de usuario 'Carlos Recuperador' (qa_recovery_user@fashionstore.com) con rol id=4.	192.168.1.50	2026-09-13 04:49:56.032751
1916	\N	LOGIN_FALLIDO	usuario	\N	Intento de inicio de sesión fallido para el correo: no_existe_seguro@fashionstore.com (correo no registrado).	192.168.99.99	2026-09-13 04:50:27.054775
1917	1	UPDATE	rol_permiso	3	Se actualizaron los permisos del rol 'Cajero (POS)' (ID: 3). Total asignados: 3.	198.51.100.22	2026-09-13 04:50:27.320486
1918	1	INSERT	usuario	429	Alta de usuario 'Audit CU04' (qa_bitacora_cu04@fashionstore.com) con rol id=4.	192.168.1.50	2026-09-13 04:50:27.426908
2629	1	UPDATE	rol_permiso	3	Se actualizaron los permisos del rol 'Cajero (POS)' (ID: 3). Total asignados: 2.	192.168.1.50	2026-09-13 09:44:49.077771
2630	1	UPDATE	rol_permiso	3	Se actualizaron los permisos del rol 'Cajero (POS)' (ID: 3). Total asignados: 4.	192.168.1.50	2026-09-13 09:44:49.433853
1921	1	UPDATE	rol_permiso	3	Se actualizaron los permisos del rol 'Cajero (POS)' (ID: 3). Total asignados: 3.	190.181.45.10	2026-09-13 04:50:28.050492
1922	1	INSERT	usuario	430	Alta de usuario 'Challenger2 Empirico' (qa_ch2_empirico@fashionstore.com) con rol id=4.	192.168.1.50	2026-09-13 04:50:28.346713
1924	1	INSERT	usuario	431	Alta de usuario 'Challenger2 Empirico' (qa_ch2_empirico@fashionstore.com) con rol id=4.	192.168.1.50	2026-09-13 04:50:28.77892
6623	1	LOGIN_EXITOSO	usuario	1	Inicio de sesión exitoso de 'Alejandro Sistemas' (admin@fashionstore.com) con rol 'Administrador'.	127.0.0.1	2026-09-20 04:17:50.350139
6624	1	LOGIN_EXITOSO	usuario	1	Inicio de sesión exitoso de 'Alejandro Sistemas' (admin@fashionstore.com) con rol 'Administrador'.	127.0.0.1	2026-09-20 04:18:01.730052
5054	1	LOGIN_EXITOSO	usuario	1	Inicio de sesión exitoso de 'Alejandro Sistemas' (admin@fashionstore.com) con rol 'Administrador'.	172.20.0.1	2026-09-13 19:07:20.248029
1944	1	LOGIN_EXITOSO	usuario	1	Inicio de sesión exitoso de 'Alejandro Sistemas' (admin@fashionstore.com) con rol 'Administrador'.	192.168.10.101	2026-09-13 04:50:45.490065
5058	1	LOGIN_EXITOSO	usuario	1	Inicio de sesión exitoso de 'Alejandro Sistemas' (admin@fashionstore.com) con rol 'Administrador'.	172.20.0.1	2026-09-13 19:07:21.673507
1947	1	LOGIN_EXITOSO	usuario	1	Inicio de sesión exitoso de 'Alejandro Sistemas' (admin@fashionstore.com) con rol 'Administrador'.	172.20.0.1	2026-09-13 04:50:45.721126
1949	1	INSERT	usuario	435	Alta de usuario 'Carlos Recuperador' (qa_recovery_user@fashionstore.com) con rol id=4.	192.168.1.50	2026-09-13 04:50:46.173407
1952	1	LOGIN_EXITOSO	usuario	1	Inicio de sesión exitoso de 'Alejandro Sistemas' (admin@fashionstore.com) con rol 'Administrador'.	172.20.0.1	2026-09-13 04:50:46.517105
1957	1	INSERT	usuario	438	Alta de usuario 'Carlos Recuperador' (qa_recovery_user@fashionstore.com) con rol id=4.	192.168.1.50	2026-09-13 04:50:47.11877
1967	1	UPDATE	usuario	441	Modificación del usuario 'qa_nuevo_cajero@fashionstore.com'. Campos actualizados: nombre=Carlos Alberto, telefono=71122334.	192.168.20.2	2026-09-13 04:50:48.721518
1969	1	INSERT	usuario	442	Alta de usuario 'Carlos Recuperador' (qa_recovery_user@fashionstore.com) con rol id=4.	192.168.1.50	2026-09-13 04:50:48.841724
1971	1	UPDATE	rol_permiso	3	Se actualizaron los permisos del rol 'Cajero (POS)' (ID: 3). Total asignados: 2.	192.168.1.50	2026-09-13 04:50:49.421872
1974	1	INSERT	usuario	444	Alta de usuario 'Carlos Recuperador' (qa_recovery_user@fashionstore.com) con rol id=4.	192.168.1.50	2026-09-13 04:50:49.658055
1984	1	UPDATE	rol_permiso	3	Se actualizaron los permisos del rol 'Cajero (POS)' (ID: 3). Total asignados: 3.	190.181.45.10	2026-09-13 04:50:51.396288
1986	1	INSERT	usuario	449	Alta de usuario 'Carlos Recuperador' (qa_recovery_user@fashionstore.com) con rol id=4.	192.168.1.50	2026-09-13 04:50:51.417217
1988	1	UPDATE	rol_permiso	3	Se actualizaron los permisos del rol 'Cajero (POS)' (ID: 3). Total asignados: 5.	192.168.1.50	2026-09-13 04:50:51.745315
1989	1	INSERT	usuario	450	Alta de usuario 'Challenger2 Empirico' (ch2_empirico_user@fashionstore.com) con rol id=4.	192.168.1.50	2026-09-13 04:50:51.621406
5795	1	INSERT	ciudad	165	Alta de la ciudad 'Pando QA IP Test'.	200.87.100.45	2026-09-13 19:23:34.855428
1991	1	INSERT	usuario	451	Alta de usuario 'Carlos Recuperador' (qa_recovery_user@fashionstore.com) con rol id=4.	192.168.1.50	2026-09-13 04:50:51.98127
1992	\N	SOLICITUD_RECUPERACION_PASSWORD	usuario_token	296	Solicitud de recuperación de contraseña para el correo: qa_recovery_user@fashionstore.com.	192.168.1.88	2026-09-13 04:50:52.247343
5796	\N	LOGIN_FALLIDO	usuario	\N	Intento de inicio de sesión fallido para el correo: no_existe_seguro@fashionstore.com (correo no registrado).	192.168.99.99	2026-09-13 19:23:35.059192
1996	1	INSERT	usuario	454	Alta de usuario 'Carlos Recuperador' (qa_recovery_user@fashionstore.com) con rol id=4.	192.168.1.50	2026-09-13 04:50:52.409902
5797	1	UPDATE	rol_permiso	3	Se actualizaron los permisos del rol 'Cajero (POS)' (ID: 3). Total asignados: 3.	198.51.100.22	2026-09-13 19:23:35.313429
5798	1	INSERT	usuario	1095	Alta de usuario 'Audit CU04' (qa_bitacora_cu04@fashionstore.com) con rol id=4.	192.168.1.50	2026-09-13 19:23:35.419526
2002	1	INSERT	usuario	456	Alta de usuario 'Carlos Recuperador' (qa_recovery_user@fashionstore.com) con rol id=4.	192.168.1.50	2026-09-13 04:50:52.881767
2005	1	UPDATE	rol_permiso	3	Se actualizaron los permisos del rol 'Cajero (POS)' (ID: 3). Total asignados: 3.	198.51.100.22	2026-09-13 04:50:53.294096
2008	1	INSERT	ciudad	66	Alta de la ciudad 'Ch2 IPv6 Test'.	2800:cd0:8c00:100:e85f:8a93:8bf4:8c6b	2026-09-13 04:50:53.485266
2009	1	INSERT	usuario	457	Alta de usuario 'Carlos Recuperador' (qa_recovery_user@fashionstore.com) con rol id=4.	192.168.1.50	2026-09-13 04:50:53.342428
2010	1	INSERT	ciudad	67	Alta de la ciudad 'Ch2 Overflow IP Test'.	2001:0db8:85a3:0000:0000:8a2e:0370:7334:extra	2026-09-13 04:50:53.581346
2013	1	INSERT	ciudad	68	Alta de la ciudad 'Ch2 Rollback Ciudad Test'.	192.168.1.50	2026-09-13 04:50:53.673483
2011	\N	SOLICITUD_RECUPERACION_PASSWORD	usuario_token	301	Solicitud de recuperación de contraseña para el correo: qa_recovery_user@fashionstore.com.	172.20.0.1	2026-09-13 04:50:53.614958
6172	1	INSERT	ciudad	173	Alta de la ciudad 'Pando QA IP Test'.	200.87.100.45	2026-09-13 20:49:06.817155
6173	\N	LOGIN_FALLIDO	usuario	\N	Intento de inicio de sesión fallido para el correo: no_existe_seguro@fashionstore.com (correo no registrado).	192.168.99.99	2026-09-13 20:49:07.01236
6174	1	UPDATE	rol_permiso	3	Se actualizaron los permisos del rol 'Cajero (POS)' (ID: 3). Total asignados: 3.	198.51.100.22	2026-09-13 20:49:07.282728
6175	1	INSERT	usuario	1151	Alta de usuario 'Audit CU04' (qa_bitacora_cu04@fashionstore.com) con rol id=4.	192.168.1.50	2026-09-13 20:49:07.396193
2631	1	UPDATE	rol_permiso	3	Se actualizaron los permisos del rol 'Cajero (POS)' (ID: 3). Total asignados: 0.	192.168.1.50	2026-09-13 09:44:49.549613
5267	\N	LOGIN_FALLIDO	usuario	\N	Intento de inicio de sesión fallido para el correo: no_existe_seguro@fashionstore.com (correo no registrado).	192.168.99.99	2026-09-13 19:08:45.775874
4919	\N	LOGIN_FALLIDO	usuario	\N	Intento de inicio de sesión fallido para el correo: no_existe_seguro@fashionstore.com (correo no registrado).	192.168.99.99	2026-09-13 19:06:40.266959
5460	1	UPDATE	rol_permiso	3	Se actualizaron los permisos del rol 'Cajero (POS)' (ID: 3). Total asignados: 3.	198.51.100.22	2026-09-13 19:10:30.084424
2058	\N	LOGIN_FALLIDO	usuario	\N	Intento de inicio de sesión fallido para el correo: no_existe_seguro@fashionstore.com (correo no registrado).	192.168.99.99	2026-09-13 04:51:03.829624
2059	1	UPDATE	rol_permiso	3	Se actualizaron los permisos del rol 'Cajero (POS)' (ID: 3). Total asignados: 3.	198.51.100.22	2026-09-13 04:51:04.102071
2060	1	INSERT	usuario	467	Alta de usuario 'Audit CU04' (qa_bitacora_cu04@fashionstore.com) con rol id=4.	192.168.1.50	2026-09-13 04:51:04.223895
5464	1	INSERT	usuario	1065	Alta de usuario 'Audit CU04' (qa_bitacora_cu04@fashionstore.com) con rol id=4.	192.168.1.50	2026-09-13 19:10:30.195576
2064	1	LOGIN_EXITOSO	usuario	1	Inicio de sesión exitoso de 'Alejandro Sistemas' (admin@fashionstore.com) con rol 'Administrador'.	192.168.10.101	2026-09-13 04:51:10.895634
2065	1	LOGIN_EXITOSO	usuario	1	Inicio de sesión exitoso de 'Alejandro Sistemas' (admin@fashionstore.com) con rol 'Administrador'.	172.20.0.1	2026-09-13 04:51:11.124448
2066	1	LOGIN_FALLIDO	usuario	1	Intento de inicio de sesión fallido para el correo: admin@fashionstore.com (contraseña incorrecta).	192.168.10.102	2026-09-13 04:51:11.384235
2067	\N	LOGIN_FALLIDO	usuario	\N	Intento de inicio de sesión fallido para el correo: no_existe_qa_999@fashionstore.com (correo no registrado).	192.168.10.103	2026-09-13 04:51:11.65059
2068	1	LOGIN_EXITOSO	usuario	1	Inicio de sesión exitoso de 'Alejandro Sistemas' (admin@fashionstore.com) con rol 'Administrador'.	172.20.0.1	2026-09-13 04:51:11.916754
5957	1	INSERT	ciudad	169	Alta de la ciudad 'Pando QA IP Test'.	200.87.100.45	2026-09-13 19:33:55.814083
5958	\N	LOGIN_FALLIDO	usuario	\N	Intento de inicio de sesión fallido para el correo: no_existe_seguro@fashionstore.com (correo no registrado).	192.168.99.99	2026-09-13 19:33:56.006359
2073	1	UPDATE	usuario	470	Modificación del usuario 'qa_nuevo_cajero@fashionstore.com'. Campos actualizados: nombre=Carlos Alberto, telefono=71122334.	192.168.20.2	2026-09-13 04:51:14.095803
2074	1	INACTIVAR	usuario	470	Baja lógica del usuario 'qa_nuevo_cajero@fashionstore.com': estado cambiado de 'Activo' a 'Inactivo'.	192.168.20.3	2026-09-13 04:51:14.371156
2075	1	UPDATE	rol_permiso	3	Se actualizaron los permisos del rol 'Cajero (POS)' (ID: 3). Total asignados: 2.	192.168.1.50	2026-09-13 04:51:14.756705
2076	1	UPDATE	rol_permiso	3	Se actualizaron los permisos del rol 'Cajero (POS)' (ID: 3). Total asignados: 4.	192.168.1.50	2026-09-13 04:51:15.115896
2077	1	UPDATE	rol_permiso	3	Se actualizaron los permisos del rol 'Cajero (POS)' (ID: 3). Total asignados: 0.	192.168.1.50	2026-09-13 04:51:15.23201
5959	1	UPDATE	rol_permiso	3	Se actualizaron los permisos del rol 'Cajero (POS)' (ID: 3). Total asignados: 3.	198.51.100.22	2026-09-13 19:33:56.271792
5960	1	INSERT	usuario	1114	Alta de usuario 'Audit CU04' (qa_bitacora_cu04@fashionstore.com) con rol id=4.	192.168.1.50	2026-09-13 19:33:56.382185
2080	1	UPDATE	rol_permiso	3	Se actualizaron los permisos del rol 'Cajero (POS)' (ID: 3). Total asignados: 5.	192.168.1.50	2026-09-13 04:51:16.23616
2081	1	UPDATE	rol_permiso	3	Se actualizaron los permisos del rol 'Cajero (POS)' (ID: 3). Total asignados: 4.	192.168.1.50	2026-09-13 04:51:16.379866
2084	1	UPDATE	rol_permiso	3	Se actualizaron los permisos del rol 'Cajero (POS)' (ID: 3). Total asignados: 5.	192.168.1.50	2026-09-13 04:51:17.219987
2085	1	INSERT	usuario	473	Alta de usuario 'Carlos Recuperador' (qa_recovery_user@fashionstore.com) con rol id=4.	192.168.1.50	2026-09-13 04:51:17.480313
5963	1	LOGIN_EXITOSO	usuario	1	Inicio de sesión exitoso de 'Alejandro Sistemas' (admin@fashionstore.com) con rol 'Administrador'.	172.20.0.1	2026-09-13 19:34:02.187493
2087	1	INSERT	usuario	474	Alta de usuario 'Carlos Recuperador' (qa_recovery_user@fashionstore.com) con rol id=4.	192.168.1.50	2026-09-13 04:51:17.944112
2090	1	INSERT	usuario	475	Alta de usuario 'Carlos Recuperador' (qa_recovery_user@fashionstore.com) con rol id=4.	192.168.1.50	2026-09-13 04:51:18.395983
2092	1	INSERT	usuario	476	Alta de usuario 'Carlos Recuperador' (qa_recovery_user@fashionstore.com) con rol id=4.	192.168.1.50	2026-09-13 04:51:18.848311
2097	1	INSERT	usuario	477	Alta de usuario 'Carlos Recuperador' (qa_recovery_user@fashionstore.com) con rol id=4.	192.168.1.50	2026-09-13 04:51:20.100549
2099	1	INSERT	usuario	478	Alta de usuario 'Carlos Recuperador' (qa_recovery_user@fashionstore.com) con rol id=4.	192.168.1.50	2026-09-13 04:51:20.560711
2100	1	INSERT	usuario	479	Alta de usuario 'Carlos Recuperador' (qa_recovery_user@fashionstore.com) con rol id=4.	192.168.1.50	2026-09-13 04:51:20.936903
2103	1	INSERT	usuario	480	Alta de usuario 'Carlos Recuperador' (qa_recovery_user@fashionstore.com) con rol id=4.	192.168.1.50	2026-09-13 04:51:21.647872
2105	1	INSERT	usuario	482	Alta de usuario 'Carlos Recuperador' (qa_recovery_user@fashionstore.com) con rol id=4.	192.168.1.50	2026-09-13 04:51:22.640296
2107	1	INSERT	usuario	483	Alta de usuario 'Carlos Recuperador' (qa_recovery_user@fashionstore.com) con rol id=4.	192.168.1.50	2026-09-13 04:51:23.192201
2112	1	INSERT	usuario	484	Alta de usuario 'Carlos Recuperador' (qa_recovery_user@fashionstore.com) con rol id=4.	192.168.1.50	2026-09-13 04:51:24.404252
2116	1	INSERT	cliente	28	Alta del cliente 'Lucía Morales Paz' (CI 88997711).	192.168.40.1	2026-09-13 04:51:25.655999
2117	1	UPDATE	cliente	28	Modificación del cliente CI 88997711. Campos: nombre_completo=Lucía Morales de Mendoza, telefono=78999999.	192.168.40.2	2026-09-13 04:51:26.083896
2118	1	INACTIVAR	cliente	28	Baja lógica del cliente 'Lucía Morales de Mendoza' (CI 88997711).	192.168.40.3	2026-09-13 04:51:26.132373
5987	1	LOGIN_EXITOSO	usuario	1	Inicio de sesión exitoso de 'Alejandro Sistemas' (admin@fashionstore.com) con rol 'Administrador'.	192.168.10.101	2026-09-13 19:34:13.526813
5988	1	LOGIN_EXITOSO	usuario	1	Inicio de sesión exitoso de 'Alejandro Sistemas' (admin@fashionstore.com) con rol 'Administrador'.	172.20.0.1	2026-09-13 19:34:13.753907
5989	1	LOGIN_FALLIDO	usuario	1	Intento de inicio de sesión fallido para el correo: admin@fashionstore.com (contraseña incorrecta).	192.168.10.102	2026-09-13 19:34:14.003177
5990	\N	LOGIN_FALLIDO	usuario	\N	Intento de inicio de sesión fallido para el correo: no_existe_qa_999@fashionstore.com (correo no registrado).	192.168.10.103	2026-09-13 19:34:14.252957
5991	1	LOGIN_EXITOSO	usuario	1	Inicio de sesión exitoso de 'Alejandro Sistemas' (admin@fashionstore.com) con rol 'Administrador'.	172.20.0.1	2026-09-13 19:34:14.50433
5993	1	LOGIN_EXITOSO	usuario	1	Inicio de sesión exitoso de 'Alejandro Sistemas' (admin@fashionstore.com) con rol 'Administrador'.	172.20.0.1	2026-09-13 19:34:19.957909
2634	1	UPDATE	rol_permiso	3	Se actualizaron los permisos del rol 'Cajero (POS)' (ID: 3). Total asignados: 5.	192.168.1.50	2026-09-13 09:44:50.546191
2635	1	UPDATE	rol_permiso	3	Se actualizaron los permisos del rol 'Cajero (POS)' (ID: 3). Total asignados: 4.	192.168.1.50	2026-09-13 09:44:50.698033
6625	\N	UPDATE	prenda	4	Se modificó la prenda. SKU anterior: E2E-CALZADO-1788649379 -> SKU nuevo: E2E-CALZADO-1788649379	\N	2026-09-20 04:18:23.651051
6626	\N	UPDATE	prenda	3	Se modificó la prenda. SKU anterior: CHQ-JEAN-001 -> SKU nuevo: CHQ-JEAN-001	\N	2026-09-20 04:18:23.651051
2638	1	UPDATE	rol_permiso	3	Se actualizaron los permisos del rol 'Cajero (POS)' (ID: 3). Total asignados: 5.	192.168.1.50	2026-09-13 09:44:51.537554
2639	1	INSERT	usuario	623	Alta de usuario 'Carlos Recuperador' (qa_recovery_user@fashionstore.com) con rol id=4.	192.168.1.50	2026-09-13 09:44:51.789988
3838	1	LOGIN_EXITOSO	usuario	1	Inicio de sesión exitoso de 'Alejandro Sistemas' (admin@fashionstore.com) con rol 'Administrador'.	172.20.0.1	2026-09-13 10:05:56.653259
2641	1	INSERT	usuario	624	Alta de usuario 'Carlos Recuperador' (qa_recovery_user@fashionstore.com) con rol id=4.	192.168.1.50	2026-09-13 09:44:52.262115
4920	1	UPDATE	rol_permiso	3	Se actualizaron los permisos del rol 'Cajero (POS)' (ID: 3). Total asignados: 3.	198.51.100.22	2026-09-13 19:06:40.488682
4921	1	INSERT	usuario	1045	Alta de usuario 'Audit CU04' (qa_bitacora_cu04@fashionstore.com) con rol id=4.	192.168.1.50	2026-09-13 19:06:40.602286
2644	1	INSERT	usuario	625	Alta de usuario 'Carlos Recuperador' (qa_recovery_user@fashionstore.com) con rol id=4.	192.168.1.50	2026-09-13 09:44:52.713677
2646	1	INSERT	usuario	626	Alta de usuario 'Carlos Recuperador' (qa_recovery_user@fashionstore.com) con rol id=4.	192.168.1.50	2026-09-13 09:44:53.170225
4922	\N	SOLICITUD_RECUPERACION_PASSWORD	usuario_token	726	Solicitud de recuperación de contraseña para el correo: qa_bitacora_cu04@fashionstore.com.	198.51.100.33	2026-09-13 19:06:40.869581
2651	1	INSERT	usuario	627	Alta de usuario 'Carlos Recuperador' (qa_recovery_user@fashionstore.com) con rol id=4.	192.168.1.50	2026-09-13 09:44:54.42973
2653	1	INSERT	usuario	628	Alta de usuario 'Carlos Recuperador' (qa_recovery_user@fashionstore.com) con rol id=4.	192.168.1.50	2026-09-13 09:44:54.885755
2654	1	INSERT	usuario	629	Alta de usuario 'Carlos Recuperador' (qa_recovery_user@fashionstore.com) con rol id=4.	192.168.1.50	2026-09-13 09:44:55.257559
2657	1	INSERT	usuario	630	Alta de usuario 'Carlos Recuperador' (qa_recovery_user@fashionstore.com) con rol id=4.	192.168.1.50	2026-09-13 09:44:55.970583
2659	1	INSERT	usuario	632	Alta de usuario 'Carlos Recuperador' (qa_recovery_user@fashionstore.com) con rol id=4.	192.168.1.50	2026-09-13 09:44:56.981775
2661	1	INSERT	usuario	633	Alta de usuario 'Carlos Recuperador' (qa_recovery_user@fashionstore.com) con rol id=4.	192.168.1.50	2026-09-13 09:44:57.52978
2666	1	INSERT	usuario	634	Alta de usuario 'Carlos Recuperador' (qa_recovery_user@fashionstore.com) con rol id=4.	192.168.1.50	2026-09-13 09:44:58.75822
2670	1	INSERT	cliente	33	Alta del cliente 'Lucía Morales Paz' (CI 88997711).	192.168.40.1	2026-09-13 09:45:00.070261
2671	1	UPDATE	cliente	33	Modificación del cliente CI 88997711. Campos: nombre_completo=Lucía Morales de Mendoza, telefono=78999999.	192.168.40.2	2026-09-13 09:45:00.50178
2672	1	INACTIVAR	cliente	33	Baja lógica del cliente 'Lucía Morales de Mendoza' (CI 88997711).	192.168.40.3	2026-09-13 09:45:00.55659
5275	1	INSERT	usuario	1053	Alta de usuario 'Audit CU04' (qa_bitacora_cu04@fashionstore.com) con rol id=4.	192.168.1.50	2026-09-13 19:08:46.184632
2690	\N	LOGIN_FALLIDO	usuario	\N	Intento de inicio de sesión fallido para el correo: no_existe_seguro@fashionstore.com (correo no registrado).	192.168.99.99	2026-09-13 09:45:04.069462
2691	1	UPDATE	rol_permiso	3	Se actualizaron los permisos del rol 'Cajero (POS)' (ID: 3). Total asignados: 3.	198.51.100.22	2026-09-13 09:45:04.339775
2692	1	INSERT	usuario	635	Alta de usuario 'Audit CU04' (qa_bitacora_cu04@fashionstore.com) con rol id=4.	192.168.1.50	2026-09-13 09:45:04.450442
5276	\N	SOLICITUD_RECUPERACION_PASSWORD	usuario_token	734	Solicitud de recuperación de contraseña para el correo: qa_bitacora_cu04@fashionstore.com.	198.51.100.33	2026-09-13 19:08:46.513325
2696	1	LOGIN_EXITOSO	usuario	1	Inicio de sesión exitoso de 'Alejandro Sistemas' (admin@fashionstore.com) con rol 'Administrador'.	192.168.10.101	2026-09-13 09:46:21.364649
2697	1	LOGIN_EXITOSO	usuario	1	Inicio de sesión exitoso de 'Alejandro Sistemas' (admin@fashionstore.com) con rol 'Administrador'.	172.20.0.1	2026-09-13 09:46:21.600736
2698	1	LOGIN_FALLIDO	usuario	1	Intento de inicio de sesión fallido para el correo: admin@fashionstore.com (contraseña incorrecta).	192.168.10.102	2026-09-13 09:46:21.860284
2699	\N	LOGIN_FALLIDO	usuario	\N	Intento de inicio de sesión fallido para el correo: no_existe_qa_999@fashionstore.com (correo no registrado).	192.168.10.103	2026-09-13 09:46:22.125146
2700	1	LOGIN_EXITOSO	usuario	1	Inicio de sesión exitoso de 'Alejandro Sistemas' (admin@fashionstore.com) con rol 'Administrador'.	172.20.0.1	2026-09-13 09:46:22.400538
2705	1	UPDATE	usuario	638	Modificación del usuario 'qa_nuevo_cajero@fashionstore.com'. Campos actualizados: nombre=Carlos Alberto, telefono=71122334.	192.168.20.2	2026-09-13 09:46:24.600521
2706	1	INACTIVAR	usuario	638	Baja lógica del usuario 'qa_nuevo_cajero@fashionstore.com': estado cambiado de 'Activo' a 'Inactivo'.	192.168.20.3	2026-09-13 09:46:24.889222
2707	1	UPDATE	rol_permiso	3	Se actualizaron los permisos del rol 'Cajero (POS)' (ID: 3). Total asignados: 2.	192.168.1.50	2026-09-13 09:46:25.276585
2708	1	UPDATE	rol_permiso	3	Se actualizaron los permisos del rol 'Cajero (POS)' (ID: 3). Total asignados: 4.	192.168.1.50	2026-09-13 09:46:25.625318
2709	1	UPDATE	rol_permiso	3	Se actualizaron los permisos del rol 'Cajero (POS)' (ID: 3). Total asignados: 0.	192.168.1.50	2026-09-13 09:46:25.732619
2712	1	UPDATE	rol_permiso	3	Se actualizaron los permisos del rol 'Cajero (POS)' (ID: 3). Total asignados: 5.	192.168.1.50	2026-09-13 09:46:26.733032
5294	\N	LOGIN_FALLIDO	usuario	\N	Intento de inicio de sesión fallido para el correo: no_existe_seguro@fashionstore.com (correo no registrado).	192.168.99.99	2026-09-13 19:08:51.052544
5295	1	UPDATE	rol_permiso	3	Se actualizaron los permisos del rol 'Cajero (POS)' (ID: 3). Total asignados: 3.	198.51.100.22	2026-09-13 19:08:51.32635
5296	1	INSERT	usuario	1054	Alta de usuario 'Audit CU04' (qa_bitacora_cu04@fashionstore.com) con rol id=4.	192.168.1.50	2026-09-13 19:08:51.44
5299	1	LOGIN_EXITOSO	usuario	1	Inicio de sesión exitoso de 'Alejandro Sistemas' (admin@fashionstore.com) con rol 'Administrador'.	172.20.0.1	2026-09-13 19:08:54.721684
5302	1	LOGIN_EXITOSO	usuario	1	Inicio de sesión exitoso de 'Alejandro Sistemas' (admin@fashionstore.com) con rol 'Administrador'.	172.20.0.1	2026-09-13 19:08:58.773713
5303	1	INSERT	usuario	1055	Alta de usuario 'Audit CU04' (qa_bitacora_cu04@fashionstore.com) con rol id=4.	192.168.1.50	2026-09-13 19:08:58.99848
5306	1	LOGIN_EXITOSO	usuario	1	Inicio de sesión exitoso de 'Alejandro Sistemas' (admin@fashionstore.com) con rol 'Administrador'.	172.20.0.1	2026-09-13 19:09:03.977005
6627	1	LOGIN_EXITOSO	usuario	1	Inicio de sesión exitoso de 'Alejandro Sistemas' (admin@fashionstore.com) con rol 'Administrador'.	127.0.0.1	2026-09-20 04:18:34.851704
5269	1	UPDATE	rol_permiso	3	Se actualizaron los permisos del rol 'Cajero (POS)' (ID: 3). Total asignados: 3.	198.51.100.22	2026-09-13 19:08:46.066781
4923	1	LOGIN_EXITOSO	usuario	1	Inicio de sesión exitoso de 'Alejandro Sistemas' (admin@fashionstore.com) con rol 'Administrador'.	172.20.0.1	2026-09-13 19:06:40.793805
2822	1	INSERT	usuario	670	Alta de usuario 'Carlos Recuperador' (qa_recovery_user@fashionstore.com) con rol id=4.	192.168.1.50	2026-09-13 09:49:39.786488
2136	\N	LOGIN_FALLIDO	usuario	\N	Intento de inicio de sesión fallido para el correo: no_existe_seguro@fashionstore.com (correo no registrado).	192.168.99.99	2026-09-13 04:51:29.488047
2137	1	UPDATE	rol_permiso	3	Se actualizaron los permisos del rol 'Cajero (POS)' (ID: 3). Total asignados: 3.	198.51.100.22	2026-09-13 04:51:29.745771
2138	1	INSERT	usuario	485	Alta de usuario 'Audit CU04' (qa_bitacora_cu04@fashionstore.com) con rol id=4.	192.168.1.50	2026-09-13 04:51:29.855805
2142	1	LOGIN_EXITOSO	usuario	1	Inicio de sesión exitoso de 'Alejandro Sistemas' (admin@fashionstore.com) con rol 'Administrador'.	172.20.0.1	2026-09-13 04:51:38.057201
3008	\N	INSERT	prenda	78	Se registró una nueva prenda con SKU: CHALLENGE-PRENDA-DET, Nombre: Prenda Test Challenge Detalle	\N	2026-09-13 09:53:44.881309
2145	1	UPDATE	rol_permiso	3	Se actualizaron los permisos del rol 'Cajero (POS)' (ID: 3). Total asignados: 2.	192.168.1.50	2026-09-13 04:51:39.096031
2146	1	UPDATE	rol_permiso	3	Se actualizaron los permisos del rol 'Cajero (POS)' (ID: 3). Total asignados: 4.	192.168.1.50	2026-09-13 04:51:39.440258
2147	1	UPDATE	rol_permiso	3	Se actualizaron los permisos del rol 'Cajero (POS)' (ID: 3). Total asignados: 0.	192.168.1.50	2026-09-13 04:51:39.548079
2150	1	UPDATE	rol_permiso	3	Se actualizaron los permisos del rol 'Cajero (POS)' (ID: 3). Total asignados: 5.	192.168.1.50	2026-09-13 04:51:40.544282
2151	1	UPDATE	rol_permiso	3	Se actualizaron los permisos del rol 'Cajero (POS)' (ID: 3). Total asignados: 4.	192.168.1.50	2026-09-13 04:51:40.68817
6129	1	LOGIN_EXITOSO	usuario	1	Inicio de sesión exitoso de 'Alejandro Sistemas' (admin@fashionstore.com) con rol 'Administrador'.	172.20.0.1	2026-09-13 20:42:07.62282
6130	1	INSERT	ciudad	171	Alta de la ciudad 'Pando QA IP Test'.	200.87.100.45	2026-09-13 20:42:07.853776
2154	1	UPDATE	rol_permiso	3	Se actualizaron los permisos del rol 'Cajero (POS)' (ID: 3). Total asignados: 5.	192.168.1.50	2026-09-13 04:51:41.511801
2155	1	LOGIN_EXITOSO	usuario	1	Inicio de sesión exitoso de 'Alejandro Sistemas' (admin@fashionstore.com) con rol 'Administrador'.	172.20.0.1	2026-09-13 04:51:44.049446
6131	\N	LOGIN_FALLIDO	usuario	\N	Intento de inicio de sesión fallido para el correo: no_existe_seguro@fashionstore.com (correo no registrado).	192.168.99.99	2026-09-13 20:42:08.050218
6132	1	UPDATE	rol_permiso	3	Se actualizaron los permisos del rol 'Cajero (POS)' (ID: 3). Total asignados: 3.	198.51.100.22	2026-09-13 20:42:08.322459
2158	1	LOGIN_EXITOSO	usuario	1	Inicio de sesión exitoso de 'Alejandro Sistemas' (admin@fashionstore.com) con rol 'Administrador'.	172.20.0.1	2026-09-13 04:51:47.798497
2159	1	INSERT	usuario	490	Alta de usuario 'Carlos Recuperador' (qa_recovery_user@fashionstore.com) con rol id=4.	192.168.1.50	2026-09-13 04:51:48.015174
6133	1	INSERT	usuario	1149	Alta de usuario 'Audit CU04' (qa_bitacora_cu04@fashionstore.com) con rol id=4.	192.168.1.50	2026-09-13 20:42:08.442192
2161	1	INSERT	usuario	491	Alta de usuario 'Carlos Recuperador' (qa_recovery_user@fashionstore.com) con rol id=4.	192.168.1.50	2026-09-13 04:51:48.490904
2164	1	INSERT	usuario	492	Alta de usuario 'Carlos Recuperador' (qa_recovery_user@fashionstore.com) con rol id=4.	192.168.1.50	2026-09-13 04:51:48.943281
6136	1	LOGIN_EXITOSO	usuario	1	Inicio de sesión exitoso de 'Alejandro Sistemas' (admin@fashionstore.com) con rol 'Administrador'.	172.20.0.1	2026-09-13 20:43:41.469034
2166	1	INSERT	usuario	493	Alta de usuario 'Carlos Recuperador' (qa_recovery_user@fashionstore.com) con rol id=4.	192.168.1.50	2026-09-13 04:51:49.403322
2171	1	INSERT	usuario	494	Alta de usuario 'Carlos Recuperador' (qa_recovery_user@fashionstore.com) con rol id=4.	192.168.1.50	2026-09-13 04:51:50.623154
2173	1	INSERT	usuario	495	Alta de usuario 'Carlos Recuperador' (qa_recovery_user@fashionstore.com) con rol id=4.	192.168.1.50	2026-09-13 04:51:51.087063
2174	1	INSERT	usuario	496	Alta de usuario 'Carlos Recuperador' (qa_recovery_user@fashionstore.com) con rol id=4.	192.168.1.50	2026-09-13 04:51:51.451244
2177	1	INSERT	usuario	497	Alta de usuario 'Carlos Recuperador' (qa_recovery_user@fashionstore.com) con rol id=4.	192.168.1.50	2026-09-13 04:51:52.162676
2179	1	INSERT	usuario	499	Alta de usuario 'Carlos Recuperador' (qa_recovery_user@fashionstore.com) con rol id=4.	192.168.1.50	2026-09-13 04:51:53.143904
2181	1	INSERT	usuario	500	Alta de usuario 'Carlos Recuperador' (qa_recovery_user@fashionstore.com) con rol id=4.	192.168.1.50	2026-09-13 04:51:53.707451
2182	\N	SOLICITUD_RECUPERACION_PASSWORD	usuario_token	334	Solicitud de recuperación de contraseña para el correo: qa_recovery_user@fashionstore.com.	192.168.1.88	2026-09-13 04:51:53.964244
2184	1	INSERT	usuario	501	Alta de usuario 'Carlos Recuperador' (qa_recovery_user@fashionstore.com) con rol id=4.	192.168.1.50	2026-09-13 04:51:54.407851
2186	1	LOGIN_EXITOSO	usuario	1	Inicio de sesión exitoso de 'Alejandro Sistemas' (admin@fashionstore.com) con rol 'Administrador'.	172.20.0.1	2026-09-13 04:51:54.475799
2185	\N	SOLICITUD_RECUPERACION_PASSWORD	usuario_token	335	Solicitud de recuperación de contraseña para el correo: qa_recovery_user@fashionstore.com.	200.87.150.25	2026-09-13 04:51:54.642768
2189	1	LOGIN_EXITOSO	usuario	1	Inicio de sesión exitoso de 'Alejandro Sistemas' (admin@fashionstore.com) con rol 'Administrador'.	192.168.10.101	2026-09-13 04:51:55.197005
2190	1	UPDATE	rol_permiso	3	Se actualizaron los permisos del rol 'Cajero (POS)' (ID: 3). Total asignados: 2.	192.168.1.50	2026-09-13 04:51:55.539626
2191	1	LOGIN_EXITOSO	usuario	1	Inicio de sesión exitoso de 'Alejandro Sistemas' (admin@fashionstore.com) con rol 'Administrador'.	172.20.0.1	2026-09-13 04:51:55.428481
2192	1	UPDATE	rol_permiso	3	Se actualizaron los permisos del rol 'Cajero (POS)' (ID: 3). Total asignados: 4.	192.168.1.50	2026-09-13 04:51:55.898553
2193	1	LOGIN_FALLIDO	usuario	1	Intento de inicio de sesión fallido para el correo: admin@fashionstore.com (contraseña incorrecta).	192.168.10.102	2026-09-13 04:51:55.693507
2194	1	UPDATE	rol_permiso	3	Se actualizaron los permisos del rol 'Cajero (POS)' (ID: 3). Total asignados: 0.	192.168.1.50	2026-09-13 04:51:56.016283
2195	\N	LOGIN_FALLIDO	usuario	\N	Intento de inicio de sesión fallido para el correo: no_existe_qa_999@fashionstore.com (correo no registrado).	192.168.10.103	2026-09-13 04:51:55.958329
2196	1	LOGIN_EXITOSO	usuario	1	Inicio de sesión exitoso de 'Alejandro Sistemas' (admin@fashionstore.com) con rol 'Administrador'.	172.20.0.1	2026-09-13 04:51:56.222299
2200	1	UPDATE	rol_permiso	3	Se actualizaron los permisos del rol 'Cajero (POS)' (ID: 3). Total asignados: 5.	192.168.1.50	2026-09-13 04:51:57.035891
2201	1	UPDATE	rol_permiso	3	Se actualizaron los permisos del rol 'Cajero (POS)' (ID: 3). Total asignados: 4.	192.168.1.50	2026-09-13 04:51:57.190905
5803	1	LOGIN_EXITOSO	usuario	1	Inicio de sesión exitoso de 'Alejandro Sistemas' (admin@fashionstore.com) con rol 'Administrador'.	172.20.0.1	2026-09-13 19:24:33.91039
5272	1	UPDATE	rol_permiso	3	Se actualizaron los permisos del rol 'Cajero (POS)' (ID: 3). Total asignados: 3.	198.51.100.22	2026-09-13 19:08:46.346123
5804	1	LOGIN_EXITOSO	usuario	1	Inicio de sesión exitoso de 'Alejandro Sistemas' (admin@fashionstore.com) con rol 'Administrador'.	172.20.0.1	2026-09-13 19:27:18.388932
2713	1	UPDATE	rol_permiso	3	Se actualizaron los permisos del rol 'Cajero (POS)' (ID: 3). Total asignados: 4.	192.168.1.50	2026-09-13 09:46:26.888561
2206	1	UPDATE	rol_permiso	3	Se actualizaron los permisos del rol 'Cajero (POS)' (ID: 3). Total asignados: 5.	192.168.1.50	2026-09-13 04:51:58.043644
6628	1	LOGIN_EXITOSO	usuario	1	Inicio de sesión exitoso de 'Alejandro Sistemas' (admin@fashionstore.com) con rol 'Administrador'.	127.0.0.1	2026-09-20 04:32:18.097855
6629	1	LOGIN_EXITOSO	usuario	1	Inicio de sesión exitoso de 'Alejandro Sistemas' (admin@fashionstore.com) con rol 'Administrador'.	127.0.0.1	2026-09-20 04:32:55.034426
2208	1	UPDATE	rol_permiso	3	Se actualizaron los permisos del rol 'Cajero (POS)' (ID: 3). Total asignados: 2.	192.168.1.50	2026-09-13 04:51:59.034937
2209	1	UPDATE	rol_permiso	3	Se actualizaron los permisos del rol 'Cajero (POS)' (ID: 3). Total asignados: 4.	192.168.1.50	2026-09-13 04:51:59.382957
2210	1	UPDATE	rol_permiso	3	Se actualizaron los permisos del rol 'Cajero (POS)' (ID: 3). Total asignados: 0.	192.168.1.50	2026-09-13 04:51:59.491071
6632	1	INSERT	venta	3	Venta presencial POS #3 registrada en sucursal 'Sucursal Centro'. Método de pago: Efectivo. Total: Bs 369.90. Recibido: Bs 500.00, Cambio: Bs 130.10. Comprobante: N/A.	127.0.0.1	2026-09-20 04:35:06.480169
3009	\N	DELETE	prenda	78	Se eliminó la prenda con SKU: CHALLENGE-PRENDA-DET	\N	2026-09-13 09:53:44.895437
2213	1	UPDATE	rol_permiso	3	Se actualizaron los permisos del rol 'Cajero (POS)' (ID: 3). Total asignados: 5.	192.168.1.50	2026-09-13 04:52:00.498804
2214	1	UPDATE	rol_permiso	3	Se actualizaron los permisos del rol 'Cajero (POS)' (ID: 3). Total asignados: 4.	192.168.1.50	2026-09-13 04:52:00.650625
6730	\N	UPDATE	prenda	177	Se modificó la prenda. SKU anterior: BLU-HAL-002 -> SKU nuevo: BLU-HAL-002	\N	2026-09-20 10:19:53.521878
6731	\N	UPDATE	prenda	178	Se modificó la prenda. SKU anterior: VES-GALA-001 -> SKU nuevo: VES-GALA-001	\N	2026-09-20 10:19:53.521878
2217	1	UPDATE	rol_permiso	3	Se actualizaron los permisos del rol 'Cajero (POS)' (ID: 3). Total asignados: 5.	192.168.1.50	2026-09-13 04:52:01.471627
6732	\N	UPDATE	prenda	179	Se modificó la prenda. SKU anterior: VES-MIDI-002 -> SKU nuevo: VES-MIDI-002	\N	2026-09-20 10:19:53.521878
5474	1	LOGIN_EXITOSO	usuario	1	Inicio de sesión exitoso de 'Alejandro Sistemas' (admin@fashionstore.com) con rol 'Administrador'.	172.20.0.1	2026-09-13 19:10:33.496796
6733	\N	UPDATE	prenda	180	Se modificó la prenda. SKU anterior: SWT-HOD-001 -> SKU nuevo: SWT-HOD-001	\N	2026-09-20 10:19:53.521878
2221	1	LOGIN_EXITOSO	usuario	1	Inicio de sesión exitoso de 'Alejandro Sistemas' (admin@fashionstore.com) con rol 'Administrador'.	172.20.0.1	2026-09-13 04:52:04.063838
6734	\N	UPDATE	prenda	181	Se modificó la prenda. SKU anterior: SWT-TOR-002 -> SKU nuevo: SWT-TOR-002	\N	2026-09-20 10:19:53.521878
2223	\N	LOGIN_FALLIDO	usuario	\N	Intento de inicio de sesión fallido para el correo: no_existe_seguro@fashionstore.com (correo no registrado).	192.168.99.99	2026-09-13 04:52:04.474754
2224	1	UPDATE	rol_permiso	3	Se actualizaron los permisos del rol 'Cajero (POS)' (ID: 3). Total asignados: 3.	198.51.100.22	2026-09-13 04:52:04.740964
2225	1	INSERT	usuario	510	Alta de usuario 'Audit CU04' (qa_bitacora_cu04@fashionstore.com) con rol id=4.	192.168.1.50	2026-09-13 04:52:04.851084
2228	1	LOGIN_EXITOSO	usuario	1	Inicio de sesión exitoso de 'Alejandro Sistemas' (admin@fashionstore.com) con rol 'Administrador'.	172.20.0.1	2026-09-13 04:52:11.4916
2229	1	INSERT	usuario	511	Alta de usuario 'Carlos Recuperador' (qa_recovery_user@fashionstore.com) con rol id=4.	192.168.1.50	2026-09-13 04:52:11.705118
2231	1	INSERT	usuario	512	Alta de usuario 'Carlos Recuperador' (qa_recovery_user@fashionstore.com) con rol id=4.	192.168.1.50	2026-09-13 04:52:12.163414
2234	1	INSERT	usuario	513	Alta de usuario 'Carlos Recuperador' (qa_recovery_user@fashionstore.com) con rol id=4.	192.168.1.50	2026-09-13 04:52:12.626726
2236	1	INSERT	usuario	514	Alta de usuario 'Carlos Recuperador' (qa_recovery_user@fashionstore.com) con rol id=4.	192.168.1.50	2026-09-13 04:52:13.078784
2241	1	INSERT	usuario	515	Alta de usuario 'Carlos Recuperador' (qa_recovery_user@fashionstore.com) con rol id=4.	192.168.1.50	2026-09-13 04:52:14.325797
2243	1	INSERT	usuario	516	Alta de usuario 'Carlos Recuperador' (qa_recovery_user@fashionstore.com) con rol id=4.	192.168.1.50	2026-09-13 04:52:14.793703
2244	1	INSERT	usuario	517	Alta de usuario 'Carlos Recuperador' (qa_recovery_user@fashionstore.com) con rol id=4.	192.168.1.50	2026-09-13 04:52:15.189408
2247	1	INSERT	usuario	518	Alta de usuario 'Carlos Recuperador' (qa_recovery_user@fashionstore.com) con rol id=4.	192.168.1.50	2026-09-13 04:52:15.905378
2249	1	INSERT	usuario	520	Alta de usuario 'Carlos Recuperador' (qa_recovery_user@fashionstore.com) con rol id=4.	192.168.1.50	2026-09-13 04:52:16.88928
2251	1	INSERT	usuario	521	Alta de usuario 'Carlos Recuperador' (qa_recovery_user@fashionstore.com) con rol id=4.	192.168.1.50	2026-09-13 04:52:17.441264
2256	1	INSERT	usuario	522	Alta de usuario 'Carlos Recuperador' (qa_recovery_user@fashionstore.com) con rol id=4.	192.168.1.50	2026-09-13 04:52:18.673649
2260	1	LOGIN_EXITOSO	usuario	1	Inicio de sesión exitoso de 'Alejandro Sistemas' (admin@fashionstore.com) con rol 'Administrador'.	192.168.10.101	2026-09-13 04:52:26.277377
2261	1	LOGIN_EXITOSO	usuario	1	Inicio de sesión exitoso de 'Alejandro Sistemas' (admin@fashionstore.com) con rol 'Administrador'.	172.20.0.1	2026-09-13 04:52:26.5047
2262	1	LOGIN_FALLIDO	usuario	1	Intento de inicio de sesión fallido para el correo: admin@fashionstore.com (contraseña incorrecta).	192.168.10.102	2026-09-13 04:52:26.76878
2263	\N	LOGIN_FALLIDO	usuario	\N	Intento de inicio de sesión fallido para el correo: no_existe_qa_999@fashionstore.com (correo no registrado).	192.168.10.103	2026-09-13 04:52:27.04616
2264	1	LOGIN_EXITOSO	usuario	1	Inicio de sesión exitoso de 'Alejandro Sistemas' (admin@fashionstore.com) con rol 'Administrador'.	172.20.0.1	2026-09-13 04:52:27.309051
2268	1	LOGIN_EXITOSO	usuario	1	Inicio de sesión exitoso de 'Alejandro Sistemas' (admin@fashionstore.com) con rol 'Administrador'.	172.20.0.1	2026-09-13 04:52:28.796712
2270	1	INSERT	usuario	526	Alta de usuario 'Carlos Recuperador' (qa_recovery_user@fashionstore.com) con rol id=4.	192.168.1.50	2026-09-13 04:52:29.017407
2272	1	UPDATE	usuario	525	Modificación del usuario 'qa_nuevo_cajero@fashionstore.com'. Campos actualizados: nombre=Carlos Alberto, telefono=71122334.	192.168.20.2	2026-09-13 04:52:29.530255
2273	1	INSERT	usuario	527	Alta de usuario 'Carlos Recuperador' (qa_recovery_user@fashionstore.com) con rol id=4.	192.168.1.50	2026-09-13 04:52:29.481539
6630	1	INSERT	comprobante	1	Comprobante FS-2026-000001 generado para venta #2. Razón: Cliente Mostrador Test.	127.0.0.1	2026-09-20 04:32:55.285105
2275	1	INACTIVAR	usuario	525	Baja lógica del usuario 'qa_nuevo_cajero@fashionstore.com': estado cambiado de 'Activo' a 'Inactivo'.	192.168.20.3	2026-09-13 04:52:29.813088
4772	1	LOGIN_EXITOSO	usuario	1	Inicio de sesión exitoso de 'Alejandro Sistemas' (admin@fashionstore.com) con rol 'Administrador'.	172.20.0.1	2026-09-13 19:05:48.30922
2277	1	INSERT	usuario	528	Alta de usuario 'Carlos Recuperador' (qa_recovery_user@fashionstore.com) con rol id=4.	192.168.1.50	2026-09-13 04:52:29.945453
2716	1	UPDATE	rol_permiso	3	Se actualizaron los permisos del rol 'Cajero (POS)' (ID: 3). Total asignados: 5.	192.168.1.50	2026-09-13 09:46:27.713108
2279	1	UPDATE	rol_permiso	3	Se actualizaron los permisos del rol 'Cajero (POS)' (ID: 3). Total asignados: 2.	192.168.1.50	2026-09-13 04:52:30.217628
2280	1	UPDATE	rol_permiso	3	Se actualizaron los permisos del rol 'Cajero (POS)' (ID: 3). Total asignados: 4.	192.168.1.50	2026-09-13 04:52:30.565161
2281	1	INSERT	usuario	529	Alta de usuario 'Carlos Recuperador' (qa_recovery_user@fashionstore.com) con rol id=4.	192.168.1.50	2026-09-13 04:52:30.413146
2717	1	INSERT	usuario	641	Alta de usuario 'Carlos Recuperador' (qa_recovery_user@fashionstore.com) con rol id=4.	192.168.1.50	2026-09-13 09:46:27.972853
2283	1	UPDATE	rol_permiso	3	Se actualizaron los permisos del rol 'Cajero (POS)' (ID: 3). Total asignados: 0.	192.168.1.50	2026-09-13 04:52:30.681779
3965	1	UPDATE	rol_permiso	3	Se actualizaron los permisos del rol 'Cajero (POS)' (ID: 3). Total asignados: 2.	192.168.1.50	2026-09-13 10:08:02.770779
2719	1	INSERT	usuario	642	Alta de usuario 'Carlos Recuperador' (qa_recovery_user@fashionstore.com) con rol id=4.	192.168.1.50	2026-09-13 09:46:28.433627
4773	1	LOGIN_EXITOSO	usuario	1	Inicio de sesión exitoso de 'Alejandro Sistemas' (admin@fashionstore.com) con rol 'Administrador'.	172.20.0.1	2026-09-13 19:05:56.714139
4774	1	LOGIN_EXITOSO	usuario	1	Inicio de sesión exitoso de 'Alejandro Sistemas' (admin@fashionstore.com) con rol 'Administrador'.	172.20.0.1	2026-09-13 19:05:57.527274
6735	\N	UPDATE	prenda	182	Se modificó la prenda. SKU anterior: ABR-CAM-001 -> SKU nuevo: ABR-CAM-001	\N	2026-09-20 10:19:53.521878
2289	1	UPDATE	rol_permiso	3	Se actualizaron los permisos del rol 'Cajero (POS)' (ID: 3). Total asignados: 5.	192.168.1.50	2026-09-13 04:52:31.727209
2290	1	UPDATE	rol_permiso	3	Se actualizaron los permisos del rol 'Cajero (POS)' (ID: 3). Total asignados: 4.	192.168.1.50	2026-09-13 04:52:31.890099
2291	1	INSERT	usuario	531	Alta de usuario 'Carlos Recuperador' (qa_recovery_user@fashionstore.com) con rol id=4.	192.168.1.50	2026-09-13 04:52:31.67343
2294	1	INSERT	usuario	533	Alta de usuario 'Carlos Recuperador' (qa_recovery_user@fashionstore.com) con rol id=4.	192.168.1.50	2026-09-13 04:52:32.181522
5479	1	UPDATE	rol_permiso	3	Se actualizaron los permisos del rol 'Cajero (POS)' (ID: 3). Total asignados: 3.	198.51.100.22	2026-09-13 19:10:34.18238
2296	1	UPDATE	rol_permiso	3	Se actualizaron los permisos del rol 'Cajero (POS)' (ID: 3). Total asignados: 5.	192.168.1.50	2026-09-13 04:52:32.746024
2297	1	INSERT	usuario	534	Alta de usuario 'Carlos Recuperador' (qa_recovery_user@fashionstore.com) con rol id=4.	192.168.1.50	2026-09-13 04:52:32.550783
2298	\N	SOLICITUD_RECUPERACION_PASSWORD	usuario_token	356	Solicitud de recuperación de contraseña para el correo: qa_recovery_user@fashionstore.com.	172.20.0.1	2026-09-13 04:52:32.822973
5480	\N	LOGIN_FALLIDO	usuario	\N	Intento de inicio de sesión fallido para el correo: no_existe_seguro@fashionstore.com (correo no registrado).	192.168.99.99	2026-09-13 19:10:34.291641
2300	1	INSERT	usuario	535	Alta de usuario 'Carlos Recuperador' (qa_recovery_user@fashionstore.com) con rol id=4.	192.168.1.50	2026-09-13 04:52:33.023136
5482	1	UPDATE	rol_permiso	3	Se actualizaron los permisos del rol 'Cajero (POS)' (ID: 3). Total asignados: 3.	198.51.100.22	2026-09-13 19:10:34.553297
2302	1	INSERT	usuario	536	Alta de usuario 'Carlos Recuperador' (qa_recovery_user@fashionstore.com) con rol id=4.	192.168.1.50	2026-09-13 04:52:33.50185
5483	\N	SOLICITUD_RECUPERACION_PASSWORD	usuario_token	745	Solicitud de recuperación de contraseña para el correo: qa_bitacora_cu04@fashionstore.com.	198.51.100.33	2026-09-13 19:10:34.568663
5484	1	INSERT	usuario	1067	Alta de usuario 'Audit CU04' (qa_bitacora_cu04@fashionstore.com) con rol id=4.	192.168.1.50	2026-09-13 19:10:34.667425
2306	1	INSERT	usuario	538	Alta de usuario 'Carlos Recuperador' (qa_recovery_user@fashionstore.com) con rol id=4.	192.168.1.50	2026-09-13 04:52:33.969462
2307	\N	SOLICITUD_RECUPERACION_PASSWORD	usuario_token	360	Solicitud de recuperación de contraseña para el correo: qa_recovery_user@fashionstore.com.	172.20.0.1	2026-09-13 04:52:34.235123
2308	1	INSERT	usuario	540	Alta de usuario 'Carlos Recuperador' (qa_recovery_user@fashionstore.com) con rol id=4.	192.168.1.50	2026-09-13 04:52:34.295612
2309	1	INSERT	usuario	541	Alta de usuario 'Carlos Recuperador' (qa_recovery_user@fashionstore.com) con rol id=4.	192.168.1.50	2026-09-13 04:52:34.589867
2310	\N	SOLICITUD_RECUPERACION_PASSWORD	usuario_token	361	Solicitud de recuperación de contraseña para el correo: qa_recovery_user@fashionstore.com.	172.20.0.1	2026-09-13 04:52:34.830465
2312	1	INSERT	usuario	543	Alta de usuario 'Carlos Recuperador' (qa_recovery_user@fashionstore.com) con rol id=4.	192.168.1.50	2026-09-13 04:52:35.229842
5487	1	LOGIN_EXITOSO	usuario	1	Inicio de sesión exitoso de 'Alejandro Sistemas' (admin@fashionstore.com) con rol 'Administrador'.	172.20.0.1	2026-09-13 19:10:37.099763
2314	1	INSERT	usuario	544	Alta de usuario 'Carlos Recuperador' (qa_recovery_user@fashionstore.com) con rol id=4.	192.168.1.50	2026-09-13 04:52:35.677401
2315	1	INSERT	usuario	545	Alta de usuario 'Carlos Recuperador' (qa_recovery_user@fashionstore.com) con rol id=4.	192.168.1.50	2026-09-13 04:52:36.029574
2318	1	INSERT	usuario	546	Alta de usuario 'Carlos Recuperador' (qa_recovery_user@fashionstore.com) con rol id=4.	192.168.1.50	2026-09-13 04:52:36.74146
2320	1	INSERT	usuario	548	Alta de usuario 'Carlos Recuperador' (qa_recovery_user@fashionstore.com) con rol id=4.	192.168.1.50	2026-09-13 04:52:37.729117
4790	1	LOGIN_EXITOSO	usuario	1	Inicio de sesión exitoso de 'Alejandro Sistemas' (admin@fashionstore.com) con rol 'Administrador'.	172.20.0.1	2026-09-13 19:06:01.076171
2322	1	INSERT	usuario	549	Alta de usuario 'Carlos Recuperador' (qa_recovery_user@fashionstore.com) con rol id=4.	192.168.1.50	2026-09-13 04:52:38.273341
4793	1	LOGIN_EXITOSO	usuario	1	Inicio de sesión exitoso de 'Alejandro Sistemas' (admin@fashionstore.com) con rol 'Administrador'.	172.20.0.1	2026-09-13 19:06:02.940258
2327	1	INSERT	usuario	550	Alta de usuario 'Carlos Recuperador' (qa_recovery_user@fashionstore.com) con rol id=4.	192.168.1.50	2026-09-13 04:52:39.529531
2331	1	INSERT	cliente	29	Alta del cliente 'Lucía Morales Paz' (CI 88997711).	192.168.40.1	2026-09-13 04:52:40.781708
2332	1	UPDATE	cliente	29	Modificación del cliente CI 88997711. Campos: nombre_completo=Lucía Morales de Mendoza, telefono=78999999.	192.168.40.2	2026-09-13 04:52:41.209247
2333	1	INACTIVAR	cliente	29	Baja lógica del cliente 'Lucía Morales de Mendoza' (CI 88997711).	192.168.40.3	2026-09-13 04:52:41.262114
6631	1	INSERT	venta	2	Venta presencial POS #2 registrada en sucursal 'Sucursal Equipetrol'. Método de pago: Efectivo. Total: Bs 369.90. Recibido: Bs 400.00, Cambio: Bs 30.10. Comprobante: FS-2026-000001.	127.0.0.1	2026-09-20 04:32:55.285105
2722	1	INSERT	usuario	643	Alta de usuario 'Carlos Recuperador' (qa_recovery_user@fashionstore.com) con rol id=4.	192.168.1.50	2026-09-13 09:46:28.900997
6736	\N	UPDATE	prenda	183	Se modificó la prenda. SKU anterior: JEA-SLIM-001 -> SKU nuevo: JEA-SLIM-001	\N	2026-09-20 10:19:53.521878
2724	1	INSERT	usuario	644	Alta de usuario 'Carlos Recuperador' (qa_recovery_user@fashionstore.com) con rol id=4.	192.168.1.50	2026-09-13 09:46:29.361539
6737	\N	UPDATE	prenda	184	Se modificó la prenda. SKU anterior: JEA-WIDE-002 -> SKU nuevo: JEA-WIDE-002	\N	2026-09-20 10:19:53.521878
5098	\N	LOGIN_FALLIDO	usuario	\N	Intento de inicio de sesión fallido para el correo: no_existe_seguro@fashionstore.com (correo no registrado).	192.168.99.99	2026-09-13 19:07:26.880533
4798	\N	LOGIN_FALLIDO	usuario	\N	Intento de inicio de sesión fallido para el correo: no_existe_seguro@fashionstore.com (correo no registrado).	192.168.99.99	2026-09-13 19:06:03.749162
5103	1	UPDATE	rol_permiso	3	Se actualizaron los permisos del rol 'Cajero (POS)' (ID: 3). Total asignados: 3.	198.51.100.22	2026-09-13 19:07:27.176527
2729	1	INSERT	usuario	645	Alta de usuario 'Carlos Recuperador' (qa_recovery_user@fashionstore.com) con rol id=4.	192.168.1.50	2026-09-13 09:46:30.60061
5104	1	INSERT	usuario	1049	Alta de usuario 'Audit CU04' (qa_bitacora_cu04@fashionstore.com) con rol id=4.	192.168.1.50	2026-09-13 19:07:27.287768
2731	1	INSERT	usuario	646	Alta de usuario 'Carlos Recuperador' (qa_recovery_user@fashionstore.com) con rol id=4.	192.168.1.50	2026-09-13 09:46:31.060807
2732	1	INSERT	usuario	647	Alta de usuario 'Carlos Recuperador' (qa_recovery_user@fashionstore.com) con rol id=4.	192.168.1.50	2026-09-13 09:46:31.428683
6738	\N	UPDATE	prenda	185	Se modificó la prenda. SKU anterior: PAN-CHI-001 -> SKU nuevo: PAN-CHI-001	\N	2026-09-20 10:19:53.521878
6178	1	LOGIN_EXITOSO	usuario	1	Inicio de sesión exitoso de 'Alejandro Sistemas' (admin@fashionstore.com) con rol 'Administrador'.	172.20.0.1	2026-09-13 20:49:31.97459
2735	1	INSERT	usuario	648	Alta de usuario 'Carlos Recuperador' (qa_recovery_user@fashionstore.com) con rol id=4.	192.168.1.50	2026-09-13 09:46:32.144654
6739	\N	UPDATE	prenda	186	Se modificó la prenda. SKU anterior: POL-BAS-001 -> SKU nuevo: POL-BAS-001	\N	2026-09-20 10:19:53.521878
2737	1	INSERT	usuario	650	Alta de usuario 'Carlos Recuperador' (qa_recovery_user@fashionstore.com) con rol id=4.	192.168.1.50	2026-09-13 09:46:33.137131
6740	\N	UPDATE	prenda	187	Se modificó la prenda. SKU anterior: POL-GRA-002 -> SKU nuevo: POL-GRA-002	\N	2026-09-20 10:19:53.521878
2739	1	INSERT	usuario	651	Alta de usuario 'Carlos Recuperador' (qa_recovery_user@fashionstore.com) con rol id=4.	192.168.1.50	2026-09-13 09:46:33.688728
5478	\N	LOGIN_FALLIDO	usuario	\N	Intento de inicio de sesión fallido para el correo: no_existe_seguro@fashionstore.com (correo no registrado).	192.168.99.99	2026-09-13 19:10:33.917206
6741	\N	UPDATE	prenda	188	Se modificó la prenda. SKU anterior: CALZ-RUN-002 -> SKU nuevo: CALZ-RUN-002	\N	2026-09-20 10:19:53.521878
8312	\N	LOGIN_FALLIDO	usuario	\N	Intento de inicio de sesión fallido para el correo: no_existe_qa_999@fashionstore.com (correo no registrado).	192.168.10.103	2026-09-20 19:34:51.522712
8313	1	LOGIN_EXITOSO	usuario	1	Inicio de sesión exitoso de 'Alejandro Sistemas' (admin@fashionstore.com) con rol 'Administrador'.	172.20.0.1	2026-09-20 19:34:51.785135
2744	1	INSERT	usuario	652	Alta de usuario 'Carlos Recuperador' (qa_recovery_user@fashionstore.com) con rol id=4.	192.168.1.50	2026-09-13 09:46:34.928561
6798	\N	UPDATE	prenda	178	Se modificó la prenda. SKU anterior: VES-GALA-001 -> SKU nuevo: VES-GALA-001	\N	2026-09-20 10:25:02.183521
6799	\N	UPDATE	prenda	179	Se modificó la prenda. SKU anterior: VES-MIDI-002 -> SKU nuevo: VES-MIDI-002	\N	2026-09-20 10:25:02.183521
2748	1	INSERT	cliente	34	Alta del cliente 'Lucía Morales Paz' (CI 88997711).	192.168.40.1	2026-09-13 09:46:36.192703
2749	1	UPDATE	cliente	34	Modificación del cliente CI 88997711. Campos: nombre_completo=Lucía Morales de Mendoza, telefono=78999999.	192.168.40.2	2026-09-13 09:46:36.624862
2750	1	INACTIVAR	cliente	34	Baja lógica del cliente 'Lucía Morales de Mendoza' (CI 88997711).	192.168.40.3	2026-09-13 09:46:36.677562
6800	\N	UPDATE	prenda	180	Se modificó la prenda. SKU anterior: SWT-HOD-001 -> SKU nuevo: SWT-HOD-001	\N	2026-09-20 10:25:02.183521
6801	\N	UPDATE	prenda	181	Se modificó la prenda. SKU anterior: SWT-TOR-002 -> SKU nuevo: SWT-TOR-002	\N	2026-09-20 10:25:02.183521
6802	\N	UPDATE	prenda	182	Se modificó la prenda. SKU anterior: ABR-CAM-001 -> SKU nuevo: ABR-CAM-001	\N	2026-09-20 10:25:02.183521
6803	\N	UPDATE	prenda	183	Se modificó la prenda. SKU anterior: JEA-SLIM-001 -> SKU nuevo: JEA-SLIM-001	\N	2026-09-20 10:25:02.183521
2768	\N	LOGIN_FALLIDO	usuario	\N	Intento de inicio de sesión fallido para el correo: no_existe_seguro@fashionstore.com (correo no registrado).	192.168.99.99	2026-09-13 09:46:40.065009
2769	1	UPDATE	rol_permiso	3	Se actualizaron los permisos del rol 'Cajero (POS)' (ID: 3). Total asignados: 3.	198.51.100.22	2026-09-13 09:46:40.335103
2770	1	INSERT	usuario	653	Alta de usuario 'Audit CU04' (qa_bitacora_cu04@fashionstore.com) con rol id=4.	192.168.1.50	2026-09-13 09:46:40.453456
2826	1	INSERT	cliente	35	Alta del cliente 'Lucía Morales Paz' (CI 88997711).	192.168.40.1	2026-09-13 09:49:41.038601
2827	1	UPDATE	cliente	35	Modificación del cliente CI 88997711. Campos: nombre_completo=Lucía Morales de Mendoza, telefono=78999999.	192.168.40.2	2026-09-13 09:49:41.450497
2828	1	INACTIVAR	cliente	35	Baja lógica del cliente 'Lucía Morales de Mendoza' (CI 88997711).	192.168.40.3	2026-09-13 09:49:41.503175
2846	\N	LOGIN_FALLIDO	usuario	\N	Intento de inicio de sesión fallido para el correo: no_existe_seguro@fashionstore.com (correo no registrado).	192.168.99.99	2026-09-13 09:49:44.856675
2847	1	UPDATE	rol_permiso	3	Se actualizaron los permisos del rol 'Cajero (POS)' (ID: 3). Total asignados: 3.	198.51.100.22	2026-09-13 09:49:45.127058
2848	1	INSERT	usuario	671	Alta de usuario 'Audit CU04' (qa_bitacora_cu04@fashionstore.com) con rol id=4.	192.168.1.50	2026-09-13 09:49:45.236503
2852	1	LOGIN_EXITOSO	usuario	1	Inicio de sesión exitoso de 'Alejandro Sistemas' (admin@fashionstore.com) con rol 'Administrador'.	192.168.10.101	2026-09-13 09:51:21.342292
2853	1	LOGIN_EXITOSO	usuario	1	Inicio de sesión exitoso de 'Alejandro Sistemas' (admin@fashionstore.com) con rol 'Administrador'.	172.20.0.1	2026-09-13 09:51:21.57958
2854	1	LOGIN_FALLIDO	usuario	1	Intento de inicio de sesión fallido para el correo: admin@fashionstore.com (contraseña incorrecta).	192.168.10.102	2026-09-13 09:51:21.843644
2855	\N	LOGIN_FALLIDO	usuario	\N	Intento de inicio de sesión fallido para el correo: no_existe_qa_999@fashionstore.com (correo no registrado).	192.168.10.103	2026-09-13 09:51:22.11403
2856	1	LOGIN_EXITOSO	usuario	1	Inicio de sesión exitoso de 'Alejandro Sistemas' (admin@fashionstore.com) con rol 'Administrador'.	172.20.0.1	2026-09-13 09:51:22.380483
2861	1	UPDATE	usuario	674	Modificación del usuario 'qa_nuevo_cajero@fashionstore.com'. Campos actualizados: nombre=Carlos Alberto, telefono=71122334.	192.168.20.2	2026-09-13 09:51:24.576752
4400	1	INACTIVAR	usuario	1003	Baja lógica del usuario 'qa_nuevo_cajero@fashionstore.com': estado cambiado de 'Activo' a 'Inactivo'.	192.168.20.3	2026-09-13 10:26:41.046075
4401	1	UPDATE	rol_permiso	3	Se actualizaron los permisos del rol 'Cajero (POS)' (ID: 3). Total asignados: 2.	192.168.1.50	2026-09-13 10:26:41.450147
4402	1	UPDATE	rol_permiso	3	Se actualizaron los permisos del rol 'Cajero (POS)' (ID: 3). Total asignados: 4.	192.168.1.50	2026-09-13 10:26:41.790289
2351	\N	LOGIN_FALLIDO	usuario	\N	Intento de inicio de sesión fallido para el correo: no_existe_seguro@fashionstore.com (correo no registrado).	192.168.99.99	2026-09-13 04:52:44.687773
2352	1	UPDATE	rol_permiso	3	Se actualizaron los permisos del rol 'Cajero (POS)' (ID: 3). Total asignados: 3.	198.51.100.22	2026-09-13 04:52:44.968814
2353	1	INSERT	usuario	551	Alta de usuario 'Audit CU04' (qa_bitacora_cu04@fashionstore.com) con rol id=4.	192.168.1.50	2026-09-13 04:52:45.079739
4403	1	UPDATE	rol_permiso	3	Se actualizaron los permisos del rol 'Cajero (POS)' (ID: 3). Total asignados: 0.	192.168.1.50	2026-09-13 10:26:41.902332
4404	1	INSERT	usuario	1004	Alta de usuario 'Cajero POS QA' (qa_cajero_rbac@fashionstore.com) con rol id=3.	192.168.1.50	2026-09-13 10:26:42.287146
2357	1	LOGIN_EXITOSO	usuario	1	Inicio de sesión exitoso de 'Alejandro Sistemas' (admin@fashionstore.com) con rol 'Administrador'.	192.168.10.101	2026-09-13 04:52:59.199613
2358	1	LOGIN_EXITOSO	usuario	1	Inicio de sesión exitoso de 'Alejandro Sistemas' (admin@fashionstore.com) con rol 'Administrador'.	172.20.0.1	2026-09-13 04:52:59.420978
2359	1	LOGIN_FALLIDO	usuario	1	Intento de inicio de sesión fallido para el correo: admin@fashionstore.com (contraseña incorrecta).	192.168.10.102	2026-09-13 04:52:59.67825
2360	\N	LOGIN_FALLIDO	usuario	\N	Intento de inicio de sesión fallido para el correo: no_existe_qa_999@fashionstore.com (correo no registrado).	192.168.10.103	2026-09-13 04:52:59.944187
2361	1	LOGIN_EXITOSO	usuario	1	Inicio de sesión exitoso de 'Alejandro Sistemas' (admin@fashionstore.com) con rol 'Administrador'.	172.20.0.1	2026-09-13 04:53:00.210981
2862	1	INACTIVAR	usuario	674	Baja lógica del usuario 'qa_nuevo_cajero@fashionstore.com': estado cambiado de 'Activo' a 'Inactivo'.	192.168.20.3	2026-09-13 09:51:24.860218
2863	1	UPDATE	rol_permiso	3	Se actualizaron los permisos del rol 'Cajero (POS)' (ID: 3). Total asignados: 2.	192.168.1.50	2026-09-13 09:51:25.260163
4406	1	UPDATE	rol_permiso	3	Se actualizaron los permisos del rol 'Cajero (POS)' (ID: 3). Total asignados: 5.	192.168.1.50	2026-09-13 10:26:42.906626
2366	1	UPDATE	usuario	554	Modificación del usuario 'qa_nuevo_cajero@fashionstore.com'. Campos actualizados: nombre=Carlos Alberto, telefono=71122334.	192.168.20.2	2026-09-13 04:53:02.383441
2367	1	INACTIVAR	usuario	554	Baja lógica del usuario 'qa_nuevo_cajero@fashionstore.com': estado cambiado de 'Activo' a 'Inactivo'.	192.168.20.3	2026-09-13 04:53:02.667728
2368	1	UPDATE	rol_permiso	3	Se actualizaron los permisos del rol 'Cajero (POS)' (ID: 3). Total asignados: 2.	192.168.1.50	2026-09-13 04:53:03.059761
2369	1	UPDATE	rol_permiso	3	Se actualizaron los permisos del rol 'Cajero (POS)' (ID: 3). Total asignados: 4.	192.168.1.50	2026-09-13 04:53:03.395594
2370	1	UPDATE	rol_permiso	3	Se actualizaron los permisos del rol 'Cajero (POS)' (ID: 3). Total asignados: 0.	192.168.1.50	2026-09-13 04:53:03.503561
4407	1	UPDATE	rol_permiso	3	Se actualizaron los permisos del rol 'Cajero (POS)' (ID: 3). Total asignados: 4.	192.168.1.50	2026-09-13 10:26:43.050016
2864	1	UPDATE	rol_permiso	3	Se actualizaron los permisos del rol 'Cajero (POS)' (ID: 3). Total asignados: 4.	192.168.1.50	2026-09-13 09:51:25.60043
2373	1	UPDATE	rol_permiso	3	Se actualizaron los permisos del rol 'Cajero (POS)' (ID: 3). Total asignados: 5.	192.168.1.50	2026-09-13 04:53:04.480125
2374	1	UPDATE	rol_permiso	3	Se actualizaron los permisos del rol 'Cajero (POS)' (ID: 3). Total asignados: 4.	192.168.1.50	2026-09-13 04:53:04.62374
4408	1	INSERT	usuario	1005	Alta de usuario 'Cajero POS QA' (qa_cajero_rbac@fashionstore.com) con rol id=3.	192.168.1.50	2026-09-13 10:26:43.218149
2377	1	UPDATE	rol_permiso	3	Se actualizaron los permisos del rol 'Cajero (POS)' (ID: 3). Total asignados: 5.	192.168.1.50	2026-09-13 04:53:05.479619
2378	1	INSERT	usuario	557	Alta de usuario 'Carlos Recuperador' (qa_recovery_user@fashionstore.com) con rol id=4.	192.168.1.50	2026-09-13 04:53:05.732847
4410	1	UPDATE	rol_permiso	3	Se actualizaron los permisos del rol 'Cajero (POS)' (ID: 3). Total asignados: 5.	192.168.1.50	2026-09-13 10:26:43.888807
2380	1	INSERT	usuario	558	Alta de usuario 'Carlos Recuperador' (qa_recovery_user@fashionstore.com) con rol id=4.	192.168.1.50	2026-09-13 04:53:06.188998
4411	1	INSERT	usuario	1006	Alta de usuario 'Carlos Recuperador' (qa_recovery_user@fashionstore.com) con rol id=4.	192.168.1.50	2026-09-13 10:26:44.141879
2383	1	INSERT	usuario	559	Alta de usuario 'Carlos Recuperador' (qa_recovery_user@fashionstore.com) con rol id=4.	192.168.1.50	2026-09-13 04:53:06.639686
4413	1	INSERT	usuario	1007	Alta de usuario 'Carlos Recuperador' (qa_recovery_user@fashionstore.com) con rol id=4.	192.168.1.50	2026-09-13 10:26:44.597198
2385	1	INSERT	usuario	560	Alta de usuario 'Carlos Recuperador' (qa_recovery_user@fashionstore.com) con rol id=4.	192.168.1.50	2026-09-13 04:53:07.099787
4416	1	INSERT	usuario	1008	Alta de usuario 'Carlos Recuperador' (qa_recovery_user@fashionstore.com) con rol id=4.	192.168.1.50	2026-09-13 10:26:45.057336
2390	1	INSERT	usuario	561	Alta de usuario 'Carlos Recuperador' (qa_recovery_user@fashionstore.com) con rol id=4.	192.168.1.50	2026-09-13 04:53:08.3717
4418	1	INSERT	usuario	1009	Alta de usuario 'Carlos Recuperador' (qa_recovery_user@fashionstore.com) con rol id=4.	192.168.1.50	2026-09-13 10:26:45.512998
2392	1	INSERT	usuario	562	Alta de usuario 'Carlos Recuperador' (qa_recovery_user@fashionstore.com) con rol id=4.	192.168.1.50	2026-09-13 04:53:08.831726
2393	1	INSERT	usuario	563	Alta de usuario 'Carlos Recuperador' (qa_recovery_user@fashionstore.com) con rol id=4.	192.168.1.50	2026-09-13 04:53:09.187692
2396	1	INSERT	usuario	564	Alta de usuario 'Carlos Recuperador' (qa_recovery_user@fashionstore.com) con rol id=4.	192.168.1.50	2026-09-13 04:53:09.891573
2398	1	INSERT	usuario	566	Alta de usuario 'Carlos Recuperador' (qa_recovery_user@fashionstore.com) con rol id=4.	192.168.1.50	2026-09-13 04:53:10.872149
2400	1	INSERT	usuario	567	Alta de usuario 'Carlos Recuperador' (qa_recovery_user@fashionstore.com) con rol id=4.	192.168.1.50	2026-09-13 04:53:11.423831
2405	1	INSERT	usuario	568	Alta de usuario 'Carlos Recuperador' (qa_recovery_user@fashionstore.com) con rol id=4.	192.168.1.50	2026-09-13 04:53:12.663525
2406	\N	SOLICITUD_RECUPERACION_PASSWORD	usuario_token	381	Solicitud de recuperación de contraseña para el correo: qa_recovery_user@fashionstore.com.	200.87.150.25	2026-09-13 04:53:12.92902
2407	1	INSERT	cliente	30	Alta del cliente 'Lucía Morales Paz' (CI 88997711).	192.168.40.1	2026-09-13 04:53:13.308137
2408	1	UPDATE	cliente	30	Modificación del cliente CI 88997711. Campos: nombre_completo=Lucía Morales de Mendoza, telefono=78999999.	192.168.40.2	2026-09-13 04:53:13.734173
2409	1	INACTIVAR	cliente	30	Baja lógica del cliente 'Lucía Morales de Mendoza' (CI 88997711).	192.168.40.3	2026-09-13 04:53:13.784549
2774	1	LOGIN_EXITOSO	usuario	1	Inicio de sesión exitoso de 'Alejandro Sistemas' (admin@fashionstore.com) con rol 'Administrador'.	192.168.10.101	2026-09-13 09:49:26.256648
6633	1	LOGIN_FALLIDO	usuario	1	Intento de inicio de sesión fallido para el correo: admin@fashionstore.com (contraseña incorrecta).	127.0.0.1	2026-09-20 05:23:52.368696
6634	1	LOGIN_EXITOSO	usuario	1	Inicio de sesión exitoso de 'Alejandro Sistemas' (admin@fashionstore.com) con rol 'Administrador'.	127.0.0.1	2026-09-20 05:25:01.028219
5481	1	INSERT	usuario	1066	Alta de usuario 'Audit CU04' (qa_bitacora_cu04@fashionstore.com) con rol id=4.	192.168.1.50	2026-09-13 19:10:34.304259
4423	1	INSERT	usuario	1010	Alta de usuario 'Carlos Recuperador' (qa_recovery_user@fashionstore.com) con rol id=4.	192.168.1.50	2026-09-13 10:26:46.74496
2427	\N	LOGIN_FALLIDO	usuario	\N	Intento de inicio de sesión fallido para el correo: no_existe_seguro@fashionstore.com (correo no registrado).	192.168.99.99	2026-09-13 04:53:17.178295
2428	1	UPDATE	rol_permiso	3	Se actualizaron los permisos del rol 'Cajero (POS)' (ID: 3). Total asignados: 3.	198.51.100.22	2026-09-13 04:53:17.44058
2429	1	INSERT	usuario	569	Alta de usuario 'Audit CU04' (qa_bitacora_cu04@fashionstore.com) con rol id=4.	192.168.1.50	2026-09-13 04:53:17.550432
4425	1	INSERT	usuario	1011	Alta de usuario 'Carlos Recuperador' (qa_recovery_user@fashionstore.com) con rol id=4.	192.168.1.50	2026-09-13 10:26:47.201541
4426	1	INSERT	usuario	1012	Alta de usuario 'Carlos Recuperador' (qa_recovery_user@fashionstore.com) con rol id=4.	192.168.1.50	2026-09-13 10:26:47.565085
2433	1	LOGIN_EXITOSO	usuario	1	Inicio de sesión exitoso de 'Alejandro Sistemas' (admin@fashionstore.com) con rol 'Administrador'.	172.20.0.1	2026-09-13 04:53:47.684506
2434	1	INSERT	usuario	570	Alta de usuario 'Carlos Recuperador' (qa_recovery_user@fashionstore.com) con rol id=4.	192.168.1.50	2026-09-13 04:53:47.914652
4799	1	UPDATE	rol_permiso	3	Se actualizaron los permisos del rol 'Cajero (POS)' (ID: 3). Total asignados: 3.	198.51.100.22	2026-09-13 19:06:04.012036
2436	1	INSERT	usuario	571	Alta de usuario 'Carlos Recuperador' (qa_recovery_user@fashionstore.com) con rol id=4.	192.168.1.50	2026-09-13 04:53:48.376954
4800	1	INSERT	usuario	1042	Alta de usuario 'Audit CU04' (qa_bitacora_cu04@fashionstore.com) con rol id=4.	192.168.1.50	2026-09-13 19:06:04.125164
2439	1	INSERT	usuario	572	Alta de usuario 'Carlos Recuperador' (qa_recovery_user@fashionstore.com) con rol id=4.	192.168.1.50	2026-09-13 04:53:48.832981
2441	1	INSERT	usuario	573	Alta de usuario 'Carlos Recuperador' (qa_recovery_user@fashionstore.com) con rol id=4.	192.168.1.50	2026-09-13 04:53:49.292978
2446	1	INSERT	usuario	574	Alta de usuario 'Carlos Recuperador' (qa_recovery_user@fashionstore.com) con rol id=4.	192.168.1.50	2026-09-13 04:53:50.521174
2448	1	INSERT	usuario	575	Alta de usuario 'Carlos Recuperador' (qa_recovery_user@fashionstore.com) con rol id=4.	192.168.1.50	2026-09-13 04:53:50.973178
2449	1	INSERT	usuario	576	Alta de usuario 'Carlos Recuperador' (qa_recovery_user@fashionstore.com) con rol id=4.	192.168.1.50	2026-09-13 04:53:51.333187
2452	1	INSERT	usuario	577	Alta de usuario 'Carlos Recuperador' (qa_recovery_user@fashionstore.com) con rol id=4.	192.168.1.50	2026-09-13 04:53:52.044995
2454	1	INSERT	usuario	579	Alta de usuario 'Carlos Recuperador' (qa_recovery_user@fashionstore.com) con rol id=4.	192.168.1.50	2026-09-13 04:53:53.025265
2456	1	INSERT	usuario	580	Alta de usuario 'Carlos Recuperador' (qa_recovery_user@fashionstore.com) con rol id=4.	192.168.1.50	2026-09-13 04:53:53.573864
2461	1	INSERT	usuario	581	Alta de usuario 'Carlos Recuperador' (qa_recovery_user@fashionstore.com) con rol id=4.	192.168.1.50	2026-09-13 04:53:54.837744
2465	1	LOGIN_EXITOSO	usuario	1	Inicio de sesión exitoso de 'Alejandro Sistemas' (admin@fashionstore.com) con rol 'Administrador'.	192.168.10.101	2026-09-13 04:54:02.535725
2466	1	LOGIN_EXITOSO	usuario	1	Inicio de sesión exitoso de 'Alejandro Sistemas' (admin@fashionstore.com) con rol 'Administrador'.	172.20.0.1	2026-09-13 04:54:02.764554
2467	1	LOGIN_FALLIDO	usuario	1	Intento de inicio de sesión fallido para el correo: admin@fashionstore.com (contraseña incorrecta).	192.168.10.102	2026-09-13 04:54:03.025174
2468	\N	LOGIN_FALLIDO	usuario	\N	Intento de inicio de sesión fallido para el correo: no_existe_qa_999@fashionstore.com (correo no registrado).	192.168.10.103	2026-09-13 04:54:03.291554
2469	1	LOGIN_EXITOSO	usuario	1	Inicio de sesión exitoso de 'Alejandro Sistemas' (admin@fashionstore.com) con rol 'Administrador'.	172.20.0.1	2026-09-13 04:54:03.565555
2474	1	UPDATE	usuario	584	Modificación del usuario 'qa_nuevo_cajero@fashionstore.com'. Campos actualizados: nombre=Carlos Alberto, telefono=71122334.	192.168.20.2	2026-09-13 04:54:05.729652
2475	1	INACTIVAR	usuario	584	Baja lógica del usuario 'qa_nuevo_cajero@fashionstore.com': estado cambiado de 'Activo' a 'Inactivo'.	192.168.20.3	2026-09-13 04:54:06.009826
2476	1	UPDATE	rol_permiso	3	Se actualizaron los permisos del rol 'Cajero (POS)' (ID: 3). Total asignados: 2.	192.168.1.50	2026-09-13 04:54:06.413387
2477	1	UPDATE	rol_permiso	3	Se actualizaron los permisos del rol 'Cajero (POS)' (ID: 3). Total asignados: 4.	192.168.1.50	2026-09-13 04:54:06.753534
2478	1	UPDATE	rol_permiso	3	Se actualizaron los permisos del rol 'Cajero (POS)' (ID: 3). Total asignados: 0.	192.168.1.50	2026-09-13 04:54:06.865422
2481	1	UPDATE	rol_permiso	3	Se actualizaron los permisos del rol 'Cajero (POS)' (ID: 3). Total asignados: 5.	192.168.1.50	2026-09-13 04:54:07.88146
2482	1	UPDATE	rol_permiso	3	Se actualizaron los permisos del rol 'Cajero (POS)' (ID: 3). Total asignados: 4.	192.168.1.50	2026-09-13 04:54:08.025208
2485	1	UPDATE	rol_permiso	3	Se actualizaron los permisos del rol 'Cajero (POS)' (ID: 3). Total asignados: 5.	192.168.1.50	2026-09-13 04:54:08.857095
2486	1	INSERT	usuario	587	Alta de usuario 'Carlos Recuperador' (qa_recovery_user@fashionstore.com) con rol id=4.	192.168.1.50	2026-09-13 04:54:09.113196
2488	1	INSERT	usuario	588	Alta de usuario 'Carlos Recuperador' (qa_recovery_user@fashionstore.com) con rol id=4.	192.168.1.50	2026-09-13 04:54:09.569177
2491	1	INSERT	usuario	589	Alta de usuario 'Carlos Recuperador' (qa_recovery_user@fashionstore.com) con rol id=4.	192.168.1.50	2026-09-13 04:54:10.020954
2493	1	INSERT	usuario	590	Alta de usuario 'Carlos Recuperador' (qa_recovery_user@fashionstore.com) con rol id=4.	192.168.1.50	2026-09-13 04:54:10.473381
2498	1	INSERT	usuario	591	Alta de usuario 'Carlos Recuperador' (qa_recovery_user@fashionstore.com) con rol id=4.	192.168.1.50	2026-09-13 04:54:11.700977
2500	1	INSERT	usuario	592	Alta de usuario 'Carlos Recuperador' (qa_recovery_user@fashionstore.com) con rol id=4.	192.168.1.50	2026-09-13 04:54:12.161225
2501	1	INSERT	usuario	593	Alta de usuario 'Carlos Recuperador' (qa_recovery_user@fashionstore.com) con rol id=4.	192.168.1.50	2026-09-13 04:54:12.525175
2504	1	INSERT	usuario	594	Alta de usuario 'Carlos Recuperador' (qa_recovery_user@fashionstore.com) con rol id=4.	192.168.1.50	2026-09-13 04:54:13.229078
2506	1	INSERT	usuario	596	Alta de usuario 'Carlos Recuperador' (qa_recovery_user@fashionstore.com) con rol id=4.	192.168.1.50	2026-09-13 04:54:14.203818
2508	1	INSERT	usuario	597	Alta de usuario 'Carlos Recuperador' (qa_recovery_user@fashionstore.com) con rol id=4.	192.168.1.50	2026-09-13 04:54:14.764093
2775	1	LOGIN_EXITOSO	usuario	1	Inicio de sesión exitoso de 'Alejandro Sistemas' (admin@fashionstore.com) con rol 'Administrador'.	172.20.0.1	2026-09-13 09:49:26.4901
2776	1	LOGIN_FALLIDO	usuario	1	Intento de inicio de sesión fallido para el correo: admin@fashionstore.com (contraseña incorrecta).	192.168.10.102	2026-09-13 09:49:26.757854
2777	\N	LOGIN_FALLIDO	usuario	\N	Intento de inicio de sesión fallido para el correo: no_existe_qa_999@fashionstore.com (correo no registrado).	192.168.10.103	2026-09-13 09:49:27.042859
2513	1	INSERT	usuario	598	Alta de usuario 'Carlos Recuperador' (qa_recovery_user@fashionstore.com) con rol id=4.	192.168.1.50	2026-09-13 04:54:16.064778
2514	\N	SOLICITUD_RECUPERACION_PASSWORD	usuario_token	406	Solicitud de recuperación de contraseña para el correo: qa_recovery_user@fashionstore.com.	200.87.150.25	2026-09-13 04:54:16.325237
2516	1	INSERT	cliente	31	Alta del cliente 'Lucía Morales Paz' (CI 88997711).	192.168.40.1	2026-09-13 04:54:16.997853
2517	1	LOGIN_EXITOSO	usuario	1	Inicio de sesión exitoso de 'Alejandro Sistemas' (admin@fashionstore.com) con rol 'Administrador'.	192.168.10.101	2026-09-13 04:54:16.902245
2518	1	LOGIN_EXITOSO	usuario	1	Inicio de sesión exitoso de 'Alejandro Sistemas' (admin@fashionstore.com) con rol 'Administrador'.	172.20.0.1	2026-09-13 04:54:17.131881
2519	1	UPDATE	cliente	31	Modificación del cliente CI 88997711. Campos: nombre_completo=Lucía Morales de Mendoza, telefono=78999999.	192.168.40.2	2026-09-13 04:54:17.452481
2520	1	INACTIVAR	cliente	31	Baja lógica del cliente 'Lucía Morales de Mendoza' (CI 88997711).	192.168.40.3	2026-09-13 04:54:17.508692
2521	1	LOGIN_FALLIDO	usuario	1	Intento de inicio de sesión fallido para el correo: admin@fashionstore.com (contraseña incorrecta).	192.168.10.102	2026-09-13 04:54:17.395678
4429	1	INSERT	usuario	1013	Alta de usuario 'Carlos Recuperador' (qa_recovery_user@fashionstore.com) con rol id=4.	192.168.1.50	2026-09-13 10:26:48.285021
2523	\N	LOGIN_FALLIDO	usuario	\N	Intento de inicio de sesión fallido para el correo: no_existe_qa_999@fashionstore.com (correo no registrado).	192.168.10.103	2026-09-13 04:54:17.662082
2524	1	LOGIN_EXITOSO	usuario	1	Inicio de sesión exitoso de 'Alejandro Sistemas' (admin@fashionstore.com) con rol 'Administrador'.	172.20.0.1	2026-09-13 04:54:17.939878
4430	1	INSERT	usuario	1014	Alta de usuario 'Inactivo QA' (qa_user_inactivo_recovery@fashionstore.com) con rol id=4.	192.168.1.50	2026-09-13 10:26:48.932985
4431	1	INSERT	usuario	1015	Alta de usuario 'Carlos Recuperador' (qa_recovery_user@fashionstore.com) con rol id=4.	192.168.1.50	2026-09-13 10:26:49.300889
4433	1	INSERT	usuario	1016	Alta de usuario 'Carlos Recuperador' (qa_recovery_user@fashionstore.com) con rol id=4.	192.168.1.50	2026-09-13 10:26:49.853179
4438	1	INSERT	usuario	1017	Alta de usuario 'Carlos Recuperador' (qa_recovery_user@fashionstore.com) con rol id=4.	192.168.1.50	2026-09-13 10:26:51.08509
4442	1	INSERT	cliente	52	Alta del cliente 'Lucía Morales Paz' (CI 88997711).	192.168.40.1	2026-09-13 10:26:52.337582
4443	1	UPDATE	cliente	52	Modificación del cliente CI 88997711. Campos: nombre_completo=Lucía Morales de Mendoza, telefono=78999999.	192.168.40.2	2026-09-13 10:26:52.757139
2539	1	UPDATE	usuario	601	Modificación del usuario 'qa_nuevo_cajero@fashionstore.com'. Campos actualizados: nombre=Carlos Alberto, telefono=71122334.	192.168.20.2	2026-09-13 04:54:20.131704
4444	1	INACTIVAR	cliente	52	Baja lógica del cliente 'Lucía Morales de Mendoza' (CI 88997711).	192.168.40.3	2026-09-13 10:26:52.810899
4445	1	INSERT	ciudad	122	Alta de la ciudad 'Tarija QA'.	192.168.30.1	2026-09-13 10:26:53.05331
4446	1	INSERT	sucursal	112	Alta de la sucursal 'Sucursal Tarija Centro QA' en la ciudad id=122.	192.168.30.2	2026-09-13 10:26:53.433467
4447	1	UPDATE	sucursal	112	Modificación de la sucursal 'Sucursal Tarija Centro QA'. Campos: direccion=Calle Sucre #789 (Modificado), telefono=66449988.	192.168.30.3	2026-09-13 10:26:53.720886
4448	1	INSERT	categoria	104	Alta de la categoría 'Deportes QA'.	192.168.50.1	2026-09-13 10:26:54.009347
2545	1	INACTIVAR	usuario	601	Baja lógica del usuario 'qa_nuevo_cajero@fashionstore.com': estado cambiado de 'Activo' a 'Inactivo'.	192.168.20.3	2026-09-13 04:54:20.427248
2546	1	UPDATE	rol_permiso	3	Se actualizaron los permisos del rol 'Cajero (POS)' (ID: 3). Total asignados: 2.	192.168.1.50	2026-09-13 04:54:20.840187
4449	1	INSERT	categoria	105	Alta de la categoría 'Calzado Deportivo QA'.	192.168.1.50	2026-09-13 10:26:54.105147
2548	1	UPDATE	rol_permiso	3	Se actualizaron los permisos del rol 'Cajero (POS)' (ID: 3). Total asignados: 4.	192.168.1.50	2026-09-13 04:54:21.191653
2549	\N	LOGIN_FALLIDO	usuario	\N	Intento de inicio de sesión fallido para el correo: no_existe_seguro@fashionstore.com (correo no registrado).	192.168.99.99	2026-09-13 04:54:21.063644
2550	1	UPDATE	rol_permiso	3	Se actualizaron los permisos del rol 'Cajero (POS)' (ID: 3). Total asignados: 0.	192.168.1.50	2026-09-13 04:54:21.299559
2551	1	UPDATE	rol_permiso	3	Se actualizaron los permisos del rol 'Cajero (POS)' (ID: 3). Total asignados: 3.	198.51.100.22	2026-09-13 04:54:21.333833
2552	1	INSERT	usuario	602	Alta de usuario 'Audit CU04' (qa_bitacora_cu04@fashionstore.com) con rol id=4.	192.168.1.50	2026-09-13 04:54:21.436593
4450	1	UPDATE	categoria	104	Modificación de la categoría 'Deportes QA'. Campos: descripcion=Ropa de running y fitness.	192.168.50.2	2026-09-13 10:26:54.469255
4451	1	INACTIVAR	categoria	105	Baja lógica de la categoría 'Calzado Deportivo QA' (0 prenda(s) asociadas).	192.168.50.3	2026-09-13 10:26:54.575184
2560	1	UPDATE	rol_permiso	3	Se actualizaron los permisos del rol 'Cajero (POS)' (ID: 3). Total asignados: 1.	192.168.1.50	2026-09-13 04:54:22.988273
2561	1	INSERT	usuario	605	Alta de usuario 'Carlos Recuperador' (qa_recovery_user@fashionstore.com) con rol id=4.	192.168.1.50	2026-09-13 04:54:23.227677
2563	1	INSERT	usuario	606	Alta de usuario 'Carlos Recuperador' (qa_recovery_user@fashionstore.com) con rol id=4.	192.168.1.50	2026-09-13 04:54:23.680006
2566	1	INSERT	usuario	607	Alta de usuario 'Carlos Recuperador' (qa_recovery_user@fashionstore.com) con rol id=4.	192.168.1.50	2026-09-13 04:54:24.13999
2568	1	INSERT	usuario	608	Alta de usuario 'Carlos Recuperador' (qa_recovery_user@fashionstore.com) con rol id=4.	192.168.1.50	2026-09-13 04:54:24.595868
2573	1	INSERT	usuario	609	Alta de usuario 'Carlos Recuperador' (qa_recovery_user@fashionstore.com) con rol id=4.	192.168.1.50	2026-09-13 04:54:25.848871
2575	1	INSERT	usuario	610	Alta de usuario 'Carlos Recuperador' (qa_recovery_user@fashionstore.com) con rol id=4.	192.168.1.50	2026-09-13 04:54:26.307621
2576	1	INSERT	usuario	611	Alta de usuario 'Carlos Recuperador' (qa_recovery_user@fashionstore.com) con rol id=4.	192.168.1.50	2026-09-13 04:54:26.67208
2579	1	INSERT	usuario	612	Alta de usuario 'Carlos Recuperador' (qa_recovery_user@fashionstore.com) con rol id=4.	192.168.1.50	2026-09-13 04:54:27.403754
2581	1	INSERT	usuario	614	Alta de usuario 'Carlos Recuperador' (qa_recovery_user@fashionstore.com) con rol id=4.	192.168.1.50	2026-09-13 04:54:28.383729
2583	1	INSERT	usuario	615	Alta de usuario 'Carlos Recuperador' (qa_recovery_user@fashionstore.com) con rol id=4.	192.168.1.50	2026-09-13 04:54:28.940123
2778	1	LOGIN_EXITOSO	usuario	1	Inicio de sesión exitoso de 'Alejandro Sistemas' (admin@fashionstore.com) con rol 'Administrador'.	172.20.0.1	2026-09-13 09:49:27.307059
4452	1	INACTIVAR	categoria	104	Baja lógica de la categoría 'Deportes QA' (0 prenda(s) asociadas).	192.168.50.3	2026-09-13 10:26:54.626576
2588	1	INSERT	usuario	616	Alta de usuario 'Carlos Recuperador' (qa_recovery_user@fashionstore.com) con rol id=4.	192.168.1.50	2026-09-13 04:54:30.195657
6635	1	LOGIN_EXITOSO	usuario	1	Inicio de sesión exitoso de 'Alejandro Sistemas' (admin@fashionstore.com) con rol 'Administrador'.	127.0.0.1	2026-09-20 06:18:38.072593
5819	1	INSERT	ciudad	166	Alta de la ciudad 'Pando QA IP Test'.	200.87.100.45	2026-09-13 19:27:20.302946
5489	\N	LOGIN_FALLIDO	usuario	\N	Intento de inicio de sesión fallido para el correo: no_existe_seguro@fashionstore.com (correo no registrado).	192.168.99.99	2026-09-13 19:10:37.499502
2592	1	INSERT	cliente	32	Alta del cliente 'Lucía Morales Paz' (CI 88997711).	192.168.40.1	2026-09-13 04:54:31.459952
2593	1	UPDATE	cliente	32	Modificación del cliente CI 88997711. Campos: nombre_completo=Lucía Morales de Mendoza, telefono=78999999.	192.168.40.2	2026-09-13 04:54:31.887643
2594	1	INACTIVAR	cliente	32	Baja lógica del cliente 'Lucía Morales de Mendoza' (CI 88997711).	192.168.40.3	2026-09-13 04:54:31.936529
5490	1	UPDATE	rol_permiso	3	Se actualizaron los permisos del rol 'Cajero (POS)' (ID: 3). Total asignados: 3.	198.51.100.22	2026-09-13 19:10:37.757102
5491	1	INSERT	usuario	1068	Alta de usuario 'Audit CU04' (qa_bitacora_cu04@fashionstore.com) con rol id=4.	192.168.1.50	2026-09-13 19:10:37.867212
5820	\N	LOGIN_FALLIDO	usuario	\N	Intento de inicio de sesión fallido para el correo: no_existe_seguro@fashionstore.com (correo no registrado).	192.168.99.99	2026-09-13 19:27:20.494546
5821	1	UPDATE	rol_permiso	3	Se actualizaron los permisos del rol 'Cajero (POS)' (ID: 3). Total asignados: 3.	198.51.100.22	2026-09-13 19:27:20.752897
5822	1	INSERT	usuario	1096	Alta de usuario 'Audit CU04' (qa_bitacora_cu04@fashionstore.com) con rol id=4.	192.168.1.50	2026-09-13 19:27:20.863308
2783	1	UPDATE	usuario	656	Modificación del usuario 'qa_nuevo_cajero@fashionstore.com'. Campos actualizados: nombre=Carlos Alberto, telefono=71122334.	192.168.20.2	2026-09-13 09:49:29.506828
2784	1	INACTIVAR	usuario	656	Baja lógica del usuario 'qa_nuevo_cajero@fashionstore.com': estado cambiado de 'Activo' a 'Inactivo'.	192.168.20.3	2026-09-13 09:49:29.79409
2785	1	UPDATE	rol_permiso	3	Se actualizaron los permisos del rol 'Cajero (POS)' (ID: 3). Total asignados: 2.	192.168.1.50	2026-09-13 09:49:30.182784
2786	1	UPDATE	rol_permiso	3	Se actualizaron los permisos del rol 'Cajero (POS)' (ID: 3). Total asignados: 4.	192.168.1.50	2026-09-13 09:49:30.514775
2787	1	UPDATE	rol_permiso	3	Se actualizaron los permisos del rol 'Cajero (POS)' (ID: 3). Total asignados: 0.	192.168.1.50	2026-09-13 09:49:30.626484
2790	1	UPDATE	rol_permiso	3	Se actualizaron los permisos del rol 'Cajero (POS)' (ID: 3). Total asignados: 5.	192.168.1.50	2026-09-13 09:49:31.614561
2612	\N	LOGIN_FALLIDO	usuario	\N	Intento de inicio de sesión fallido para el correo: no_existe_seguro@fashionstore.com (correo no registrado).	192.168.99.99	2026-09-13 04:54:35.35582
2613	1	UPDATE	rol_permiso	3	Se actualizaron los permisos del rol 'Cajero (POS)' (ID: 3). Total asignados: 3.	198.51.100.22	2026-09-13 04:54:35.621301
2614	1	INSERT	usuario	617	Alta de usuario 'Audit CU04' (qa_bitacora_cu04@fashionstore.com) con rol id=4.	192.168.1.50	2026-09-13 04:54:35.717054
2791	1	UPDATE	rol_permiso	3	Se actualizaron los permisos del rol 'Cajero (POS)' (ID: 3). Total asignados: 4.	192.168.1.50	2026-09-13 09:49:31.758517
2794	1	UPDATE	rol_permiso	3	Se actualizaron los permisos del rol 'Cajero (POS)' (ID: 3). Total asignados: 5.	192.168.1.50	2026-09-13 09:49:32.586797
2795	1	INSERT	usuario	659	Alta de usuario 'Carlos Recuperador' (qa_recovery_user@fashionstore.com) con rol id=4.	192.168.1.50	2026-09-13 09:49:32.842911
2797	1	INSERT	usuario	660	Alta de usuario 'Carlos Recuperador' (qa_recovery_user@fashionstore.com) con rol id=4.	192.168.1.50	2026-09-13 09:49:33.294649
2800	1	INSERT	usuario	661	Alta de usuario 'Carlos Recuperador' (qa_recovery_user@fashionstore.com) con rol id=4.	192.168.1.50	2026-09-13 09:49:33.750648
2802	1	INSERT	usuario	662	Alta de usuario 'Carlos Recuperador' (qa_recovery_user@fashionstore.com) con rol id=4.	192.168.1.50	2026-09-13 09:49:34.210861
2807	1	INSERT	usuario	663	Alta de usuario 'Carlos Recuperador' (qa_recovery_user@fashionstore.com) con rol id=4.	192.168.1.50	2026-09-13 09:49:35.446611
2809	1	INSERT	usuario	664	Alta de usuario 'Carlos Recuperador' (qa_recovery_user@fashionstore.com) con rol id=4.	192.168.1.50	2026-09-13 09:49:35.90662
2810	1	INSERT	usuario	665	Alta de usuario 'Carlos Recuperador' (qa_recovery_user@fashionstore.com) con rol id=4.	192.168.1.50	2026-09-13 09:49:36.274593
4485	\N	LOGIN_FALLIDO	usuario	\N	Intento de inicio de sesión fallido para el correo: no_existe_seguro@fashionstore.com (correo no registrado).	192.168.99.99	2026-09-13 10:27:02.188939
2813	1	INSERT	usuario	666	Alta de usuario 'Carlos Recuperador' (qa_recovery_user@fashionstore.com) con rol id=4.	192.168.1.50	2026-09-13 09:49:37.014362
4486	1	UPDATE	rol_permiso	3	Se actualizaron los permisos del rol 'Cajero (POS)' (ID: 3). Total asignados: 3.	198.51.100.22	2026-09-13 10:27:02.452447
2815	1	INSERT	usuario	668	Alta de usuario 'Carlos Recuperador' (qa_recovery_user@fashionstore.com) con rol id=4.	192.168.1.50	2026-09-13 09:49:37.990708
4487	1	INSERT	usuario	1018	Alta de usuario 'Audit CU04' (qa_bitacora_cu04@fashionstore.com) con rol id=4.	192.168.1.50	2026-09-13 10:27:02.564813
2817	1	INSERT	usuario	669	Alta de usuario 'Carlos Recuperador' (qa_recovery_user@fashionstore.com) con rol id=4.	192.168.1.50	2026-09-13 09:49:38.538951
4491	1	LOGIN_EXITOSO	usuario	1	Inicio de sesión exitoso de 'Alejandro Sistemas' (admin@fashionstore.com) con rol 'Administrador'.	172.20.0.1	2026-09-13 10:38:22.774487
2865	1	UPDATE	rol_permiso	3	Se actualizaron los permisos del rol 'Cajero (POS)' (ID: 3). Total asignados: 0.	192.168.1.50	2026-09-13 09:51:25.712121
4492	1	LOGIN_EXITOSO	usuario	1	Inicio de sesión exitoso de 'Alejandro Sistemas' (admin@fashionstore.com) con rol 'Administrador'.	172.20.0.1	2026-09-13 10:41:00.370648
4493	1	INSERT	proveedor	120	Alta del proveedor 'Textiles Andinos S.R.L.' (NIT 1028475029).	172.20.0.1	2026-09-13 10:42:18.371516
2868	1	UPDATE	rol_permiso	3	Se actualizaron los permisos del rol 'Cajero (POS)' (ID: 3). Total asignados: 5.	192.168.1.50	2026-09-13 09:51:26.712184
2869	1	UPDATE	rol_permiso	3	Se actualizaron los permisos del rol 'Cajero (POS)' (ID: 3). Total asignados: 4.	192.168.1.50	2026-09-13 09:51:26.856444
4494	1	LOGIN_EXITOSO	usuario	1	Inicio de sesión exitoso de 'Alejandro Sistemas' (admin@fashionstore.com) con rol 'Administrador'.	172.20.0.1	2026-09-13 10:42:23.376022
2872	1	UPDATE	rol_permiso	3	Se actualizaron los permisos del rol 'Cajero (POS)' (ID: 3). Total asignados: 5.	192.168.1.50	2026-09-13 09:51:27.696174
2873	1	INSERT	usuario	677	Alta de usuario 'Carlos Recuperador' (qa_recovery_user@fashionstore.com) con rol id=4.	192.168.1.50	2026-09-13 09:51:27.948411
2875	1	INSERT	usuario	678	Alta de usuario 'Carlos Recuperador' (qa_recovery_user@fashionstore.com) con rol id=4.	192.168.1.50	2026-09-13 09:51:28.400417
6636	1	LOGIN_EXITOSO	usuario	1	Inicio de sesión exitoso de 'Alejandro Sistemas' (admin@fashionstore.com) con rol 'Administrador'.	192.168.1.30	2026-09-20 07:46:04.609223
2878	1	INSERT	usuario	679	Alta de usuario 'Carlos Recuperador' (qa_recovery_user@fashionstore.com) con rol id=4.	192.168.1.50	2026-09-13 09:51:28.856723
5825	1	LOGIN_EXITOSO	usuario	1	Inicio de sesión exitoso de 'Alejandro Sistemas' (admin@fashionstore.com) con rol 'Administrador'.	192.168.10.101	2026-09-13 19:32:33.713666
2880	1	INSERT	usuario	680	Alta de usuario 'Carlos Recuperador' (qa_recovery_user@fashionstore.com) con rol id=4.	192.168.1.50	2026-09-13 09:51:29.316703
5826	1	LOGIN_EXITOSO	usuario	1	Inicio de sesión exitoso de 'Alejandro Sistemas' (admin@fashionstore.com) con rol 'Administrador'.	172.20.0.1	2026-09-13 19:32:34.099106
5828	\N	LOGIN_FALLIDO	usuario	\N	Intento de inicio de sesión fallido para el correo: no_existe_qa_999@fashionstore.com (correo no registrado).	192.168.10.103	2026-09-13 19:32:34.590426
5829	1	LOGIN_EXITOSO	usuario	1	Inicio de sesión exitoso de 'Alejandro Sistemas' (admin@fashionstore.com) con rol 'Administrador'.	172.20.0.1	2026-09-13 19:32:34.862171
5517	1	LOGIN_EXITOSO	usuario	1	Inicio de sesión exitoso de 'Alejandro Sistemas' (admin@fashionstore.com) con rol 'Administrador'.	172.20.0.1	2026-09-13 19:11:00.098915
2885	1	INSERT	usuario	681	Alta de usuario 'Carlos Recuperador' (qa_recovery_user@fashionstore.com) con rol id=4.	192.168.1.50	2026-09-13 09:51:30.556346
2887	1	INSERT	usuario	682	Alta de usuario 'Carlos Recuperador' (qa_recovery_user@fashionstore.com) con rol id=4.	192.168.1.50	2026-09-13 09:51:31.016213
2888	1	INSERT	usuario	683	Alta de usuario 'Carlos Recuperador' (qa_recovery_user@fashionstore.com) con rol id=4.	192.168.1.50	2026-09-13 09:51:31.376545
5831	1	INSERT	usuario	1098	Alta de usuario 'Usuario Cliente QA' (qa_cliente_rbac@fashionstore.com) con rol id=4.	192.168.1.50	2026-09-13 19:32:35.830849
2891	1	INSERT	usuario	684	Alta de usuario 'Carlos Recuperador' (qa_recovery_user@fashionstore.com) con rol id=4.	192.168.1.50	2026-09-13 09:51:32.093072
5833	1	INSERT	usuario	1099	Alta de usuario 'Carlos Cajero QA' (qa_nuevo_cajero@fashionstore.com) con rol id=3.	192.168.20.1	2026-09-13 19:32:36.490736
2893	1	INSERT	usuario	686	Alta de usuario 'Carlos Recuperador' (qa_recovery_user@fashionstore.com) con rol id=4.	192.168.1.50	2026-09-13 09:51:33.08042
5834	1	UPDATE	usuario	1099	Modificación del usuario 'qa_nuevo_cajero@fashionstore.com'. Campos actualizados: nombre=Carlos Alberto, telefono=71122334.	192.168.20.2	2026-09-13 19:32:37.022955
2895	1	INSERT	usuario	687	Alta de usuario 'Carlos Recuperador' (qa_recovery_user@fashionstore.com) con rol id=4.	192.168.1.50	2026-09-13 09:51:33.62818
5835	1	INACTIVAR	usuario	1099	Baja lógica del usuario 'qa_nuevo_cajero@fashionstore.com': estado cambiado de 'Activo' a 'Inactivo'.	192.168.20.3	2026-09-13 19:32:37.312542
5836	1	UPDATE	rol_permiso	3	Se actualizaron los permisos del rol 'Cajero (POS)' (ID: 3). Total asignados: 2.	192.168.1.50	2026-09-13 19:32:37.714976
5837	1	UPDATE	rol_permiso	3	Se actualizaron los permisos del rol 'Cajero (POS)' (ID: 3). Total asignados: 4.	192.168.1.50	2026-09-13 19:32:38.054967
5838	1	UPDATE	rol_permiso	3	Se actualizaron los permisos del rol 'Cajero (POS)' (ID: 3). Total asignados: 0.	192.168.1.50	2026-09-13 19:32:38.226681
2900	1	INSERT	usuario	688	Alta de usuario 'Carlos Recuperador' (qa_recovery_user@fashionstore.com) con rol id=4.	192.168.1.50	2026-09-13 09:51:34.864585
5530	1	LOGIN_EXITOSO	usuario	1	Inicio de sesión exitoso de 'Alejandro Sistemas' (admin@fashionstore.com) con rol 'Administrador'.	172.20.0.1	2026-09-13 19:11:02.446146
2904	1	INSERT	cliente	36	Alta del cliente 'Lucía Morales Paz' (CI 88997711).	192.168.40.1	2026-09-13 09:51:36.128906
2905	1	UPDATE	cliente	36	Modificación del cliente CI 88997711. Campos: nombre_completo=Lucía Morales de Mendoza, telefono=78999999.	192.168.40.2	2026-09-13 09:51:36.545058
2906	1	INACTIVAR	cliente	36	Baja lógica del cliente 'Lucía Morales de Mendoza' (CI 88997711).	192.168.40.3	2026-09-13 09:51:36.601411
2924	\N	LOGIN_FALLIDO	usuario	\N	Intento de inicio de sesión fallido para el correo: no_existe_seguro@fashionstore.com (correo no registrado).	192.168.99.99	2026-09-13 09:51:39.932223
2925	1	UPDATE	rol_permiso	3	Se actualizaron los permisos del rol 'Cajero (POS)' (ID: 3). Total asignados: 3.	198.51.100.22	2026-09-13 09:51:40.210098
2926	1	INSERT	usuario	689	Alta de usuario 'Audit CU04' (qa_bitacora_cu04@fashionstore.com) con rol id=4.	192.168.1.50	2026-09-13 09:51:40.320159
2930	1	LOGIN_EXITOSO	usuario	1	Inicio de sesión exitoso de 'Alejandro Sistemas' (admin@fashionstore.com) con rol 'Administrador'.	192.168.10.101	2026-09-13 09:53:24.681596
2931	1	LOGIN_EXITOSO	usuario	1	Inicio de sesión exitoso de 'Alejandro Sistemas' (admin@fashionstore.com) con rol 'Administrador'.	172.20.0.1	2026-09-13 09:53:24.925773
2932	1	LOGIN_FALLIDO	usuario	1	Intento de inicio de sesión fallido para el correo: admin@fashionstore.com (contraseña incorrecta).	192.168.10.102	2026-09-13 09:53:25.193125
2933	\N	LOGIN_FALLIDO	usuario	\N	Intento de inicio de sesión fallido para el correo: no_existe_qa_999@fashionstore.com (correo no registrado).	192.168.10.103	2026-09-13 09:53:25.458281
2934	1	LOGIN_EXITOSO	usuario	1	Inicio de sesión exitoso de 'Alejandro Sistemas' (admin@fashionstore.com) con rol 'Administrador'.	172.20.0.1	2026-09-13 09:53:25.730344
2939	1	UPDATE	usuario	692	Modificación del usuario 'qa_nuevo_cajero@fashionstore.com'. Campos actualizados: nombre=Carlos Alberto, telefono=71122334.	192.168.20.2	2026-09-13 09:53:27.958178
2940	1	INACTIVAR	usuario	692	Baja lógica del usuario 'qa_nuevo_cajero@fashionstore.com': estado cambiado de 'Activo' a 'Inactivo'.	192.168.20.3	2026-09-13 09:53:28.241962
2941	1	UPDATE	rol_permiso	3	Se actualizaron los permisos del rol 'Cajero (POS)' (ID: 3). Total asignados: 2.	192.168.1.50	2026-09-13 09:53:28.64205
2942	1	UPDATE	rol_permiso	3	Se actualizaron los permisos del rol 'Cajero (POS)' (ID: 3). Total asignados: 4.	192.168.1.50	2026-09-13 09:53:28.978297
2943	1	UPDATE	rol_permiso	3	Se actualizaron los permisos del rol 'Cajero (POS)' (ID: 3). Total asignados: 0.	192.168.1.50	2026-09-13 09:53:29.08997
2946	1	UPDATE	rol_permiso	3	Se actualizaron los permisos del rol 'Cajero (POS)' (ID: 3). Total asignados: 5.	192.168.1.50	2026-09-13 09:53:30.090232
2947	1	UPDATE	rol_permiso	3	Se actualizaron los permisos del rol 'Cajero (POS)' (ID: 3). Total asignados: 4.	192.168.1.50	2026-09-13 09:53:30.234638
2950	1	UPDATE	rol_permiso	3	Se actualizaron los permisos del rol 'Cajero (POS)' (ID: 3). Total asignados: 5.	192.168.1.50	2026-09-13 09:53:31.066312
2951	1	INSERT	usuario	695	Alta de usuario 'Carlos Recuperador' (qa_recovery_user@fashionstore.com) con rol id=4.	192.168.1.50	2026-09-13 09:53:31.322151
2953	1	INSERT	usuario	696	Alta de usuario 'Carlos Recuperador' (qa_recovery_user@fashionstore.com) con rol id=4.	192.168.1.50	2026-09-13 09:53:31.782137
2956	1	INSERT	usuario	697	Alta de usuario 'Carlos Recuperador' (qa_recovery_user@fashionstore.com) con rol id=4.	192.168.1.50	2026-09-13 09:53:32.250066
2958	1	INSERT	usuario	698	Alta de usuario 'Carlos Recuperador' (qa_recovery_user@fashionstore.com) con rol id=4.	192.168.1.50	2026-09-13 09:53:32.71001
5827	1	LOGIN_FALLIDO	usuario	1	Intento de inicio de sesión fallido para el correo: admin@fashionstore.com (contraseña incorrecta).	192.168.10.102	2026-09-13 19:32:34.319675
5308	\N	LOGIN_FALLIDO	usuario	\N	Intento de inicio de sesión fallido para el correo: no_existe_seguro@fashionstore.com (correo no registrado).	192.168.99.99	2026-09-13 19:09:04.387857
5309	1	UPDATE	rol_permiso	3	Se actualizaron los permisos del rol 'Cajero (POS)' (ID: 3). Total asignados: 3.	198.51.100.22	2026-09-13 19:09:04.649486
2963	1	INSERT	usuario	699	Alta de usuario 'Carlos Recuperador' (qa_recovery_user@fashionstore.com) con rol id=4.	192.168.1.50	2026-09-13 09:53:33.96233
5310	1	INSERT	usuario	1056	Alta de usuario 'Audit CU04' (qa_bitacora_cu04@fashionstore.com) con rol id=4.	192.168.1.50	2026-09-13 19:09:04.760005
2965	1	INSERT	usuario	700	Alta de usuario 'Carlos Recuperador' (qa_recovery_user@fashionstore.com) con rol id=4.	192.168.1.50	2026-09-13 09:53:34.430953
2966	1	INSERT	usuario	701	Alta de usuario 'Carlos Recuperador' (qa_recovery_user@fashionstore.com) con rol id=4.	192.168.1.50	2026-09-13 09:53:34.798417
6637	1	IA_RECOMENDACION	inventario	3	Recomendación IA (Fallback Catálogo): 2 prendas sugeridas para estilo 'Casual' y ocasión 'Evento social'.	192.168.1.30	2026-09-20 07:46:32.557782
6638	\N	LOGIN_FALLIDO	usuario	\N	Intento de inicio de sesión fallido para el correo: mateo.surez@example.com (correo no registrado).	192.168.1.30	2026-09-20 07:47:20.949489
2969	1	INSERT	usuario	702	Alta de usuario 'Carlos Recuperador' (qa_recovery_user@fashionstore.com) con rol id=4.	192.168.1.50	2026-09-13 09:53:35.506154
5313	1	LOGIN_EXITOSO	usuario	1	Inicio de sesión exitoso de 'Alejandro Sistemas' (admin@fashionstore.com) con rol 'Administrador'.	172.20.0.1	2026-09-13 19:09:10.435663
2971	1	INSERT	usuario	704	Alta de usuario 'Carlos Recuperador' (qa_recovery_user@fashionstore.com) con rol id=4.	192.168.1.50	2026-09-13 09:53:36.502095
6639	\N	LOGIN_FALLIDO	usuario	\N	Intento de inicio de sesión fallido para el correo: mateo.surez@example.com (correo no registrado).	192.168.1.30	2026-09-20 07:47:39.062312
2973	1	INSERT	usuario	705	Alta de usuario 'Carlos Recuperador' (qa_recovery_user@fashionstore.com) con rol id=4.	192.168.1.50	2026-09-13 09:53:37.058663
6660	1	LOGIN_EXITOSO	usuario	1	Inicio de sesión exitoso de 'Alejandro Sistemas' (admin@fashionstore.com) con rol 'Administrador'.	192.168.1.30	2026-09-20 08:19:09.373374
6742	\N	UPDATE	prenda	3	Se modificó la prenda. SKU anterior: CHQ-CUERO-001 -> SKU nuevo: CHQ-CUERO-001	\N	2026-09-20 10:19:56.568589
2978	1	INSERT	usuario	706	Alta de usuario 'Carlos Recuperador' (qa_recovery_user@fashionstore.com) con rol id=4.	192.168.1.50	2026-09-13 09:53:38.325985
2982	1	INSERT	cliente	37	Alta del cliente 'Lucía Morales Paz' (CI 88997711).	192.168.40.1	2026-09-13 09:53:39.578283
2983	1	UPDATE	cliente	37	Modificación del cliente CI 88997711. Campos: nombre_completo=Lucía Morales de Mendoza, telefono=78999999.	192.168.40.2	2026-09-13 09:53:40.002114
2984	1	INACTIVAR	cliente	37	Baja lógica del cliente 'Lucía Morales de Mendoza' (CI 88997711).	192.168.40.3	2026-09-13 09:53:40.05561
5326	1	LOGIN_EXITOSO	usuario	1	Inicio de sesión exitoso de 'Alejandro Sistemas' (admin@fashionstore.com) con rol 'Administrador'.	172.20.0.1	2026-09-13 19:09:12.98811
5329	\N	LOGIN_FALLIDO	usuario	\N	Intento de inicio de sesión fallido para el correo: no_existe_seguro@fashionstore.com (correo no registrado).	192.168.99.99	2026-09-13 19:09:13.395158
4832	1	LOGIN_EXITOSO	usuario	1	Inicio de sesión exitoso de 'Alejandro Sistemas' (admin@fashionstore.com) con rol 'Administrador'.	172.20.0.1	2026-09-13 19:06:07.760459
3002	\N	LOGIN_FALLIDO	usuario	\N	Intento de inicio de sesión fallido para el correo: no_existe_seguro@fashionstore.com (correo no registrado).	192.168.99.99	2026-09-13 09:53:43.442044
3003	1	UPDATE	rol_permiso	3	Se actualizaron los permisos del rol 'Cajero (POS)' (ID: 3). Total asignados: 3.	198.51.100.22	2026-09-13 09:53:43.708091
3004	1	INSERT	usuario	707	Alta de usuario 'Audit CU04' (qa_bitacora_cu04@fashionstore.com) con rol id=4.	192.168.1.50	2026-09-13 09:53:43.816373
3012	1	LOGIN_EXITOSO	usuario	1	Inicio de sesión exitoso de 'Alejandro Sistemas' (admin@fashionstore.com) con rol 'Administrador'.	192.168.10.101	2026-09-13 09:53:49.139138
3013	1	LOGIN_EXITOSO	usuario	1	Inicio de sesión exitoso de 'Alejandro Sistemas' (admin@fashionstore.com) con rol 'Administrador'.	172.20.0.1	2026-09-13 09:53:49.370219
3014	1	LOGIN_FALLIDO	usuario	1	Intento de inicio de sesión fallido para el correo: admin@fashionstore.com (contraseña incorrecta).	192.168.10.102	2026-09-13 09:53:49.632796
3015	\N	LOGIN_FALLIDO	usuario	\N	Intento de inicio de sesión fallido para el correo: no_existe_qa_999@fashionstore.com (correo no registrado).	192.168.10.103	2026-09-13 09:53:49.896911
3016	1	LOGIN_EXITOSO	usuario	1	Inicio de sesión exitoso de 'Alejandro Sistemas' (admin@fashionstore.com) con rol 'Administrador'.	172.20.0.1	2026-09-13 09:53:50.169251
3021	1	UPDATE	usuario	710	Modificación del usuario 'qa_nuevo_cajero@fashionstore.com'. Campos actualizados: nombre=Carlos Alberto, telefono=71122334.	192.168.20.2	2026-09-13 09:53:52.372796
3022	1	INACTIVAR	usuario	710	Baja lógica del usuario 'qa_nuevo_cajero@fashionstore.com': estado cambiado de 'Activo' a 'Inactivo'.	192.168.20.3	2026-09-13 09:53:52.663584
3023	1	UPDATE	rol_permiso	3	Se actualizaron los permisos del rol 'Cajero (POS)' (ID: 3). Total asignados: 2.	192.168.1.50	2026-09-13 09:53:53.060468
3024	1	UPDATE	rol_permiso	3	Se actualizaron los permisos del rol 'Cajero (POS)' (ID: 3). Total asignados: 4.	192.168.1.50	2026-09-13 09:53:53.400423
3025	1	UPDATE	rol_permiso	3	Se actualizaron los permisos del rol 'Cajero (POS)' (ID: 3). Total asignados: 0.	192.168.1.50	2026-09-13 09:53:53.512682
3028	1	UPDATE	rol_permiso	3	Se actualizaron los permisos del rol 'Cajero (POS)' (ID: 3). Total asignados: 5.	192.168.1.50	2026-09-13 09:53:54.504682
3029	1	UPDATE	rol_permiso	3	Se actualizaron los permisos del rol 'Cajero (POS)' (ID: 3). Total asignados: 4.	192.168.1.50	2026-09-13 09:53:54.648467
3032	1	UPDATE	rol_permiso	3	Se actualizaron los permisos del rol 'Cajero (POS)' (ID: 3). Total asignados: 5.	192.168.1.50	2026-09-13 09:53:55.480944
3033	1	INSERT	usuario	713	Alta de usuario 'Carlos Recuperador' (qa_recovery_user@fashionstore.com) con rol id=4.	192.168.1.50	2026-09-13 09:53:55.736873
3035	1	INSERT	usuario	714	Alta de usuario 'Carlos Recuperador' (qa_recovery_user@fashionstore.com) con rol id=4.	192.168.1.50	2026-09-13 09:53:56.196842
3038	1	INSERT	usuario	715	Alta de usuario 'Carlos Recuperador' (qa_recovery_user@fashionstore.com) con rol id=4.	192.168.1.50	2026-09-13 09:53:56.664629
3040	1	INSERT	usuario	716	Alta de usuario 'Carlos Recuperador' (qa_recovery_user@fashionstore.com) con rol id=4.	192.168.1.50	2026-09-13 09:53:57.116697
3438	1	UPDATE	rol_permiso	3	Se actualizaron los permisos del rol 'Cajero (POS)' (ID: 3). Total asignados: 2.	192.168.1.50	2026-09-13 10:00:01.130982
3439	1	UPDATE	rol_permiso	3	Se actualizaron los permisos del rol 'Cajero (POS)' (ID: 3). Total asignados: 4.	192.168.1.50	2026-09-13 10:00:01.475384
3440	1	UPDATE	rol_permiso	3	Se actualizaron los permisos del rol 'Cajero (POS)' (ID: 3). Total asignados: 0.	192.168.1.50	2026-09-13 10:00:01.591014
3010	\N	INSERT	prenda	79	Se registró una nueva prenda con SKU: CHALLENGE-PRENDA-MOV, Nombre: Prenda Test Challenge Movimiento	\N	2026-09-13 09:53:44.903023
3011	\N	DELETE	prenda	79	Se eliminó la prenda con SKU: CHALLENGE-PRENDA-MOV	\N	2026-09-13 09:53:44.914075
5839	1	INSERT	usuario	1100	Alta de usuario 'Cajero POS QA' (qa_cajero_rbac@fashionstore.com) con rol id=3.	192.168.1.50	2026-09-13 19:32:38.590887
4805	1	LOGIN_EXITOSO	usuario	1	Inicio de sesión exitoso de 'Alejandro Sistemas' (admin@fashionstore.com) con rol 'Administrador'.	172.20.0.1	2026-09-13 19:06:04.539264
6640	\N	UPDATE	prenda	3	Se modificó la prenda. SKU anterior: CHQ-JEAN-001 -> SKU nuevo: CHQ-CUERO-001	\N	2026-09-20 08:11:37.894841
5841	1	UPDATE	rol_permiso	3	Se actualizaron los permisos del rol 'Cajero (POS)' (ID: 3). Total asignados: 5.	192.168.1.50	2026-09-13 19:32:39.186874
3853	1	LOGIN_EXITOSO	usuario	1	Inicio de sesión exitoso de 'Alejandro Sistemas' (admin@fashionstore.com) con rol 'Administrador'.	192.168.10.101	2026-09-13 10:06:04.257972
3854	1	LOGIN_EXITOSO	usuario	1	Inicio de sesión exitoso de 'Alejandro Sistemas' (admin@fashionstore.com) con rol 'Administrador'.	172.20.0.1	2026-09-13 10:06:04.487869
3855	1	LOGIN_FALLIDO	usuario	1	Intento de inicio de sesión fallido para el correo: admin@fashionstore.com (contraseña incorrecta).	192.168.10.102	2026-09-13 10:06:04.747134
3856	\N	LOGIN_FALLIDO	usuario	\N	Intento de inicio de sesión fallido para el correo: no_existe_qa_999@fashionstore.com (correo no registrado).	192.168.10.103	2026-09-13 10:06:05.01349
3857	1	LOGIN_EXITOSO	usuario	1	Inicio de sesión exitoso de 'Alejandro Sistemas' (admin@fashionstore.com) con rol 'Administrador'.	172.20.0.1	2026-09-13 10:06:05.284425
5842	1	UPDATE	rol_permiso	3	Se actualizaron los permisos del rol 'Cajero (POS)' (ID: 3). Total asignados: 4.	192.168.1.50	2026-09-13 19:32:39.330909
5843	1	INSERT	usuario	1101	Alta de usuario 'Cajero POS QA' (qa_cajero_rbac@fashionstore.com) con rol id=3.	192.168.1.50	2026-09-13 19:32:39.558685
5531	1	INSERT	usuario	1069	Alta de usuario 'Audit CU04' (qa_bitacora_cu04@fashionstore.com) con rol id=4.	192.168.1.50	2026-09-13 19:11:02.680417
5845	1	UPDATE	rol_permiso	3	Se actualizaron los permisos del rol 'Cajero (POS)' (ID: 3). Total asignados: 5.	192.168.1.50	2026-09-13 19:32:40.187083
3862	1	UPDATE	usuario	908	Modificación del usuario 'qa_nuevo_cajero@fashionstore.com'. Campos actualizados: nombre=Carlos Alberto, telefono=71122334.	192.168.20.2	2026-09-13 10:06:07.485972
3863	1	INACTIVAR	usuario	908	Baja lógica del usuario 'qa_nuevo_cajero@fashionstore.com': estado cambiado de 'Activo' a 'Inactivo'.	192.168.20.3	2026-09-13 10:06:07.779873
3864	1	UPDATE	rol_permiso	3	Se actualizaron los permisos del rol 'Cajero (POS)' (ID: 3). Total asignados: 2.	192.168.1.50	2026-09-13 10:06:08.168722
3865	1	UPDATE	rol_permiso	3	Se actualizaron los permisos del rol 'Cajero (POS)' (ID: 3). Total asignados: 4.	192.168.1.50	2026-09-13 10:06:08.512513
3866	1	UPDATE	rol_permiso	3	Se actualizaron los permisos del rol 'Cajero (POS)' (ID: 3). Total asignados: 0.	192.168.1.50	2026-09-13 10:06:08.628562
5846	1	INSERT	usuario	1102	Alta de usuario 'Carlos Recuperador' (qa_recovery_user@fashionstore.com) con rol id=4.	192.168.1.50	2026-09-13 19:32:40.497791
5848	1	INSERT	usuario	1103	Alta de usuario 'Carlos Recuperador' (qa_recovery_user@fashionstore.com) con rol id=4.	192.168.1.50	2026-09-13 19:32:40.965504
3869	1	UPDATE	rol_permiso	3	Se actualizaron los permisos del rol 'Cajero (POS)' (ID: 3). Total asignados: 5.	192.168.1.50	2026-09-13 10:06:09.624373
3870	1	UPDATE	rol_permiso	3	Se actualizaron los permisos del rol 'Cajero (POS)' (ID: 3). Total asignados: 4.	192.168.1.50	2026-09-13 10:06:09.768843
6641	\N	UPDATE	prenda	4	Se modificó la prenda. SKU anterior: E2E-CALZADO-1788649379 -> SKU nuevo: CALZ-URB-001	\N	2026-09-20 08:11:37.894841
3873	1	UPDATE	rol_permiso	3	Se actualizaron los permisos del rol 'Cajero (POS)' (ID: 3). Total asignados: 5.	192.168.1.50	2026-09-13 10:06:10.612474
3874	1	LOGIN_EXITOSO	usuario	1	Inicio de sesión exitoso de 'Alejandro Sistemas' (admin@fashionstore.com) con rol 'Administrador'.	192.168.10.101	2026-09-13 10:06:42.263273
3875	1	LOGIN_EXITOSO	usuario	1	Inicio de sesión exitoso de 'Alejandro Sistemas' (admin@fashionstore.com) con rol 'Administrador'.	172.20.0.1	2026-09-13 10:06:42.492284
3876	1	LOGIN_FALLIDO	usuario	1	Intento de inicio de sesión fallido para el correo: admin@fashionstore.com (contraseña incorrecta).	192.168.10.102	2026-09-13 10:06:42.750033
3877	\N	LOGIN_FALLIDO	usuario	\N	Intento de inicio de sesión fallido para el correo: no_existe_qa_999@fashionstore.com (correo no registrado).	192.168.10.103	2026-09-13 10:06:43.01503
3878	1	LOGIN_EXITOSO	usuario	1	Inicio de sesión exitoso de 'Alejandro Sistemas' (admin@fashionstore.com) con rol 'Administrador'.	172.20.0.1	2026-09-13 10:06:43.286176
3883	1	UPDATE	usuario	913	Modificación del usuario 'qa_nuevo_cajero@fashionstore.com'. Campos actualizados: nombre=Carlos Alberto, telefono=71122334.	192.168.20.2	2026-09-13 10:06:45.485304
3884	1	INACTIVAR	usuario	913	Baja lógica del usuario 'qa_nuevo_cajero@fashionstore.com': estado cambiado de 'Activo' a 'Inactivo'.	192.168.20.3	2026-09-13 10:06:45.761624
3885	1	UPDATE	rol_permiso	3	Se actualizaron los permisos del rol 'Cajero (POS)' (ID: 3). Total asignados: 2.	192.168.1.50	2026-09-13 10:06:46.169371
3886	1	UPDATE	rol_permiso	3	Se actualizaron los permisos del rol 'Cajero (POS)' (ID: 3). Total asignados: 4.	192.168.1.50	2026-09-13 10:06:46.50185
3887	1	UPDATE	rol_permiso	3	Se actualizaron los permisos del rol 'Cajero (POS)' (ID: 3). Total asignados: 0.	192.168.1.50	2026-09-13 10:06:46.657308
3946	\N	LOGIN_FALLIDO	usuario	\N	Intento de inicio de sesión fallido para el correo: no_existe_seguro@fashionstore.com (correo no registrado).	192.168.99.99	2026-09-13 10:07:01.193274
3947	1	UPDATE	rol_permiso	3	Se actualizaron los permisos del rol 'Cajero (POS)' (ID: 3). Total asignados: 3.	198.51.100.22	2026-09-13 10:07:01.461124
3948	1	INSERT	usuario	928	Alta de usuario 'Audit CU04' (qa_bitacora_cu04@fashionstore.com) con rol id=4.	192.168.1.50	2026-09-13 10:07:01.590102
3952	1	LOGIN_EXITOSO	usuario	1	Inicio de sesión exitoso de 'Alejandro Sistemas' (admin@fashionstore.com) con rol 'Administrador'.	172.20.0.1	2026-09-13 10:07:31.367941
3954	1	LOGIN_EXITOSO	usuario	1	Inicio de sesión exitoso de 'Alejandro Sistemas' (admin@fashionstore.com) con rol 'Administrador'.	192.168.10.101	2026-09-13 10:07:58.854109
3955	1	LOGIN_EXITOSO	usuario	1	Inicio de sesión exitoso de 'Alejandro Sistemas' (admin@fashionstore.com) con rol 'Administrador'.	172.20.0.1	2026-09-13 10:07:59.079914
3956	1	LOGIN_FALLIDO	usuario	1	Intento de inicio de sesión fallido para el correo: admin@fashionstore.com (contraseña incorrecta).	192.168.10.102	2026-09-13 10:07:59.341487
3957	\N	LOGIN_FALLIDO	usuario	\N	Intento de inicio de sesión fallido para el correo: no_existe_qa_999@fashionstore.com (correo no registrado).	192.168.10.103	2026-09-13 10:07:59.607386
3958	1	LOGIN_EXITOSO	usuario	1	Inicio de sesión exitoso de 'Alejandro Sistemas' (admin@fashionstore.com) con rol 'Administrador'.	172.20.0.1	2026-09-13 10:07:59.874942
3963	1	UPDATE	usuario	931	Modificación del usuario 'qa_nuevo_cajero@fashionstore.com'. Campos actualizados: nombre=Carlos Alberto, telefono=71122334.	192.168.20.2	2026-09-13 10:08:02.087179
3045	1	INSERT	usuario	717	Alta de usuario 'Carlos Recuperador' (qa_recovery_user@fashionstore.com) con rol id=4.	192.168.1.50	2026-09-13 09:53:58.364678
5330	1	UPDATE	rol_permiso	3	Se actualizaron los permisos del rol 'Cajero (POS)' (ID: 3). Total asignados: 3.	198.51.100.22	2026-09-13 19:09:13.68865
3047	1	INSERT	usuario	718	Alta de usuario 'Carlos Recuperador' (qa_recovery_user@fashionstore.com) con rol id=4.	192.168.1.50	2026-09-13 09:53:58.840952
3048	1	INSERT	usuario	719	Alta de usuario 'Carlos Recuperador' (qa_recovery_user@fashionstore.com) con rol id=4.	192.168.1.50	2026-09-13 09:53:59.208637
5333	1	INSERT	usuario	1057	Alta de usuario 'Audit CU04' (qa_bitacora_cu04@fashionstore.com) con rol id=4.	192.168.1.50	2026-09-13 19:09:13.798797
3051	1	INSERT	usuario	720	Alta de usuario 'Carlos Recuperador' (qa_recovery_user@fashionstore.com) con rol id=4.	192.168.1.50	2026-09-13 09:53:59.940394
3053	1	INSERT	usuario	722	Alta de usuario 'Carlos Recuperador' (qa_recovery_user@fashionstore.com) con rol id=4.	192.168.1.50	2026-09-13 09:54:00.936976
3055	1	INSERT	usuario	723	Alta de usuario 'Carlos Recuperador' (qa_recovery_user@fashionstore.com) con rol id=4.	192.168.1.50	2026-09-13 09:54:01.504702
3060	1	INSERT	usuario	724	Alta de usuario 'Carlos Recuperador' (qa_recovery_user@fashionstore.com) con rol id=4.	192.168.1.50	2026-09-13 09:54:02.768467
6151	1	INSERT	ciudad	172	Alta de la ciudad 'Pando QA IP Test'.	200.87.100.45	2026-09-13 20:43:43.455762
6152	\N	LOGIN_FALLIDO	usuario	\N	Intento de inicio de sesión fallido para el correo: no_existe_seguro@fashionstore.com (correo no registrado).	192.168.99.99	2026-09-13 20:43:43.647791
6153	1	UPDATE	rol_permiso	3	Se actualizaron los permisos del rol 'Cajero (POS)' (ID: 3). Total asignados: 3.	198.51.100.22	2026-09-13 20:43:43.922214
3064	1	INSERT	cliente	38	Alta del cliente 'Lucía Morales Paz' (CI 88997711).	192.168.40.1	2026-09-13 09:54:04.017069
3065	1	UPDATE	cliente	38	Modificación del cliente CI 88997711. Campos: nombre_completo=Lucía Morales de Mendoza, telefono=78999999.	192.168.40.2	2026-09-13 09:54:04.440648
3066	1	INACTIVAR	cliente	38	Baja lógica del cliente 'Lucía Morales de Mendoza' (CI 88997711).	192.168.40.3	2026-09-13 09:54:04.495447
6154	1	INSERT	usuario	1150	Alta de usuario 'Audit CU04' (qa_bitacora_cu04@fashionstore.com) con rol id=4.	192.168.1.50	2026-09-13 20:43:44.032694
6193	1	INSERT	ciudad	174	Alta de la ciudad 'Pando QA IP Test'.	200.87.100.45	2026-09-13 20:49:33.914671
6194	\N	LOGIN_FALLIDO	usuario	\N	Intento de inicio de sesión fallido para el correo: no_existe_seguro@fashionstore.com (correo no registrado).	192.168.99.99	2026-09-13 20:49:34.127193
6195	1	UPDATE	rol_permiso	3	Se actualizaron los permisos del rol 'Cajero (POS)' (ID: 3). Total asignados: 3.	198.51.100.22	2026-09-13 20:49:34.396244
6196	1	INSERT	usuario	1152	Alta de usuario 'Audit CU04' (qa_bitacora_cu04@fashionstore.com) con rol id=4.	192.168.1.50	2026-09-13 20:49:34.507214
6199	1	IA_ANALITICA_VOZ	inventario	\N	Analítica por voz CU23: 'Reporte de existencias para auditoria' -> Métrica 'inventario_stock', Resultados=3, PDF=False.	172.16.5.99	2026-09-13 20:49:35.826501
6200	1	LOGIN_EXITOSO	usuario	1	Inicio de sesión exitoso de 'Alejandro Sistemas' (admin@fashionstore.com) con rol 'Administrador'.	172.20.0.1	2026-09-13 20:49:55.410247
6201	1	IA_RECOMENDACION	inventario	4	Recomendación IA (Fallback Catálogo): 1 prendas sugeridas para estilo 'Formal' y ocasión 'General'.	172.20.0.1	2026-09-13 20:49:55.635337
6202	1	IA_ANALITICA_VOZ	inventario	\N	Analítica por voz CU23: 'Total de stock de inventario' -> Métrica 'inventario_stock', Resultados=3, PDF=True.	172.20.0.1	2026-09-13 20:49:55.737334
3084	\N	LOGIN_FALLIDO	usuario	\N	Intento de inicio de sesión fallido para el correo: no_existe_seguro@fashionstore.com (correo no registrado).	192.168.99.99	2026-09-13 09:54:07.884461
3085	1	UPDATE	rol_permiso	3	Se actualizaron los permisos del rol 'Cajero (POS)' (ID: 3). Total asignados: 3.	198.51.100.22	2026-09-13 09:54:08.163351
3086	1	INSERT	usuario	725	Alta de usuario 'Audit CU04' (qa_bitacora_cu04@fashionstore.com) con rol id=4.	192.168.1.50	2026-09-13 09:54:08.28882
3090	1	LOGIN_EXITOSO	usuario	1	Inicio de sesión exitoso de 'Alejandro Sistemas' (admin@fashionstore.com) con rol 'Administrador'.	192.168.10.101	2026-09-13 09:54:21.449926
3091	1	LOGIN_EXITOSO	usuario	1	Inicio de sesión exitoso de 'Alejandro Sistemas' (admin@fashionstore.com) con rol 'Administrador'.	172.20.0.1	2026-09-13 09:54:21.680888
3092	1	LOGIN_FALLIDO	usuario	1	Intento de inicio de sesión fallido para el correo: admin@fashionstore.com (contraseña incorrecta).	192.168.10.102	2026-09-13 09:54:21.934198
3093	\N	LOGIN_FALLIDO	usuario	\N	Intento de inicio de sesión fallido para el correo: no_existe_qa_999@fashionstore.com (correo no registrado).	192.168.10.103	2026-09-13 09:54:22.199273
3094	1	LOGIN_EXITOSO	usuario	1	Inicio de sesión exitoso de 'Alejandro Sistemas' (admin@fashionstore.com) con rol 'Administrador'.	172.20.0.1	2026-09-13 09:54:22.466774
3100	1	UPDATE	usuario	728	Modificación del usuario 'qa_nuevo_cajero@fashionstore.com'. Campos actualizados: nombre=Carlos Alberto, telefono=71122334.	192.168.20.2	2026-09-13 09:54:24.703339
3101	1	INACTIVAR	usuario	728	Baja lógica del usuario 'qa_nuevo_cajero@fashionstore.com': estado cambiado de 'Activo' a 'Inactivo'.	192.168.20.3	2026-09-13 09:54:24.983078
3102	1	UPDATE	rol_permiso	3	Se actualizaron los permisos del rol 'Cajero (POS)' (ID: 3). Total asignados: 2.	192.168.1.50	2026-09-13 09:54:25.382911
3103	1	UPDATE	rol_permiso	3	Se actualizaron los permisos del rol 'Cajero (POS)' (ID: 3). Total asignados: 4.	192.168.1.50	2026-09-13 09:54:25.734962
3104	1	UPDATE	rol_permiso	3	Se actualizaron los permisos del rol 'Cajero (POS)' (ID: 3). Total asignados: 0.	192.168.1.50	2026-09-13 09:54:25.842934
3107	1	UPDATE	rol_permiso	3	Se actualizaron los permisos del rol 'Cajero (POS)' (ID: 3). Total asignados: 5.	192.168.1.50	2026-09-13 09:54:26.839035
3108	1	UPDATE	rol_permiso	3	Se actualizaron los permisos del rol 'Cajero (POS)' (ID: 3). Total asignados: 4.	192.168.1.50	2026-09-13 09:54:26.982967
3111	1	UPDATE	rol_permiso	3	Se actualizaron los permisos del rol 'Cajero (POS)' (ID: 3). Total asignados: 5.	192.168.1.50	2026-09-13 09:54:27.891033
3112	1	INSERT	usuario	731	Alta de usuario 'Carlos Recuperador' (qa_recovery_user@fashionstore.com) con rol id=4.	192.168.1.50	2026-09-13 09:54:28.143178
3114	1	INSERT	usuario	732	Alta de usuario 'Carlos Recuperador' (qa_recovery_user@fashionstore.com) con rol id=4.	192.168.1.50	2026-09-13 09:54:28.610893
3117	1	INSERT	usuario	733	Alta de usuario 'Carlos Recuperador' (qa_recovery_user@fashionstore.com) con rol id=4.	192.168.1.50	2026-09-13 09:54:29.075169
3119	1	INSERT	usuario	734	Alta de usuario 'Carlos Recuperador' (qa_recovery_user@fashionstore.com) con rol id=4.	192.168.1.50	2026-09-13 09:54:29.53504
3523	1	UPDATE	rol_permiso	3	Se actualizaron los permisos del rol 'Cajero (POS)' (ID: 3). Total asignados: 5.	192.168.1.50	2026-09-13 10:03:18.575387
3524	1	UPDATE	rol_permiso	3	Se actualizaron los permisos del rol 'Cajero (POS)' (ID: 3). Total asignados: 4.	192.168.1.50	2026-09-13 10:03:18.718798
3527	1	UPDATE	rol_permiso	3	Se actualizaron los permisos del rol 'Cajero (POS)' (ID: 3). Total asignados: 5.	192.168.1.50	2026-09-13 10:03:19.587113
6642	\N	INSERT	prenda	171	Se registró una nueva prenda con SKU: CHQ-DENIM-002, Nombre: Chaqueta Denim Vintage Stone Wash	\N	2026-09-20 08:11:37.894841
5331	1	LOGIN_EXITOSO	usuario	1	Inicio de sesión exitoso de 'Alejandro Sistemas' (admin@fashionstore.com) con rol 'Administrador'.	172.20.0.1	2026-09-13 19:09:13.751435
3124	1	INSERT	usuario	735	Alta de usuario 'Carlos Recuperador' (qa_recovery_user@fashionstore.com) con rol id=4.	192.168.1.50	2026-09-13 09:54:30.78282
5994	1	INSERT	usuario	1116	Alta de usuario 'Usuario Cliente QA' (qa_cliente_rbac@fashionstore.com) con rol id=4.	192.168.1.50	2026-09-13 19:34:20.272344
3126	1	INSERT	usuario	736	Alta de usuario 'Carlos Recuperador' (qa_recovery_user@fashionstore.com) con rol id=4.	192.168.1.50	2026-09-13 09:54:31.238805
3127	1	INSERT	usuario	737	Alta de usuario 'Carlos Recuperador' (qa_recovery_user@fashionstore.com) con rol id=4.	192.168.1.50	2026-09-13 09:54:31.603468
6643	\N	INSERT	prenda	172	Se registró una nueva prenda con SKU: BLZ-EJE-001, Nombre: Blazer Ejecutivo Entallado Negro	\N	2026-09-20 08:11:37.894841
5996	1	UPDATE	rol_permiso	3	Se actualizaron los permisos del rol 'Cajero (POS)' (ID: 3). Total asignados: 2.	192.168.1.50	2026-09-13 19:34:20.968305
3130	1	INSERT	usuario	738	Alta de usuario 'Carlos Recuperador' (qa_recovery_user@fashionstore.com) con rol id=4.	192.168.1.50	2026-09-13 09:54:32.323635
3132	1	INSERT	usuario	740	Alta de usuario 'Carlos Recuperador' (qa_recovery_user@fashionstore.com) con rol id=4.	192.168.1.50	2026-09-13 09:54:33.314847
3966	1	UPDATE	rol_permiso	3	Se actualizaron los permisos del rol 'Cajero (POS)' (ID: 3). Total asignados: 4.	192.168.1.50	2026-09-13 10:08:03.119477
3134	1	INSERT	usuario	741	Alta de usuario 'Carlos Recuperador' (qa_recovery_user@fashionstore.com) con rol id=4.	192.168.1.50	2026-09-13 09:54:33.874849
3967	1	UPDATE	rol_permiso	3	Se actualizaron los permisos del rol 'Cajero (POS)' (ID: 3). Total asignados: 0.	192.168.1.50	2026-09-13 10:08:03.231092
3139	1	INSERT	usuario	742	Alta de usuario 'Carlos Recuperador' (qa_recovery_user@fashionstore.com) con rol id=4.	192.168.1.50	2026-09-13 09:54:35.143039
5346	\N	LOGIN_FALLIDO	usuario	\N	Intento de inicio de sesión fallido para el correo: no_existe_seguro@fashionstore.com (correo no registrado).	192.168.99.99	2026-09-13 19:09:17.014861
5347	1	UPDATE	rol_permiso	3	Se actualizaron los permisos del rol 'Cajero (POS)' (ID: 3). Total asignados: 3.	198.51.100.22	2026-09-13 19:09:17.268858
5348	1	INSERT	usuario	1059	Alta de usuario 'Audit CU04' (qa_bitacora_cu04@fashionstore.com) con rol id=4.	192.168.1.50	2026-09-13 19:09:17.386777
3143	1	INSERT	cliente	39	Alta del cliente 'Lucía Morales Paz' (CI 88997711).	192.168.40.1	2026-09-13 09:54:36.39126
3144	1	UPDATE	cliente	39	Modificación del cliente CI 88997711. Campos: nombre_completo=Lucía Morales de Mendoza, telefono=78999999.	192.168.40.2	2026-09-13 09:54:36.807017
3145	1	INACTIVAR	cliente	39	Baja lógica del cliente 'Lucía Morales de Mendoza' (CI 88997711).	192.168.40.3	2026-09-13 09:54:36.859468
5351	1	LOGIN_EXITOSO	usuario	1	Inicio de sesión exitoso de 'Alejandro Sistemas' (admin@fashionstore.com) con rol 'Administrador'.	172.20.0.1	2026-09-13 19:09:21.516666
5353	1	LOGIN_EXITOSO	usuario	1	Inicio de sesión exitoso de 'Alejandro Sistemas' (admin@fashionstore.com) con rol 'Administrador'.	172.20.0.1	2026-09-13 19:09:22.472143
5355	\N	LOGIN_FALLIDO	usuario	\N	Intento de inicio de sesión fallido para el correo: no_existe_seguro@fashionstore.com (correo no registrado).	192.168.99.99	2026-09-13 19:09:22.874588
5356	1	UPDATE	rol_permiso	3	Se actualizaron los permisos del rol 'Cajero (POS)' (ID: 3). Total asignados: 3.	198.51.100.22	2026-09-13 19:09:23.137245
5357	1	INSERT	usuario	1061	Alta de usuario 'Audit CU04' (qa_bitacora_cu04@fashionstore.com) con rol id=4.	192.168.1.50	2026-09-13 19:09:23.24675
5360	1	LOGIN_EXITOSO	usuario	1	Inicio de sesión exitoso de 'Alejandro Sistemas' (admin@fashionstore.com) con rol 'Administrador'.	172.20.0.1	2026-09-13 19:09:25.923045
5363	1	LOGIN_EXITOSO	usuario	1	Inicio de sesión exitoso de 'Alejandro Sistemas' (admin@fashionstore.com) con rol 'Administrador'.	172.20.0.1	2026-09-13 19:09:28.416679
3163	\N	LOGIN_FALLIDO	usuario	\N	Intento de inicio de sesión fallido para el correo: no_existe_seguro@fashionstore.com (correo no registrado).	192.168.99.99	2026-09-13 09:54:40.475697
3164	1	UPDATE	rol_permiso	3	Se actualizaron los permisos del rol 'Cajero (POS)' (ID: 3). Total asignados: 3.	198.51.100.22	2026-09-13 09:54:40.751227
3165	1	INSERT	usuario	743	Alta de usuario 'Audit CU04' (qa_bitacora_cu04@fashionstore.com) con rol id=4.	192.168.1.50	2026-09-13 09:54:40.863496
3169	1	LOGIN_EXITOSO	usuario	1	Inicio de sesión exitoso de 'Alejandro Sistemas' (admin@fashionstore.com) con rol 'Administrador'.	192.168.10.101	2026-09-13 09:54:50.27842
3170	1	LOGIN_EXITOSO	usuario	1	Inicio de sesión exitoso de 'Alejandro Sistemas' (admin@fashionstore.com) con rol 'Administrador'.	172.20.0.1	2026-09-13 09:54:50.514911
3171	1	LOGIN_FALLIDO	usuario	1	Intento de inicio de sesión fallido para el correo: admin@fashionstore.com (contraseña incorrecta).	192.168.10.102	2026-09-13 09:54:50.777437
3172	\N	LOGIN_FALLIDO	usuario	\N	Intento de inicio de sesión fallido para el correo: no_existe_qa_999@fashionstore.com (correo no registrado).	192.168.10.103	2026-09-13 09:54:51.05342
3173	1	LOGIN_EXITOSO	usuario	1	Inicio de sesión exitoso de 'Alejandro Sistemas' (admin@fashionstore.com) con rol 'Administrador'.	172.20.0.1	2026-09-13 09:54:51.325431
3178	1	UPDATE	usuario	746	Modificación del usuario 'qa_nuevo_cajero@fashionstore.com'. Campos actualizados: nombre=Carlos Alberto, telefono=71122334.	192.168.20.2	2026-09-13 09:54:53.521847
3179	1	INACTIVAR	usuario	746	Baja lógica del usuario 'qa_nuevo_cajero@fashionstore.com': estado cambiado de 'Activo' a 'Inactivo'.	192.168.20.3	2026-09-13 09:54:53.806762
3180	1	UPDATE	rol_permiso	3	Se actualizaron los permisos del rol 'Cajero (POS)' (ID: 3). Total asignados: 2.	192.168.1.50	2026-09-13 09:54:54.218001
3181	1	UPDATE	rol_permiso	3	Se actualizaron los permisos del rol 'Cajero (POS)' (ID: 3). Total asignados: 4.	192.168.1.50	2026-09-13 09:54:54.5658
3182	1	UPDATE	rol_permiso	3	Se actualizaron los permisos del rol 'Cajero (POS)' (ID: 3). Total asignados: 0.	192.168.1.50	2026-09-13 09:54:54.673626
3185	1	UPDATE	rol_permiso	3	Se actualizaron los permisos del rol 'Cajero (POS)' (ID: 3). Total asignados: 5.	192.168.1.50	2026-09-13 09:54:55.673577
3186	1	UPDATE	rol_permiso	3	Se actualizaron los permisos del rol 'Cajero (POS)' (ID: 3). Total asignados: 4.	192.168.1.50	2026-09-13 09:54:55.82177
3189	1	UPDATE	rol_permiso	3	Se actualizaron los permisos del rol 'Cajero (POS)' (ID: 3). Total asignados: 5.	192.168.1.50	2026-09-13 09:54:56.657541
3190	1	INSERT	usuario	749	Alta de usuario 'Carlos Recuperador' (qa_recovery_user@fashionstore.com) con rol id=4.	192.168.1.50	2026-09-13 09:54:56.909639
3192	1	INSERT	usuario	750	Alta de usuario 'Carlos Recuperador' (qa_recovery_user@fashionstore.com) con rol id=4.	192.168.1.50	2026-09-13 09:54:57.377529
3195	1	INSERT	usuario	751	Alta de usuario 'Carlos Recuperador' (qa_recovery_user@fashionstore.com) con rol id=4.	192.168.1.50	2026-09-13 09:54:57.833753
3198	1	INSERT	usuario	752	Alta de usuario 'Carlos Recuperador' (qa_recovery_user@fashionstore.com) con rol id=4.	192.168.1.50	2026-09-13 09:54:58.3095
4495	1	INSERT	proveedor	121	Alta del proveedor 'Confecciones Alta Costura Bolivia S.A.' (NIT 349182024).	172.20.0.1	2026-09-13 10:42:23.60006
3203	1	INSERT	usuario	753	Alta de usuario 'Carlos Recuperador' (qa_recovery_user@fashionstore.com) con rol id=4.	192.168.1.50	2026-09-13 09:54:59.565853
5109	\N	LOGIN_FALLIDO	usuario	\N	Intento de inicio de sesión fallido para el correo: no_existe_seguro@fashionstore.com (correo no registrado).	192.168.99.99	2026-09-13 19:07:28.203965
3205	1	INSERT	usuario	754	Alta de usuario 'Carlos Recuperador' (qa_recovery_user@fashionstore.com) con rol id=4.	192.168.1.50	2026-09-13 09:55:00.018244
3206	1	INSERT	usuario	755	Alta de usuario 'Carlos Recuperador' (qa_recovery_user@fashionstore.com) con rol id=4.	192.168.1.50	2026-09-13 09:55:00.389578
5110	1	UPDATE	rol_permiso	3	Se actualizaron los permisos del rol 'Cajero (POS)' (ID: 3). Total asignados: 3.	198.51.100.22	2026-09-13 19:07:28.484485
5111	1	INSERT	usuario	1050	Alta de usuario 'Audit CU04' (qa_bitacora_cu04@fashionstore.com) con rol id=4.	192.168.1.50	2026-09-13 19:07:28.599934
3209	1	INSERT	usuario	756	Alta de usuario 'Carlos Recuperador' (qa_recovery_user@fashionstore.com) con rol id=4.	192.168.1.50	2026-09-13 09:55:01.115176
5851	1	INSERT	usuario	1104	Alta de usuario 'Carlos Recuperador' (qa_recovery_user@fashionstore.com) con rol id=4.	192.168.1.50	2026-09-13 19:32:41.445463
3211	1	INSERT	usuario	758	Alta de usuario 'Carlos Recuperador' (qa_recovery_user@fashionstore.com) con rol id=4.	192.168.1.50	2026-09-13 09:55:02.113984
5853	1	INSERT	usuario	1105	Alta de usuario 'Carlos Recuperador' (qa_recovery_user@fashionstore.com) con rol id=4.	192.168.1.50	2026-09-13 19:32:41.909856
3213	1	INSERT	usuario	759	Alta de usuario 'Carlos Recuperador' (qa_recovery_user@fashionstore.com) con rol id=4.	192.168.1.50	2026-09-13 09:55:02.669501
5114	1	LOGIN_EXITOSO	usuario	1	Inicio de sesión exitoso de 'Alejandro Sistemas' (admin@fashionstore.com) con rol 'Administrador'.	172.20.0.1	2026-09-13 19:07:34.595763
5120	1	LOGIN_EXITOSO	usuario	1	Inicio de sesión exitoso de 'Alejandro Sistemas' (admin@fashionstore.com) con rol 'Administrador'.	172.20.0.1	2026-09-13 19:07:40.493768
3218	1	INSERT	usuario	760	Alta de usuario 'Carlos Recuperador' (qa_recovery_user@fashionstore.com) con rol id=4.	192.168.1.50	2026-09-13 09:55:03.901979
3223	1	INSERT	cliente	40	Alta del cliente 'Lucía Morales Paz' (CI 88997711).	192.168.40.1	2026-09-13 09:55:05.165645
3224	1	UPDATE	cliente	40	Modificación del cliente CI 88997711. Campos: nombre_completo=Lucía Morales de Mendoza, telefono=78999999.	192.168.40.2	2026-09-13 09:55:05.589886
3225	1	INACTIVAR	cliente	40	Baja lógica del cliente 'Lucía Morales de Mendoza' (CI 88997711).	192.168.40.3	2026-09-13 09:55:05.642498
5334	\N	SOLICITUD_RECUPERACION_PASSWORD	usuario_token	738	Solicitud de recuperación de contraseña para el correo: qa_bitacora_cu04@fashionstore.com.	198.51.100.33	2026-09-13 19:09:14.077873
3243	\N	LOGIN_FALLIDO	usuario	\N	Intento de inicio de sesión fallido para el correo: no_existe_seguro@fashionstore.com (correo no registrado).	192.168.99.99	2026-09-13 09:55:09.025785
3244	1	UPDATE	rol_permiso	3	Se actualizaron los permisos del rol 'Cajero (POS)' (ID: 3). Total asignados: 3.	198.51.100.22	2026-09-13 09:55:09.30355
3245	1	INSERT	usuario	761	Alta de usuario 'Audit CU04' (qa_bitacora_cu04@fashionstore.com) con rol id=4.	192.168.1.50	2026-09-13 09:55:09.413696
3251	1	LOGIN_EXITOSO	usuario	1	Inicio de sesión exitoso de 'Alejandro Sistemas' (admin@fashionstore.com) con rol 'Administrador'.	192.168.10.101	2026-09-13 09:55:53.963264
3252	1	LOGIN_EXITOSO	usuario	1	Inicio de sesión exitoso de 'Alejandro Sistemas' (admin@fashionstore.com) con rol 'Administrador'.	172.20.0.1	2026-09-13 09:55:54.19654
3253	1	LOGIN_FALLIDO	usuario	1	Intento de inicio de sesión fallido para el correo: admin@fashionstore.com (contraseña incorrecta).	192.168.10.102	2026-09-13 09:55:54.456522
3254	\N	LOGIN_FALLIDO	usuario	\N	Intento de inicio de sesión fallido para el correo: no_existe_qa_999@fashionstore.com (correo no registrado).	192.168.10.103	2026-09-13 09:55:54.722519
3255	1	LOGIN_EXITOSO	usuario	1	Inicio de sesión exitoso de 'Alejandro Sistemas' (admin@fashionstore.com) con rol 'Administrador'.	172.20.0.1	2026-09-13 09:55:54.990383
5546	\N	LOGIN_FALLIDO	usuario	\N	Intento de inicio de sesión fallido para el correo: no_existe_seguro@fashionstore.com (correo no registrado).	192.168.99.99	2026-09-13 19:11:06.481868
3260	1	UPDATE	usuario	764	Modificación del usuario 'qa_nuevo_cajero@fashionstore.com'. Campos actualizados: nombre=Carlos Alberto, telefono=71122334.	192.168.20.2	2026-09-13 09:55:57.171097
3261	1	INACTIVAR	usuario	764	Baja lógica del usuario 'qa_nuevo_cajero@fashionstore.com': estado cambiado de 'Activo' a 'Inactivo'.	192.168.20.3	2026-09-13 09:55:57.462297
3262	1	UPDATE	rol_permiso	3	Se actualizaron los permisos del rol 'Cajero (POS)' (ID: 3). Total asignados: 2.	192.168.1.50	2026-09-13 09:55:57.854299
3263	1	UPDATE	rol_permiso	3	Se actualizaron los permisos del rol 'Cajero (POS)' (ID: 3). Total asignados: 4.	192.168.1.50	2026-09-13 09:55:58.20213
3264	1	UPDATE	rol_permiso	3	Se actualizaron los permisos del rol 'Cajero (POS)' (ID: 3). Total asignados: 0.	192.168.1.50	2026-09-13 09:55:58.310264
5547	1	UPDATE	rol_permiso	3	Se actualizaron los permisos del rol 'Cajero (POS)' (ID: 3). Total asignados: 3.	198.51.100.22	2026-09-13 19:11:06.756298
5548	1	INSERT	usuario	1070	Alta de usuario 'Audit CU04' (qa_bitacora_cu04@fashionstore.com) con rol id=4.	192.168.1.50	2026-09-13 19:11:06.869661
3267	1	UPDATE	rol_permiso	3	Se actualizaron los permisos del rol 'Cajero (POS)' (ID: 3). Total asignados: 5.	192.168.1.50	2026-09-13 09:55:59.314761
3268	1	UPDATE	rol_permiso	3	Se actualizaron los permisos del rol 'Cajero (POS)' (ID: 3). Total asignados: 4.	192.168.1.50	2026-09-13 09:55:59.458467
3271	1	UPDATE	rol_permiso	3	Se actualizaron los permisos del rol 'Cajero (POS)' (ID: 3). Total asignados: 5.	192.168.1.50	2026-09-13 09:56:00.30619
3272	1	INSERT	usuario	767	Alta de usuario 'Carlos Recuperador' (qa_recovery_user@fashionstore.com) con rol id=4.	192.168.1.50	2026-09-13 09:56:00.566349
3274	1	INSERT	usuario	768	Alta de usuario 'Carlos Recuperador' (qa_recovery_user@fashionstore.com) con rol id=4.	192.168.1.50	2026-09-13 09:56:01.026309
3277	1	INSERT	usuario	769	Alta de usuario 'Carlos Recuperador' (qa_recovery_user@fashionstore.com) con rol id=4.	192.168.1.50	2026-09-13 09:56:01.482543
3279	1	INSERT	usuario	770	Alta de usuario 'Carlos Recuperador' (qa_recovery_user@fashionstore.com) con rol id=4.	192.168.1.50	2026-09-13 09:56:01.938473
3528	1	INSERT	usuario	825	Alta de usuario 'Carlos Recuperador' (qa_recovery_user@fashionstore.com) con rol id=4.	192.168.1.50	2026-09-13 10:03:19.906671
3530	1	INSERT	usuario	826	Alta de usuario 'Carlos Recuperador' (qa_recovery_user@fashionstore.com) con rol id=4.	192.168.1.50	2026-09-13 10:03:20.358731
3533	1	INSERT	usuario	827	Alta de usuario 'Carlos Recuperador' (qa_recovery_user@fashionstore.com) con rol id=4.	192.168.1.50	2026-09-13 10:03:20.842903
3535	1	INSERT	usuario	828	Alta de usuario 'Carlos Recuperador' (qa_recovery_user@fashionstore.com) con rol id=4.	192.168.1.50	2026-09-13 10:03:21.303537
3890	1	UPDATE	rol_permiso	3	Se actualizaron los permisos del rol 'Cajero (POS)' (ID: 3). Total asignados: 5.	192.168.1.50	2026-09-13 10:06:47.754417
3891	1	UPDATE	rol_permiso	3	Se actualizaron los permisos del rol 'Cajero (POS)' (ID: 3). Total asignados: 4.	192.168.1.50	2026-09-13 10:06:47.901203
3284	1	INSERT	usuario	771	Alta de usuario 'Carlos Recuperador' (qa_recovery_user@fashionstore.com) con rol id=4.	192.168.1.50	2026-09-13 09:56:03.182264
4496	1	INSERT	proveedor	122	Alta del proveedor 'Importadora Milano Fashion S.R.L.' (NIT 582049101).	172.20.0.1	2026-09-13 10:42:23.69825
3286	1	INSERT	usuario	772	Alta de usuario 'Carlos Recuperador' (qa_recovery_user@fashionstore.com) con rol id=4.	192.168.1.50	2026-09-13 09:56:03.662933
3287	1	INSERT	usuario	773	Alta de usuario 'Carlos Recuperador' (qa_recovery_user@fashionstore.com) con rol id=4.	192.168.1.50	2026-09-13 09:56:04.026254
4497	1	LOGIN_EXITOSO	usuario	1	Inicio de sesión exitoso de 'Alejandro Sistemas' (admin@fashionstore.com) con rol 'Administrador'.	172.20.0.1	2026-09-13 10:43:52.899267
4498	1	LOGIN_EXITOSO	usuario	1	Inicio de sesión exitoso de 'Alejandro Sistemas' (admin@fashionstore.com) con rol 'Administrador'.	172.20.0.1	2026-09-13 10:44:44.143766
3290	1	INSERT	usuario	774	Alta de usuario 'Carlos Recuperador' (qa_recovery_user@fashionstore.com) con rol id=4.	192.168.1.50	2026-09-13 09:56:04.750317
4500	1	INSERT	movimiento_inventario	204	Movimiento 'Salida' de 3 unidad(es) en sucursal 1 (Variante 4). Motivo: Merma por daño menor en exhibición de vitrina	172.20.0.1	2026-09-13 10:44:44.47439
3292	1	INSERT	usuario	776	Alta de usuario 'Carlos Recuperador' (qa_recovery_user@fashionstore.com) con rol id=4.	192.168.1.50	2026-09-13 09:56:05.742222
4501	1	INSERT	movimiento_inventario	205	Movimiento 'Traspaso' de 2 unidad(es) en sucursal 1 (Variante 4). Motivo: Traspaso de stock a Sucursal Equipetrol	172.20.0.1	2026-09-13 10:44:44.566608
3294	1	INSERT	usuario	777	Alta de usuario 'Carlos Recuperador' (qa_recovery_user@fashionstore.com) con rol id=4.	192.168.1.50	2026-09-13 09:56:06.290454
4502	1	LOGIN_EXITOSO	usuario	1	Inicio de sesión exitoso de 'Alejandro Sistemas' (admin@fashionstore.com) con rol 'Administrador'.	172.20.0.1	2026-09-13 10:45:07.628433
4505	1	LOGIN_EXITOSO	usuario	1	Inicio de sesión exitoso de 'Alejandro Sistemas' (admin@fashionstore.com) con rol 'Administrador'.	192.168.10.101	2026-09-13 10:46:45.145987
3299	1	INSERT	usuario	778	Alta de usuario 'Carlos Recuperador' (qa_recovery_user@fashionstore.com) con rol id=4.	192.168.1.50	2026-09-13 09:56:07.598071
4506	1	LOGIN_EXITOSO	usuario	1	Inicio de sesión exitoso de 'Alejandro Sistemas' (admin@fashionstore.com) con rol 'Administrador'.	172.20.0.1	2026-09-13 10:46:45.394038
4507	1	LOGIN_FALLIDO	usuario	1	Intento de inicio de sesión fallido para el correo: admin@fashionstore.com (contraseña incorrecta).	192.168.10.102	2026-09-13 10:46:45.655684
4508	\N	LOGIN_FALLIDO	usuario	\N	Intento de inicio de sesión fallido para el correo: no_existe_qa_999@fashionstore.com (correo no registrado).	192.168.10.103	2026-09-13 10:46:45.915893
3303	1	INSERT	cliente	41	Alta del cliente 'Lucía Morales Paz' (CI 88997711).	192.168.40.1	2026-09-13 09:56:08.850356
3304	1	UPDATE	cliente	41	Modificación del cliente CI 88997711. Campos: nombre_completo=Lucía Morales de Mendoza, telefono=78999999.	192.168.40.2	2026-09-13 09:56:09.270214
3305	1	INACTIVAR	cliente	41	Baja lógica del cliente 'Lucía Morales de Mendoza' (CI 88997711).	192.168.40.3	2026-09-13 09:56:09.324566
4509	1	LOGIN_EXITOSO	usuario	1	Inicio de sesión exitoso de 'Alejandro Sistemas' (admin@fashionstore.com) con rol 'Administrador'.	172.20.0.1	2026-09-13 10:46:46.180792
4511	1	INSERT	usuario	1020	Alta de usuario 'Usuario Cliente QA' (qa_cliente_rbac@fashionstore.com) con rol id=4.	192.168.1.50	2026-09-13 10:46:47.152552
3323	\N	LOGIN_FALLIDO	usuario	\N	Intento de inicio de sesión fallido para el correo: no_existe_seguro@fashionstore.com (correo no registrado).	192.168.99.99	2026-09-13 09:56:12.670246
3324	1	UPDATE	rol_permiso	3	Se actualizaron los permisos del rol 'Cajero (POS)' (ID: 3). Total asignados: 3.	198.51.100.22	2026-09-13 09:56:12.935445
3325	1	INSERT	usuario	779	Alta de usuario 'Audit CU04' (qa_bitacora_cu04@fashionstore.com) con rol id=4.	192.168.1.50	2026-09-13 09:56:13.046316
3329	\N	INSERT	prenda	94	Se registró una nueva prenda con SKU: SKU-TEST-M1-ITER2, Nombre: Prenda Test M1	\N	2026-09-13 09:58:12.024185
3330	\N	DELETE	prenda	94	Se eliminó la prenda con SKU: SKU-TEST-M1-ITER2	\N	2026-09-13 09:58:12.024185
3331	1	LOGIN_EXITOSO	usuario	1	Inicio de sesión exitoso de 'Alejandro Sistemas' (admin@fashionstore.com) con rol 'Administrador'.	192.168.10.101	2026-09-13 09:58:23.707857
3332	1	LOGIN_EXITOSO	usuario	1	Inicio de sesión exitoso de 'Alejandro Sistemas' (admin@fashionstore.com) con rol 'Administrador'.	172.20.0.1	2026-09-13 09:58:24.131297
3333	1	LOGIN_FALLIDO	usuario	1	Intento de inicio de sesión fallido para el correo: admin@fashionstore.com (contraseña incorrecta).	192.168.10.102	2026-09-13 09:58:24.368964
3334	\N	LOGIN_FALLIDO	usuario	\N	Intento de inicio de sesión fallido para el correo: no_existe_qa_999@fashionstore.com (correo no registrado).	192.168.10.103	2026-09-13 09:58:24.643849
3335	1	LOGIN_EXITOSO	usuario	1	Inicio de sesión exitoso de 'Alejandro Sistemas' (admin@fashionstore.com) con rol 'Administrador'.	172.20.0.1	2026-09-13 09:58:24.919402
3340	1	UPDATE	usuario	782	Modificación del usuario 'qa_nuevo_cajero@fashionstore.com'. Campos actualizados: nombre=Carlos Alberto, telefono=71122334.	192.168.20.2	2026-09-13 09:58:27.131136
3341	1	INACTIVAR	usuario	782	Baja lógica del usuario 'qa_nuevo_cajero@fashionstore.com': estado cambiado de 'Activo' a 'Inactivo'.	192.168.20.3	2026-09-13 09:58:27.422655
3342	1	UPDATE	rol_permiso	3	Se actualizaron los permisos del rol 'Cajero (POS)' (ID: 3). Total asignados: 2.	192.168.1.50	2026-09-13 09:58:27.811295
3343	1	UPDATE	rol_permiso	3	Se actualizaron los permisos del rol 'Cajero (POS)' (ID: 3). Total asignados: 4.	192.168.1.50	2026-09-13 09:58:28.159189
3344	1	UPDATE	rol_permiso	3	Se actualizaron los permisos del rol 'Cajero (POS)' (ID: 3). Total asignados: 0.	192.168.1.50	2026-09-13 09:58:28.323185
3347	1	UPDATE	rol_permiso	3	Se actualizaron los permisos del rol 'Cajero (POS)' (ID: 3). Total asignados: 5.	192.168.1.50	2026-09-13 09:58:29.315438
3348	1	UPDATE	rol_permiso	3	Se actualizaron los permisos del rol 'Cajero (POS)' (ID: 3). Total asignados: 4.	192.168.1.50	2026-09-13 09:58:29.459143
3351	1	UPDATE	rol_permiso	3	Se actualizaron los permisos del rol 'Cajero (POS)' (ID: 3). Total asignados: 5.	192.168.1.50	2026-09-13 09:58:30.339127
3352	1	INSERT	usuario	785	Alta de usuario 'Carlos Recuperador' (qa_recovery_user@fashionstore.com) con rol id=4.	192.168.1.50	2026-09-13 09:58:30.667255
3354	1	INSERT	usuario	786	Alta de usuario 'Carlos Recuperador' (qa_recovery_user@fashionstore.com) con rol id=4.	192.168.1.50	2026-09-13 09:58:31.083678
3357	1	INSERT	usuario	787	Alta de usuario 'Carlos Recuperador' (qa_recovery_user@fashionstore.com) con rol id=4.	192.168.1.50	2026-09-13 09:58:31.571407
3359	1	INSERT	usuario	788	Alta de usuario 'Carlos Recuperador' (qa_recovery_user@fashionstore.com) con rol id=4.	192.168.1.50	2026-09-13 09:58:32.019343
4499	1	INSERT	movimiento_inventario	203	Movimiento 'Entrada' de 15 unidad(es) en sucursal 1 (Variante 4). Motivo: Ingreso de lote por reposición de temporada	172.20.0.1	2026-09-13 10:44:44.370134
6644	\N	INSERT	prenda	173	Se registró una nueva prenda con SKU: CAM-OXF-001, Nombre: Camisa Oxford Slim Fit Celeste	\N	2026-09-20 08:11:37.894841
5997	1	UPDATE	rol_permiso	3	Se actualizaron los permisos del rol 'Cajero (POS)' (ID: 3). Total asignados: 4.	192.168.1.50	2026-09-13 19:34:21.308503
3364	1	INSERT	usuario	789	Alta de usuario 'Carlos Recuperador' (qa_recovery_user@fashionstore.com) con rol id=4.	192.168.1.50	2026-09-13 09:58:33.259073
5998	1	UPDATE	rol_permiso	3	Se actualizaron los permisos del rol 'Cajero (POS)' (ID: 3). Total asignados: 0.	192.168.1.50	2026-09-13 19:34:21.416246
3366	1	INSERT	usuario	790	Alta de usuario 'Carlos Recuperador' (qa_recovery_user@fashionstore.com) con rol id=4.	192.168.1.50	2026-09-13 09:58:33.747475
3367	1	INSERT	usuario	791	Alta de usuario 'Carlos Recuperador' (qa_recovery_user@fashionstore.com) con rol id=4.	192.168.1.50	2026-09-13 09:58:34.135791
5999	1	INSERT	usuario	1117	Alta de usuario 'Cajero POS QA' (qa_cajero_rbac@fashionstore.com) con rol id=3.	192.168.1.50	2026-09-13 19:34:21.797056
6645	\N	INSERT	prenda	174	Se registró una nueva prenda con SKU: CAM-BLA-002, Nombre: Camisa Formal Blanca Algodón Egipcio	\N	2026-09-20 08:11:37.894841
3370	1	INSERT	usuario	792	Alta de usuario 'Carlos Recuperador' (qa_recovery_user@fashionstore.com) con rol id=4.	192.168.1.50	2026-09-13 09:58:34.875134
6001	1	UPDATE	rol_permiso	3	Se actualizaron los permisos del rol 'Cajero (POS)' (ID: 3). Total asignados: 5.	192.168.1.50	2026-09-13 19:34:22.384543
3372	1	INSERT	usuario	794	Alta de usuario 'Carlos Recuperador' (qa_recovery_user@fashionstore.com) con rol id=4.	192.168.1.50	2026-09-13 09:58:35.914984
6002	1	UPDATE	rol_permiso	3	Se actualizaron los permisos del rol 'Cajero (POS)' (ID: 3). Total asignados: 4.	192.168.1.50	2026-09-13 19:34:22.532547
3374	1	INSERT	usuario	795	Alta de usuario 'Carlos Recuperador' (qa_recovery_user@fashionstore.com) con rol id=4.	192.168.1.50	2026-09-13 09:58:36.535555
6003	1	INSERT	usuario	1118	Alta de usuario 'Cajero POS QA' (qa_cajero_rbac@fashionstore.com) con rol id=3.	192.168.1.50	2026-09-13 19:34:22.708188
6005	1	UPDATE	rol_permiso	3	Se actualizaron los permisos del rol 'Cajero (POS)' (ID: 3). Total asignados: 5.	192.168.1.50	2026-09-13 19:34:23.364089
6006	1	LOGIN_EXITOSO	usuario	1	Inicio de sesión exitoso de 'Alejandro Sistemas' (admin@fashionstore.com) con rol 'Administrador'.	172.20.0.1	2026-09-13 19:34:28.214457
3379	1	INSERT	usuario	796	Alta de usuario 'Carlos Recuperador' (qa_recovery_user@fashionstore.com) con rol id=4.	192.168.1.50	2026-09-13 09:58:37.831387
6007	1	INSERT	usuario	1119	Alta de usuario 'Carlos Recuperador' (qa_recovery_user@fashionstore.com) con rol id=4.	192.168.1.50	2026-09-13 19:34:28.430096
6009	1	INSERT	usuario	1120	Alta de usuario 'Carlos Recuperador' (qa_recovery_user@fashionstore.com) con rol id=4.	192.168.1.50	2026-09-13 19:34:28.884393
3383	1	INSERT	cliente	42	Alta del cliente 'Lucía Morales Paz' (CI 88997711).	192.168.40.1	2026-09-13 09:58:39.083029
3384	1	UPDATE	cliente	42	Modificación del cliente CI 88997711. Campos: nombre_completo=Lucía Morales de Mendoza, telefono=78999999.	192.168.40.2	2026-09-13 09:58:39.499533
3385	1	INACTIVAR	cliente	42	Baja lógica del cliente 'Lucía Morales de Mendoza' (CI 88997711).	192.168.40.3	2026-09-13 09:58:39.555347
6012	1	INSERT	usuario	1121	Alta de usuario 'Carlos Recuperador' (qa_recovery_user@fashionstore.com) con rol id=4.	192.168.1.50	2026-09-13 19:34:29.336665
6014	1	INSERT	usuario	1122	Alta de usuario 'Carlos Recuperador' (qa_recovery_user@fashionstore.com) con rol id=4.	192.168.1.50	2026-09-13 19:34:29.796583
3403	\N	LOGIN_FALLIDO	usuario	\N	Intento de inicio de sesión fallido para el correo: no_existe_seguro@fashionstore.com (correo no registrado).	192.168.99.99	2026-09-13 09:58:42.959299
3404	1	UPDATE	rol_permiso	3	Se actualizaron los permisos del rol 'Cajero (POS)' (ID: 3). Total asignados: 3.	198.51.100.22	2026-09-13 09:58:43.233481
3405	1	INSERT	usuario	797	Alta de usuario 'Audit CU04' (qa_bitacora_cu04@fashionstore.com) con rol id=4.	192.168.1.50	2026-09-13 09:58:43.399087
3409	1	LOGIN_EXITOSO	usuario	1	Inicio de sesión exitoso de 'Alejandro Sistemas' (admin@fashionstore.com) con rol 'Administrador'.	192.168.10.101	2026-09-13 09:59:44.330918
3410	1	LOGIN_EXITOSO	usuario	1	Inicio de sesión exitoso de 'Alejandro Sistemas' (admin@fashionstore.com) con rol 'Administrador'.	172.20.0.1	2026-09-13 09:59:44.562466
3411	1	LOGIN_FALLIDO	usuario	1	Intento de inicio de sesión fallido para el correo: admin@fashionstore.com (contraseña incorrecta).	192.168.10.102	2026-09-13 09:59:44.821713
3412	\N	LOGIN_FALLIDO	usuario	\N	Intento de inicio de sesión fallido para el correo: no_existe_qa_999@fashionstore.com (correo no registrado).	192.168.10.103	2026-09-13 09:59:45.082906
3413	1	LOGIN_EXITOSO	usuario	1	Inicio de sesión exitoso de 'Alejandro Sistemas' (admin@fashionstore.com) con rol 'Administrador'.	172.20.0.1	2026-09-13 09:59:45.354789
3417	1	UPDATE	rol_permiso	3	Se actualizaron los permisos del rol 'Cajero (POS)' (ID: 3). Total asignados: 2.	192.168.1.50	2026-09-13 09:59:47.050886
3418	1	UPDATE	rol_permiso	3	Se actualizaron los permisos del rol 'Cajero (POS)' (ID: 3). Total asignados: 4.	192.168.1.50	2026-09-13 09:59:47.406802
3419	1	UPDATE	rol_permiso	3	Se actualizaron los permisos del rol 'Cajero (POS)' (ID: 3). Total asignados: 0.	192.168.1.50	2026-09-13 09:59:47.522905
3422	1	UPDATE	rol_permiso	3	Se actualizaron los permisos del rol 'Cajero (POS)' (ID: 3). Total asignados: 5.	192.168.1.50	2026-09-13 09:59:48.514632
3423	1	UPDATE	rol_permiso	3	Se actualizaron los permisos del rol 'Cajero (POS)' (ID: 3). Total asignados: 4.	192.168.1.50	2026-09-13 09:59:48.670586
3426	1	UPDATE	rol_permiso	3	Se actualizaron los permisos del rol 'Cajero (POS)' (ID: 3). Total asignados: 5.	192.168.1.50	2026-09-13 09:59:49.518607
3427	1	LOGIN_EXITOSO	usuario	1	Inicio de sesión exitoso de 'Alejandro Sistemas' (admin@fashionstore.com) con rol 'Administrador'.	192.168.10.101	2026-09-13 09:59:57.16973
3428	1	LOGIN_EXITOSO	usuario	1	Inicio de sesión exitoso de 'Alejandro Sistemas' (admin@fashionstore.com) con rol 'Administrador'.	172.20.0.1	2026-09-13 09:59:57.424822
3429	1	LOGIN_FALLIDO	usuario	1	Intento de inicio de sesión fallido para el correo: admin@fashionstore.com (contraseña incorrecta).	192.168.10.102	2026-09-13 09:59:57.701897
3430	\N	LOGIN_FALLIDO	usuario	\N	Intento de inicio de sesión fallido para el correo: no_existe_qa_999@fashionstore.com (correo no registrado).	192.168.10.103	2026-09-13 09:59:57.967016
3431	1	LOGIN_EXITOSO	usuario	1	Inicio de sesión exitoso de 'Alejandro Sistemas' (admin@fashionstore.com) con rol 'Administrador'.	172.20.0.1	2026-09-13 09:59:58.234829
3436	1	UPDATE	usuario	804	Modificación del usuario 'qa_nuevo_cajero@fashionstore.com'. Campos actualizados: nombre=Carlos Alberto, telefono=71122334.	192.168.20.2	2026-09-13 10:00:00.451121
3437	1	INACTIVAR	usuario	804	Baja lógica del usuario 'qa_nuevo_cajero@fashionstore.com': estado cambiado de 'Activo' a 'Inactivo'.	192.168.20.3	2026-09-13 10:00:00.738769
3894	1	UPDATE	rol_permiso	3	Se actualizaron los permisos del rol 'Cajero (POS)' (ID: 3). Total asignados: 5.	192.168.1.50	2026-09-13 10:06:48.729836
3443	1	UPDATE	rol_permiso	3	Se actualizaron los permisos del rol 'Cajero (POS)' (ID: 3). Total asignados: 5.	192.168.1.50	2026-09-13 10:00:02.587135
3444	1	UPDATE	rol_permiso	3	Se actualizaron los permisos del rol 'Cajero (POS)' (ID: 3). Total asignados: 4.	192.168.1.50	2026-09-13 10:00:02.730465
3895	1	INSERT	usuario	916	Alta de usuario 'Carlos Recuperador' (qa_recovery_user@fashionstore.com) con rol id=4.	192.168.1.50	2026-09-13 10:06:49.013595
3447	1	UPDATE	rol_permiso	3	Se actualizaron los permisos del rol 'Cajero (POS)' (ID: 3). Total asignados: 5.	192.168.1.50	2026-09-13 10:00:03.598765
3448	1	INSERT	usuario	807	Alta de usuario 'Carlos Recuperador' (qa_recovery_user@fashionstore.com) con rol id=4.	192.168.1.50	2026-09-13 10:00:03.851032
3897	1	INSERT	usuario	917	Alta de usuario 'Carlos Recuperador' (qa_recovery_user@fashionstore.com) con rol id=4.	192.168.1.50	2026-09-13 10:06:49.46244
3450	1	INSERT	usuario	808	Alta de usuario 'Carlos Recuperador' (qa_recovery_user@fashionstore.com) con rol id=4.	192.168.1.50	2026-09-13 10:00:04.302468
4513	1	INSERT	usuario	1021	Alta de usuario 'Carlos Cajero QA' (qa_nuevo_cajero@fashionstore.com) con rol id=3.	192.168.20.1	2026-09-13 10:46:47.808253
4514	1	UPDATE	usuario	1021	Modificación del usuario 'qa_nuevo_cajero@fashionstore.com'. Campos actualizados: nombre=Carlos Alberto, telefono=71122334.	192.168.20.2	2026-09-13 10:46:48.356624
3453	1	INSERT	usuario	809	Alta de usuario 'Carlos Recuperador' (qa_recovery_user@fashionstore.com) con rol id=4.	192.168.1.50	2026-09-13 10:00:04.75834
4515	1	INACTIVAR	usuario	1021	Baja lógica del usuario 'qa_nuevo_cajero@fashionstore.com': estado cambiado de 'Activo' a 'Inactivo'.	192.168.20.3	2026-09-13 10:46:48.646171
3455	1	INSERT	usuario	810	Alta de usuario 'Carlos Recuperador' (qa_recovery_user@fashionstore.com) con rol id=4.	192.168.1.50	2026-09-13 10:00:05.206976
4516	1	UPDATE	rol_permiso	3	Se actualizaron los permisos del rol 'Cajero (POS)' (ID: 3). Total asignados: 2.	192.168.1.50	2026-09-13 10:46:49.040717
4517	1	UPDATE	rol_permiso	3	Se actualizaron los permisos del rol 'Cajero (POS)' (ID: 3). Total asignados: 4.	192.168.1.50	2026-09-13 10:46:49.380133
4518	1	UPDATE	rol_permiso	3	Se actualizaron los permisos del rol 'Cajero (POS)' (ID: 3). Total asignados: 0.	192.168.1.50	2026-09-13 10:46:49.492979
4519	1	INSERT	usuario	1022	Alta de usuario 'Cajero POS QA' (qa_cajero_rbac@fashionstore.com) con rol id=3.	192.168.1.50	2026-09-13 10:46:49.908327
3460	1	INSERT	usuario	811	Alta de usuario 'Carlos Recuperador' (qa_recovery_user@fashionstore.com) con rol id=4.	192.168.1.50	2026-09-13 10:00:06.45095
3462	1	INSERT	usuario	812	Alta de usuario 'Carlos Recuperador' (qa_recovery_user@fashionstore.com) con rol id=4.	192.168.1.50	2026-09-13 10:00:06.942844
3463	1	INSERT	usuario	813	Alta de usuario 'Carlos Recuperador' (qa_recovery_user@fashionstore.com) con rol id=4.	192.168.1.50	2026-09-13 10:00:07.306761
4521	1	UPDATE	rol_permiso	3	Se actualizaron los permisos del rol 'Cajero (POS)' (ID: 3). Total asignados: 5.	192.168.1.50	2026-09-13 10:46:50.516463
4522	1	UPDATE	rol_permiso	3	Se actualizaron los permisos del rol 'Cajero (POS)' (ID: 3). Total asignados: 4.	192.168.1.50	2026-09-13 10:46:50.664106
3466	1	INSERT	usuario	814	Alta de usuario 'Carlos Recuperador' (qa_recovery_user@fashionstore.com) con rol id=4.	192.168.1.50	2026-09-13 10:00:08.042518
4523	1	INSERT	usuario	1023	Alta de usuario 'Cajero POS QA' (qa_cajero_rbac@fashionstore.com) con rol id=3.	192.168.1.50	2026-09-13 10:46:50.828354
3468	1	INSERT	usuario	816	Alta de usuario 'Carlos Recuperador' (qa_recovery_user@fashionstore.com) con rol id=4.	192.168.1.50	2026-09-13 10:00:09.038907
3470	1	INSERT	usuario	817	Alta de usuario 'Carlos Recuperador' (qa_recovery_user@fashionstore.com) con rol id=4.	192.168.1.50	2026-09-13 10:00:09.591138
6019	1	INSERT	usuario	1123	Alta de usuario 'Carlos Recuperador' (qa_recovery_user@fashionstore.com) con rol id=4.	192.168.1.50	2026-09-13 19:34:31.000615
6021	1	INSERT	usuario	1124	Alta de usuario 'Carlos Recuperador' (qa_recovery_user@fashionstore.com) con rol id=4.	192.168.1.50	2026-09-13 19:34:31.444736
3475	1	INSERT	usuario	818	Alta de usuario 'Carlos Recuperador' (qa_recovery_user@fashionstore.com) con rol id=4.	192.168.1.50	2026-09-13 10:00:10.83048
3479	1	INSERT	cliente	43	Alta del cliente 'Lucía Morales Paz' (CI 88997711).	192.168.40.1	2026-09-13 10:00:12.098917
3480	1	UPDATE	cliente	43	Modificación del cliente CI 88997711. Campos: nombre_completo=Lucía Morales de Mendoza, telefono=78999999.	192.168.40.2	2026-09-13 10:00:12.515167
3481	1	INACTIVAR	cliente	43	Baja lógica del cliente 'Lucía Morales de Mendoza' (CI 88997711).	192.168.40.3	2026-09-13 10:00:12.567516
3499	\N	LOGIN_FALLIDO	usuario	\N	Intento de inicio de sesión fallido para el correo: no_existe_seguro@fashionstore.com (correo no registrado).	192.168.99.99	2026-09-13 10:00:15.925679
3500	1	UPDATE	rol_permiso	3	Se actualizaron los permisos del rol 'Cajero (POS)' (ID: 3). Total asignados: 3.	198.51.100.22	2026-09-13 10:00:16.191552
3501	1	INSERT	usuario	819	Alta de usuario 'Audit CU04' (qa_bitacora_cu04@fashionstore.com) con rol id=4.	192.168.1.50	2026-09-13 10:00:16.30193
3505	\N	INSERT	prenda	99	Se registró una nueva prenda con SKU: AUDIT-SKU-999, Nombre: Auditor Test Prenda	\N	2026-09-13 10:03:03.533682
3506	\N	DELETE	prenda	99	Se eliminó la prenda con SKU: AUDIT-SKU-999	\N	2026-09-13 10:03:03.533682
3507	1	LOGIN_EXITOSO	usuario	1	Inicio de sesión exitoso de 'Alejandro Sistemas' (admin@fashionstore.com) con rol 'Administrador'.	192.168.10.101	2026-09-13 10:03:13.04594
3508	1	LOGIN_EXITOSO	usuario	1	Inicio de sesión exitoso de 'Alejandro Sistemas' (admin@fashionstore.com) con rol 'Administrador'.	172.20.0.1	2026-09-13 10:03:13.421402
3509	1	LOGIN_FALLIDO	usuario	1	Intento de inicio de sesión fallido para el correo: admin@fashionstore.com (contraseña incorrecta).	192.168.10.102	2026-09-13 10:03:13.656832
3510	\N	LOGIN_FALLIDO	usuario	\N	Intento de inicio de sesión fallido para el correo: no_existe_qa_999@fashionstore.com (correo no registrado).	192.168.10.103	2026-09-13 10:03:13.930709
3511	1	LOGIN_EXITOSO	usuario	1	Inicio de sesión exitoso de 'Alejandro Sistemas' (admin@fashionstore.com) con rol 'Administrador'.	172.20.0.1	2026-09-13 10:03:14.20703
3516	1	UPDATE	usuario	822	Modificación del usuario 'qa_nuevo_cajero@fashionstore.com'. Campos actualizados: nombre=Carlos Alberto, telefono=71122334.	192.168.20.2	2026-09-13 10:03:16.406792
3517	1	INACTIVAR	usuario	822	Baja lógica del usuario 'qa_nuevo_cajero@fashionstore.com': estado cambiado de 'Activo' a 'Inactivo'.	192.168.20.3	2026-09-13 10:03:16.691009
3518	1	UPDATE	rol_permiso	3	Se actualizaron los permisos del rol 'Cajero (POS)' (ID: 3). Total asignados: 2.	192.168.1.50	2026-09-13 10:03:17.082874
3519	1	UPDATE	rol_permiso	3	Se actualizaron los permisos del rol 'Cajero (POS)' (ID: 3). Total asignados: 4.	192.168.1.50	2026-09-13 10:03:17.43078
3520	1	UPDATE	rol_permiso	3	Se actualizaron los permisos del rol 'Cajero (POS)' (ID: 3). Total asignados: 0.	192.168.1.50	2026-09-13 10:03:17.595235
4525	1	UPDATE	rol_permiso	3	Se actualizaron los permisos del rol 'Cajero (POS)' (ID: 3). Total asignados: 5.	192.168.1.50	2026-09-13 10:46:51.484111
4526	1	INSERT	usuario	1024	Alta de usuario 'Carlos Recuperador' (qa_recovery_user@fashionstore.com) con rol id=4.	192.168.1.50	2026-09-13 10:46:51.744135
6646	\N	INSERT	prenda	175	Se registró una nueva prenda con SKU: CAM-LEN-003, Nombre: Camisa Leñadora Cuadros Tartán	\N	2026-09-20 08:11:37.894841
3540	1	INSERT	usuario	829	Alta de usuario 'Carlos Recuperador' (qa_recovery_user@fashionstore.com) con rol id=4.	192.168.1.50	2026-09-13 10:03:22.522836
4528	1	INSERT	usuario	1025	Alta de usuario 'Carlos Recuperador' (qa_recovery_user@fashionstore.com) con rol id=4.	192.168.1.50	2026-09-13 10:46:52.19873
3542	1	INSERT	usuario	830	Alta de usuario 'Carlos Recuperador' (qa_recovery_user@fashionstore.com) con rol id=4.	192.168.1.50	2026-09-13 10:03:23.031308
3543	1	INSERT	usuario	831	Alta de usuario 'Carlos Recuperador' (qa_recovery_user@fashionstore.com) con rol id=4.	192.168.1.50	2026-09-13 10:03:23.273228
6647	\N	INSERT	prenda	176	Se registró una nueva prenda con SKU: BLU-FLO-001, Nombre: Blusa de Seda Estampada Floral	\N	2026-09-20 08:11:37.894841
3546	1	INSERT	usuario	832	Alta de usuario 'Carlos Recuperador' (qa_recovery_user@fashionstore.com) con rol id=4.	192.168.1.50	2026-09-13 10:03:24.01468
4531	1	INSERT	usuario	1026	Alta de usuario 'Carlos Recuperador' (qa_recovery_user@fashionstore.com) con rol id=4.	192.168.1.50	2026-09-13 10:46:52.652132
3548	1	INSERT	usuario	834	Alta de usuario 'Carlos Recuperador' (qa_recovery_user@fashionstore.com) con rol id=4.	192.168.1.50	2026-09-13 10:03:24.906926
3550	1	INSERT	usuario	835	Alta de usuario 'Carlos Recuperador' (qa_recovery_user@fashionstore.com) con rol id=4.	192.168.1.50	2026-09-13 10:03:25.518822
4533	1	INSERT	usuario	1027	Alta de usuario 'Carlos Recuperador' (qa_recovery_user@fashionstore.com) con rol id=4.	192.168.1.50	2026-09-13 10:46:53.100107
3555	1	INSERT	usuario	836	Alta de usuario 'Carlos Recuperador' (qa_recovery_user@fashionstore.com) con rol id=4.	192.168.1.50	2026-09-13 10:03:26.79107
4538	1	INSERT	usuario	1028	Alta de usuario 'Carlos Recuperador' (qa_recovery_user@fashionstore.com) con rol id=4.	192.168.1.50	2026-09-13 10:46:54.332216
3559	1	INSERT	cliente	44	Alta del cliente 'Lucía Morales Paz' (CI 88997711).	192.168.40.1	2026-09-13 10:03:28.022876
3560	1	UPDATE	cliente	44	Modificación del cliente CI 88997711. Campos: nombre_completo=Lucía Morales de Mendoza, telefono=78999999.	192.168.40.2	2026-09-13 10:03:28.439004
3561	1	INACTIVAR	cliente	44	Baja lógica del cliente 'Lucía Morales de Mendoza' (CI 88997711).	192.168.40.3	2026-09-13 10:03:28.501077
4540	1	INSERT	usuario	1029	Alta de usuario 'Carlos Recuperador' (qa_recovery_user@fashionstore.com) con rol id=4.	192.168.1.50	2026-09-13 10:46:54.796836
4541	1	INSERT	usuario	1030	Alta de usuario 'Carlos Recuperador' (qa_recovery_user@fashionstore.com) con rol id=4.	192.168.1.50	2026-09-13 10:46:55.160377
3579	\N	LOGIN_FALLIDO	usuario	\N	Intento de inicio de sesión fallido para el correo: no_existe_seguro@fashionstore.com (correo no registrado).	192.168.99.99	2026-09-13 10:03:31.918574
3580	1	UPDATE	rol_permiso	3	Se actualizaron los permisos del rol 'Cajero (POS)' (ID: 3). Total asignados: 3.	198.51.100.22	2026-09-13 10:03:32.200115
3581	1	INSERT	usuario	837	Alta de usuario 'Audit CU04' (qa_bitacora_cu04@fashionstore.com) con rol id=4.	192.168.1.50	2026-09-13 10:03:32.362677
3585	1	LOGIN_EXITOSO	usuario	1	Inicio de sesión exitoso de 'Alejandro Sistemas' (admin@fashionstore.com) con rol 'Administrador'.	172.20.0.1	2026-09-13 10:04:24.858796
3586	1	INSERT	usuario	838	Alta de usuario 'Carlos Recuperador' (qa_recovery_user@fashionstore.com) con rol id=4.	192.168.1.50	2026-09-13 10:04:25.079281
3588	1	INSERT	usuario	839	Alta de usuario 'Carlos Recuperador' (qa_recovery_user@fashionstore.com) con rol id=4.	192.168.1.50	2026-09-13 10:04:25.548467
3591	1	INSERT	usuario	840	Alta de usuario 'Carlos Recuperador' (qa_recovery_user@fashionstore.com) con rol id=4.	192.168.1.50	2026-09-13 10:04:26.003863
3593	1	INSERT	usuario	841	Alta de usuario 'Carlos Recuperador' (qa_recovery_user@fashionstore.com) con rol id=4.	192.168.1.50	2026-09-13 10:04:26.460273
3598	1	INSERT	usuario	842	Alta de usuario 'Carlos Recuperador' (qa_recovery_user@fashionstore.com) con rol id=4.	192.168.1.50	2026-09-13 10:04:27.711927
3600	1	INSERT	usuario	843	Alta de usuario 'Carlos Recuperador' (qa_recovery_user@fashionstore.com) con rol id=4.	192.168.1.50	2026-09-13 10:04:28.168123
3601	1	INSERT	usuario	844	Alta de usuario 'Carlos Recuperador' (qa_recovery_user@fashionstore.com) con rol id=4.	192.168.1.50	2026-09-13 10:04:28.532642
3604	\N	INSERT	prenda	102	Se registró una nueva prenda con SKU: SKU-DIR-TEST-01, Nombre: Prenda Adversarial Test	\N	2026-09-13 10:04:29.349267
3605	\N	DELETE	prenda	102	Se eliminó la prenda con SKU: SKU-DIR-TEST-01	\N	2026-09-13 10:04:29.349267
3606	1	INSERT	usuario	845	Alta de usuario 'Carlos Recuperador' (qa_recovery_user@fashionstore.com) con rol id=4.	192.168.1.50	2026-09-13 10:04:29.268378
3608	1	INSERT	usuario	847	Alta de usuario 'Carlos Recuperador' (qa_recovery_user@fashionstore.com) con rol id=4.	192.168.1.50	2026-09-13 10:04:30.264186
3610	1	INSERT	usuario	848	Alta de usuario 'Carlos Recuperador' (qa_recovery_user@fashionstore.com) con rol id=4.	192.168.1.50	2026-09-13 10:04:30.812536
3615	1	INSERT	usuario	849	Alta de usuario 'Carlos Recuperador' (qa_recovery_user@fashionstore.com) con rol id=4.	192.168.1.50	2026-09-13 10:04:32.044245
3619	1	LOGIN_EXITOSO	usuario	1	Inicio de sesión exitoso de 'Alejandro Sistemas' (admin@fashionstore.com) con rol 'Administrador'.	192.168.10.101	2026-09-13 10:04:37.152856
3620	1	LOGIN_EXITOSO	usuario	1	Inicio de sesión exitoso de 'Alejandro Sistemas' (admin@fashionstore.com) con rol 'Administrador'.	172.20.0.1	2026-09-13 10:04:37.382452
3621	1	LOGIN_FALLIDO	usuario	1	Intento de inicio de sesión fallido para el correo: admin@fashionstore.com (contraseña incorrecta).	192.168.10.102	2026-09-13 10:04:37.667782
3622	1	LOGIN_EXITOSO	usuario	1	Inicio de sesión exitoso de 'Alejandro Sistemas' (admin@fashionstore.com) con rol 'Administrador'.	192.168.10.101	2026-09-13 10:04:37.827663
3623	\N	LOGIN_FALLIDO	usuario	\N	Intento de inicio de sesión fallido para el correo: no_existe_qa_999@fashionstore.com (correo no registrado).	192.168.10.103	2026-09-13 10:04:37.937082
3624	1	LOGIN_EXITOSO	usuario	1	Inicio de sesión exitoso de 'Alejandro Sistemas' (admin@fashionstore.com) con rol 'Administrador'.	172.20.0.1	2026-09-13 10:04:38.070546
3625	1	LOGIN_EXITOSO	usuario	1	Inicio de sesión exitoso de 'Alejandro Sistemas' (admin@fashionstore.com) con rol 'Administrador'.	172.20.0.1	2026-09-13 10:04:38.220339
3626	1	LOGIN_FALLIDO	usuario	1	Intento de inicio de sesión fallido para el correo: admin@fashionstore.com (contraseña incorrecta).	192.168.10.102	2026-09-13 10:04:38.331518
4602	1	INSERT	usuario	1036	Alta de usuario 'Audit CU04' (qa_bitacora_cu04@fashionstore.com) con rol id=4.	192.168.1.50	2026-09-13 10:47:10.252786
3627	\N	LOGIN_FALLIDO	usuario	\N	Intento de inicio de sesión fallido para el correo: no_existe_qa_999@fashionstore.com (correo no registrado).	192.168.10.103	2026-09-13 10:04:38.599823
3629	1	LOGIN_EXITOSO	usuario	1	Inicio de sesión exitoso de 'Alejandro Sistemas' (admin@fashionstore.com) con rol 'Administrador'.	172.20.0.1	2026-09-13 10:04:38.868173
4544	1	INSERT	usuario	1031	Alta de usuario 'Carlos Recuperador' (qa_recovery_user@fashionstore.com) con rol id=4.	192.168.1.50	2026-09-13 10:46:55.868381
4545	1	INSERT	usuario	1032	Alta de usuario 'Inactivo QA' (qa_user_inactivo_recovery@fashionstore.com) con rol id=4.	192.168.1.50	2026-09-13 10:46:56.504514
4546	1	INSERT	usuario	1033	Alta de usuario 'Carlos Recuperador' (qa_recovery_user@fashionstore.com) con rol id=4.	192.168.1.50	2026-09-13 10:46:56.864148
5858	1	INSERT	usuario	1106	Alta de usuario 'Carlos Recuperador' (qa_recovery_user@fashionstore.com) con rol id=4.	192.168.1.50	2026-09-13 19:32:43.149794
3634	1	UPDATE	usuario	853	Modificación del usuario 'qa_nuevo_cajero@fashionstore.com'. Campos actualizados: nombre=Carlos Alberto, telefono=71122334.	192.168.20.2	2026-09-13 10:04:40.436273
3635	1	INACTIVAR	usuario	853	Baja lógica del usuario 'qa_nuevo_cajero@fashionstore.com': estado cambiado de 'Activo' a 'Inactivo'.	192.168.20.3	2026-09-13 10:04:40.720852
3636	1	UPDATE	rol_permiso	3	Se actualizaron los permisos del rol 'Cajero (POS)' (ID: 3). Total asignados: 2.	192.168.1.50	2026-09-13 10:04:41.223969
3637	1	UPDATE	rol_permiso	3	Se actualizaron los permisos del rol 'Cajero (POS)' (ID: 3). Total asignados: 4.	192.168.1.50	2026-09-13 10:04:41.564359
3638	1	UPDATE	rol_permiso	3	Se actualizaron los permisos del rol 'Cajero (POS)' (ID: 3). Total asignados: 0.	192.168.1.50	2026-09-13 10:04:41.675997
4548	1	INSERT	usuario	1034	Alta de usuario 'Carlos Recuperador' (qa_recovery_user@fashionstore.com) con rol id=4.	192.168.1.50	2026-09-13 10:46:57.416196
3641	1	UPDATE	rol_permiso	3	Se actualizaron los permisos del rol 'Cajero (POS)' (ID: 3). Total asignados: 5.	192.168.1.50	2026-09-13 10:04:42.680498
3642	1	UPDATE	rol_permiso	3	Se actualizaron los permisos del rol 'Cajero (POS)' (ID: 3). Total asignados: 4.	192.168.1.50	2026-09-13 10:04:42.828059
5860	1	INSERT	usuario	1107	Alta de usuario 'Carlos Recuperador' (qa_recovery_user@fashionstore.com) con rol id=4.	192.168.1.50	2026-09-13 19:32:43.633662
5861	1	INSERT	usuario	1108	Alta de usuario 'Carlos Recuperador' (qa_recovery_user@fashionstore.com) con rol id=4.	192.168.1.50	2026-09-13 19:32:43.985645
3645	1	UPDATE	rol_permiso	3	Se actualizaron los permisos del rol 'Cajero (POS)' (ID: 3). Total asignados: 5.	192.168.1.50	2026-09-13 10:04:43.668376
3646	1	INSERT	usuario	856	Alta de usuario 'Carlos Recuperador' (qa_recovery_user@fashionstore.com) con rol id=4.	192.168.1.50	2026-09-13 10:04:43.927578
4553	1	INSERT	usuario	1035	Alta de usuario 'Carlos Recuperador' (qa_recovery_user@fashionstore.com) con rol id=4.	192.168.1.50	2026-09-13 10:46:58.652155
3648	1	LOGIN_EXITOSO	usuario	1	Inicio de sesión exitoso de 'Alejandro Sistemas' (admin@fashionstore.com) con rol 'Administrador'.	172.20.0.1	2026-09-13 10:04:43.969638
3650	1	INSERT	usuario	858	Alta de usuario 'Carlos Recuperador' (qa_recovery_user@fashionstore.com) con rol id=4.	192.168.1.50	2026-09-13 10:04:44.407068
4557	1	INSERT	cliente	53	Alta del cliente 'Lucía Morales Paz' (CI 88997711).	192.168.40.1	2026-09-13 10:46:59.940152
3654	1	UPDATE	rol_permiso	3	Se actualizaron los permisos del rol 'Cajero (POS)' (ID: 3). Total asignados: 2.	192.168.1.50	2026-09-13 10:04:45.039687
3655	1	INSERT	usuario	859	Alta de usuario 'Carlos Recuperador' (qa_recovery_user@fashionstore.com) con rol id=4.	192.168.1.50	2026-09-13 10:04:44.867346
4558	1	UPDATE	cliente	53	Modificación del cliente CI 88997711. Campos: nombre_completo=Lucía Morales de Mendoza, telefono=78999999.	192.168.40.2	2026-09-13 10:47:00.356253
3657	1	UPDATE	rol_permiso	3	Se actualizaron los permisos del rol 'Cajero (POS)' (ID: 3). Total asignados: 4.	192.168.1.50	2026-09-13 10:04:45.395723
3658	1	UPDATE	rol_permiso	3	Se actualizaron los permisos del rol 'Cajero (POS)' (ID: 3). Total asignados: 0.	192.168.1.50	2026-09-13 10:04:45.522832
3659	1	INSERT	usuario	860	Alta de usuario 'Carlos Recuperador' (qa_recovery_user@fashionstore.com) con rol id=4.	192.168.1.50	2026-09-13 10:04:45.327395
4559	1	INACTIVAR	cliente	53	Baja lógica del cliente 'Lucía Morales de Mendoza' (CI 88997711).	192.168.40.3	2026-09-13 10:47:00.406211
4560	1	INSERT	ciudad	124	Alta de la ciudad 'Tarija QA'.	192.168.30.1	2026-09-13 10:47:00.648806
4561	1	INSERT	sucursal	114	Alta de la sucursal 'Sucursal Tarija Centro QA' en la ciudad id=124.	192.168.30.2	2026-09-13 10:47:01.025069
4562	1	UPDATE	sucursal	114	Modificación de la sucursal 'Sucursal Tarija Centro QA'. Campos: direccion=Calle Sucre #789 (Modificado), telefono=66449988.	192.168.30.3	2026-09-13 10:47:01.304204
4563	1	INSERT	categoria	106	Alta de la categoría 'Deportes QA'.	192.168.50.1	2026-09-13 10:47:01.592255
4564	1	INSERT	categoria	107	Alta de la categoría 'Calzado Deportivo QA'.	192.168.1.50	2026-09-13 10:47:01.684274
3666	1	UPDATE	rol_permiso	3	Se actualizaron los permisos del rol 'Cajero (POS)' (ID: 3). Total asignados: 5.	192.168.1.50	2026-09-13 10:04:46.527616
3667	1	UPDATE	rol_permiso	3	Se actualizaron los permisos del rol 'Cajero (POS)' (ID: 3). Total asignados: 4.	192.168.1.50	2026-09-13 10:04:46.688263
3668	1	INSERT	usuario	862	Alta de usuario 'Carlos Recuperador' (qa_recovery_user@fashionstore.com) con rol id=4.	192.168.1.50	2026-09-13 10:04:46.595137
4565	1	UPDATE	categoria	106	Modificación de la categoría 'Deportes QA'. Campos: descripcion=Ropa de running y fitness.	192.168.50.2	2026-09-13 10:47:02.064342
4566	1	INACTIVAR	categoria	107	Baja lógica de la categoría 'Calzado Deportivo QA' (0 prenda(s) asociadas).	192.168.50.3	2026-09-13 10:47:02.169544
3671	1	INSERT	usuario	864	Alta de usuario 'Carlos Recuperador' (qa_recovery_user@fashionstore.com) con rol id=4.	192.168.1.50	2026-09-13 10:04:47.071122
4567	1	INACTIVAR	categoria	106	Baja lógica de la categoría 'Deportes QA' (0 prenda(s) asociadas).	192.168.50.3	2026-09-13 10:47:02.217406
3673	1	UPDATE	rol_permiso	3	Se actualizaron los permisos del rol 'Cajero (POS)' (ID: 3). Total asignados: 5.	192.168.1.50	2026-09-13 10:04:47.523115
3674	1	INSERT	usuario	865	Alta de usuario 'Carlos Recuperador' (qa_recovery_user@fashionstore.com) con rol id=4.	192.168.1.50	2026-09-13 10:04:47.444247
3675	\N	SOLICITUD_RECUPERACION_PASSWORD	usuario_token	596	Solicitud de recuperación de contraseña para el correo: qa_recovery_user@fashionstore.com.	172.20.0.1	2026-09-13 10:04:47.740111
3676	1	INSERT	usuario	866	Alta de usuario 'Carlos Recuperador' (qa_recovery_user@fashionstore.com) con rol id=4.	192.168.1.50	2026-09-13 10:04:47.855104
3678	1	INSERT	usuario	868	Alta de usuario 'Carlos Recuperador' (qa_recovery_user@fashionstore.com) con rol id=4.	192.168.1.50	2026-09-13 10:04:48.850938
3680	1	INSERT	usuario	869	Alta de usuario 'Carlos Recuperador' (qa_recovery_user@fashionstore.com) con rol id=4.	192.168.1.50	2026-09-13 10:04:49.402882
3685	1	INSERT	usuario	870	Alta de usuario 'Carlos Recuperador' (qa_recovery_user@fashionstore.com) con rol id=4.	192.168.1.50	2026-09-13 10:04:50.64684
3689	1	INSERT	cliente	45	Alta del cliente 'Lucía Morales Paz' (CI 88997711).	192.168.40.1	2026-09-13 10:04:51.895123
3690	1	UPDATE	cliente	45	Modificación del cliente CI 88997711. Campos: nombre_completo=Lucía Morales de Mendoza, telefono=78999999.	192.168.40.2	2026-09-13 10:04:52.307004
3691	1	INACTIVAR	cliente	45	Baja lógica del cliente 'Lucía Morales de Mendoza' (CI 88997711).	192.168.40.3	2026-09-13 10:04:52.359308
5862	1	INSERT	usuario	1109	Alta de usuario 'Inactivo QA' (qa_user_inactivo_recovery@fashionstore.com) con rol id=4.	192.168.1.50	2026-09-13 19:32:44.63561
5352	1	INSERT	usuario	1060	Alta de usuario 'Audit CU04' (qa_bitacora_cu04@fashionstore.com) con rol id=4.	192.168.1.50	2026-09-13 19:09:21.749206
3922	1	INSERT	usuario	927	Alta de usuario 'Carlos Recuperador' (qa_recovery_user@fashionstore.com) con rol id=4.	192.168.1.50	2026-09-13 10:06:56.113413
5863	1	INSERT	usuario	1110	Alta de usuario 'Carlos Recuperador' (qa_recovery_user@fashionstore.com) con rol id=4.	192.168.1.50	2026-09-13 19:32:44.997561
5551	1	LOGIN_EXITOSO	usuario	1	Inicio de sesión exitoso de 'Alejandro Sistemas' (admin@fashionstore.com) con rol 'Administrador'.	172.20.0.1	2026-09-13 19:11:10.314303
6648	\N	INSERT	prenda	177	Se registró una nueva prenda con SKU: BLU-HAL-002, Nombre: Blusa Elegante Cuello Halter Crema	\N	2026-09-20 08:11:37.894841
3926	1	INSERT	cliente	47	Alta del cliente 'Lucía Morales Paz' (CI 88997711).	192.168.40.1	2026-09-13 10:06:57.3819
3927	1	UPDATE	cliente	47	Modificación del cliente CI 88997711. Campos: nombre_completo=Lucía Morales de Mendoza, telefono=78999999.	192.168.40.2	2026-09-13 10:06:57.813153
5553	\N	LOGIN_FALLIDO	usuario	\N	Intento de inicio de sesión fallido para el correo: no_existe_seguro@fashionstore.com (correo no registrado).	192.168.99.99	2026-09-13 19:11:10.716154
3709	\N	LOGIN_FALLIDO	usuario	\N	Intento de inicio de sesión fallido para el correo: no_existe_seguro@fashionstore.com (correo no registrado).	192.168.99.99	2026-09-13 10:04:55.795425
3710	1	UPDATE	rol_permiso	3	Se actualizaron los permisos del rol 'Cajero (POS)' (ID: 3). Total asignados: 3.	198.51.100.22	2026-09-13 10:04:56.065967
3711	1	INSERT	usuario	871	Alta de usuario 'Audit CU04' (qa_bitacora_cu04@fashionstore.com) con rol id=4.	192.168.1.50	2026-09-13 10:04:56.179087
3928	1	INACTIVAR	cliente	47	Baja lógica del cliente 'Lucía Morales de Mendoza' (CI 88997711).	192.168.40.3	2026-09-13 10:06:57.865057
5554	1	UPDATE	rol_permiso	3	Se actualizaron los permisos del rol 'Cajero (POS)' (ID: 3). Total asignados: 3.	198.51.100.22	2026-09-13 19:11:10.985893
5555	1	INSERT	usuario	1071	Alta de usuario 'Audit CU04' (qa_bitacora_cu04@fashionstore.com) con rol id=4.	192.168.1.50	2026-09-13 19:11:11.096586
3715	1	LOGIN_EXITOSO	usuario	1	Inicio de sesión exitoso de 'Alejandro Sistemas' (admin@fashionstore.com) con rol 'Administrador'.	192.168.10.101	2026-09-13 10:05:01.831938
3716	1	LOGIN_EXITOSO	usuario	1	Inicio de sesión exitoso de 'Alejandro Sistemas' (admin@fashionstore.com) con rol 'Administrador'.	172.20.0.1	2026-09-13 10:05:02.072332
3717	1	LOGIN_FALLIDO	usuario	1	Intento de inicio de sesión fallido para el correo: admin@fashionstore.com (contraseña incorrecta).	192.168.10.102	2026-09-13 10:05:02.342291
3718	\N	LOGIN_FALLIDO	usuario	\N	Intento de inicio de sesión fallido para el correo: no_existe_qa_999@fashionstore.com (correo no registrado).	192.168.10.103	2026-09-13 10:05:02.607936
3719	1	LOGIN_EXITOSO	usuario	1	Inicio de sesión exitoso de 'Alejandro Sistemas' (admin@fashionstore.com) con rol 'Administrador'.	172.20.0.1	2026-09-13 10:05:02.871112
5865	1	INSERT	usuario	1111	Alta de usuario 'Carlos Recuperador' (qa_recovery_user@fashionstore.com) con rol id=4.	192.168.1.50	2026-09-13 19:32:45.637819
6649	\N	INSERT	prenda	178	Se registró una nueva prenda con SKU: VES-GALA-001, Nombre: Vestido de Noche Escote Cocktail	\N	2026-09-20 08:11:37.894841
5558	1	LOGIN_EXITOSO	usuario	1	Inicio de sesión exitoso de 'Alejandro Sistemas' (admin@fashionstore.com) con rol 'Administrador'.	172.20.0.1	2026-09-13 19:11:16.620532
3724	1	UPDATE	usuario	874	Modificación del usuario 'qa_nuevo_cajero@fashionstore.com'. Campos actualizados: nombre=Carlos Alberto, telefono=71122334.	192.168.20.2	2026-09-13 10:05:05.079076
3725	1	INACTIVAR	usuario	874	Baja lógica del usuario 'qa_nuevo_cajero@fashionstore.com': estado cambiado de 'Activo' a 'Inactivo'.	192.168.20.3	2026-09-13 10:05:05.366821
3726	1	UPDATE	rol_permiso	3	Se actualizaron los permisos del rol 'Cajero (POS)' (ID: 3). Total asignados: 2.	192.168.1.50	2026-09-13 10:05:05.763432
3727	1	UPDATE	rol_permiso	3	Se actualizaron los permisos del rol 'Cajero (POS)' (ID: 3). Total asignados: 4.	192.168.1.50	2026-09-13 10:05:06.107587
3728	1	UPDATE	rol_permiso	3	Se actualizaron los permisos del rol 'Cajero (POS)' (ID: 3). Total asignados: 0.	192.168.1.50	2026-09-13 10:05:06.227174
3731	1	UPDATE	rol_permiso	3	Se actualizaron los permisos del rol 'Cajero (POS)' (ID: 3). Total asignados: 5.	192.168.1.50	2026-09-13 10:05:07.226812
3732	1	UPDATE	rol_permiso	3	Se actualizaron los permisos del rol 'Cajero (POS)' (ID: 3). Total asignados: 4.	192.168.1.50	2026-09-13 10:05:07.371211
3735	1	UPDATE	rol_permiso	3	Se actualizaron los permisos del rol 'Cajero (POS)' (ID: 3). Total asignados: 5.	192.168.1.50	2026-09-13 10:05:08.222988
3736	1	INSERT	usuario	877	Alta de usuario 'Carlos Recuperador' (qa_recovery_user@fashionstore.com) con rol id=4.	192.168.1.50	2026-09-13 10:05:08.479209
3738	1	INSERT	usuario	878	Alta de usuario 'Carlos Recuperador' (qa_recovery_user@fashionstore.com) con rol id=4.	192.168.1.50	2026-09-13 10:05:08.935281
3741	1	INSERT	usuario	879	Alta de usuario 'Carlos Recuperador' (qa_recovery_user@fashionstore.com) con rol id=4.	192.168.1.50	2026-09-13 10:05:09.386867
3743	1	INSERT	usuario	880	Alta de usuario 'Carlos Recuperador' (qa_recovery_user@fashionstore.com) con rol id=4.	192.168.1.50	2026-09-13 10:05:09.875692
3953	1	UPDATE	rol_permiso	3	Se actualizaron los permisos del rol 'Cajero (POS)' (ID: 3). Total asignados: 0.	192.168.1.50	2026-09-13 10:07:31.602713
3970	1	UPDATE	rol_permiso	3	Se actualizaron los permisos del rol 'Cajero (POS)' (ID: 3). Total asignados: 5.	192.168.1.50	2026-09-13 10:08:04.223191
3748	1	INSERT	usuario	881	Alta de usuario 'Carlos Recuperador' (qa_recovery_user@fashionstore.com) con rol id=4.	192.168.1.50	2026-09-13 10:05:11.111699
3971	1	UPDATE	rol_permiso	3	Se actualizaron los permisos del rol 'Cajero (POS)' (ID: 3). Total asignados: 4.	192.168.1.50	2026-09-13 10:08:04.370769
3750	1	INSERT	usuario	882	Alta de usuario 'Carlos Recuperador' (qa_recovery_user@fashionstore.com) con rol id=4.	192.168.1.50	2026-09-13 10:05:11.563061
3751	1	INSERT	usuario	883	Alta de usuario 'Carlos Recuperador' (qa_recovery_user@fashionstore.com) con rol id=4.	192.168.1.50	2026-09-13 10:05:11.923376
3754	1	INSERT	usuario	884	Alta de usuario 'Carlos Recuperador' (qa_recovery_user@fashionstore.com) con rol id=4.	192.168.1.50	2026-09-13 10:05:12.639336
3756	1	INSERT	usuario	886	Alta de usuario 'Carlos Recuperador' (qa_recovery_user@fashionstore.com) con rol id=4.	192.168.1.50	2026-09-13 10:05:13.627363
3758	1	INSERT	usuario	887	Alta de usuario 'Carlos Recuperador' (qa_recovery_user@fashionstore.com) con rol id=4.	192.168.1.50	2026-09-13 10:05:14.17736
4600	\N	LOGIN_FALLIDO	usuario	\N	Intento de inicio de sesión fallido para el correo: no_existe_seguro@fashionstore.com (correo no registrado).	192.168.99.99	2026-09-13 10:47:09.840399
4601	1	UPDATE	rol_permiso	3	Se actualizaron los permisos del rol 'Cajero (POS)' (ID: 3). Total asignados: 3.	198.51.100.22	2026-09-13 10:47:10.138447
6650	\N	INSERT	prenda	179	Se registró una nueva prenda con SKU: VES-MIDI-002, Nombre: Vestido Midi Bohemio Estampado	\N	2026-09-20 08:11:37.894841
3763	1	INSERT	usuario	888	Alta de usuario 'Carlos Recuperador' (qa_recovery_user@fashionstore.com) con rol id=4.	192.168.1.50	2026-09-13 10:05:15.409115
6022	1	INSERT	usuario	1125	Alta de usuario 'Carlos Recuperador' (qa_recovery_user@fashionstore.com) con rol id=4.	192.168.1.50	2026-09-13 19:34:31.812515
3900	1	INSERT	usuario	918	Alta de usuario 'Carlos Recuperador' (qa_recovery_user@fashionstore.com) con rol id=4.	192.168.1.50	2026-09-13 10:06:49.945397
6651	\N	INSERT	prenda	180	Se registró una nueva prenda con SKU: SWT-HOD-001, Nombre: Hoodie Urbano Oversize Camel	\N	2026-09-20 08:11:37.894841
3767	1	INSERT	cliente	46	Alta del cliente 'Lucía Morales Paz' (CI 88997711).	192.168.40.1	2026-09-13 10:05:16.661756
3768	1	UPDATE	cliente	46	Modificación del cliente CI 88997711. Campos: nombre_completo=Lucía Morales de Mendoza, telefono=78999999.	192.168.40.2	2026-09-13 10:05:17.089298
3769	1	INACTIVAR	cliente	46	Baja lógica del cliente 'Lucía Morales de Mendoza' (CI 88997711).	192.168.40.3	2026-09-13 10:05:17.142861
6652	\N	INSERT	prenda	181	Se registró una nueva prenda con SKU: SWT-TOR-002, Nombre: Suéter Tejido Cuello Tortuga Carbón	\N	2026-09-20 08:11:37.894841
6025	1	INSERT	usuario	1126	Alta de usuario 'Carlos Recuperador' (qa_recovery_user@fashionstore.com) con rol id=4.	192.168.1.50	2026-09-13 19:34:32.508397
4844	\N	LOGIN_FALLIDO	usuario	\N	Intento de inicio de sesión fallido para el correo: no_existe_seguro@fashionstore.com (correo no registrado).	192.168.99.99	2026-09-13 19:06:09.773737
6026	1	INSERT	usuario	1127	Alta de usuario 'Inactivo QA' (qa_user_inactivo_recovery@fashionstore.com) con rol id=4.	192.168.1.50	2026-09-13 19:34:33.14054
6027	1	INSERT	usuario	1128	Alta de usuario 'Carlos Recuperador' (qa_recovery_user@fashionstore.com) con rol id=4.	192.168.1.50	2026-09-13 19:34:33.496441
6653	\N	INSERT	prenda	182	Se registró una nueva prenda con SKU: ABR-CAM-001, Nombre: Abrigo Clásico de Paño Camel Long	\N	2026-09-20 08:11:37.894841
6029	1	INSERT	usuario	1129	Alta de usuario 'Carlos Recuperador' (qa_recovery_user@fashionstore.com) con rol id=4.	192.168.1.50	2026-09-13 19:34:34.036547
6654	\N	INSERT	prenda	183	Se registró una nueva prenda con SKU: JEA-SLIM-001, Nombre: Jeans Slim Fit Lavado Índigo	\N	2026-09-20 08:11:37.894841
3902	1	INSERT	usuario	919	Alta de usuario 'Carlos Recuperador' (qa_recovery_user@fashionstore.com) con rol id=4.	192.168.1.50	2026-09-13 10:06:50.425616
6655	\N	INSERT	prenda	184	Se registró una nueva prenda con SKU: JEA-WIDE-002, Nombre: Jeans Tiro Alto Wide Leg Vintage	\N	2026-09-20 08:11:37.894841
3907	1	INSERT	usuario	920	Alta de usuario 'Carlos Recuperador' (qa_recovery_user@fashionstore.com) con rol id=4.	192.168.1.50	2026-09-13 10:06:51.657605
6034	1	INSERT	usuario	1130	Alta de usuario 'Carlos Recuperador' (qa_recovery_user@fashionstore.com) con rol id=4.	192.168.1.50	2026-09-13 19:34:35.232587
3909	1	INSERT	usuario	921	Alta de usuario 'Carlos Recuperador' (qa_recovery_user@fashionstore.com) con rol id=4.	192.168.1.50	2026-09-13 10:06:52.133444
3910	1	INSERT	usuario	922	Alta de usuario 'Carlos Recuperador' (qa_recovery_user@fashionstore.com) con rol id=4.	192.168.1.50	2026-09-13 10:06:52.533746
3787	\N	LOGIN_FALLIDO	usuario	\N	Intento de inicio de sesión fallido para el correo: no_existe_seguro@fashionstore.com (correo no registrado).	192.168.99.99	2026-09-13 10:05:20.677306
3788	1	UPDATE	rol_permiso	3	Se actualizaron los permisos del rol 'Cajero (POS)' (ID: 3). Total asignados: 3.	198.51.100.22	2026-09-13 10:05:20.942697
3789	1	INSERT	usuario	889	Alta de usuario 'Audit CU04' (qa_bitacora_cu04@fashionstore.com) con rol id=4.	192.168.1.50	2026-09-13 10:05:21.049725
3913	1	INSERT	usuario	923	Alta de usuario 'Carlos Recuperador' (qa_recovery_user@fashionstore.com) con rol id=4.	192.168.1.50	2026-09-13 10:06:53.269774
3793	1	LOGIN_EXITOSO	usuario	1	Inicio de sesión exitoso de 'Alejandro Sistemas' (admin@fashionstore.com) con rol 'Administrador'.	172.20.0.1	2026-09-13 10:05:31.636589
6157	1	LOGIN_EXITOSO	usuario	1	Inicio de sesión exitoso de 'Alejandro Sistemas' (admin@fashionstore.com) con rol 'Administrador'.	172.20.0.1	2026-09-13 20:49:04.787032
3796	1	UPDATE	rol_permiso	3	Se actualizaron los permisos del rol 'Cajero (POS)' (ID: 3). Total asignados: 2.	192.168.1.50	2026-09-13 10:05:32.681718
3797	1	UPDATE	rol_permiso	3	Se actualizaron los permisos del rol 'Cajero (POS)' (ID: 3). Total asignados: 4.	192.168.1.50	2026-09-13 10:05:33.029773
3798	1	UPDATE	rol_permiso	3	Se actualizaron los permisos del rol 'Cajero (POS)' (ID: 3). Total asignados: 0.	192.168.1.50	2026-09-13 10:05:33.149254
3915	1	INSERT	usuario	925	Alta de usuario 'Carlos Recuperador' (qa_recovery_user@fashionstore.com) con rol id=4.	192.168.1.50	2026-09-13 10:06:54.29392
3801	1	UPDATE	rol_permiso	3	Se actualizaron los permisos del rol 'Cajero (POS)' (ID: 3). Total asignados: 5.	192.168.1.50	2026-09-13 10:05:34.145205
3802	1	UPDATE	rol_permiso	3	Se actualizaron los permisos del rol 'Cajero (POS)' (ID: 3). Total asignados: 4.	192.168.1.50	2026-09-13 10:05:34.289261
3805	1	UPDATE	rol_permiso	3	Se actualizaron los permisos del rol 'Cajero (POS)' (ID: 3). Total asignados: 5.	192.168.1.50	2026-09-13 10:05:35.129771
3806	1	LOGIN_EXITOSO	usuario	1	Inicio de sesión exitoso de 'Alejandro Sistemas' (admin@fashionstore.com) con rol 'Administrador'.	172.20.0.1	2026-09-13 10:05:40.056081
3807	1	INSERT	usuario	893	Alta de usuario 'Carlos Recuperador' (qa_recovery_user@fashionstore.com) con rol id=4.	192.168.1.50	2026-09-13 10:05:40.281217
3917	1	INSERT	usuario	926	Alta de usuario 'Carlos Recuperador' (qa_recovery_user@fashionstore.com) con rol id=4.	192.168.1.50	2026-09-13 10:06:54.873354
3809	1	INSERT	usuario	894	Alta de usuario 'Carlos Recuperador' (qa_recovery_user@fashionstore.com) con rol id=4.	192.168.1.50	2026-09-13 10:05:40.742142
3812	1	INSERT	usuario	895	Alta de usuario 'Carlos Recuperador' (qa_recovery_user@fashionstore.com) con rol id=4.	192.168.1.50	2026-09-13 10:05:41.201714
3814	1	INSERT	usuario	896	Alta de usuario 'Carlos Recuperador' (qa_recovery_user@fashionstore.com) con rol id=4.	192.168.1.50	2026-09-13 10:05:41.649284
3819	1	INSERT	usuario	897	Alta de usuario 'Carlos Recuperador' (qa_recovery_user@fashionstore.com) con rol id=4.	192.168.1.50	2026-09-13 10:05:42.901452
3821	1	INSERT	usuario	898	Alta de usuario 'Carlos Recuperador' (qa_recovery_user@fashionstore.com) con rol id=4.	192.168.1.50	2026-09-13 10:05:43.35726
3822	1	INSERT	usuario	899	Alta de usuario 'Carlos Recuperador' (qa_recovery_user@fashionstore.com) con rol id=4.	192.168.1.50	2026-09-13 10:05:43.718001
3825	1	INSERT	usuario	900	Alta de usuario 'Carlos Recuperador' (qa_recovery_user@fashionstore.com) con rol id=4.	192.168.1.50	2026-09-13 10:05:44.438153
3827	1	INSERT	usuario	902	Alta de usuario 'Carlos Recuperador' (qa_recovery_user@fashionstore.com) con rol id=4.	192.168.1.50	2026-09-13 10:05:45.428222
3829	1	INSERT	usuario	903	Alta de usuario 'Carlos Recuperador' (qa_recovery_user@fashionstore.com) con rol id=4.	192.168.1.50	2026-09-13 10:05:45.980298
3834	1	INSERT	usuario	904	Alta de usuario 'Carlos Recuperador' (qa_recovery_user@fashionstore.com) con rol id=4.	192.168.1.50	2026-09-13 10:05:47.208508
3974	1	UPDATE	rol_permiso	3	Se actualizaron los permisos del rol 'Cajero (POS)' (ID: 3). Total asignados: 5.	192.168.1.50	2026-09-13 10:08:05.204232
3975	1	INSERT	usuario	934	Alta de usuario 'Carlos Recuperador' (qa_recovery_user@fashionstore.com) con rol id=4.	192.168.1.50	2026-09-13 10:08:05.459266
6656	\N	INSERT	prenda	185	Se registró una nueva prenda con SKU: PAN-CHI-001, Nombre: Pantalón Chino Confort Fit Caqui	\N	2026-09-20 08:11:37.894841
3977	1	INSERT	usuario	935	Alta de usuario 'Carlos Recuperador' (qa_recovery_user@fashionstore.com) con rol id=4.	192.168.1.50	2026-09-13 10:08:05.911004
5366	1	LOGIN_EXITOSO	usuario	1	Inicio de sesión exitoso de 'Alejandro Sistemas' (admin@fashionstore.com) con rol 'Administrador'.	172.20.0.1	2026-09-13 19:09:34.548923
5870	1	INSERT	usuario	1112	Alta de usuario 'Carlos Recuperador' (qa_recovery_user@fashionstore.com) con rol id=4.	192.168.1.50	2026-09-13 19:32:46.88178
3980	1	INSERT	usuario	936	Alta de usuario 'Carlos Recuperador' (qa_recovery_user@fashionstore.com) con rol id=4.	192.168.1.50	2026-09-13 10:08:06.379288
3982	1	INSERT	usuario	937	Alta de usuario 'Carlos Recuperador' (qa_recovery_user@fashionstore.com) con rol id=4.	192.168.1.50	2026-09-13 10:08:06.843077
5874	1	INSERT	cliente	55	Alta del cliente 'Lucía Morales Paz' (CI 88997711).	192.168.40.1	2026-09-13 19:32:48.11734
5875	1	UPDATE	cliente	55	Modificación del cliente CI 88997711. Campos: nombre_completo=Lucía Morales de Mendoza, telefono=78999999.	192.168.40.2	2026-09-13 19:32:48.549413
5876	1	INACTIVAR	cliente	55	Baja lógica del cliente 'Lucía Morales de Mendoza' (CI 88997711).	192.168.40.3	2026-09-13 19:32:48.599089
3987	1	INSERT	usuario	938	Alta de usuario 'Carlos Recuperador' (qa_recovery_user@fashionstore.com) con rol id=4.	192.168.1.50	2026-09-13 10:08:08.107235
5877	1	INSERT	ciudad	167	Alta de la ciudad 'Tarija QA'.	192.168.30.1	2026-09-13 19:32:48.837362
3989	1	INSERT	usuario	939	Alta de usuario 'Carlos Recuperador' (qa_recovery_user@fashionstore.com) con rol id=4.	192.168.1.50	2026-09-13 10:08:08.56318
3990	1	INSERT	usuario	940	Alta de usuario 'Carlos Recuperador' (qa_recovery_user@fashionstore.com) con rol id=4.	192.168.1.50	2026-09-13 10:08:08.939084
5878	1	INSERT	sucursal	118	Alta de la sucursal 'Sucursal Tarija Centro QA' en la ciudad id=167.	192.168.30.2	2026-09-13 19:32:49.20969
5879	1	UPDATE	sucursal	118	Modificación de la sucursal 'Sucursal Tarija Centro QA'. Campos: direccion=Calle Sucre #789 (Modificado), telefono=66449988.	192.168.30.3	2026-09-13 19:32:49.505659
3993	1	INSERT	usuario	941	Alta de usuario 'Carlos Recuperador' (qa_recovery_user@fashionstore.com) con rol id=4.	192.168.1.50	2026-09-13 10:08:09.650985
5880	1	INSERT	categoria	110	Alta de la categoría 'Deportes QA'.	192.168.50.1	2026-09-13 19:32:49.793526
3995	1	INSERT	usuario	943	Alta de usuario 'Carlos Recuperador' (qa_recovery_user@fashionstore.com) con rol id=4.	192.168.1.50	2026-09-13 10:08:10.666905
5881	1	INSERT	categoria	111	Alta de la categoría 'Calzado Deportivo QA'.	192.168.1.50	2026-09-13 19:32:49.88584
3997	1	INSERT	usuario	944	Alta de usuario 'Carlos Recuperador' (qa_recovery_user@fashionstore.com) con rol id=4.	192.168.1.50	2026-09-13 10:08:11.214863
5882	1	UPDATE	categoria	110	Modificación de la categoría 'Deportes QA'. Campos: descripcion=Ropa de running y fitness.	192.168.50.2	2026-09-13 19:32:50.245831
5883	1	INACTIVAR	categoria	111	Baja lógica de la categoría 'Calzado Deportivo QA' (0 prenda(s) asociadas).	192.168.50.3	2026-09-13 19:32:50.350875
5884	1	INACTIVAR	categoria	110	Baja lógica de la categoría 'Deportes QA' (0 prenda(s) asociadas).	192.168.50.3	2026-09-13 19:32:50.39895
4002	1	INSERT	usuario	945	Alta de usuario 'Carlos Recuperador' (qa_recovery_user@fashionstore.com) con rol id=4.	192.168.1.50	2026-09-13 10:08:12.451052
4006	1	INSERT	cliente	48	Alta del cliente 'Lucía Morales Paz' (CI 88997711).	192.168.40.1	2026-09-13 10:08:13.703652
4007	1	UPDATE	cliente	48	Modificación del cliente CI 88997711. Campos: nombre_completo=Lucía Morales de Mendoza, telefono=78999999.	192.168.40.2	2026-09-13 10:08:14.121606
4008	1	INACTIVAR	cliente	48	Baja lógica del cliente 'Lucía Morales de Mendoza' (CI 88997711).	192.168.40.3	2026-09-13 10:08:14.171094
5390	1	LOGIN_EXITOSO	usuario	1	Inicio de sesión exitoso de 'Alejandro Sistemas' (admin@fashionstore.com) con rol 'Administrador'.	172.20.0.1	2026-09-13 19:09:40.672843
4026	\N	LOGIN_FALLIDO	usuario	\N	Intento de inicio de sesión fallido para el correo: no_existe_seguro@fashionstore.com (correo no registrado).	192.168.99.99	2026-09-13 10:08:17.521637
4027	1	UPDATE	rol_permiso	3	Se actualizaron los permisos del rol 'Cajero (POS)' (ID: 3). Total asignados: 3.	198.51.100.22	2026-09-13 10:08:17.807558
4028	1	INSERT	usuario	946	Alta de usuario 'Audit CU04' (qa_bitacora_cu04@fashionstore.com) con rol id=4.	192.168.1.50	2026-09-13 10:08:17.917611
4032	1	LOGIN_EXITOSO	usuario	1	Inicio de sesión exitoso de 'Alejandro Sistemas' (admin@fashionstore.com) con rol 'Administrador'.	192.168.10.101	2026-09-13 10:11:42.853668
4033	1	LOGIN_EXITOSO	usuario	1	Inicio de sesión exitoso de 'Alejandro Sistemas' (admin@fashionstore.com) con rol 'Administrador'.	172.20.0.1	2026-09-13 10:11:43.07104
4034	1	LOGIN_FALLIDO	usuario	1	Intento de inicio de sesión fallido para el correo: admin@fashionstore.com (contraseña incorrecta).	192.168.10.102	2026-09-13 10:11:43.316002
4035	\N	LOGIN_FALLIDO	usuario	\N	Intento de inicio de sesión fallido para el correo: no_existe_qa_999@fashionstore.com (correo no registrado).	192.168.10.103	2026-09-13 10:11:43.565659
4036	1	LOGIN_EXITOSO	usuario	1	Inicio de sesión exitoso de 'Alejandro Sistemas' (admin@fashionstore.com) con rol 'Administrador'.	172.20.0.1	2026-09-13 10:11:43.831794
4041	1	UPDATE	usuario	949	Modificación del usuario 'qa_nuevo_cajero@fashionstore.com'. Campos actualizados: nombre=Carlos Alberto, telefono=71122334.	192.168.20.2	2026-09-13 10:11:45.972809
4042	1	INACTIVAR	usuario	949	Baja lógica del usuario 'qa_nuevo_cajero@fashionstore.com': estado cambiado de 'Activo' a 'Inactivo'.	192.168.20.3	2026-09-13 10:11:46.257635
4043	1	UPDATE	rol_permiso	3	Se actualizaron los permisos del rol 'Cajero (POS)' (ID: 3). Total asignados: 2.	192.168.1.50	2026-09-13 10:11:46.655993
4044	1	UPDATE	rol_permiso	3	Se actualizaron los permisos del rol 'Cajero (POS)' (ID: 3). Total asignados: 4.	192.168.1.50	2026-09-13 10:11:46.999961
4045	1	UPDATE	rol_permiso	3	Se actualizaron los permisos del rol 'Cajero (POS)' (ID: 3). Total asignados: 0.	192.168.1.50	2026-09-13 10:11:47.112157
4048	1	UPDATE	rol_permiso	3	Se actualizaron los permisos del rol 'Cajero (POS)' (ID: 3). Total asignados: 5.	192.168.1.50	2026-09-13 10:11:48.111693
4049	1	UPDATE	rol_permiso	3	Se actualizaron los permisos del rol 'Cajero (POS)' (ID: 3). Total asignados: 4.	192.168.1.50	2026-09-13 10:11:48.255896
4052	1	UPDATE	rol_permiso	3	Se actualizaron los permisos del rol 'Cajero (POS)' (ID: 3). Total asignados: 5.	192.168.1.50	2026-09-13 10:11:49.068493
4053	1	INSERT	usuario	952	Alta de usuario 'Carlos Recuperador' (qa_recovery_user@fashionstore.com) con rol id=4.	192.168.1.50	2026-09-13 10:11:49.319923
4055	1	INSERT	usuario	953	Alta de usuario 'Carlos Recuperador' (qa_recovery_user@fashionstore.com) con rol id=4.	192.168.1.50	2026-09-13 10:11:49.768081
6657	\N	INSERT	prenda	186	Se registró una nueva prenda con SKU: POL-BAS-001, Nombre: Polera Básica Algodón Orgánico Blanca	\N	2026-09-20 08:11:37.894841
4846	1	UPDATE	rol_permiso	3	Se actualizaron los permisos del rol 'Cajero (POS)' (ID: 3). Total asignados: 3.	198.51.100.22	2026-09-13 19:06:10.091033
4058	1	INSERT	usuario	954	Alta de usuario 'Carlos Recuperador' (qa_recovery_user@fashionstore.com) con rol id=4.	192.168.1.50	2026-09-13 10:11:50.228027
6038	1	LOGIN_EXITOSO	usuario	1	Inicio de sesión exitoso de 'Alejandro Sistemas' (admin@fashionstore.com) con rol 'Administrador'.	192.168.10.101	2026-09-13 19:34:50.051135
4060	1	INSERT	usuario	955	Alta de usuario 'Carlos Recuperador' (qa_recovery_user@fashionstore.com) con rol id=4.	192.168.1.50	2026-09-13 10:11:50.66802
5145	\N	LOGIN_FALLIDO	usuario	\N	Intento de inicio de sesión fallido para el correo: no_existe_seguro@fashionstore.com (correo no registrado).	192.168.99.99	2026-09-13 19:07:46.759631
5146	1	UPDATE	rol_permiso	3	Se actualizaron los permisos del rol 'Cajero (POS)' (ID: 3). Total asignados: 3.	198.51.100.22	2026-09-13 19:07:47.022034
5147	1	INSERT	usuario	1051	Alta de usuario 'Audit CU04' (qa_bitacora_cu04@fashionstore.com) con rol id=4.	192.168.1.50	2026-09-13 19:07:47.147561
6039	1	LOGIN_EXITOSO	usuario	1	Inicio de sesión exitoso de 'Alejandro Sistemas' (admin@fashionstore.com) con rol 'Administrador'.	172.20.0.1	2026-09-13 19:34:50.262891
4065	1	INSERT	usuario	956	Alta de usuario 'Carlos Recuperador' (qa_recovery_user@fashionstore.com) con rol id=4.	192.168.1.50	2026-09-13 10:11:51.864002
6040	1	LOGIN_FALLIDO	usuario	1	Intento de inicio de sesión fallido para el correo: admin@fashionstore.com (contraseña incorrecta).	192.168.10.102	2026-09-13 19:34:50.514182
4067	1	INSERT	usuario	957	Alta de usuario 'Carlos Recuperador' (qa_recovery_user@fashionstore.com) con rol id=4.	192.168.1.50	2026-09-13 10:11:52.312307
4068	1	INSERT	usuario	958	Alta de usuario 'Carlos Recuperador' (qa_recovery_user@fashionstore.com) con rol id=4.	192.168.1.50	2026-09-13 10:11:52.676219
5150	1	LOGIN_EXITOSO	usuario	1	Inicio de sesión exitoso de 'Alejandro Sistemas' (admin@fashionstore.com) con rol 'Administrador'.	172.20.0.1	2026-09-13 19:08:00.199827
6041	\N	LOGIN_FALLIDO	usuario	\N	Intento de inicio de sesión fallido para el correo: no_existe_qa_999@fashionstore.com (correo no registrado).	192.168.10.103	2026-09-13 19:34:50.771014
4071	1	INSERT	usuario	959	Alta de usuario 'Carlos Recuperador' (qa_recovery_user@fashionstore.com) con rol id=4.	192.168.1.50	2026-09-13 10:11:53.375848
5152	\N	LOGIN_FALLIDO	usuario	\N	Intento de inicio de sesión fallido para el correo: no_existe_seguro@fashionstore.com (correo no registrado).	192.168.99.99	2026-09-13 19:08:00.630829
4073	1	INSERT	usuario	961	Alta de usuario 'Carlos Recuperador' (qa_recovery_user@fashionstore.com) con rol id=4.	192.168.1.50	2026-09-13 10:11:54.340259
5153	1	UPDATE	rol_permiso	3	Se actualizaron los permisos del rol 'Cajero (POS)' (ID: 3). Total asignados: 3.	198.51.100.22	2026-09-13 19:08:00.908656
4075	1	INSERT	usuario	962	Alta de usuario 'Carlos Recuperador' (qa_recovery_user@fashionstore.com) con rol id=4.	192.168.1.50	2026-09-13 10:11:54.883816
5154	1	INSERT	usuario	1052	Alta de usuario 'Audit CU04' (qa_bitacora_cu04@fashionstore.com) con rol id=4.	192.168.1.50	2026-09-13 19:08:01.018898
6042	1	LOGIN_EXITOSO	usuario	1	Inicio de sesión exitoso de 'Alejandro Sistemas' (admin@fashionstore.com) con rol 'Administrador'.	172.20.0.1	2026-09-13 19:34:51.018418
6658	\N	INSERT	prenda	187	Se registró una nueva prenda con SKU: POL-GRA-002, Nombre: Polera Gráfica Edición Urbana Tokio	\N	2026-09-20 08:11:37.894841
6044	1	INSERT	usuario	1132	Alta de usuario 'Usuario Cliente QA' (qa_cliente_rbac@fashionstore.com) con rol id=4.	192.168.1.50	2026-09-13 19:34:51.979163
4080	1	INSERT	usuario	963	Alta de usuario 'Carlos Recuperador' (qa_recovery_user@fashionstore.com) con rol id=4.	192.168.1.50	2026-09-13 10:11:56.060354
6046	1	INSERT	usuario	1133	Alta de usuario 'Carlos Cajero QA' (qa_nuevo_cajero@fashionstore.com) con rol id=3.	192.168.20.1	2026-09-13 19:34:52.619045
5583	\N	LOGIN_FALLIDO	usuario	\N	Intento de inicio de sesión fallido para el correo: no_existe_seguro@fashionstore.com (correo no registrado).	192.168.99.99	2026-09-13 19:11:22.876625
4084	1	INSERT	cliente	49	Alta del cliente 'Lucía Morales Paz' (CI 88997711).	192.168.40.1	2026-09-13 10:11:57.268239
4085	1	UPDATE	cliente	49	Modificación del cliente CI 88997711. Campos: nombre_completo=Lucía Morales de Mendoza, telefono=78999999.	192.168.40.2	2026-09-13 10:11:57.687979
4086	1	INACTIVAR	cliente	49	Baja lógica del cliente 'Lucía Morales de Mendoza' (CI 88997711).	192.168.40.3	2026-09-13 10:11:57.74076
5584	1	UPDATE	rol_permiso	3	Se actualizaron los permisos del rol 'Cajero (POS)' (ID: 3). Total asignados: 3.	198.51.100.22	2026-09-13 19:11:23.138154
5585	1	INSERT	usuario	1072	Alta de usuario 'Audit CU04' (qa_bitacora_cu04@fashionstore.com) con rol id=4.	192.168.1.50	2026-09-13 19:11:23.248332
6047	1	UPDATE	usuario	1133	Modificación del usuario 'qa_nuevo_cajero@fashionstore.com'. Campos actualizados: nombre=Carlos Alberto, telefono=71122334.	192.168.20.2	2026-09-13 19:34:53.191357
6048	1	INACTIVAR	usuario	1133	Baja lógica del usuario 'qa_nuevo_cajero@fashionstore.com': estado cambiado de 'Activo' a 'Inactivo'.	192.168.20.3	2026-09-13 19:34:53.471402
5588	1	LOGIN_EXITOSO	usuario	1	Inicio de sesión exitoso de 'Alejandro Sistemas' (admin@fashionstore.com) con rol 'Administrador'.	172.20.0.1	2026-09-13 19:11:29.567781
6049	1	UPDATE	rol_permiso	3	Se actualizaron los permisos del rol 'Cajero (POS)' (ID: 3). Total asignados: 2.	192.168.1.50	2026-09-13 19:34:53.867169
6050	1	UPDATE	rol_permiso	3	Se actualizaron los permisos del rol 'Cajero (POS)' (ID: 3). Total asignados: 4.	192.168.1.50	2026-09-13 19:34:54.210953
6051	1	UPDATE	rol_permiso	3	Se actualizaron los permisos del rol 'Cajero (POS)' (ID: 3). Total asignados: 0.	192.168.1.50	2026-09-13 19:34:54.318926
6052	1	INSERT	usuario	1134	Alta de usuario 'Cajero POS QA' (qa_cajero_rbac@fashionstore.com) con rol id=3.	192.168.1.50	2026-09-13 19:34:54.695149
6054	1	UPDATE	rol_permiso	3	Se actualizaron los permisos del rol 'Cajero (POS)' (ID: 3). Total asignados: 5.	192.168.1.50	2026-09-13 19:34:55.282916
6055	1	UPDATE	rol_permiso	3	Se actualizaron los permisos del rol 'Cajero (POS)' (ID: 3). Total asignados: 4.	192.168.1.50	2026-09-13 19:34:55.439131
5597	1	LOGIN_EXITOSO	usuario	1	Inicio de sesión exitoso de 'Alejandro Sistemas' (admin@fashionstore.com) con rol 'Administrador'.	172.20.0.1	2026-09-13 19:11:37.026775
6056	1	INSERT	usuario	1135	Alta de usuario 'Cajero POS QA' (qa_cajero_rbac@fashionstore.com) con rol id=3.	192.168.1.50	2026-09-13 19:34:55.603032
5621	1	INSERT	ciudad	160	Alta de la ciudad 'Pando QA IP Test'.	200.87.100.45	2026-09-13 19:11:43.094604
5622	\N	LOGIN_FALLIDO	usuario	\N	Intento de inicio de sesión fallido para el correo: no_existe_seguro@fashionstore.com (correo no registrado).	192.168.99.99	2026-09-13 19:11:43.282688
5623	1	UPDATE	rol_permiso	3	Se actualizaron los permisos del rol 'Cajero (POS)' (ID: 3). Total asignados: 3.	198.51.100.22	2026-09-13 19:11:43.561396
5624	1	INSERT	usuario	1073	Alta de usuario 'Audit CU04' (qa_bitacora_cu04@fashionstore.com) con rol id=4.	192.168.1.50	2026-09-13 19:11:43.670496
4606	1	LOGIN_EXITOSO	usuario	1	Inicio de sesión exitoso de 'Alejandro Sistemas' (admin@fashionstore.com) con rol 'Administrador'.	172.20.0.1	2026-09-13 18:51:53.6808
5156	1	LOGIN_EXITOSO	usuario	1	Inicio de sesión exitoso de 'Alejandro Sistemas' (admin@fashionstore.com) con rol 'Administrador'.	172.20.0.1	2026-09-13 19:08:01.17272
4608	1	LOGIN_EXITOSO	usuario	1	Inicio de sesión exitoso de 'Alejandro Sistemas' (admin@fashionstore.com) con rol 'Administrador'.	172.20.0.1	2026-09-13 18:52:14.043679
4104	\N	LOGIN_FALLIDO	usuario	\N	Intento de inicio de sesión fallido para el correo: no_existe_seguro@fashionstore.com (correo no registrado).	192.168.99.99	2026-09-13 10:12:01.112065
4105	1	UPDATE	rol_permiso	3	Se actualizaron los permisos del rol 'Cajero (POS)' (ID: 3). Total asignados: 3.	198.51.100.22	2026-09-13 10:12:01.37038
4106	1	INSERT	usuario	964	Alta de usuario 'Audit CU04' (qa_bitacora_cu04@fashionstore.com) con rol id=4.	192.168.1.50	2026-09-13 10:12:01.476189
6659	\N	INSERT	prenda	188	Se registró una nueva prenda con SKU: CALZ-RUN-002, Nombre: Zapatillas Deportivas Pro Runner Neon	\N	2026-09-20 08:11:37.894841
4610	\N	LOGIN_FALLIDO	usuario	\N	Intento de inicio de sesión fallido para el correo: no_existe_seguro@fashionstore.com (correo no registrado).	192.168.99.99	2026-09-13 18:52:14.488847
4110	1	LOGIN_EXITOSO	usuario	1	Inicio de sesión exitoso de 'Alejandro Sistemas' (admin@fashionstore.com) con rol 'Administrador'.	172.20.0.1	2026-09-13 10:16:19.535828
4111	1	LOGIN_EXITOSO	usuario	1	Inicio de sesión exitoso de 'Alejandro Sistemas' (admin@fashionstore.com) con rol 'Administrador'.	172.20.0.1	2026-09-13 10:16:27.572598
4611	1	UPDATE	rol_permiso	3	Se actualizaron los permisos del rol 'Cajero (POS)' (ID: 3). Total asignados: 3.	198.51.100.22	2026-09-13 18:52:14.768479
4612	1	INSERT	usuario	1037	Alta de usuario 'Audit CU04' (qa_bitacora_cu04@fashionstore.com) con rol id=4.	192.168.1.50	2026-09-13 18:52:14.906566
5159	1	LOGIN_EXITOSO	usuario	1	Inicio de sesión exitoso de 'Alejandro Sistemas' (admin@fashionstore.com) con rol 'Administrador'.	172.20.0.1	2026-09-13 19:08:08.357776
6743	\N	UPDATE	prenda	4	Se modificó la prenda. SKU anterior: CALZ-URB-001 -> SKU nuevo: CALZ-URB-001	\N	2026-09-20 10:19:56.568589
4615	1	LOGIN_EXITOSO	usuario	1	Inicio de sesión exitoso de 'Alejandro Sistemas' (admin@fashionstore.com) con rol 'Administrador'.	172.20.0.1	2026-09-13 18:52:20.144656
6744	\N	UPDATE	prenda	171	Se modificó la prenda. SKU anterior: CHQ-DENIM-002 -> SKU nuevo: CHQ-DENIM-002	\N	2026-09-20 10:19:56.568589
6745	\N	UPDATE	prenda	172	Se modificó la prenda. SKU anterior: BLZ-EJE-001 -> SKU nuevo: BLZ-EJE-001	\N	2026-09-20 10:19:56.568589
4119	1	LOGIN_EXITOSO	usuario	1	Inicio de sesión exitoso de 'Alejandro Sistemas' (admin@fashionstore.com) con rol 'Administrador'.	172.20.0.1	2026-09-13 10:16:38.619435
5164	1	LOGIN_EXITOSO	usuario	1	Inicio de sesión exitoso de 'Alejandro Sistemas' (admin@fashionstore.com) con rol 'Administrador'.	172.20.0.1	2026-09-13 19:08:16.94555
6746	\N	UPDATE	prenda	173	Se modificó la prenda. SKU anterior: CAM-OXF-001 -> SKU nuevo: CAM-OXF-001	\N	2026-09-20 10:19:56.568589
6747	\N	UPDATE	prenda	174	Se modificó la prenda. SKU anterior: CAM-BLA-002 -> SKU nuevo: CAM-BLA-002	\N	2026-09-20 10:19:56.568589
6748	\N	UPDATE	prenda	175	Se modificó la prenda. SKU anterior: CAM-LEN-003 -> SKU nuevo: CAM-LEN-003	\N	2026-09-20 10:19:56.568589
6749	\N	UPDATE	prenda	176	Se modificó la prenda. SKU anterior: BLU-FLO-001 -> SKU nuevo: BLU-FLO-001	\N	2026-09-20 10:19:56.568589
6750	\N	UPDATE	prenda	177	Se modificó la prenda. SKU anterior: BLU-HAL-002 -> SKU nuevo: BLU-HAL-002	\N	2026-09-20 10:19:56.568589
6751	\N	UPDATE	prenda	178	Se modificó la prenda. SKU anterior: VES-GALA-001 -> SKU nuevo: VES-GALA-001	\N	2026-09-20 10:19:56.568589
6752	\N	UPDATE	prenda	179	Se modificó la prenda. SKU anterior: VES-MIDI-002 -> SKU nuevo: VES-MIDI-002	\N	2026-09-20 10:19:56.568589
6753	\N	UPDATE	prenda	180	Se modificó la prenda. SKU anterior: SWT-HOD-001 -> SKU nuevo: SWT-HOD-001	\N	2026-09-20 10:19:56.568589
6754	\N	UPDATE	prenda	181	Se modificó la prenda. SKU anterior: SWT-TOR-002 -> SKU nuevo: SWT-TOR-002	\N	2026-09-20 10:19:56.568589
6755	\N	UPDATE	prenda	182	Se modificó la prenda. SKU anterior: ABR-CAM-001 -> SKU nuevo: ABR-CAM-001	\N	2026-09-20 10:19:56.568589
5176	1	LOGIN_EXITOSO	usuario	1	Inicio de sesión exitoso de 'Alejandro Sistemas' (admin@fashionstore.com) con rol 'Administrador'.	172.20.0.1	2026-09-13 19:08:18.737952
6756	\N	UPDATE	prenda	183	Se modificó la prenda. SKU anterior: JEA-SLIM-001 -> SKU nuevo: JEA-SLIM-001	\N	2026-09-20 10:19:56.568589
6757	\N	UPDATE	prenda	184	Se modificó la prenda. SKU anterior: JEA-WIDE-002 -> SKU nuevo: JEA-WIDE-002	\N	2026-09-20 10:19:56.568589
6758	\N	UPDATE	prenda	185	Se modificó la prenda. SKU anterior: PAN-CHI-001 -> SKU nuevo: PAN-CHI-001	\N	2026-09-20 10:19:56.568589
6759	\N	UPDATE	prenda	186	Se modificó la prenda. SKU anterior: POL-BAS-001 -> SKU nuevo: POL-BAS-001	\N	2026-09-20 10:19:56.568589
6760	\N	UPDATE	prenda	187	Se modificó la prenda. SKU anterior: POL-GRA-002 -> SKU nuevo: POL-GRA-002	\N	2026-09-20 10:19:56.568589
4639	1	LOGIN_EXITOSO	usuario	1	Inicio de sesión exitoso de 'Alejandro Sistemas' (admin@fashionstore.com) con rol 'Administrador'.	172.20.0.1	2026-09-13 18:57:00.583501
6761	\N	UPDATE	prenda	188	Se modificó la prenda. SKU anterior: CALZ-RUN-002 -> SKU nuevo: CALZ-RUN-002	\N	2026-09-20 10:19:56.568589
6804	\N	UPDATE	prenda	184	Se modificó la prenda. SKU anterior: JEA-WIDE-002 -> SKU nuevo: JEA-WIDE-002	\N	2026-09-20 10:25:02.183521
6805	\N	UPDATE	prenda	185	Se modificó la prenda. SKU anterior: PAN-CHI-001 -> SKU nuevo: PAN-CHI-001	\N	2026-09-20 10:25:02.183521
6806	\N	UPDATE	prenda	186	Se modificó la prenda. SKU anterior: POL-BAS-001 -> SKU nuevo: POL-BAS-001	\N	2026-09-20 10:25:02.183521
6807	\N	UPDATE	prenda	187	Se modificó la prenda. SKU anterior: POL-GRA-002 -> SKU nuevo: POL-GRA-002	\N	2026-09-20 10:25:02.183521
6808	\N	UPDATE	prenda	188	Se modificó la prenda. SKU anterior: CALZ-RUN-002 -> SKU nuevo: CALZ-RUN-002	\N	2026-09-20 10:25:02.183521
5932	1	INSERT	ciudad	168	Alta de la ciudad 'Pando QA IP Test'.	200.87.100.45	2026-09-13 19:33:00.741318
5933	\N	LOGIN_FALLIDO	usuario	\N	Intento de inicio de sesión fallido para el correo: no_existe_seguro@fashionstore.com (correo no registrado).	192.168.99.99	2026-09-13 19:33:00.92952
4664	\N	LOGIN_FALLIDO	usuario	\N	Intento de inicio de sesión fallido para el correo: no_existe_seguro@fashionstore.com (correo no registrado).	192.168.99.99	2026-09-13 18:57:07.329181
4665	1	UPDATE	rol_permiso	3	Se actualizaron los permisos del rol 'Cajero (POS)' (ID: 3). Total asignados: 3.	198.51.100.22	2026-09-13 18:57:07.607232
4666	1	INSERT	usuario	1038	Alta de usuario 'Audit CU04' (qa_bitacora_cu04@fashionstore.com) con rol id=4.	192.168.1.50	2026-09-13 18:57:07.724948
5934	1	UPDATE	rol_permiso	3	Se actualizaron los permisos del rol 'Cajero (POS)' (ID: 3). Total asignados: 3.	198.51.100.22	2026-09-13 19:33:01.199501
5935	1	INSERT	usuario	1113	Alta de usuario 'Audit CU04' (qa_bitacora_cu04@fashionstore.com) con rol id=4.	192.168.1.50	2026-09-13 19:33:01.309207
4851	1	INSERT	usuario	1043	Alta de usuario 'Audit CU04' (qa_bitacora_cu04@fashionstore.com) con rol id=4.	192.168.1.50	2026-09-13 19:06:10.221386
5940	1	LOGIN_EXITOSO	usuario	1	Inicio de sesión exitoso de 'Alejandro Sistemas' (admin@fashionstore.com) con rol 'Administrador'.	172.20.0.1	2026-09-13 19:33:52.566689
6203	1	LOGIN_EXITOSO	usuario	1	Inicio de sesión exitoso de 'Alejandro Sistemas' (admin@fashionstore.com) con rol 'Administrador'.	172.20.0.1	2026-09-13 21:12:00.471217
6204	1	IA_RECOMENDACION	inventario	4	Recomendación IA (Fallback Catálogo): 1 prendas sugeridas para estilo 'Formal' y ocasión 'Trabajo'.	192.168.1.50	2026-09-13 21:12:01.974073
6205	1	IA_RECOMENDACION	inventario	4	Recomendación IA (Fallback Catálogo): 1 prendas sugeridas para estilo 'Urbano' y ocasión 'General'.	192.168.1.50	2026-09-13 21:12:02.226594
8315	1	INSERT	usuario	1353	Alta de usuario 'Usuario Cliente QA' (qa_cliente_rbac@fashionstore.com) con rol id=4.	192.168.1.50	2026-09-20 19:34:52.724959
6206	1	IA_RECOMENDACION	inventario	4	Recomendación IA (Fallback Catálogo): 1 prendas sugeridas para estilo 'Deportivo' y ocasión 'General'.	192.168.1.50	2026-09-13 21:12:02.278251
6207	1	IA_RECOMENDACION	inventario	4	Recomendación IA (Fallback Catálogo): 1 prendas sugeridas para estilo 'Elegante' y ocasión 'Cena'.	10.0.0.77	2026-09-13 21:12:02.370366
6208	1	IA_ANALITICA_VOZ	inventario	\N	Analítica por voz CU23: 'Cuántas prendas tenemos en stock en todas las sucursales' -> Métrica 'inventario_stock', Resultados=3, PDF=False.	192.168.1.50	2026-09-13 21:12:02.558941
6661	\N	UPDATE	prenda	3	Se modificó la prenda. SKU anterior: CHQ-CUERO-001 -> SKU nuevo: CHQ-CUERO-001	\N	2026-09-20 10:12:08.083986
6210	1	IA_ANALITICA_VOZ	venta	\N	Analítica por voz CU23: 'Generar reporte ejecutivo de ventas globales del mes' -> Métrica 'ventas_total', Resultados=0, PDF=True.	192.168.1.50	2026-09-13 21:12:02.75032
6211	1	IA_ANALITICA_VOZ	inventario	\N	Analítica por voz CU23: 'Reporte de existencias para auditoria' -> Métrica 'inventario_stock', Resultados=3, PDF=False.	172.16.5.99	2026-09-13 21:12:02.80643
6212	1	LOGIN_EXITOSO	usuario	1	Inicio de sesión exitoso de 'Alejandro Sistemas' (admin@fashionstore.com) con rol 'Administrador'.	172.20.0.1	2026-09-13 21:12:09.03626
6213	1	IA_RECOMENDACION	inventario	4	Recomendación IA (Fallback Catálogo): 1 prendas sugeridas para estilo 'Formal' y ocasión 'Trabajo'.	192.168.1.50	2026-09-13 21:12:10.395798
6214	1	LOGIN_EXITOSO	usuario	1	Inicio de sesión exitoso de 'Alejandro Sistemas' (admin@fashionstore.com) con rol 'Administrador'.	172.20.0.1	2026-09-13 21:13:16.16183
6215	1	IA_RECOMENDACION	inventario	4	Recomendación IA (Fallback Catálogo): 1 prendas sugeridas para estilo 'Formal' y ocasión 'Trabajo'.	192.168.1.50	2026-09-13 21:13:16.425382
6216	1	IA_RECOMENDACION	inventario	4	Recomendación IA (Fallback Catálogo): 1 prendas sugeridas para estilo 'Deportivo' y ocasión 'General'.	192.168.1.50	2026-09-13 21:13:16.51757
6217	1	IA_RECOMENDACION	inventario	4	Recomendación IA (Fallback Catálogo): 1 prendas sugeridas para estilo 'Urbano' y ocasión 'General'.	192.168.1.50	2026-09-13 21:13:17.737353
6218	1	IA_RECOMENDACION	inventario	4	Recomendación IA (Fallback Catálogo): 1 prendas sugeridas para estilo 'Elegante' y ocasión 'Cena'.	10.0.0.77	2026-09-13 21:13:17.78944
6219	1	IA_ANALITICA_VOZ	inventario	\N	Analítica por voz CU23: 'Cuántas prendas tenemos en stock en todas las sucursales' -> Métrica 'inventario_stock', Resultados=3, PDF=False.	192.168.1.50	2026-09-13 21:13:17.979463
6662	\N	UPDATE	prenda	4	Se modificó la prenda. SKU anterior: CALZ-URB-001 -> SKU nuevo: CALZ-URB-001	\N	2026-09-20 10:12:08.083986
6221	1	IA_ANALITICA_VOZ	venta	\N	Analítica por voz CU23: 'Generar reporte ejecutivo de ventas globales del mes' -> Métrica 'ventas_total', Resultados=0, PDF=True.	192.168.1.50	2026-09-13 21:13:18.169324
6222	1	IA_ANALITICA_VOZ	inventario	\N	Analítica por voz CU23: 'Reporte de existencias para auditoria' -> Métrica 'inventario_stock', Resultados=3, PDF=False.	172.16.5.99	2026-09-13 21:13:18.225284
6223	1	LOGIN_EXITOSO	usuario	1	Inicio de sesión exitoso de 'Alejandro Sistemas' (admin@fashionstore.com) con rol 'Administrador'.	172.20.0.1	2026-09-13 22:15:36.55822
6224	1	IA_RECOMENDACION	inventario	4	Recomendación IA (Fallback Catálogo): 1 prendas sugeridas para estilo 'Formal' y ocasión 'Trabajo'.	192.168.1.50	2026-09-13 22:15:36.888309
6225	1	IA_RECOMENDACION	inventario	4	Recomendación IA (Fallback Catálogo): 1 prendas sugeridas para estilo 'Deportivo' y ocasión 'General'.	192.168.1.50	2026-09-13 22:15:36.997991
6226	1	IA_RECOMENDACION	inventario	4	Recomendación IA (Fallback Catálogo): 1 prendas sugeridas para estilo 'Urbano' y ocasión 'General'.	192.168.1.50	2026-09-13 22:15:37.099104
6227	1	IA_RECOMENDACION	inventario	4	Recomendación IA (Fallback Catálogo): 1 prendas sugeridas para estilo 'Elegante' y ocasión 'Cena'.	10.0.0.77	2026-09-13 22:15:37.198708
6228	1	IA_ANALITICA_VOZ	inventario	\N	Analítica por voz CU23: 'Cuántas prendas tenemos en stock en todas las sucursales' -> Métrica 'inventario_stock', Resultados=3, PDF=False.	192.168.1.50	2026-09-13 22:15:37.390939
6230	1	IA_ANALITICA_VOZ	venta	\N	Analítica por voz CU23: 'Generar reporte ejecutivo de ventas globales del mes' -> Métrica 'ventas_total', Resultados=0, PDF=True.	192.168.1.50	2026-09-13 22:15:37.602863
6231	1	IA_ANALITICA_VOZ	inventario	\N	Analítica por voz CU23: 'Reporte de existencias para auditoria' -> Métrica 'inventario_stock', Resultados=3, PDF=False.	172.16.5.99	2026-09-13 22:15:37.67839
6232	1	LOGIN_EXITOSO	usuario	1	Inicio de sesión exitoso de 'Alejandro Sistemas' (admin@fashionstore.com) con rol 'Administrador'.	192.168.10.101	2026-09-13 22:16:00.25979
6233	1	LOGIN_EXITOSO	usuario	1	Inicio de sesión exitoso de 'Alejandro Sistemas' (admin@fashionstore.com) con rol 'Administrador'.	172.20.0.1	2026-09-13 22:16:00.550558
6234	1	LOGIN_FALLIDO	usuario	1	Intento de inicio de sesión fallido para el correo: admin@fashionstore.com (contraseña incorrecta).	192.168.10.102	2026-09-13 22:16:00.864395
6235	\N	LOGIN_FALLIDO	usuario	\N	Intento de inicio de sesión fallido para el correo: no_existe_qa_999@fashionstore.com (correo no registrado).	192.168.10.103	2026-09-13 22:16:01.146683
6236	1	LOGIN_EXITOSO	usuario	1	Inicio de sesión exitoso de 'Alejandro Sistemas' (admin@fashionstore.com) con rol 'Administrador'.	172.20.0.1	2026-09-13 22:16:01.409072
6238	1	INSERT	usuario	1154	Alta de usuario 'Usuario Cliente QA' (qa_cliente_rbac@fashionstore.com) con rol id=4.	192.168.1.50	2026-09-13 22:16:02.41913
6240	1	INSERT	usuario	1155	Alta de usuario 'Carlos Cajero QA' (qa_nuevo_cajero@fashionstore.com) con rol id=3.	192.168.20.1	2026-09-13 22:16:03.114145
6241	1	UPDATE	usuario	1155	Modificación del usuario 'qa_nuevo_cajero@fashionstore.com'. Campos actualizados: nombre=Carlos Alberto, telefono=71122334.	192.168.20.2	2026-09-13 22:16:03.674245
6242	1	INACTIVAR	usuario	1155	Baja lógica del usuario 'qa_nuevo_cajero@fashionstore.com': estado cambiado de 'Activo' a 'Inactivo'.	192.168.20.3	2026-09-13 22:16:03.973171
6243	1	UPDATE	rol_permiso	3	Se actualizaron los permisos del rol 'Cajero (POS)' (ID: 3). Total asignados: 2.	192.168.1.50	2026-09-13 22:16:04.442421
6244	1	UPDATE	rol_permiso	3	Se actualizaron los permisos del rol 'Cajero (POS)' (ID: 3). Total asignados: 4.	192.168.1.50	2026-09-13 22:16:04.801509
6245	1	UPDATE	rol_permiso	3	Se actualizaron los permisos del rol 'Cajero (POS)' (ID: 3). Total asignados: 0.	192.168.1.50	2026-09-13 22:16:04.913999
6246	1	INSERT	usuario	1156	Alta de usuario 'Cajero POS QA' (qa_cajero_rbac@fashionstore.com) con rol id=3.	192.168.1.50	2026-09-13 22:16:05.306211
6248	1	UPDATE	rol_permiso	3	Se actualizaron los permisos del rol 'Cajero (POS)' (ID: 3). Total asignados: 5.	192.168.1.50	2026-09-13 22:16:05.921695
6249	1	UPDATE	rol_permiso	3	Se actualizaron los permisos del rol 'Cajero (POS)' (ID: 3). Total asignados: 4.	192.168.1.50	2026-09-13 22:16:06.066414
6250	1	INSERT	usuario	1157	Alta de usuario 'Cajero POS QA' (qa_cajero_rbac@fashionstore.com) con rol id=3.	192.168.1.50	2026-09-13 22:16:06.249784
6252	1	UPDATE	rol_permiso	3	Se actualizaron los permisos del rol 'Cajero (POS)' (ID: 3). Total asignados: 5.	192.168.1.50	2026-09-13 22:16:06.990251
6253	1	INSERT	usuario	1158	Alta de usuario 'Carlos Recuperador' (qa_recovery_user@fashionstore.com) con rol id=4.	192.168.1.50	2026-09-13 22:16:07.249744
6255	1	INSERT	usuario	1159	Alta de usuario 'Carlos Recuperador' (qa_recovery_user@fashionstore.com) con rol id=4.	192.168.1.50	2026-09-13 22:16:07.737689
8483	\N	IA_TRYON	prenda	3	Vestidor Virtual IA (opencv_fallback, 17.15ms) para prenda ID 3.	172.20.0.1	2026-09-20 19:43:08.9094
6258	1	INSERT	usuario	1160	Alta de usuario 'Carlos Recuperador' (qa_recovery_user@fashionstore.com) con rol id=4.	192.168.1.50	2026-09-13 22:16:08.193726
6260	1	INSERT	usuario	1161	Alta de usuario 'Carlos Recuperador' (qa_recovery_user@fashionstore.com) con rol id=4.	192.168.1.50	2026-09-13 22:16:08.646343
6265	1	INSERT	usuario	1162	Alta de usuario 'Carlos Recuperador' (qa_recovery_user@fashionstore.com) con rol id=4.	192.168.1.50	2026-09-13 22:16:09.962106
6267	1	INSERT	usuario	1163	Alta de usuario 'Carlos Recuperador' (qa_recovery_user@fashionstore.com) con rol id=4.	192.168.1.50	2026-09-13 22:16:10.446171
6268	1	INSERT	usuario	1164	Alta de usuario 'Carlos Recuperador' (qa_recovery_user@fashionstore.com) con rol id=4.	192.168.1.50	2026-09-13 22:16:10.854707
6271	1	INSERT	usuario	1165	Alta de usuario 'Carlos Recuperador' (qa_recovery_user@fashionstore.com) con rol id=4.	192.168.1.50	2026-09-13 22:16:11.582984
6272	1	INSERT	usuario	1166	Alta de usuario 'Inactivo QA' (qa_user_inactivo_recovery@fashionstore.com) con rol id=4.	192.168.1.50	2026-09-13 22:16:12.218883
6273	1	INSERT	usuario	1167	Alta de usuario 'Carlos Recuperador' (qa_recovery_user@fashionstore.com) con rol id=4.	192.168.1.50	2026-09-13 22:16:12.618495
6275	1	INSERT	usuario	1168	Alta de usuario 'Carlos Recuperador' (qa_recovery_user@fashionstore.com) con rol id=4.	192.168.1.50	2026-09-13 22:16:13.258807
6280	1	INSERT	usuario	1169	Alta de usuario 'Carlos Recuperador' (qa_recovery_user@fashionstore.com) con rol id=4.	192.168.1.50	2026-09-13 22:16:14.758892
6284	1	INSERT	cliente	57	Alta del cliente 'Lucía Morales Paz' (CI 88997711).	192.168.40.1	2026-09-13 22:16:16.171417
6285	1	UPDATE	cliente	57	Modificación del cliente CI 88997711. Campos: nombre_completo=Lucía Morales de Mendoza, telefono=78999999.	192.168.40.2	2026-09-13 22:16:16.671461
6286	1	INACTIVAR	cliente	57	Baja lógica del cliente 'Lucía Morales de Mendoza' (CI 88997711).	192.168.40.3	2026-09-13 22:16:16.784532
6287	1	INSERT	ciudad	175	Alta de la ciudad 'Tarija QA'.	192.168.30.1	2026-09-13 22:16:17.043207
6288	1	INSERT	sucursal	122	Alta de la sucursal 'Sucursal Tarija Centro QA' en la ciudad id=175.	192.168.30.2	2026-09-13 22:16:17.439667
6289	1	UPDATE	sucursal	122	Modificación de la sucursal 'Sucursal Tarija Centro QA'. Campos: direccion=Calle Sucre #789 (Modificado), telefono=66449988.	192.168.30.3	2026-09-13 22:16:17.759085
6290	1	INSERT	categoria	114	Alta de la categoría 'Deportes QA'.	192.168.50.1	2026-09-13 22:16:18.059115
6291	1	INSERT	categoria	115	Alta de la categoría 'Calzado Deportivo QA'.	192.168.1.50	2026-09-13 22:16:18.187168
6292	1	UPDATE	categoria	114	Modificación de la categoría 'Deportes QA'. Campos: descripcion=Ropa de running y fitness.	192.168.50.2	2026-09-13 22:16:18.599543
6293	1	INACTIVAR	categoria	115	Baja lógica de la categoría 'Calzado Deportivo QA' (0 prenda(s) asociadas).	192.168.50.3	2026-09-13 22:16:18.721141
6294	1	INACTIVAR	categoria	114	Baja lógica de la categoría 'Deportes QA' (0 prenda(s) asociadas).	192.168.50.3	2026-09-13 22:16:18.771986
6485	1	LOGIN_EXITOSO	usuario	1	Inicio de sesión exitoso de 'Alejandro Sistemas' (admin@fashionstore.com) con rol 'Administrador'.	192.168.10.101	2026-09-13 22:18:20.283638
6486	1	LOGIN_EXITOSO	usuario	1	Inicio de sesión exitoso de 'Alejandro Sistemas' (admin@fashionstore.com) con rol 'Administrador'.	172.20.0.1	2026-09-13 22:18:20.53485
6487	1	LOGIN_FALLIDO	usuario	1	Intento de inicio de sesión fallido para el correo: admin@fashionstore.com (contraseña incorrecta).	192.168.10.102	2026-09-13 22:18:20.792882
6488	\N	LOGIN_FALLIDO	usuario	\N	Intento de inicio de sesión fallido para el correo: no_existe_qa_999@fashionstore.com (correo no registrado).	192.168.10.103	2026-09-13 22:18:21.054185
6489	1	LOGIN_EXITOSO	usuario	1	Inicio de sesión exitoso de 'Alejandro Sistemas' (admin@fashionstore.com) con rol 'Administrador'.	172.20.0.1	2026-09-13 22:18:21.314247
6491	1	INSERT	usuario	1191	Alta de usuario 'Usuario Cliente QA' (qa_cliente_rbac@fashionstore.com) con rol id=4.	192.168.1.50	2026-09-13 22:18:22.282098
6493	1	INSERT	usuario	1192	Alta de usuario 'Carlos Cajero QA' (qa_nuevo_cajero@fashionstore.com) con rol id=3.	192.168.20.1	2026-09-13 22:18:22.938373
6494	1	UPDATE	usuario	1192	Modificación del usuario 'qa_nuevo_cajero@fashionstore.com'. Campos actualizados: nombre=Carlos Alberto, telefono=71122334.	192.168.20.2	2026-09-13 22:18:23.482694
6495	1	INACTIVAR	usuario	1192	Baja lógica del usuario 'qa_nuevo_cajero@fashionstore.com': estado cambiado de 'Activo' a 'Inactivo'.	192.168.20.3	2026-09-13 22:18:23.75843
6496	1	UPDATE	rol_permiso	3	Se actualizaron los permisos del rol 'Cajero (POS)' (ID: 3). Total asignados: 2.	192.168.1.50	2026-09-13 22:18:24.15417
6497	1	UPDATE	rol_permiso	3	Se actualizaron los permisos del rol 'Cajero (POS)' (ID: 3). Total asignados: 4.	192.168.1.50	2026-09-13 22:18:24.502213
6498	1	UPDATE	rol_permiso	3	Se actualizaron los permisos del rol 'Cajero (POS)' (ID: 3). Total asignados: 0.	192.168.1.50	2026-09-13 22:18:24.610056
6499	1	INSERT	usuario	1193	Alta de usuario 'Cajero POS QA' (qa_cajero_rbac@fashionstore.com) con rol id=3.	192.168.1.50	2026-09-13 22:18:24.990064
6501	1	UPDATE	rol_permiso	3	Se actualizaron los permisos del rol 'Cajero (POS)' (ID: 3). Total asignados: 5.	192.168.1.50	2026-09-13 22:18:25.597928
6502	1	UPDATE	rol_permiso	3	Se actualizaron los permisos del rol 'Cajero (POS)' (ID: 3). Total asignados: 4.	192.168.1.50	2026-09-13 22:18:25.742041
6503	1	INSERT	usuario	1194	Alta de usuario 'Cajero POS QA' (qa_cajero_rbac@fashionstore.com) con rol id=3.	192.168.1.50	2026-09-13 22:18:25.910524
6505	1	UPDATE	rol_permiso	3	Se actualizaron los permisos del rol 'Cajero (POS)' (ID: 3). Total asignados: 5.	192.168.1.50	2026-09-13 22:18:26.590281
6506	1	INSERT	usuario	1195	Alta de usuario 'Carlos Recuperador' (qa_recovery_user@fashionstore.com) con rol id=4.	192.168.1.50	2026-09-13 22:18:26.841947
6508	1	INSERT	usuario	1196	Alta de usuario 'Carlos Recuperador' (qa_recovery_user@fashionstore.com) con rol id=4.	192.168.1.50	2026-09-13 22:18:27.298335
6663	\N	UPDATE	prenda	171	Se modificó la prenda. SKU anterior: CHQ-DENIM-002 -> SKU nuevo: CHQ-DENIM-002	\N	2026-09-20 10:12:08.083986
6664	\N	UPDATE	prenda	172	Se modificó la prenda. SKU anterior: BLZ-EJE-001 -> SKU nuevo: BLZ-EJE-001	\N	2026-09-20 10:12:08.083986
6665	\N	UPDATE	prenda	173	Se modificó la prenda. SKU anterior: CAM-OXF-001 -> SKU nuevo: CAM-OXF-001	\N	2026-09-20 10:12:08.083986
6666	\N	UPDATE	prenda	174	Se modificó la prenda. SKU anterior: CAM-BLA-002 -> SKU nuevo: CAM-BLA-002	\N	2026-09-20 10:12:08.083986
6667	\N	UPDATE	prenda	175	Se modificó la prenda. SKU anterior: CAM-LEN-003 -> SKU nuevo: CAM-LEN-003	\N	2026-09-20 10:12:08.083986
6668	\N	UPDATE	prenda	176	Se modificó la prenda. SKU anterior: BLU-FLO-001 -> SKU nuevo: BLU-FLO-001	\N	2026-09-20 10:12:08.083986
6669	\N	UPDATE	prenda	177	Se modificó la prenda. SKU anterior: BLU-HAL-002 -> SKU nuevo: BLU-HAL-002	\N	2026-09-20 10:12:08.083986
6670	\N	UPDATE	prenda	178	Se modificó la prenda. SKU anterior: VES-GALA-001 -> SKU nuevo: VES-GALA-001	\N	2026-09-20 10:12:08.083986
6671	\N	UPDATE	prenda	179	Se modificó la prenda. SKU anterior: VES-MIDI-002 -> SKU nuevo: VES-MIDI-002	\N	2026-09-20 10:12:08.083986
6672	\N	UPDATE	prenda	180	Se modificó la prenda. SKU anterior: SWT-HOD-001 -> SKU nuevo: SWT-HOD-001	\N	2026-09-20 10:12:08.083986
6673	\N	UPDATE	prenda	181	Se modificó la prenda. SKU anterior: SWT-TOR-002 -> SKU nuevo: SWT-TOR-002	\N	2026-09-20 10:12:08.083986
6674	\N	UPDATE	prenda	182	Se modificó la prenda. SKU anterior: ABR-CAM-001 -> SKU nuevo: ABR-CAM-001	\N	2026-09-20 10:12:08.083986
6675	\N	UPDATE	prenda	183	Se modificó la prenda. SKU anterior: JEA-SLIM-001 -> SKU nuevo: JEA-SLIM-001	\N	2026-09-20 10:12:08.083986
6676	\N	UPDATE	prenda	184	Se modificó la prenda. SKU anterior: JEA-WIDE-002 -> SKU nuevo: JEA-WIDE-002	\N	2026-09-20 10:12:08.083986
6677	\N	UPDATE	prenda	185	Se modificó la prenda. SKU anterior: PAN-CHI-001 -> SKU nuevo: PAN-CHI-001	\N	2026-09-20 10:12:08.083986
6678	\N	UPDATE	prenda	186	Se modificó la prenda. SKU anterior: POL-BAS-001 -> SKU nuevo: POL-BAS-001	\N	2026-09-20 10:12:08.083986
6679	\N	UPDATE	prenda	187	Se modificó la prenda. SKU anterior: POL-GRA-002 -> SKU nuevo: POL-GRA-002	\N	2026-09-20 10:12:08.083986
6680	\N	UPDATE	prenda	188	Se modificó la prenda. SKU anterior: CALZ-RUN-002 -> SKU nuevo: CALZ-RUN-002	\N	2026-09-20 10:12:08.083986
6762	\N	UPDATE	prenda	3	Se modificó la prenda. SKU anterior: CHQ-CUERO-001 -> SKU nuevo: CHQ-CUERO-001	\N	2026-09-20 10:20:02.39326
8317	1	INSERT	usuario	1354	Alta de usuario 'Carlos Cajero QA' (qa_nuevo_cajero@fashionstore.com) con rol id=3.	192.168.20.1	2026-09-20 19:34:53.341731
6821	1	IA_RECOMENDACION	inventario	180	Recomendación IA (Fallback Catálogo): 6 prendas sugeridas para estilo 'Elegante' y ocasión 'Cena'.	10.0.0.77	2026-09-20 16:13:43.128543
8318	1	UPDATE	usuario	1354	Modificación del usuario 'qa_nuevo_cajero@fashionstore.com'. Campos actualizados: nombre=Carlos Alberto, telefono=71122334.	192.168.20.2	2026-09-20 19:34:53.805474
6838	1	LOGIN_EXITOSO	usuario	1	Inicio de sesión exitoso de 'Alejandro Sistemas' (admin@fashionstore.com) con rol 'Administrador'.	127.0.0.1	2026-09-20 16:18:53.863818
6846	1	LOGIN_EXITOSO	usuario	1	Inicio de sesión exitoso de 'Alejandro Sistemas' (admin@fashionstore.com) con rol 'Administrador'.	127.0.0.1	2026-09-20 16:23:11.587837
6847	1	INSERT	ciudad	183	Alta de la ciudad 'Pando QA IP Test'.	200.87.100.45	2026-09-20 16:23:11.814657
6848	\N	LOGIN_FALLIDO	usuario	\N	Intento de inicio de sesión fallido para el correo: no_existe_seguro@fashionstore.com (correo no registrado).	192.168.99.99	2026-09-20 16:23:12.04301
6849	1	UPDATE	rol_permiso	3	Se actualizaron los permisos del rol 'Cajero (POS)' (ID: 3). Total asignados: 3.	198.51.100.22	2026-09-20 16:23:12.287695
6850	1	INSERT	usuario	1214	Alta de usuario 'Audit CU04' (qa_bitacora_cu04@fashionstore.com) con rol id=4.	192.168.1.50	2026-09-20 16:23:12.622092
6853	\N	IA_TRYON	prenda	3	Vestidor Virtual IA (warping_hsv_local, 23.85ms) para prenda ID 3.	127.0.0.1	2026-09-20 16:25:02.507951
6854	\N	IA_TRYON	prenda	\N	Vestidor Virtual IA (warping_hsv_local, 16.53ms) para prenda ID None.	127.0.0.1	2026-09-20 16:25:02.562463
6855	1	LOGIN_EXITOSO	usuario	1	Inicio de sesión exitoso de 'Alejandro Sistemas' (admin@fashionstore.com) con rol 'Administrador'.	127.0.0.1	2026-09-20 16:25:02.569415
6856	1	IA_TRYON	prenda	\N	Vestidor Virtual IA (warping_hsv_local, 12.37ms) para prenda ID None.	192.168.42.100	2026-09-20 16:25:02.801277
6857	\N	IA_TRYON	prenda	\N	Vestidor Virtual IA (warping_hsv_local, 15.03ms) para prenda ID None.	200.10.20.30	2026-09-20 16:25:03.041417
6858	1	INSERT	ciudad	184	Alta de la ciudad 'Pando QA IP Test'.	200.87.100.45	2026-09-20 16:25:05.08505
6859	\N	LOGIN_FALLIDO	usuario	\N	Intento de inicio de sesión fallido para el correo: no_existe_seguro@fashionstore.com (correo no registrado).	192.168.99.99	2026-09-20 16:25:05.309758
6860	1	UPDATE	rol_permiso	3	Se actualizaron los permisos del rol 'Cajero (POS)' (ID: 3). Total asignados: 3.	198.51.100.22	2026-09-20 16:25:05.543285
6861	1	INSERT	usuario	1215	Alta de usuario 'Audit CU04' (qa_bitacora_cu04@fashionstore.com) con rol id=4.	192.168.1.50	2026-09-20 16:25:05.900012
6864	1	LOGIN_EXITOSO	usuario	1	Inicio de sesión exitoso de 'Alejandro Sistemas' (admin@fashionstore.com) con rol 'Administrador'.	192.168.10.101	2026-09-20 16:26:43.300582
6865	1	LOGIN_EXITOSO	usuario	1	Inicio de sesión exitoso de 'Alejandro Sistemas' (admin@fashionstore.com) con rol 'Administrador'.	127.0.0.1	2026-09-20 16:26:43.540432
6866	1	LOGIN_FALLIDO	usuario	1	Intento de inicio de sesión fallido para el correo: admin@fashionstore.com (contraseña incorrecta).	192.168.10.102	2026-09-20 16:26:43.788572
6867	\N	LOGIN_FALLIDO	usuario	\N	Intento de inicio de sesión fallido para el correo: no_existe_qa_999@fashionstore.com (correo no registrado).	192.168.10.103	2026-09-20 16:26:44.037794
6868	1	LOGIN_EXITOSO	usuario	1	Inicio de sesión exitoso de 'Alejandro Sistemas' (admin@fashionstore.com) con rol 'Administrador'.	127.0.0.1	2026-09-20 16:26:44.26896
6870	1	INSERT	usuario	1217	Alta de usuario 'Usuario Cliente QA' (qa_cliente_rbac@fashionstore.com) con rol id=4.	192.168.1.50	2026-09-20 16:26:45.006603
6872	1	INSERT	usuario	1218	Alta de usuario 'Carlos Cajero QA' (qa_nuevo_cajero@fashionstore.com) con rol id=3.	192.168.20.1	2026-09-20 16:26:45.518741
6873	1	UPDATE	usuario	1218	Modificación del usuario 'qa_nuevo_cajero@fashionstore.com'. Campos actualizados: nombre=Carlos Alberto, telefono=71122334.	192.168.20.2	2026-09-20 16:26:46.105168
6874	1	INACTIVAR	usuario	1218	Baja lógica del usuario 'qa_nuevo_cajero@fashionstore.com': estado cambiado de 'Activo' a 'Inactivo'.	192.168.20.3	2026-09-20 16:26:46.153674
6875	1	UPDATE	rol_permiso	3	Se actualizaron los permisos del rol 'Cajero (POS)' (ID: 3). Total asignados: 2.	192.168.1.50	2026-09-20 16:26:46.22502
6876	1	UPDATE	rol_permiso	3	Se actualizaron los permisos del rol 'Cajero (POS)' (ID: 3). Total asignados: 4.	192.168.1.50	2026-09-20 16:26:46.287873
6877	1	UPDATE	rol_permiso	3	Se actualizaron los permisos del rol 'Cajero (POS)' (ID: 3). Total asignados: 0.	192.168.1.50	2026-09-20 16:26:46.336937
6878	1	INSERT	usuario	1219	Alta de usuario 'Cajero POS QA' (qa_cajero_rbac@fashionstore.com) con rol id=3.	192.168.1.50	2026-09-20 16:26:46.398001
6784	\N	DELETE	prenda	210	Se eliminó la prenda con SKU: TEST-DEBUG-999	\N	2026-09-20 10:21:30.669011
6342	1	IA_RECOMENDACION	inventario	4	Recomendación IA (Fallback Catálogo): 1 prendas sugeridas para estilo 'Formal' y ocasión 'Trabajo'.	192.168.1.50	2026-09-13 22:16:30.882492
6343	1	IA_RECOMENDACION	inventario	4	Recomendación IA (Fallback Catálogo): 1 prendas sugeridas para estilo 'Deportivo' y ocasión 'General'.	192.168.1.50	2026-09-13 22:16:30.978509
6344	1	IA_RECOMENDACION	inventario	4	Recomendación IA (Fallback Catálogo): 1 prendas sugeridas para estilo 'Urbano' y ocasión 'General'.	192.168.1.50	2026-09-13 22:16:31.074738
6345	1	IA_RECOMENDACION	inventario	4	Recomendación IA (Fallback Catálogo): 1 prendas sugeridas para estilo 'Elegante' y ocasión 'Cena'.	10.0.0.77	2026-09-13 22:16:31.170714
6346	1	IA_ANALITICA_VOZ	inventario	\N	Analítica por voz CU23: 'Cuántas prendas tenemos en stock en todas las sucursales' -> Métrica 'inventario_stock', Resultados=4, PDF=False.	192.168.1.50	2026-09-13 22:16:31.354485
8319	1	INACTIVAR	usuario	1354	Baja lógica del usuario 'qa_nuevo_cajero@fashionstore.com': estado cambiado de 'Activo' a 'Inactivo'.	192.168.20.3	2026-09-20 19:34:54.004886
6348	1	IA_ANALITICA_VOZ	venta	\N	Analítica por voz CU23: 'Generar reporte ejecutivo de ventas globales del mes' -> Métrica 'ventas_total', Resultados=0, PDF=True.	192.168.1.50	2026-09-13 22:16:31.546739
6349	1	IA_ANALITICA_VOZ	inventario	\N	Analítica por voz CU23: 'Reporte de existencias para auditoria' -> Métrica 'inventario_stock', Resultados=4, PDF=False.	172.16.5.99	2026-09-13 22:16:31.607045
6350	1	INSERT	ciudad	176	Alta de la ciudad 'Pando QA IP Test'.	200.87.100.45	2026-09-13 22:16:31.707416
6351	\N	LOGIN_FALLIDO	usuario	\N	Intento de inicio de sesión fallido para el correo: no_existe_seguro@fashionstore.com (correo no registrado).	192.168.99.99	2026-09-13 22:16:31.903251
6352	1	UPDATE	rol_permiso	3	Se actualizaron los permisos del rol 'Cajero (POS)' (ID: 3). Total asignados: 3.	198.51.100.22	2026-09-13 22:16:32.17563
6353	1	INSERT	usuario	1170	Alta de usuario 'Audit CU04' (qa_bitacora_cu04@fashionstore.com) con rol id=4.	192.168.1.50	2026-09-13 22:16:32.286891
8320	1	UPDATE	rol_permiso	3	Se actualizaron los permisos del rol 'Cajero (POS)' (ID: 3). Total asignados: 2.	192.168.1.50	2026-09-20 19:34:54.354375
8321	1	UPDATE	rol_permiso	3	Se actualizaron los permisos del rol 'Cajero (POS)' (ID: 3). Total asignados: 4.	192.168.1.50	2026-09-20 19:34:54.57074
6358	1	LOGIN_EXITOSO	usuario	1	Inicio de sesión exitoso de 'Alejandro Sistemas' (admin@fashionstore.com) con rol 'Administrador'.	172.20.0.1	2026-09-13 22:17:12.680856
8322	1	UPDATE	rol_permiso	3	Se actualizaron los permisos del rol 'Cajero (POS)' (ID: 3). Total asignados: 0.	192.168.1.50	2026-09-20 19:34:54.637871
8323	1	INSERT	usuario	1355	Alta de usuario 'Cajero POS QA' (qa_cajero_rbac@fashionstore.com) con rol id=3.	192.168.1.50	2026-09-20 19:34:54.890345
6362	1	INSERT	usuario	1171	Alta de usuario 'Usuario Cliente QA' (qa_cliente_rbac@fashionstore.com) con rol id=4.	192.168.1.50	2026-09-13 22:17:13.516936
6371	1	LOGIN_EXITOSO	usuario	1	Inicio de sesión exitoso de 'Alejandro Sistemas' (admin@fashionstore.com) con rol 'Administrador'.	172.20.0.1	2026-09-13 22:17:18.636148
6375	1	LOGIN_EXITOSO	usuario	1	Inicio de sesión exitoso de 'Alejandro Sistemas' (admin@fashionstore.com) con rol 'Administrador'.	172.20.0.1	2026-09-13 22:17:34.676758
6376	1	INSERT	categoria	116	Alta de la categoría 'Deportes QA'.	192.168.50.1	2026-09-13 22:17:35.036796
6377	1	INSERT	categoria	117	Alta de la categoría 'Calzado Deportivo QA'.	192.168.1.50	2026-09-13 22:17:35.133442
6378	1	UPDATE	categoria	116	Modificación de la categoría 'Deportes QA'. Campos: descripcion=Ropa de running y fitness.	192.168.50.2	2026-09-13 22:17:35.493145
6379	1	INACTIVAR	categoria	117	Baja lógica de la categoría 'Calzado Deportivo QA' (0 prenda(s) asociadas).	192.168.50.3	2026-09-13 22:17:35.598496
6380	1	INACTIVAR	categoria	116	Baja lógica de la categoría 'Deportes QA' (0 prenda(s) asociadas).	192.168.50.3	2026-09-13 22:17:35.645938
6384	1	INSERT	usuario	1172	Alta de usuario 'Usuario Cliente QA' (qa_cliente_rbac@fashionstore.com) con rol id=4.	192.168.1.50	2026-09-13 22:17:36.365228
6511	1	INSERT	usuario	1197	Alta de usuario 'Carlos Recuperador' (qa_recovery_user@fashionstore.com) con rol id=4.	192.168.1.50	2026-09-13 22:18:27.770213
6513	1	INSERT	usuario	1198	Alta de usuario 'Carlos Recuperador' (qa_recovery_user@fashionstore.com) con rol id=4.	192.168.1.50	2026-09-13 22:18:28.221899
6518	1	INSERT	usuario	1199	Alta de usuario 'Carlos Recuperador' (qa_recovery_user@fashionstore.com) con rol id=4.	192.168.1.50	2026-09-13 22:18:29.450237
6520	1	INSERT	usuario	1200	Alta de usuario 'Carlos Recuperador' (qa_recovery_user@fashionstore.com) con rol id=4.	192.168.1.50	2026-09-13 22:18:29.902226
6521	1	INSERT	usuario	1201	Alta de usuario 'Carlos Recuperador' (qa_recovery_user@fashionstore.com) con rol id=4.	192.168.1.50	2026-09-13 22:18:30.269913
6524	1	INSERT	usuario	1202	Alta de usuario 'Carlos Recuperador' (qa_recovery_user@fashionstore.com) con rol id=4.	192.168.1.50	2026-09-13 22:18:30.982003
6525	1	INSERT	usuario	1203	Alta de usuario 'Inactivo QA' (qa_user_inactivo_recovery@fashionstore.com) con rol id=4.	192.168.1.50	2026-09-13 22:18:31.614174
6526	1	INSERT	usuario	1204	Alta de usuario 'Carlos Recuperador' (qa_recovery_user@fashionstore.com) con rol id=4.	192.168.1.50	2026-09-13 22:18:31.974401
6528	1	INSERT	usuario	1205	Alta de usuario 'Carlos Recuperador' (qa_recovery_user@fashionstore.com) con rol id=4.	192.168.1.50	2026-09-13 22:18:32.542418
6533	1	INSERT	usuario	1206	Alta de usuario 'Carlos Recuperador' (qa_recovery_user@fashionstore.com) con rol id=4.	192.168.1.50	2026-09-13 22:18:33.782393
6537	1	INSERT	cliente	59	Alta del cliente 'Lucía Morales Paz' (CI 88997711).	192.168.40.1	2026-09-13 22:18:35.046136
6538	1	UPDATE	cliente	59	Modificación del cliente CI 88997711. Campos: nombre_completo=Lucía Morales de Mendoza, telefono=78999999.	192.168.40.2	2026-09-13 22:18:35.46587
6539	1	INACTIVAR	cliente	59	Baja lógica del cliente 'Lucía Morales de Mendoza' (CI 88997711).	192.168.40.3	2026-09-13 22:18:35.518324
6540	1	INSERT	ciudad	178	Alta de la ciudad 'Tarija QA'.	192.168.30.1	2026-09-13 22:18:36.829906
6541	1	INSERT	sucursal	126	Alta de la sucursal 'Sucursal Tarija Centro QA' en la ciudad id=178.	192.168.30.2	2026-09-13 22:18:37.198618
6542	1	UPDATE	sucursal	126	Modificación de la sucursal 'Sucursal Tarija Centro QA'. Campos: direccion=Calle Sucre #789 (Modificado), telefono=66449988.	192.168.30.3	2026-09-13 22:18:37.474487
6543	1	INSERT	categoria	120	Alta de la categoría 'Deportes QA'.	192.168.50.1	2026-09-13 22:18:37.765335
6544	1	INSERT	categoria	121	Alta de la categoría 'Calzado Deportivo QA'.	192.168.1.50	2026-09-13 22:18:37.862377
6545	1	UPDATE	categoria	120	Modificación de la categoría 'Deportes QA'. Campos: descripcion=Ropa de running y fitness.	192.168.50.2	2026-09-13 22:18:38.229912
6546	1	INACTIVAR	categoria	121	Baja lógica de la categoría 'Calzado Deportivo QA' (0 prenda(s) asociadas).	192.168.50.3	2026-09-13 22:18:38.335073
6547	1	INACTIVAR	categoria	120	Baja lógica de la categoría 'Deportes QA' (0 prenda(s) asociadas).	192.168.50.3	2026-09-13 22:18:38.387847
6681	\N	UPDATE	prenda	3	Se modificó la prenda. SKU anterior: CHQ-CUERO-001 -> SKU nuevo: CHQ-CUERO-001	\N	2026-09-20 10:17:20.92218
6682	\N	UPDATE	prenda	4	Se modificó la prenda. SKU anterior: CALZ-URB-001 -> SKU nuevo: CALZ-URB-001	\N	2026-09-20 10:17:20.92218
6683	\N	UPDATE	prenda	171	Se modificó la prenda. SKU anterior: CHQ-DENIM-002 -> SKU nuevo: CHQ-DENIM-002	\N	2026-09-20 10:17:20.92218
6684	\N	UPDATE	prenda	172	Se modificó la prenda. SKU anterior: BLZ-EJE-001 -> SKU nuevo: BLZ-EJE-001	\N	2026-09-20 10:17:20.92218
6685	\N	UPDATE	prenda	173	Se modificó la prenda. SKU anterior: CAM-OXF-001 -> SKU nuevo: CAM-OXF-001	\N	2026-09-20 10:17:20.92218
6686	\N	UPDATE	prenda	174	Se modificó la prenda. SKU anterior: CAM-BLA-002 -> SKU nuevo: CAM-BLA-002	\N	2026-09-20 10:17:20.92218
6393	1	LOGIN_EXITOSO	usuario	1	Inicio de sesión exitoso de 'Alejandro Sistemas' (admin@fashionstore.com) con rol 'Administrador'.	192.168.10.101	2026-09-13 22:17:42.234387
6394	1	LOGIN_EXITOSO	usuario	1	Inicio de sesión exitoso de 'Alejandro Sistemas' (admin@fashionstore.com) con rol 'Administrador'.	172.20.0.1	2026-09-13 22:17:42.472827
6395	1	LOGIN_FALLIDO	usuario	1	Intento de inicio de sesión fallido para el correo: admin@fashionstore.com (contraseña incorrecta).	192.168.10.102	2026-09-13 22:17:42.731451
6396	\N	LOGIN_FALLIDO	usuario	\N	Intento de inicio de sesión fallido para el correo: no_existe_qa_999@fashionstore.com (correo no registrado).	192.168.10.103	2026-09-13 22:17:42.996509
6700	\N	UPDATE	prenda	188	Se modificó la prenda. SKU anterior: CALZ-RUN-002 -> SKU nuevo: CALZ-RUN-002	\N	2026-09-20 10:17:20.92218
6397	1	LOGIN_EXITOSO	usuario	1	Inicio de sesión exitoso de 'Alejandro Sistemas' (admin@fashionstore.com) con rol 'Administrador'.	172.20.0.1	2026-09-13 22:17:43.260322
6399	1	INSERT	usuario	1174	Alta de usuario 'Usuario Cliente QA' (qa_cliente_rbac@fashionstore.com) con rol id=4.	192.168.1.50	2026-09-13 22:17:44.225129
8325	1	UPDATE	rol_permiso	3	Se actualizaron los permisos del rol 'Cajero (POS)' (ID: 3). Total asignados: 5.	192.168.1.50	2026-09-20 19:34:55.452144
6401	1	INSERT	usuario	1175	Alta de usuario 'Carlos Cajero QA' (qa_nuevo_cajero@fashionstore.com) con rol id=3.	192.168.20.1	2026-09-13 22:17:44.917617
6402	1	UPDATE	usuario	1175	Modificación del usuario 'qa_nuevo_cajero@fashionstore.com'. Campos actualizados: nombre=Carlos Alberto, telefono=71122334.	192.168.20.2	2026-09-13 22:17:45.461202
6403	1	INACTIVAR	usuario	1175	Baja lógica del usuario 'qa_nuevo_cajero@fashionstore.com': estado cambiado de 'Activo' a 'Inactivo'.	192.168.20.3	2026-09-13 22:17:45.741525
6404	1	UPDATE	rol_permiso	3	Se actualizaron los permisos del rol 'Cajero (POS)' (ID: 3). Total asignados: 2.	192.168.1.50	2026-09-13 22:17:46.133208
6405	1	UPDATE	rol_permiso	3	Se actualizaron los permisos del rol 'Cajero (POS)' (ID: 3). Total asignados: 4.	192.168.1.50	2026-09-13 22:17:46.476787
6406	1	UPDATE	rol_permiso	3	Se actualizaron los permisos del rol 'Cajero (POS)' (ID: 3). Total asignados: 0.	192.168.1.50	2026-09-13 22:17:46.589475
6407	1	INSERT	usuario	1176	Alta de usuario 'Cajero POS QA' (qa_cajero_rbac@fashionstore.com) con rol id=3.	192.168.1.50	2026-09-13 22:17:46.97281
8326	1	UPDATE	rol_permiso	3	Se actualizaron los permisos del rol 'Cajero (POS)' (ID: 3). Total asignados: 4.	192.168.1.50	2026-09-20 19:34:55.554538
6409	1	UPDATE	rol_permiso	3	Se actualizaron los permisos del rol 'Cajero (POS)' (ID: 3). Total asignados: 5.	192.168.1.50	2026-09-13 22:17:47.584803
6410	1	UPDATE	rol_permiso	3	Se actualizaron los permisos del rol 'Cajero (POS)' (ID: 3). Total asignados: 4.	192.168.1.50	2026-09-13 22:17:47.737006
6411	1	INSERT	usuario	1177	Alta de usuario 'Cajero POS QA' (qa_cajero_rbac@fashionstore.com) con rol id=3.	192.168.1.50	2026-09-13 22:17:47.901203
8327	1	INSERT	usuario	1356	Alta de usuario 'Cajero POS QA' (qa_cajero_rbac@fashionstore.com) con rol id=3.	192.168.1.50	2026-09-20 19:34:55.679738
6413	1	UPDATE	rol_permiso	3	Se actualizaron los permisos del rol 'Cajero (POS)' (ID: 3). Total asignados: 5.	192.168.1.50	2026-09-13 22:17:48.560894
6414	1	INSERT	usuario	1178	Alta de usuario 'Carlos Recuperador' (qa_recovery_user@fashionstore.com) con rol id=4.	192.168.1.50	2026-09-13 22:17:48.817262
6416	1	INSERT	usuario	1179	Alta de usuario 'Carlos Recuperador' (qa_recovery_user@fashionstore.com) con rol id=4.	192.168.1.50	2026-09-13 22:17:49.273309
6419	1	INSERT	usuario	1180	Alta de usuario 'Carlos Recuperador' (qa_recovery_user@fashionstore.com) con rol id=4.	192.168.1.50	2026-09-13 22:17:49.724913
6421	1	INSERT	usuario	1181	Alta de usuario 'Carlos Recuperador' (qa_recovery_user@fashionstore.com) con rol id=4.	192.168.1.50	2026-09-13 22:17:50.18075
6426	1	INSERT	usuario	1182	Alta de usuario 'Carlos Recuperador' (qa_recovery_user@fashionstore.com) con rol id=4.	192.168.1.50	2026-09-13 22:17:51.440954
6428	1	INSERT	usuario	1183	Alta de usuario 'Carlos Recuperador' (qa_recovery_user@fashionstore.com) con rol id=4.	192.168.1.50	2026-09-13 22:17:51.896952
6429	1	INSERT	usuario	1184	Alta de usuario 'Carlos Recuperador' (qa_recovery_user@fashionstore.com) con rol id=4.	192.168.1.50	2026-09-13 22:17:52.261527
6432	1	INSERT	usuario	1185	Alta de usuario 'Carlos Recuperador' (qa_recovery_user@fashionstore.com) con rol id=4.	192.168.1.50	2026-09-13 22:17:52.980963
6433	1	INSERT	usuario	1186	Alta de usuario 'Inactivo QA' (qa_user_inactivo_recovery@fashionstore.com) con rol id=4.	192.168.1.50	2026-09-13 22:17:53.605179
6434	1	INSERT	usuario	1187	Alta de usuario 'Carlos Recuperador' (qa_recovery_user@fashionstore.com) con rol id=4.	192.168.1.50	2026-09-13 22:17:53.965411
6436	1	INSERT	usuario	1188	Alta de usuario 'Carlos Recuperador' (qa_recovery_user@fashionstore.com) con rol id=4.	192.168.1.50	2026-09-13 22:17:54.513145
6441	1	INSERT	usuario	1189	Alta de usuario 'Carlos Recuperador' (qa_recovery_user@fashionstore.com) con rol id=4.	192.168.1.50	2026-09-13 22:17:55.741375
6445	1	INSERT	cliente	58	Alta del cliente 'Lucía Morales Paz' (CI 88997711).	192.168.40.1	2026-09-13 22:17:56.989442
6446	1	UPDATE	cliente	58	Modificación del cliente CI 88997711. Campos: nombre_completo=Lucía Morales de Mendoza, telefono=78999999.	192.168.40.2	2026-09-13 22:17:57.409142
6447	1	INACTIVAR	cliente	58	Baja lógica del cliente 'Lucía Morales de Mendoza' (CI 88997711).	192.168.40.3	2026-09-13 22:17:57.457556
6448	1	INSERT	ciudad	177	Alta de la ciudad 'Tarija QA'.	192.168.30.1	2026-09-13 22:17:57.693151
6449	1	INSERT	sucursal	124	Alta de la sucursal 'Sucursal Tarija Centro QA' en la ciudad id=177.	192.168.30.2	2026-09-13 22:17:58.060903
6450	1	UPDATE	sucursal	124	Modificación de la sucursal 'Sucursal Tarija Centro QA'. Campos: direccion=Calle Sucre #789 (Modificado), telefono=66449988.	192.168.30.3	2026-09-13 22:17:58.332911
6451	1	INSERT	categoria	118	Alta de la categoría 'Deportes QA'.	192.168.50.1	2026-09-13 22:17:58.617085
6452	1	INSERT	categoria	119	Alta de la categoría 'Calzado Deportivo QA'.	192.168.1.50	2026-09-13 22:17:58.712942
6453	1	UPDATE	categoria	118	Modificación de la categoría 'Deportes QA'. Campos: descripcion=Ropa de running y fitness.	192.168.50.2	2026-09-13 22:17:59.073137
6454	1	INACTIVAR	categoria	119	Baja lógica de la categoría 'Calzado Deportivo QA' (0 prenda(s) asociadas).	192.168.50.3	2026-09-13 22:17:59.176711
6455	1	INACTIVAR	categoria	118	Baja lógica de la categoría 'Deportes QA' (0 prenda(s) asociadas).	192.168.50.3	2026-09-13 22:17:59.222228
6687	\N	UPDATE	prenda	175	Se modificó la prenda. SKU anterior: CAM-LEN-003 -> SKU nuevo: CAM-LEN-003	\N	2026-09-20 10:17:20.92218
6688	\N	UPDATE	prenda	176	Se modificó la prenda. SKU anterior: BLU-FLO-001 -> SKU nuevo: BLU-FLO-001	\N	2026-09-20 10:17:20.92218
6689	\N	UPDATE	prenda	177	Se modificó la prenda. SKU anterior: BLU-HAL-002 -> SKU nuevo: BLU-HAL-002	\N	2026-09-20 10:17:20.92218
6690	\N	UPDATE	prenda	178	Se modificó la prenda. SKU anterior: VES-GALA-001 -> SKU nuevo: VES-GALA-001	\N	2026-09-20 10:17:20.92218
6691	\N	UPDATE	prenda	179	Se modificó la prenda. SKU anterior: VES-MIDI-002 -> SKU nuevo: VES-MIDI-002	\N	2026-09-20 10:17:20.92218
6692	\N	UPDATE	prenda	180	Se modificó la prenda. SKU anterior: SWT-HOD-001 -> SKU nuevo: SWT-HOD-001	\N	2026-09-20 10:17:20.92218
6693	\N	UPDATE	prenda	181	Se modificó la prenda. SKU anterior: SWT-TOR-002 -> SKU nuevo: SWT-TOR-002	\N	2026-09-20 10:17:20.92218
6694	\N	UPDATE	prenda	182	Se modificó la prenda. SKU anterior: ABR-CAM-001 -> SKU nuevo: ABR-CAM-001	\N	2026-09-20 10:17:20.92218
6695	\N	UPDATE	prenda	183	Se modificó la prenda. SKU anterior: JEA-SLIM-001 -> SKU nuevo: JEA-SLIM-001	\N	2026-09-20 10:17:20.92218
6696	\N	UPDATE	prenda	184	Se modificó la prenda. SKU anterior: JEA-WIDE-002 -> SKU nuevo: JEA-WIDE-002	\N	2026-09-20 10:17:20.92218
6697	\N	UPDATE	prenda	185	Se modificó la prenda. SKU anterior: PAN-CHI-001 -> SKU nuevo: PAN-CHI-001	\N	2026-09-20 10:17:20.92218
6698	\N	UPDATE	prenda	186	Se modificó la prenda. SKU anterior: POL-BAS-001 -> SKU nuevo: POL-BAS-001	\N	2026-09-20 10:17:20.92218
6699	\N	UPDATE	prenda	187	Se modificó la prenda. SKU anterior: POL-GRA-002 -> SKU nuevo: POL-GRA-002	\N	2026-09-20 10:17:20.92218
6763	1	LOGIN_EXITOSO	usuario	1	Inicio de sesión exitoso de 'Alejandro Sistemas' (admin@fashionstore.com) con rol 'Administrador'.	127.0.0.1	2026-09-20 10:20:08.548808
6767	1	INSERT	usuario	1211	Alta de usuario 'Usuario Cliente QA' (qa_cliente_rbac@fashionstore.com) con rol id=4.	192.168.1.50	2026-09-20 10:20:09.095529
6776	1	LOGIN_EXITOSO	usuario	1	Inicio de sesión exitoso de 'Alejandro Sistemas' (admin@fashionstore.com) con rol 'Administrador'.	127.0.0.1	2026-09-20 10:20:51.588995
6781	1	LOGIN_EXITOSO	usuario	1	Inicio de sesión exitoso de 'Alejandro Sistemas' (admin@fashionstore.com) con rol 'Administrador'.	127.0.0.1	2026-09-20 10:21:21.742429
6785	1	LOGIN_EXITOSO	usuario	1	Inicio de sesión exitoso de 'Alejandro Sistemas' (admin@fashionstore.com) con rol 'Administrador'.	127.0.0.1	2026-09-20 10:21:38.201556
6809	1	LOGIN_EXITOSO	usuario	1	Inicio de sesión exitoso de 'Alejandro Sistemas' (admin@fashionstore.com) con rol 'Administrador'.	127.0.0.1	2026-09-20 16:12:46.587683
6810	1	INSERT	ciudad	180	Alta de la ciudad 'Pando QA IP Test'.	200.87.100.45	2026-09-20 16:12:46.822561
6811	\N	LOGIN_FALLIDO	usuario	\N	Intento de inicio de sesión fallido para el correo: no_existe_seguro@fashionstore.com (correo no registrado).	192.168.99.99	2026-09-20 16:12:46.967994
6812	1	UPDATE	rol_permiso	3	Se actualizaron los permisos del rol 'Cajero (POS)' (ID: 3). Total asignados: 3.	198.51.100.22	2026-09-20 16:12:47.199394
6813	1	INSERT	usuario	1212	Alta de usuario 'Audit CU04' (qa_bitacora_cu04@fashionstore.com) con rol id=4.	192.168.1.50	2026-09-20 16:12:47.231112
6815	1	LOGIN_EXITOSO	usuario	1	Inicio de sesión exitoso de 'Alejandro Sistemas' (admin@fashionstore.com) con rol 'Administrador'.	127.0.0.1	2026-09-20 16:13:13.692859
6816	1	INSERT	ciudad	181	Alta de la ciudad 'Pando QA IP Test'.	200.87.100.45	2026-09-20 16:13:13.913225
6817	1	LOGIN_EXITOSO	usuario	1	Inicio de sesión exitoso de 'Alejandro Sistemas' (admin@fashionstore.com) con rol 'Administrador'.	127.0.0.1	2026-09-20 16:13:39.726508
6818	1	IA_RECOMENDACION	inventario	180	Recomendación IA (Fallback Catálogo): 3 prendas sugeridas para estilo 'Formal' y ocasión 'Trabajo'.	192.168.1.50	2026-09-20 16:13:39.950607
6819	1	IA_RECOMENDACION	inventario	180	Recomendación IA (Fallback Catálogo): 2 prendas sugeridas para estilo 'Deportivo' y ocasión 'General'.	192.168.1.50	2026-09-20 16:13:40.43049
6820	1	IA_RECOMENDACION	inventario	180	Recomendación IA (Fallback Catálogo): 5 prendas sugeridas para estilo 'Urbano' y ocasión 'General'.	192.168.1.50	2026-09-20 16:13:42.857334
6822	1	LOGIN_EXITOSO	usuario	1	Inicio de sesión exitoso de 'Alejandro Sistemas' (admin@fashionstore.com) con rol 'Administrador'.	127.0.0.1	2026-09-20 16:13:49.913082
6823	1	IA_ANALITICA_VOZ	inventario	\N	Analítica por voz CU23: 'Cuántas prendas tenemos en stock en todas las sucursales' -> Métrica 'inventario_stock', Resultados=3, PDF=False.	192.168.1.50	2026-09-20 16:13:51.906384
6825	1	IA_ANALITICA_VOZ	venta	\N	Analítica por voz CU23: 'Generar reporte ejecutivo de ventas globales del mes' -> Métrica 'ventas_total', Resultados=2, PDF=True.	192.168.1.50	2026-09-20 16:13:52.959334
6826	1	IA_ANALITICA_VOZ	inventario	\N	Analítica por voz CU23: 'Reporte de existencias para auditoria' -> Métrica 'inventario_stock', Resultados=3, PDF=False.	172.16.5.99	2026-09-20 16:13:53.192376
6827	1	LOGIN_EXITOSO	usuario	1	Inicio de sesión exitoso de 'Alejandro Sistemas' (admin@fashionstore.com) con rol 'Administrador'.	127.0.0.1	2026-09-20 16:14:44.034504
6828	1	INSERT	ciudad	182	Alta de la ciudad 'Pando QA IP Test'.	200.87.100.45	2026-09-20 16:14:44.253117
6829	\N	LOGIN_FALLIDO	usuario	\N	Intento de inicio de sesión fallido para el correo: no_existe_seguro@fashionstore.com (correo no registrado).	192.168.99.99	2026-09-20 16:14:44.481776
6830	1	UPDATE	rol_permiso	3	Se actualizaron los permisos del rol 'Cajero (POS)' (ID: 3). Total asignados: 3.	198.51.100.22	2026-09-20 16:14:44.707003
6831	1	INSERT	usuario	1213	Alta de usuario 'Audit CU04' (qa_bitacora_cu04@fashionstore.com) con rol id=4.	192.168.1.50	2026-09-20 16:14:45.041873
6834	\N	IA_TRYON	prenda	3	Vestidor Virtual IA (warping_hsv_local, 1318.1ms) para prenda ID 3.	127.0.0.1	2026-09-20 16:18:17.086029
6835	\N	IA_TRYON	prenda	3	Vestidor Virtual IA (warping_hsv_local, 33.29ms) para prenda ID 3.	127.0.0.1	2026-09-20 16:18:25.441941
6836	\N	IA_TRYON	prenda	3	Vestidor Virtual IA (warping_hsv_local, 33.43ms) para prenda ID 3.	127.0.0.1	2026-09-20 16:18:53.75451
6837	\N	IA_TRYON	prenda	\N	Vestidor Virtual IA (warping_hsv_local, 20.9ms) para prenda ID None.	127.0.0.1	2026-09-20 16:18:53.82918
6839	1	IA_TRYON	prenda	\N	Vestidor Virtual IA (warping_hsv_local, 15.56ms) para prenda ID None.	192.168.42.100	2026-09-20 16:18:54.125501
6840	\N	IA_TRYON	prenda	\N	Vestidor Virtual IA (warping_hsv_local, 14.45ms) para prenda ID None.	200.10.20.30	2026-09-20 16:18:54.369953
6841	\N	IA_TRYON	prenda	3	Vestidor Virtual IA (warping_hsv_local, 1137.43ms) para prenda ID 3.	127.0.0.1	2026-09-20 16:23:00.180637
6842	\N	IA_TRYON	prenda	\N	Vestidor Virtual IA (warping_hsv_local, 16.4ms) para prenda ID None.	127.0.0.1	2026-09-20 16:23:01.354843
6843	1	LOGIN_EXITOSO	usuario	1	Inicio de sesión exitoso de 'Alejandro Sistemas' (admin@fashionstore.com) con rol 'Administrador'.	127.0.0.1	2026-09-20 16:23:01.365513
6844	1	IA_TRYON	prenda	\N	Vestidor Virtual IA (warping_hsv_local, 13.75ms) para prenda ID None.	192.168.42.100	2026-09-20 16:23:01.667914
6845	\N	IA_TRYON	prenda	\N	Vestidor Virtual IA (warping_hsv_local, 12.96ms) para prenda ID None.	200.10.20.30	2026-09-20 16:23:01.907694
6880	1	UPDATE	rol_permiso	3	Se actualizaron los permisos del rol 'Cajero (POS)' (ID: 3). Total asignados: 5.	192.168.1.50	2026-09-20 16:26:46.906622
6881	1	UPDATE	rol_permiso	3	Se actualizaron los permisos del rol 'Cajero (POS)' (ID: 3). Total asignados: 4.	192.168.1.50	2026-09-20 16:26:46.95827
6882	1	INSERT	usuario	1220	Alta de usuario 'Cajero POS QA' (qa_cajero_rbac@fashionstore.com) con rol id=3.	192.168.1.50	2026-09-20 16:26:47.032395
6884	1	UPDATE	rol_permiso	3	Se actualizaron los permisos del rol 'Cajero (POS)' (ID: 3). Total asignados: 5.	192.168.1.50	2026-09-20 16:26:47.543717
6885	1	INSERT	usuario	1221	Alta de usuario 'Carlos Recuperador' (qa_recovery_user@fashionstore.com) con rol id=4.	192.168.1.50	2026-09-20 16:26:47.65364
8329	1	UPDATE	rol_permiso	3	Se actualizaron los permisos del rol 'Cajero (POS)' (ID: 3). Total asignados: 5.	192.168.1.50	2026-09-20 19:34:56.316345
6887	1	INSERT	usuario	1222	Alta de usuario 'Carlos Recuperador' (qa_recovery_user@fashionstore.com) con rol id=4.	192.168.1.50	2026-09-20 16:26:47.975623
8330	1	INSERT	usuario	1357	Alta de usuario 'Carlos Recuperador' (qa_recovery_user@fashionstore.com) con rol id=4.	192.168.1.50	2026-09-20 19:34:56.484394
6889	1	INSERT	usuario	1223	Alta de usuario 'Carlos Recuperador' (qa_recovery_user@fashionstore.com) con rol id=4.	192.168.1.50	2026-09-20 16:26:48.255915
6891	1	INSERT	usuario	1224	Alta de usuario 'Carlos Recuperador' (qa_recovery_user@fashionstore.com) con rol id=4.	192.168.1.50	2026-09-20 16:26:48.545305
8332	1	INSERT	usuario	1358	Alta de usuario 'Carlos Recuperador' (qa_recovery_user@fashionstore.com) con rol id=4.	192.168.1.50	2026-09-20 19:34:56.853376
6893	1	INSERT	usuario	1225	Alta de usuario 'Carlos Recuperador' (qa_recovery_user@fashionstore.com) con rol id=4.	192.168.1.50	2026-09-20 16:26:48.847714
6895	1	INSERT	usuario	1226	Alta de usuario 'Carlos Recuperador' (qa_recovery_user@fashionstore.com) con rol id=4.	192.168.1.50	2026-09-20 16:26:49.14186
6896	1	INSERT	usuario	1227	Alta de usuario 'Carlos Recuperador' (qa_recovery_user@fashionstore.com) con rol id=4.	192.168.1.50	2026-09-20 16:26:49.388433
6898	1	INSERT	usuario	1228	Alta de usuario 'Carlos Recuperador' (qa_recovery_user@fashionstore.com) con rol id=4.	192.168.1.50	2026-09-20 16:26:49.668696
6899	1	INSERT	usuario	1229	Alta de usuario 'Inactivo QA' (qa_user_inactivo_recovery@fashionstore.com) con rol id=4.	192.168.1.50	2026-09-20 16:26:49.942883
6900	1	INSERT	usuario	1230	Alta de usuario 'Carlos Recuperador' (qa_recovery_user@fashionstore.com) con rol id=4.	192.168.1.50	2026-09-20 16:26:50.212811
8335	1	INSERT	usuario	1359	Alta de usuario 'Carlos Recuperador' (qa_recovery_user@fashionstore.com) con rol id=4.	192.168.1.50	2026-09-20 19:34:57.243188
6902	1	INSERT	usuario	1231	Alta de usuario 'Carlos Recuperador' (qa_recovery_user@fashionstore.com) con rol id=4.	192.168.1.50	2026-09-20 16:26:50.500861
6904	1	INSERT	usuario	1232	Alta de usuario 'Carlos Recuperador' (qa_recovery_user@fashionstore.com) con rol id=4.	192.168.1.50	2026-09-20 16:26:50.780788
8337	1	INSERT	usuario	1360	Alta de usuario 'Carlos Recuperador' (qa_recovery_user@fashionstore.com) con rol id=4.	192.168.1.50	2026-09-20 19:34:57.609855
6906	1	INSERT	cliente	63	Alta del cliente 'Lucía Morales Paz' (CI 88997711).	192.168.40.1	2026-09-20 16:26:51.093396
6907	1	UPDATE	cliente	63	Modificación del cliente CI 88997711. Campos: nombre_completo=Lucía Morales de Mendoza, telefono=78999999.	192.168.40.2	2026-09-20 16:26:51.210336
6908	1	INACTIVAR	cliente	63	Baja lógica del cliente 'Lucía Morales de Mendoza' (CI 88997711).	192.168.40.3	2026-09-20 16:26:51.237433
6909	1	INSERT	ciudad	185	Alta de la ciudad 'Tarija QA'.	192.168.30.1	2026-09-20 16:26:51.301431
6910	1	INSERT	sucursal	128	Alta de la sucursal 'Sucursal Tarija Centro QA' en la ciudad id=185.	192.168.30.2	2026-09-20 16:26:51.374482
6911	1	UPDATE	sucursal	128	Modificación de la sucursal 'Sucursal Tarija Centro QA'. Campos: direccion=Calle Sucre #789 (Modificado), telefono=66449988.	192.168.30.3	2026-09-20 16:26:51.415543
6912	1	INSERT	categoria	145	Alta de la categoría 'Deportes QA'.	192.168.50.1	2026-09-20 16:26:51.457625
6913	1	INSERT	categoria	146	Alta de la categoría 'Calzado Deportivo QA'.	192.168.1.50	2026-09-20 16:26:51.491969
6914	1	UPDATE	categoria	145	Modificación de la categoría 'Deportes QA'. Campos: descripcion=Ropa de running y fitness.	192.168.50.2	2026-09-20 16:26:51.532283
6915	1	INACTIVAR	categoria	146	Baja lógica de la categoría 'Calzado Deportivo QA' (0 prenda(s) asociadas).	192.168.50.3	2026-09-20 16:26:51.561047
6916	1	INACTIVAR	categoria	145	Baja lógica de la categoría 'Deportes QA' (0 prenda(s) asociadas).	192.168.50.3	2026-09-20 16:26:51.583618
8342	1	INSERT	usuario	1361	Alta de usuario 'Carlos Recuperador' (qa_recovery_user@fashionstore.com) con rol id=4.	192.168.1.50	2026-09-20 19:34:58.785547
8344	1	INSERT	usuario	1362	Alta de usuario 'Carlos Recuperador' (qa_recovery_user@fashionstore.com) con rol id=4.	192.168.1.50	2026-09-20 19:34:59.163039
8345	1	INSERT	usuario	1363	Alta de usuario 'Carlos Recuperador' (qa_recovery_user@fashionstore.com) con rol id=4.	192.168.1.50	2026-09-20 19:34:59.482607
8348	1	INSERT	usuario	1364	Alta de usuario 'Carlos Recuperador' (qa_recovery_user@fashionstore.com) con rol id=4.	192.168.1.50	2026-09-20 19:35:00.113228
8349	1	INSERT	usuario	1365	Alta de usuario 'Inactivo QA' (qa_user_inactivo_recovery@fashionstore.com) con rol id=4.	192.168.1.50	2026-09-20 19:35:00.590416
8350	1	INSERT	usuario	1366	Alta de usuario 'Carlos Recuperador' (qa_recovery_user@fashionstore.com) con rol id=4.	192.168.1.50	2026-09-20 19:35:00.905998
8352	1	INSERT	usuario	1367	Alta de usuario 'Carlos Recuperador' (qa_recovery_user@fashionstore.com) con rol id=4.	192.168.1.50	2026-09-20 19:35:01.335202
8357	1	INSERT	usuario	1368	Alta de usuario 'Carlos Recuperador' (qa_recovery_user@fashionstore.com) con rol id=4.	192.168.1.50	2026-09-20 19:35:02.482645
8361	1	INSERT	cliente	70	Alta del cliente 'Lucía Morales Paz' (CI 88997711).	192.168.40.1	2026-09-20 19:35:03.573695
8362	1	UPDATE	cliente	70	Modificación del cliente CI 88997711. Campos: nombre_completo=Lucía Morales de Mendoza, telefono=78999999.	192.168.40.2	2026-09-20 19:35:03.874024
8363	1	INACTIVAR	cliente	70	Baja lógica del cliente 'Lucía Morales de Mendoza' (CI 88997711).	192.168.40.3	2026-09-20 19:35:03.926427
8364	1	INSERT	ciudad	202	Alta de la ciudad 'Tarija QA'.	192.168.30.1	2026-09-20 19:35:04.12868
8365	1	INSERT	sucursal	142	Alta de la sucursal 'Sucursal Tarija Centro QA' en la ciudad id=202.	192.168.30.2	2026-09-20 19:35:04.37921
8366	1	UPDATE	sucursal	142	Modificación de la sucursal 'Sucursal Tarija Centro QA'. Campos: direccion=Calle Sucre #789 (Modificado), telefono=66449988.	192.168.30.3	2026-09-20 19:35:04.537614
8367	1	INSERT	categoria	159	Alta de la categoría 'Deportes QA'.	192.168.50.1	2026-09-20 19:35:04.69535
8368	1	INSERT	categoria	160	Alta de la categoría 'Calzado Deportivo QA'.	192.168.1.50	2026-09-20 19:35:04.748465
8369	1	UPDATE	categoria	159	Modificación de la categoría 'Deportes QA'. Campos: descripcion=Ropa de running y fitness.	192.168.50.2	2026-09-20 19:35:04.945401
8370	1	INACTIVAR	categoria	160	Baja lógica de la categoría 'Calzado Deportivo QA' (0 prenda(s) asociadas).	192.168.50.3	2026-09-20 19:35:05.05005
6962	1	IA_RECOMENDACION	inventario	180	Recomendación IA (Fallback Catálogo): 3 prendas sugeridas para estilo 'Formal' y ocasión 'Trabajo'.	192.168.1.50	2026-09-20 16:26:57.801001
6963	1	IA_RECOMENDACION	inventario	180	Recomendación IA (Fallback Catálogo): 2 prendas sugeridas para estilo 'Deportivo' y ocasión 'General'.	192.168.1.50	2026-09-20 16:26:58.239216
6964	1	IA_RECOMENDACION	inventario	180	Recomendación IA (Fallback Catálogo): 5 prendas sugeridas para estilo 'Urbano' y ocasión 'General'.	192.168.1.50	2026-09-20 16:26:58.92544
6965	1	IA_RECOMENDACION	inventario	180	Recomendación IA (Fallback Catálogo): 6 prendas sugeridas para estilo 'Elegante' y ocasión 'Cena'.	10.0.0.77	2026-09-20 16:26:59.198027
6966	1	IA_ANALITICA_VOZ	inventario	\N	Analítica por voz CU23: 'Cuántas prendas tenemos en stock en todas las sucursales' -> Métrica 'inventario_stock', Resultados=4, PDF=False.	192.168.1.50	2026-09-20 16:26:59.86493
6968	1	IA_ANALITICA_VOZ	venta	\N	Analítica por voz CU23: 'Generar reporte ejecutivo de ventas globales del mes' -> Métrica 'ventas_total', Resultados=2, PDF=True.	192.168.1.50	2026-09-20 16:27:00.782818
6969	1	IA_ANALITICA_VOZ	inventario	\N	Analítica por voz CU23: 'Reporte de existencias para auditoria' -> Métrica 'inventario_stock', Resultados=4, PDF=False.	172.16.5.99	2026-09-20 16:27:01.051362
6970	1	INSERT	ciudad	186	Alta de la ciudad 'Pando QA IP Test'.	200.87.100.45	2026-09-20 16:27:01.699668
6971	\N	LOGIN_FALLIDO	usuario	\N	Intento de inicio de sesión fallido para el correo: no_existe_seguro@fashionstore.com (correo no registrado).	192.168.99.99	2026-09-20 16:27:01.930127
6972	1	UPDATE	rol_permiso	3	Se actualizaron los permisos del rol 'Cajero (POS)' (ID: 3). Total asignados: 3.	198.51.100.22	2026-09-20 16:27:02.165508
6973	1	INSERT	usuario	1233	Alta de usuario 'Audit CU04' (qa_bitacora_cu04@fashionstore.com) con rol id=4.	192.168.1.50	2026-09-20 16:27:02.497313
6976	\N	IA_TRYON	prenda	3	Vestidor Virtual IA (warping_hsv_local, 33.7ms) para prenda ID 3.	127.0.0.1	2026-09-20 16:27:13.995365
6977	\N	IA_TRYON	prenda	\N	Vestidor Virtual IA (warping_hsv_local, 18.84ms) para prenda ID None.	127.0.0.1	2026-09-20 16:27:14.067182
6978	1	IA_TRYON	prenda	\N	Vestidor Virtual IA (warping_hsv_local, 14.13ms) para prenda ID None.	192.168.42.100	2026-09-20 16:27:14.082329
6979	\N	IA_TRYON	prenda	\N	Vestidor Virtual IA (warping_hsv_local, 11.62ms) para prenda ID None.	200.10.20.30	2026-09-20 16:27:14.323614
6982	\N	IA_TRYON	prenda	3	Vestidor Virtual IA (warping_hsv_local, 25.52ms) para prenda ID 3.	127.0.0.1	2026-09-20 16:27:25.325339
6983	\N	IA_TRYON	prenda	\N	Vestidor Virtual IA (warping_hsv_local, 16.29ms) para prenda ID None.	127.0.0.1	2026-09-20 16:27:25.382818
6984	1	LOGIN_EXITOSO	usuario	1	Inicio de sesión exitoso de 'Alejandro Sistemas' (admin@fashionstore.com) con rol 'Administrador'.	127.0.0.1	2026-09-20 16:27:25.404154
6985	1	IA_TRYON	prenda	\N	Vestidor Virtual IA (warping_hsv_local, 12.82ms) para prenda ID None.	192.168.42.100	2026-09-20 16:27:25.639522
6986	\N	IA_TRYON	prenda	\N	Vestidor Virtual IA (warping_hsv_local, 12.83ms) para prenda ID None.	200.10.20.30	2026-09-20 16:27:25.879153
6987	1	INSERT	ciudad	187	Alta de la ciudad 'Pando QA IP Test'.	200.87.100.45	2026-09-20 16:27:27.966213
6988	\N	LOGIN_FALLIDO	usuario	\N	Intento de inicio de sesión fallido para el correo: no_existe_seguro@fashionstore.com (correo no registrado).	192.168.99.99	2026-09-20 16:27:28.191638
6989	1	UPDATE	rol_permiso	3	Se actualizaron los permisos del rol 'Cajero (POS)' (ID: 3). Total asignados: 3.	198.51.100.22	2026-09-20 16:27:28.4334
6990	1	INSERT	usuario	1234	Alta de usuario 'Audit CU04' (qa_bitacora_cu04@fashionstore.com) con rol id=4.	192.168.1.50	2026-09-20 16:27:28.768742
6993	\N	IA_TRYON	prenda	3	Vestidor Virtual IA (warping_hsv_local, 22.04ms) para prenda ID 3.	127.0.0.1	2026-09-20 16:27:36.354849
6994	1	IA_TRYON	prenda	3	Vestidor Virtual IA (warping_hsv_local, 12.68ms) para prenda ID 3.	190.181.45.10	2026-09-20 16:27:48.287893
6995	\N	IA_TRYON	prenda	3	Vestidor Virtual IA (warping_hsv_local, 22.15ms) para prenda ID 3.	127.0.0.1	2026-09-20 16:27:55.563443
6996	\N	IA_TRYON	prenda	3	Vestidor Virtual IA (warping_hsv_local, 32.2ms) para prenda ID 3.	127.0.0.1	2026-09-20 16:35:41.1166
6997	\N	IA_TRYON	prenda	\N	Vestidor Virtual IA (warping_hsv_local, 18.96ms) para prenda ID None.	127.0.0.1	2026-09-20 16:35:41.184634
6998	1	LOGIN_EXITOSO	usuario	1	Inicio de sesión exitoso de 'Alejandro Sistemas' (admin@fashionstore.com) con rol 'Administrador'.	127.0.0.1	2026-09-20 16:35:41.191819
6999	1	IA_TRYON	prenda	\N	Vestidor Virtual IA (warping_hsv_local, 13.71ms) para prenda ID None.	192.168.42.100	2026-09-20 16:35:41.428311
7000	\N	IA_TRYON	prenda	\N	Vestidor Virtual IA (warping_hsv_local, 11.74ms) para prenda ID None.	200.10.20.30	2026-09-20 16:35:41.667172
7001	1	INSERT	ciudad	188	Alta de la ciudad 'Pando QA IP Test'.	200.87.100.45	2026-09-20 16:35:43.8128
7002	\N	LOGIN_FALLIDO	usuario	\N	Intento de inicio de sesión fallido para el correo: no_existe_seguro@fashionstore.com (correo no registrado).	192.168.99.99	2026-09-20 16:35:44.039826
7003	1	UPDATE	rol_permiso	3	Se actualizaron los permisos del rol 'Cajero (POS)' (ID: 3). Total asignados: 3.	198.51.100.22	2026-09-20 16:35:44.271323
7004	1	INSERT	usuario	1235	Alta de usuario 'Audit CU04' (qa_bitacora_cu04@fashionstore.com) con rol id=4.	192.168.1.50	2026-09-20 16:35:44.607887
7007	\N	IA_TRYON	prenda	3	Vestidor Virtual IA (warping_hsv_local, 41.2ms) para prenda ID 3.	127.0.0.1	2026-09-20 16:35:58.075383
7008	\N	IA_TRYON	prenda	\N	Vestidor Virtual IA (warping_hsv_local, 22.52ms) para prenda ID None.	127.0.0.1	2026-09-20 16:35:58.153176
7009	1	LOGIN_EXITOSO	usuario	1	Inicio de sesión exitoso de 'Alejandro Sistemas' (admin@fashionstore.com) con rol 'Administrador'.	127.0.0.1	2026-09-20 16:35:58.16021
7010	1	IA_TRYON	prenda	\N	Vestidor Virtual IA (warping_hsv_local, 17.48ms) para prenda ID None.	192.168.42.100	2026-09-20 16:35:58.406807
7011	\N	IA_TRYON	prenda	\N	Vestidor Virtual IA (warping_hsv_local, 11.25ms) para prenda ID None.	200.10.20.30	2026-09-20 16:35:58.653436
7012	1	INSERT	ciudad	189	Alta de la ciudad 'Pando QA IP Test'.	200.87.100.45	2026-09-20 16:36:01.180035
7013	\N	LOGIN_FALLIDO	usuario	\N	Intento de inicio de sesión fallido para el correo: no_existe_seguro@fashionstore.com (correo no registrado).	192.168.99.99	2026-09-20 16:36:01.413319
7014	1	UPDATE	rol_permiso	3	Se actualizaron los permisos del rol 'Cajero (POS)' (ID: 3). Total asignados: 3.	198.51.100.22	2026-09-20 16:36:01.655232
7015	1	INSERT	usuario	1236	Alta de usuario 'Audit CU04' (qa_bitacora_cu04@fashionstore.com) con rol id=4.	192.168.1.50	2026-09-20 16:36:02.028146
7018	\N	IA_TRYON	prenda	3	Vestidor Virtual IA (warping_hsv_local, 32.18ms) para prenda ID 3.	127.0.0.1	2026-09-20 16:36:34.722732
7019	\N	IA_TRYON	prenda	\N	Vestidor Virtual IA (warping_hsv_local, 24.39ms) para prenda ID None.	127.0.0.1	2026-09-20 16:36:34.796987
7020	1	LOGIN_EXITOSO	usuario	1	Inicio de sesión exitoso de 'Alejandro Sistemas' (admin@fashionstore.com) con rol 'Administrador'.	127.0.0.1	2026-09-20 16:36:34.83088
7021	1	IA_TRYON	prenda	\N	Vestidor Virtual IA (warping_hsv_local, 17.87ms) para prenda ID None.	192.168.42.100	2026-09-20 16:36:35.126484
7022	\N	IA_TRYON	prenda	\N	Vestidor Virtual IA (warping_hsv_local, 15.0ms) para prenda ID None.	200.10.20.30	2026-09-20 16:36:35.373673
7023	\N	IA_TRYON	prenda	3	Vestidor Virtual IA (warping_hsv_local, 163.45ms) para prenda ID 3.	127.0.0.1	2026-09-20 16:36:40.417792
7024	\N	IA_TRYON	prenda	3	Vestidor Virtual IA (warping_hsv_local, 173.8ms) para prenda ID 3.	127.0.0.1	2026-09-20 16:36:40.646017
7025	\N	IA_TRYON	prenda	\N	Vestidor Virtual IA (warping_hsv_local, 19.67ms) para prenda ID None.	127.0.0.1	2026-09-20 16:36:40.981332
7026	\N	IA_TRYON	prenda	\N	Vestidor Virtual IA (warping_hsv_local, 21.98ms) para prenda ID None.	127.0.0.1	2026-09-20 16:36:41.028244
7027	\N	IA_TRYON	prenda	3	Vestidor Virtual IA (warping_hsv_local, 38.46ms) para prenda ID 3.	127.0.0.1	2026-09-20 16:36:41.043542
7028	\N	IA_TRYON	prenda	3	Vestidor Virtual IA (warping_hsv_local, 40.46ms) para prenda ID 3.	127.0.0.1	2026-09-20 16:36:41.109432
7029	\N	IA_TRYON	prenda	3	Vestidor Virtual IA (warping_hsv_local, 35.49ms) para prenda ID 3.	127.0.0.1	2026-09-20 16:36:41.158354
7030	\N	IA_TRYON	prenda	3	Vestidor Virtual IA (warping_hsv_local, 39.87ms) para prenda ID 3.	127.0.0.1	2026-09-20 16:36:41.202171
7031	\N	IA_TRYON	prenda	3	Vestidor Virtual IA (warping_hsv_local, 32.37ms) para prenda ID 3.	127.0.0.1	2026-09-20 16:36:41.250618
7032	\N	IA_TRYON	prenda	3	Vestidor Virtual IA (warping_hsv_local, 37.08ms) para prenda ID 3.	127.0.0.1	2026-09-20 16:36:41.290039
7033	\N	IA_TRYON	prenda	3	Vestidor Virtual IA (warping_hsv_local, 27.8ms) para prenda ID 3.	127.0.0.1	2026-09-20 16:36:41.334558
7034	\N	IA_TRYON	prenda	3	Vestidor Virtual IA (warping_hsv_local, 35.01ms) para prenda ID 3.	127.0.0.1	2026-09-20 16:36:41.369922
7035	\N	IA_TRYON	prenda	3	Vestidor Virtual IA (warping_hsv_local, 29.89ms) para prenda ID 3.	127.0.0.1	2026-09-20 16:36:41.411482
7036	\N	IA_TRYON	prenda	3	Vestidor Virtual IA (warping_hsv_local, 30.16ms) para prenda ID 3.	127.0.0.1	2026-09-20 16:36:41.44764
7037	\N	IA_TRYON	prenda	3	Vestidor Virtual IA (warping_hsv_local, 27.11ms) para prenda ID 3.	127.0.0.1	2026-09-20 16:36:41.498324
7038	\N	IA_TRYON	prenda	3	Vestidor Virtual IA (warping_hsv_local, 35.69ms) para prenda ID 3.	127.0.0.1	2026-09-20 16:36:41.533823
7039	\N	IA_TRYON	prenda	3	Vestidor Virtual IA (warping_hsv_local, 40.04ms) para prenda ID 3.	127.0.0.1	2026-09-20 16:36:41.555131
7040	\N	IA_TRYON	prenda	3	Vestidor Virtual IA (warping_hsv_local, 39.36ms) para prenda ID 3.	127.0.0.1	2026-09-20 16:36:41.575643
7041	\N	IA_TRYON	prenda	3	Vestidor Virtual IA (warping_hsv_local, 41.53ms) para prenda ID 3.	127.0.0.1	2026-09-20 16:36:41.598017
7042	\N	IA_TRYON	prenda	3	Vestidor Virtual IA (warping_hsv_local, 39.25ms) para prenda ID 3.	127.0.0.1	2026-09-20 16:36:41.621985
7043	1	LOGIN_EXITOSO	usuario	1	Inicio de sesión exitoso de 'Alejandro Sistemas' (admin@fashionstore.com) con rol 'Administrador'.	192.168.10.101	2026-09-20 16:36:47.508299
7044	1	LOGIN_EXITOSO	usuario	1	Inicio de sesión exitoso de 'Alejandro Sistemas' (admin@fashionstore.com) con rol 'Administrador'.	127.0.0.1	2026-09-20 16:36:47.78792
7045	1	LOGIN_FALLIDO	usuario	1	Intento de inicio de sesión fallido para el correo: admin@fashionstore.com (contraseña incorrecta).	192.168.10.102	2026-09-20 16:36:48.055682
7046	\N	LOGIN_FALLIDO	usuario	\N	Intento de inicio de sesión fallido para el correo: no_existe_qa_999@fashionstore.com (correo no registrado).	192.168.10.103	2026-09-20 16:36:48.305989
7047	1	LOGIN_EXITOSO	usuario	1	Inicio de sesión exitoso de 'Alejandro Sistemas' (admin@fashionstore.com) con rol 'Administrador'.	127.0.0.1	2026-09-20 16:36:48.553823
7049	1	INSERT	usuario	1238	Alta de usuario 'Usuario Cliente QA' (qa_cliente_rbac@fashionstore.com) con rol id=4.	192.168.1.50	2026-09-20 16:36:49.461048
7051	1	INSERT	usuario	1239	Alta de usuario 'Carlos Cajero QA' (qa_nuevo_cajero@fashionstore.com) con rol id=3.	192.168.20.1	2026-09-20 16:36:50.046033
7052	1	UPDATE	usuario	1239	Modificación del usuario 'qa_nuevo_cajero@fashionstore.com'. Campos actualizados: nombre=Carlos Alberto, telefono=71122334.	192.168.20.2	2026-09-20 16:36:50.708938
7053	1	INACTIVAR	usuario	1239	Baja lógica del usuario 'qa_nuevo_cajero@fashionstore.com': estado cambiado de 'Activo' a 'Inactivo'.	192.168.20.3	2026-09-20 16:36:50.759272
7054	1	UPDATE	rol_permiso	3	Se actualizaron los permisos del rol 'Cajero (POS)' (ID: 3). Total asignados: 2.	192.168.1.50	2026-09-20 16:36:50.828278
7055	1	UPDATE	rol_permiso	3	Se actualizaron los permisos del rol 'Cajero (POS)' (ID: 3). Total asignados: 4.	192.168.1.50	2026-09-20 16:36:50.890289
7056	1	UPDATE	rol_permiso	3	Se actualizaron los permisos del rol 'Cajero (POS)' (ID: 3). Total asignados: 0.	192.168.1.50	2026-09-20 16:36:50.93479
7057	1	INSERT	usuario	1240	Alta de usuario 'Cajero POS QA' (qa_cajero_rbac@fashionstore.com) con rol id=3.	192.168.1.50	2026-09-20 16:36:50.999202
7059	1	UPDATE	rol_permiso	3	Se actualizaron los permisos del rol 'Cajero (POS)' (ID: 3). Total asignados: 5.	192.168.1.50	2026-09-20 16:36:51.493943
7060	1	UPDATE	rol_permiso	3	Se actualizaron los permisos del rol 'Cajero (POS)' (ID: 3). Total asignados: 4.	192.168.1.50	2026-09-20 16:36:51.544645
7061	1	INSERT	usuario	1241	Alta de usuario 'Cajero POS QA' (qa_cajero_rbac@fashionstore.com) con rol id=3.	192.168.1.50	2026-09-20 16:36:51.629484
7063	1	UPDATE	rol_permiso	3	Se actualizaron los permisos del rol 'Cajero (POS)' (ID: 3). Total asignados: 5.	192.168.1.50	2026-09-20 16:36:52.162035
7064	1	INSERT	usuario	1242	Alta de usuario 'Carlos Recuperador' (qa_recovery_user@fashionstore.com) con rol id=4.	192.168.1.50	2026-09-20 16:36:52.243835
7066	1	INSERT	usuario	1243	Alta de usuario 'Carlos Recuperador' (qa_recovery_user@fashionstore.com) con rol id=4.	192.168.1.50	2026-09-20 16:36:52.549988
7068	\N	IA_TRYON	prenda	3	Vestidor Virtual IA (warping_hsv_local, 1247.25ms) para prenda ID 3.	127.0.0.1	2026-09-20 16:43:32.868921
7069	\N	IA_TRYON	prenda	\N	Vestidor Virtual IA (warping_hsv_local, 17.02ms) para prenda ID None.	127.0.0.1	2026-09-20 16:43:34.16649
7070	1	LOGIN_EXITOSO	usuario	1	Inicio de sesión exitoso de 'Alejandro Sistemas' (admin@fashionstore.com) con rol 'Administrador'.	127.0.0.1	2026-09-20 16:43:34.175943
7071	1	IA_TRYON	prenda	\N	Vestidor Virtual IA (warping_hsv_local, 13.79ms) para prenda ID None.	192.168.42.100	2026-09-20 16:43:34.496023
7072	\N	IA_TRYON	prenda	\N	Vestidor Virtual IA (warping_hsv_local, 12.36ms) para prenda ID None.	200.10.20.30	2026-09-20 16:43:34.735474
7073	1	INSERT	ciudad	190	Alta de la ciudad 'Pando QA IP Test'.	200.87.100.45	2026-09-20 16:43:36.699368
7074	\N	LOGIN_FALLIDO	usuario	\N	Intento de inicio de sesión fallido para el correo: no_existe_seguro@fashionstore.com (correo no registrado).	192.168.99.99	2026-09-20 16:43:36.927496
7075	1	UPDATE	rol_permiso	3	Se actualizaron los permisos del rol 'Cajero (POS)' (ID: 3). Total asignados: 3.	198.51.100.22	2026-09-20 16:43:37.172801
7076	1	INSERT	usuario	1244	Alta de usuario 'Audit CU04' (qa_bitacora_cu04@fashionstore.com) con rol id=4.	192.168.1.50	2026-09-20 16:43:37.512559
7079	\N	IA_TRYON	prenda	3	Vestidor Virtual IA (warping_hsv_local, 124.96ms) para prenda ID 3.	127.0.0.1	2026-09-20 16:43:42.525671
7080	\N	IA_TRYON	prenda	3	Vestidor Virtual IA (warping_hsv_local, 152.59ms) para prenda ID 3.	127.0.0.1	2026-09-20 16:43:42.704355
7081	\N	IA_TRYON	prenda	\N	Vestidor Virtual IA (warping_hsv_local, 30.74ms) para prenda ID None.	127.0.0.1	2026-09-20 16:43:43.053267
7082	\N	IA_TRYON	prenda	\N	Vestidor Virtual IA (warping_hsv_local, 24.4ms) para prenda ID None.	127.0.0.1	2026-09-20 16:43:43.109488
7083	\N	IA_TRYON	prenda	3	Vestidor Virtual IA (warping_hsv_local, 32.75ms) para prenda ID 3.	127.0.0.1	2026-09-20 16:43:43.123237
7084	\N	IA_TRYON	prenda	3	Vestidor Virtual IA (warping_hsv_local, 34.84ms) para prenda ID 3.	127.0.0.1	2026-09-20 16:43:43.19305
7085	\N	IA_TRYON	prenda	3	Vestidor Virtual IA (warping_hsv_local, 29.61ms) para prenda ID 3.	127.0.0.1	2026-09-20 16:43:43.23649
7086	\N	IA_TRYON	prenda	3	Vestidor Virtual IA (warping_hsv_local, 32.3ms) para prenda ID 3.	127.0.0.1	2026-09-20 16:43:43.274089
7087	\N	IA_TRYON	prenda	3	Vestidor Virtual IA (warping_hsv_local, 35.38ms) para prenda ID 3.	127.0.0.1	2026-09-20 16:43:43.313008
7088	\N	IA_TRYON	prenda	3	Vestidor Virtual IA (warping_hsv_local, 36.23ms) para prenda ID 3.	127.0.0.1	2026-09-20 16:43:43.357964
7089	\N	IA_TRYON	prenda	3	Vestidor Virtual IA (warping_hsv_local, 30.15ms) para prenda ID 3.	127.0.0.1	2026-09-20 16:43:43.40076
7090	\N	IA_TRYON	prenda	3	Vestidor Virtual IA (warping_hsv_local, 26.19ms) para prenda ID 3.	127.0.0.1	2026-09-20 16:43:43.436805
7091	\N	IA_TRYON	prenda	3	Vestidor Virtual IA (warping_hsv_local, 28.31ms) para prenda ID 3.	127.0.0.1	2026-09-20 16:43:43.46938
7092	\N	IA_TRYON	prenda	3	Vestidor Virtual IA (warping_hsv_local, 34.11ms) para prenda ID 3.	127.0.0.1	2026-09-20 16:43:43.503502
7093	\N	IA_TRYON	prenda	3	Vestidor Virtual IA (warping_hsv_local, 39.53ms) para prenda ID 3.	127.0.0.1	2026-09-20 16:43:43.565845
7094	\N	IA_TRYON	prenda	3	Vestidor Virtual IA (warping_hsv_local, 47.56ms) para prenda ID 3.	127.0.0.1	2026-09-20 16:43:43.6019
7095	\N	IA_TRYON	prenda	3	Vestidor Virtual IA (warping_hsv_local, 44.52ms) para prenda ID 3.	127.0.0.1	2026-09-20 16:43:43.636073
7096	\N	IA_TRYON	prenda	3	Vestidor Virtual IA (warping_hsv_local, 39.61ms) para prenda ID 3.	127.0.0.1	2026-09-20 16:43:43.667527
7097	\N	IA_TRYON	prenda	3	Vestidor Virtual IA (warping_hsv_local, 36.29ms) para prenda ID 3.	127.0.0.1	2026-09-20 16:43:43.69502
7098	\N	IA_TRYON	prenda	3	Vestidor Virtual IA (warping_hsv_local, 32.81ms) para prenda ID 3.	127.0.0.1	2026-09-20 16:43:43.717021
7099	\N	IA_TRYON	prenda	\N	Vestidor Virtual IA (warping_hsv_local, 20.93ms) para prenda ID None.	127.0.0.1	2026-09-20 16:43:43.796367
7100	\N	IA_TRYON	prenda	\N	Vestidor Virtual IA (warping_hsv_local, 33.03ms) para prenda ID None.	127.0.0.1	2026-09-20 16:43:43.856378
7157	\N	IA_TRYON	prenda	\N	Vestidor Virtual IA (warping_hsv_local, 17.34ms) para prenda ID None.	127.0.0.1	2026-09-20 17:00:31.596395
7101	1	LOGIN_EXITOSO	usuario	1	Inicio de sesión exitoso de 'Alejandro Sistemas' (admin@fashionstore.com) con rol 'Administrador'.	127.0.0.1	2026-09-20 16:46:51.315963
7102	1	LOGIN_EXITOSO	usuario	1	Inicio de sesión exitoso de 'Alejandro Sistemas' (admin@fashionstore.com) con rol 'Administrador'.	127.0.0.1	2026-09-20 16:47:17.465949
7103	1	LOGIN_EXITOSO	usuario	1	Inicio de sesión exitoso de 'Alejandro Sistemas' (admin@fashionstore.com) con rol 'Administrador'.	127.0.0.1	2026-09-20 16:51:03.718911
7104	1	IA_TRYON	prenda	176	Vestidor Virtual IA (warping_hsv_local, 2354.61ms) para prenda ID 176.	127.0.0.1	2026-09-20 16:51:14.2618
7105	\N	IA_TRYON	prenda	3	Vestidor Virtual IA (warping_hsv_local, 47.39ms) para prenda ID 3.	127.0.0.1	2026-09-20 16:55:33.6645
7106	\N	IA_TRYON	prenda	\N	Vestidor Virtual IA (warping_hsv_local, 19.68ms) para prenda ID None.	127.0.0.1	2026-09-20 16:55:33.744952
7107	1	LOGIN_EXITOSO	usuario	1	Inicio de sesión exitoso de 'Alejandro Sistemas' (admin@fashionstore.com) con rol 'Administrador'.	127.0.0.1	2026-09-20 16:55:33.753021
7108	1	IA_TRYON	prenda	\N	Vestidor Virtual IA (warping_hsv_local, 17.4ms) para prenda ID None.	192.168.42.100	2026-09-20 16:55:33.981408
7109	\N	IA_TRYON	prenda	\N	Vestidor Virtual IA (warping_hsv_local, 11.25ms) para prenda ID None.	200.10.20.30	2026-09-20 16:55:34.223627
7110	\N	IA_TRYON	prenda	3	Vestidor Virtual IA (warping_hsv_local, 108.68ms) para prenda ID 3.	127.0.0.1	2026-09-20 16:55:36.213628
7111	\N	IA_TRYON	prenda	3	Vestidor Virtual IA (warping_hsv_local, 120.76ms) para prenda ID 3.	127.0.0.1	2026-09-20 16:55:36.371385
7112	\N	IA_TRYON	prenda	\N	Vestidor Virtual IA (warping_hsv_local, 16.18ms) para prenda ID None.	127.0.0.1	2026-09-20 16:55:36.570196
7113	\N	IA_TRYON	prenda	\N	Vestidor Virtual IA (warping_hsv_local, 17.49ms) para prenda ID None.	127.0.0.1	2026-09-20 16:55:36.624816
7114	\N	IA_TRYON	prenda	3	Vestidor Virtual IA (warping_hsv_local, 24.84ms) para prenda ID 3.	127.0.0.1	2026-09-20 16:55:36.636268
7115	\N	IA_TRYON	prenda	3	Vestidor Virtual IA (warping_hsv_local, 29.76ms) para prenda ID 3.	127.0.0.1	2026-09-20 16:55:36.683645
7116	\N	IA_TRYON	prenda	3	Vestidor Virtual IA (warping_hsv_local, 26.45ms) para prenda ID 3.	127.0.0.1	2026-09-20 16:55:36.720758
7117	\N	IA_TRYON	prenda	3	Vestidor Virtual IA (warping_hsv_local, 26.13ms) para prenda ID 3.	127.0.0.1	2026-09-20 16:55:36.753457
7118	\N	IA_TRYON	prenda	3	Vestidor Virtual IA (warping_hsv_local, 26.03ms) para prenda ID 3.	127.0.0.1	2026-09-20 16:55:36.785258
7119	\N	IA_TRYON	prenda	3	Vestidor Virtual IA (warping_hsv_local, 28.25ms) para prenda ID 3.	127.0.0.1	2026-09-20 16:55:36.816952
7120	\N	IA_TRYON	prenda	3	Vestidor Virtual IA (warping_hsv_local, 25.68ms) para prenda ID 3.	127.0.0.1	2026-09-20 16:55:36.851568
7121	\N	IA_TRYON	prenda	3	Vestidor Virtual IA (warping_hsv_local, 29.1ms) para prenda ID 3.	127.0.0.1	2026-09-20 16:55:36.884239
7122	\N	IA_TRYON	prenda	3	Vestidor Virtual IA (warping_hsv_local, 25.0ms) para prenda ID 3.	127.0.0.1	2026-09-20 16:55:36.919601
7123	\N	IA_TRYON	prenda	3	Vestidor Virtual IA (warping_hsv_local, 32.12ms) para prenda ID 3.	127.0.0.1	2026-09-20 16:55:36.951831
7124	\N	IA_TRYON	prenda	3	Vestidor Virtual IA (warping_hsv_local, 26.29ms) para prenda ID 3.	127.0.0.1	2026-09-20 16:55:37.004312
7125	\N	IA_TRYON	prenda	3	Vestidor Virtual IA (warping_hsv_local, 30.42ms) para prenda ID 3.	127.0.0.1	2026-09-20 16:55:37.020817
7126	\N	IA_TRYON	prenda	3	Vestidor Virtual IA (warping_hsv_local, 29.81ms) para prenda ID 3.	127.0.0.1	2026-09-20 16:55:37.053664
7127	\N	IA_TRYON	prenda	3	Vestidor Virtual IA (warping_hsv_local, 29.58ms) para prenda ID 3.	127.0.0.1	2026-09-20 16:55:37.072466
7128	\N	IA_TRYON	prenda	3	Vestidor Virtual IA (warping_hsv_local, 33.08ms) para prenda ID 3.	127.0.0.1	2026-09-20 16:55:37.099032
7129	\N	IA_TRYON	prenda	3	Vestidor Virtual IA (warping_hsv_local, 30.8ms) para prenda ID 3.	127.0.0.1	2026-09-20 16:55:37.135151
7130	\N	IA_TRYON	prenda	\N	Vestidor Virtual IA (warping_hsv_local, 20.26ms) para prenda ID None.	127.0.0.1	2026-09-20 16:55:37.209378
7131	\N	IA_TRYON	prenda	\N	Vestidor Virtual IA (warping_hsv_local, 30.72ms) para prenda ID None.	127.0.0.1	2026-09-20 16:55:37.262922
7132	\N	IA_TRYON	prenda	3	Vestidor Virtual IA (warping_hsv_local, 37.81ms) para prenda ID 3.	127.0.0.1	2026-09-20 17:00:22.655544
7133	\N	IA_TRYON	prenda	\N	Vestidor Virtual IA (warping_hsv_local, 19.96ms) para prenda ID None.	127.0.0.1	2026-09-20 17:00:22.741366
7134	1	LOGIN_EXITOSO	usuario	1	Inicio de sesión exitoso de 'Alejandro Sistemas' (admin@fashionstore.com) con rol 'Administrador'.	127.0.0.1	2026-09-20 17:00:22.750469
7135	1	IA_TRYON	prenda	\N	Vestidor Virtual IA (warping_hsv_local, 19.62ms) para prenda ID None.	192.168.42.100	2026-09-20 17:00:23.043094
7136	\N	IA_TRYON	prenda	\N	Vestidor Virtual IA (warping_hsv_local, 10.83ms) para prenda ID None.	200.10.20.30	2026-09-20 17:00:23.287931
7137	\N	IA_TRYON	prenda	3	Vestidor Virtual IA (warping_hsv_local, 130.68ms) para prenda ID 3.	127.0.0.1	2026-09-20 17:00:30.507328
7138	\N	IA_TRYON	prenda	3	Vestidor Virtual IA (warping_hsv_local, 161.29ms) para prenda ID 3.	127.0.0.1	2026-09-20 17:00:30.710352
7139	\N	IA_TRYON	prenda	\N	Vestidor Virtual IA (warping_hsv_local, 27.6ms) para prenda ID None.	127.0.0.1	2026-09-20 17:00:30.921467
7140	\N	IA_TRYON	prenda	\N	Vestidor Virtual IA (warping_hsv_local, 23.64ms) para prenda ID None.	127.0.0.1	2026-09-20 17:00:30.968518
7141	\N	IA_TRYON	prenda	3	Vestidor Virtual IA (warping_hsv_local, 32.12ms) para prenda ID 3.	127.0.0.1	2026-09-20 17:00:30.979798
7142	\N	IA_TRYON	prenda	3	Vestidor Virtual IA (warping_hsv_local, 37.43ms) para prenda ID 3.	127.0.0.1	2026-09-20 17:00:31.034455
7143	\N	IA_TRYON	prenda	3	Vestidor Virtual IA (warping_hsv_local, 38.68ms) para prenda ID 3.	127.0.0.1	2026-09-20 17:00:31.081032
7144	\N	IA_TRYON	prenda	3	Vestidor Virtual IA (warping_hsv_local, 35.15ms) para prenda ID 3.	127.0.0.1	2026-09-20 17:00:31.128808
7145	\N	IA_TRYON	prenda	3	Vestidor Virtual IA (warping_hsv_local, 31.92ms) para prenda ID 3.	127.0.0.1	2026-09-20 17:00:31.17321
7146	\N	IA_TRYON	prenda	3	Vestidor Virtual IA (warping_hsv_local, 29.56ms) para prenda ID 3.	127.0.0.1	2026-09-20 17:00:31.212811
7147	\N	IA_TRYON	prenda	3	Vestidor Virtual IA (warping_hsv_local, 26.45ms) para prenda ID 3.	127.0.0.1	2026-09-20 17:00:31.247979
7148	\N	IA_TRYON	prenda	3	Vestidor Virtual IA (warping_hsv_local, 29.16ms) para prenda ID 3.	127.0.0.1	2026-09-20 17:00:31.281072
7149	\N	IA_TRYON	prenda	3	Vestidor Virtual IA (warping_hsv_local, 31.31ms) para prenda ID 3.	127.0.0.1	2026-09-20 17:00:31.316271
7150	\N	IA_TRYON	prenda	3	Vestidor Virtual IA (warping_hsv_local, 28.31ms) para prenda ID 3.	127.0.0.1	2026-09-20 17:00:31.353427
7151	\N	IA_TRYON	prenda	3	Vestidor Virtual IA (warping_hsv_local, 33.91ms) para prenda ID 3.	127.0.0.1	2026-09-20 17:00:31.406234
7152	\N	IA_TRYON	prenda	3	Vestidor Virtual IA (warping_hsv_local, 42.02ms) para prenda ID 3.	127.0.0.1	2026-09-20 17:00:31.423952
7153	\N	IA_TRYON	prenda	3	Vestidor Virtual IA (warping_hsv_local, 40.31ms) para prenda ID 3.	127.0.0.1	2026-09-20 17:00:31.444833
7154	\N	IA_TRYON	prenda	3	Vestidor Virtual IA (warping_hsv_local, 37.76ms) para prenda ID 3.	127.0.0.1	2026-09-20 17:00:31.470432
7155	\N	IA_TRYON	prenda	3	Vestidor Virtual IA (warping_hsv_local, 38.67ms) para prenda ID 3.	127.0.0.1	2026-09-20 17:00:31.493033
7156	\N	IA_TRYON	prenda	3	Vestidor Virtual IA (warping_hsv_local, 36.21ms) para prenda ID 3.	127.0.0.1	2026-09-20 17:00:31.522481
7158	\N	IA_TRYON	prenda	\N	Vestidor Virtual IA (warping_hsv_local, 21.94ms) para prenda ID None.	127.0.0.1	2026-09-20 17:00:31.643581
7159	1	LOGIN_EXITOSO	usuario	1	Inicio de sesión exitoso de 'Alejandro Sistemas' (admin@fashionstore.com) con rol 'Administrador'.	192.168.10.101	2026-09-20 17:02:17.809518
7160	1	LOGIN_EXITOSO	usuario	1	Inicio de sesión exitoso de 'Alejandro Sistemas' (admin@fashionstore.com) con rol 'Administrador'.	127.0.0.1	2026-09-20 17:02:18.045036
7161	1	LOGIN_FALLIDO	usuario	1	Intento de inicio de sesión fallido para el correo: admin@fashionstore.com (contraseña incorrecta).	192.168.10.102	2026-09-20 17:02:18.290961
7162	\N	LOGIN_FALLIDO	usuario	\N	Intento de inicio de sesión fallido para el correo: no_existe_qa_999@fashionstore.com (correo no registrado).	192.168.10.103	2026-09-20 17:02:18.520919
7163	1	LOGIN_EXITOSO	usuario	1	Inicio de sesión exitoso de 'Alejandro Sistemas' (admin@fashionstore.com) con rol 'Administrador'.	127.0.0.1	2026-09-20 17:02:18.751978
8371	1	INACTIVAR	categoria	159	Baja lógica de la categoría 'Deportes QA' (0 prenda(s) asociadas).	192.168.50.3	2026-09-20 19:35:05.0989
7165	1	INSERT	usuario	1246	Alta de usuario 'Usuario Cliente QA' (qa_cliente_rbac@fashionstore.com) con rol id=4.	192.168.1.50	2026-09-20 17:02:19.471939
7167	1	INSERT	usuario	1247	Alta de usuario 'Carlos Cajero QA' (qa_nuevo_cajero@fashionstore.com) con rol id=3.	192.168.20.1	2026-09-20 17:02:19.965787
7168	1	UPDATE	usuario	1247	Modificación del usuario 'qa_nuevo_cajero@fashionstore.com'. Campos actualizados: nombre=Carlos Alberto, telefono=71122334.	192.168.20.2	2026-09-20 17:02:20.533915
7169	1	INACTIVAR	usuario	1247	Baja lógica del usuario 'qa_nuevo_cajero@fashionstore.com': estado cambiado de 'Activo' a 'Inactivo'.	192.168.20.3	2026-09-20 17:02:20.580024
7170	1	UPDATE	rol_permiso	3	Se actualizaron los permisos del rol 'Cajero (POS)' (ID: 3). Total asignados: 2.	192.168.1.50	2026-09-20 17:02:20.64313
7171	1	UPDATE	rol_permiso	3	Se actualizaron los permisos del rol 'Cajero (POS)' (ID: 3). Total asignados: 4.	192.168.1.50	2026-09-20 17:02:20.699705
7172	1	UPDATE	rol_permiso	3	Se actualizaron los permisos del rol 'Cajero (POS)' (ID: 3). Total asignados: 0.	192.168.1.50	2026-09-20 17:02:20.732378
7173	1	INSERT	usuario	1248	Alta de usuario 'Cajero POS QA' (qa_cajero_rbac@fashionstore.com) con rol id=3.	192.168.1.50	2026-09-20 17:02:20.791181
7175	1	UPDATE	rol_permiso	3	Se actualizaron los permisos del rol 'Cajero (POS)' (ID: 3). Total asignados: 5.	192.168.1.50	2026-09-20 17:02:21.279615
7176	1	UPDATE	rol_permiso	3	Se actualizaron los permisos del rol 'Cajero (POS)' (ID: 3). Total asignados: 4.	192.168.1.50	2026-09-20 17:02:21.346097
7177	1	INSERT	usuario	1249	Alta de usuario 'Cajero POS QA' (qa_cajero_rbac@fashionstore.com) con rol id=3.	192.168.1.50	2026-09-20 17:02:21.408443
7179	1	UPDATE	rol_permiso	3	Se actualizaron los permisos del rol 'Cajero (POS)' (ID: 3). Total asignados: 5.	192.168.1.50	2026-09-20 17:02:21.892946
7180	1	INSERT	usuario	1250	Alta de usuario 'Carlos Recuperador' (qa_recovery_user@fashionstore.com) con rol id=4.	192.168.1.50	2026-09-20 17:02:21.959373
7182	1	INSERT	usuario	1251	Alta de usuario 'Carlos Recuperador' (qa_recovery_user@fashionstore.com) con rol id=4.	192.168.1.50	2026-09-20 17:02:22.253535
7184	1	INSERT	usuario	1252	Alta de usuario 'Carlos Recuperador' (qa_recovery_user@fashionstore.com) con rol id=4.	192.168.1.50	2026-09-20 17:02:22.551859
7186	1	INSERT	usuario	1253	Alta de usuario 'Carlos Recuperador' (qa_recovery_user@fashionstore.com) con rol id=4.	192.168.1.50	2026-09-20 17:02:22.825417
7188	1	INSERT	usuario	1254	Alta de usuario 'Carlos Recuperador' (qa_recovery_user@fashionstore.com) con rol id=4.	192.168.1.50	2026-09-20 17:02:23.126673
7190	1	INSERT	usuario	1255	Alta de usuario 'Carlos Recuperador' (qa_recovery_user@fashionstore.com) con rol id=4.	192.168.1.50	2026-09-20 17:02:23.401955
7191	1	INSERT	usuario	1256	Alta de usuario 'Carlos Recuperador' (qa_recovery_user@fashionstore.com) con rol id=4.	192.168.1.50	2026-09-20 17:02:23.647018
7193	1	INSERT	usuario	1257	Alta de usuario 'Carlos Recuperador' (qa_recovery_user@fashionstore.com) con rol id=4.	192.168.1.50	2026-09-20 17:02:23.923252
7194	1	INSERT	usuario	1258	Alta de usuario 'Inactivo QA' (qa_user_inactivo_recovery@fashionstore.com) con rol id=4.	192.168.1.50	2026-09-20 17:02:24.179783
7195	1	INSERT	usuario	1259	Alta de usuario 'Carlos Recuperador' (qa_recovery_user@fashionstore.com) con rol id=4.	192.168.1.50	2026-09-20 17:02:24.430395
7197	1	INSERT	usuario	1260	Alta de usuario 'Carlos Recuperador' (qa_recovery_user@fashionstore.com) con rol id=4.	192.168.1.50	2026-09-20 17:02:24.708826
7199	1	INSERT	usuario	1261	Alta de usuario 'Carlos Recuperador' (qa_recovery_user@fashionstore.com) con rol id=4.	192.168.1.50	2026-09-20 17:02:25.003087
7201	1	INSERT	cliente	64	Alta del cliente 'Lucía Morales Paz' (CI 88997711).	192.168.40.1	2026-09-20 17:02:25.289335
8419	1	IA_RECOMENDACION	inventario	180	Recomendación IA (Fallback Catálogo): 3 prendas sugeridas para estilo 'Formal' y ocasión 'Trabajo'.	192.168.1.50	2026-09-20 19:35:13.22665
8420	1	IA_RECOMENDACION	inventario	180	Recomendación IA (Fallback Catálogo): 2 prendas sugeridas para estilo 'Deportivo' y ocasión 'General'.	192.168.1.50	2026-09-20 19:35:13.635731
8421	1	IA_RECOMENDACION	inventario	180	Recomendación IA (Fallback Catálogo): 5 prendas sugeridas para estilo 'Urbano' y ocasión 'General'.	192.168.1.50	2026-09-20 19:35:14.3186
8422	1	IA_RECOMENDACION	inventario	180	Recomendación IA (Fallback Catálogo): 6 prendas sugeridas para estilo 'Elegante' y ocasión 'Cena'.	10.0.0.77	2026-09-20 19:35:14.564007
8423	1	IA_ANALITICA_VOZ	inventario	\N	Analítica por voz CU23: 'Cuántas prendas tenemos en stock en todas las sucursales' -> Métrica 'inventario_stock', Resultados=4, PDF=False.	192.168.1.50	2026-09-20 19:35:15.277918
8425	1	IA_ANALITICA_VOZ	venta	\N	Analítica por voz CU23: 'Generar reporte ejecutivo de ventas globales del mes' -> Métrica 'ventas_total', Resultados=2, PDF=True.	192.168.1.50	2026-09-20 19:35:16.213273
8426	1	IA_ANALITICA_VOZ	inventario	\N	Analítica por voz CU23: 'Reporte de existencias para auditoria' -> Métrica 'inventario_stock', Resultados=4, PDF=False.	172.16.5.99	2026-09-20 19:35:16.45962
8427	1	INSERT	ciudad	203	Alta de la ciudad 'Pando QA IP Test'.	200.87.100.45	2026-09-20 19:35:17.164267
8428	\N	LOGIN_FALLIDO	usuario	\N	Intento de inicio de sesión fallido para el correo: no_existe_seguro@fashionstore.com (correo no registrado).	192.168.99.99	2026-09-20 19:35:17.429629
8429	1	UPDATE	rol_permiso	3	Se actualizaron los permisos del rol 'Cajero (POS)' (ID: 3). Total asignados: 3.	198.51.100.22	2026-09-20 19:35:17.697587
8430	1	INSERT	usuario	1369	Alta de usuario 'Audit CU04' (qa_bitacora_cu04@fashionstore.com) con rol id=4.	192.168.1.50	2026-09-20 19:35:18.069519
8433	\N	IA_TRYON	prenda	3	Vestidor Virtual IA (opencv_fallback, 88.98ms) para prenda ID 3.	172.20.0.1	2026-09-20 19:35:26.32144
8434	\N	IA_TRYON	prenda	3	Vestidor Virtual IA (opencv_fallback, 143.08ms) para prenda ID 3.	172.20.0.1	2026-09-20 19:35:26.507829
8435	\N	IA_TRYON	prenda	\N	Vestidor Virtual IA (opencv_fallback, 9.54ms) para prenda externa personalizada.	172.20.0.1	2026-09-20 19:35:26.832396
8436	\N	IA_TRYON	prenda	\N	Vestidor Virtual IA (opencv_fallback, 11.51ms) para prenda externa personalizada.	172.20.0.1	2026-09-20 19:35:26.849669
8437	\N	IA_TRYON	prenda	3	Vestidor Virtual IA (opencv_fallback, 18.8ms) para prenda ID 3.	172.20.0.1	2026-09-20 19:35:26.859115
8439	\N	IA_TRYON	prenda	3	Vestidor Virtual IA (opencv_fallback, 13.91ms) para prenda ID 3.	172.20.0.1	2026-09-20 19:35:26.91742
8485	\N	IA_TRYON	prenda	3	Vestidor Virtual IA (opencv_fallback, 15.12ms) para prenda ID 3.	172.20.0.1	2026-09-20 19:43:08.952936
8487	\N	IA_TRYON	prenda	3	Vestidor Virtual IA (opencv_fallback, 14.45ms) para prenda ID 3.	172.20.0.1	2026-09-20 19:43:09.005043
8535	1	INSERT	usuario	1372	Alta de usuario 'Carlos Cajero QA' (qa_nuevo_cajero@fashionstore.com) con rol id=3.	192.168.20.1	2026-09-20 19:43:57.012144
8536	1	UPDATE	usuario	1372	Modificación del usuario 'qa_nuevo_cajero@fashionstore.com'. Campos actualizados: nombre=Carlos Alberto, telefono=71122334.	192.168.20.2	2026-09-20 19:43:57.495349
8537	1	INACTIVAR	usuario	1372	Baja lógica del usuario 'qa_nuevo_cajero@fashionstore.com': estado cambiado de 'Activo' a 'Inactivo'.	192.168.20.3	2026-09-20 19:43:57.69985
8538	1	UPDATE	rol_permiso	3	Se actualizaron los permisos del rol 'Cajero (POS)' (ID: 3). Total asignados: 2.	192.168.1.50	2026-09-20 19:43:58.062767
8539	1	UPDATE	rol_permiso	3	Se actualizaron los permisos del rol 'Cajero (POS)' (ID: 3). Total asignados: 4.	192.168.1.50	2026-09-20 19:43:58.280401
8540	1	UPDATE	rol_permiso	3	Se actualizaron los permisos del rol 'Cajero (POS)' (ID: 3). Total asignados: 0.	192.168.1.50	2026-09-20 19:43:58.34817
8541	1	INSERT	usuario	1373	Alta de usuario 'Cajero POS QA' (qa_cajero_rbac@fashionstore.com) con rol id=3.	192.168.1.50	2026-09-20 19:43:58.601088
8543	1	UPDATE	rol_permiso	3	Se actualizaron los permisos del rol 'Cajero (POS)' (ID: 3). Total asignados: 5.	192.168.1.50	2026-09-20 19:43:59.171573
8544	1	UPDATE	rol_permiso	3	Se actualizaron los permisos del rol 'Cajero (POS)' (ID: 3). Total asignados: 4.	192.168.1.50	2026-09-20 19:43:59.274065
8545	1	INSERT	usuario	1374	Alta de usuario 'Cajero POS QA' (qa_cajero_rbac@fashionstore.com) con rol id=3.	192.168.1.50	2026-09-20 19:43:59.405655
8547	1	UPDATE	rol_permiso	3	Se actualizaron los permisos del rol 'Cajero (POS)' (ID: 3). Total asignados: 5.	192.168.1.50	2026-09-20 19:44:00.033993
8548	1	INSERT	usuario	1375	Alta de usuario 'Carlos Recuperador' (qa_recovery_user@fashionstore.com) con rol id=4.	192.168.1.50	2026-09-20 19:44:00.203944
8550	1	INSERT	usuario	1376	Alta de usuario 'Carlos Recuperador' (qa_recovery_user@fashionstore.com) con rol id=4.	192.168.1.50	2026-09-20 19:44:00.576919
8553	1	INSERT	usuario	1377	Alta de usuario 'Carlos Recuperador' (qa_recovery_user@fashionstore.com) con rol id=4.	192.168.1.50	2026-09-20 19:44:00.946811
8555	1	INSERT	usuario	1378	Alta de usuario 'Carlos Recuperador' (qa_recovery_user@fashionstore.com) con rol id=4.	192.168.1.50	2026-09-20 19:44:01.318277
8560	1	INSERT	usuario	1379	Alta de usuario 'Carlos Recuperador' (qa_recovery_user@fashionstore.com) con rol id=4.	192.168.1.50	2026-09-20 19:44:02.469095
8562	1	INSERT	usuario	1380	Alta de usuario 'Carlos Recuperador' (qa_recovery_user@fashionstore.com) con rol id=4.	192.168.1.50	2026-09-20 19:44:02.844944
8563	1	INSERT	usuario	1381	Alta de usuario 'Carlos Recuperador' (qa_recovery_user@fashionstore.com) con rol id=4.	192.168.1.50	2026-09-20 19:44:03.167747
8566	1	INSERT	usuario	1382	Alta de usuario 'Carlos Recuperador' (qa_recovery_user@fashionstore.com) con rol id=4.	192.168.1.50	2026-09-20 19:44:03.825916
8567	1	INSERT	usuario	1383	Alta de usuario 'Inactivo QA' (qa_user_inactivo_recovery@fashionstore.com) con rol id=4.	192.168.1.50	2026-09-20 19:44:04.284399
8568	1	INSERT	usuario	1384	Alta de usuario 'Carlos Recuperador' (qa_recovery_user@fashionstore.com) con rol id=4.	192.168.1.50	2026-09-20 19:44:04.600924
8570	1	INSERT	usuario	1385	Alta de usuario 'Carlos Recuperador' (qa_recovery_user@fashionstore.com) con rol id=4.	192.168.1.50	2026-09-20 19:44:05.029809
8575	1	INSERT	usuario	1386	Alta de usuario 'Carlos Recuperador' (qa_recovery_user@fashionstore.com) con rol id=4.	192.168.1.50	2026-09-20 19:44:06.186082
8579	1	INSERT	cliente	71	Alta del cliente 'Lucía Morales Paz' (CI 88997711).	192.168.40.1	2026-09-20 19:44:07.278302
8580	1	UPDATE	cliente	71	Modificación del cliente CI 88997711. Campos: nombre_completo=Lucía Morales de Mendoza, telefono=78999999.	192.168.40.2	2026-09-20 19:44:07.582252
8581	1	INACTIVAR	cliente	71	Baja lógica del cliente 'Lucía Morales de Mendoza' (CI 88997711).	192.168.40.3	2026-09-20 19:44:07.634395
8582	1	INSERT	ciudad	204	Alta de la ciudad 'Tarija QA'.	192.168.30.1	2026-09-20 19:44:07.839694
8583	1	INSERT	sucursal	144	Alta de la sucursal 'Sucursal Tarija Centro QA' en la ciudad id=204.	192.168.30.2	2026-09-20 19:44:08.097127
7202	1	UPDATE	cliente	64	Modificación del cliente CI 88997711. Campos: nombre_completo=Lucía Morales de Mendoza, telefono=78999999.	192.168.40.2	2026-09-20 17:02:25.368131
7203	1	INACTIVAR	cliente	64	Baja lógica del cliente 'Lucía Morales de Mendoza' (CI 88997711).	192.168.40.3	2026-09-20 17:02:25.385907
7204	1	INSERT	ciudad	191	Alta de la ciudad 'Tarija QA'.	192.168.30.1	2026-09-20 17:02:25.419238
7205	1	INSERT	sucursal	130	Alta de la sucursal 'Sucursal Tarija Centro QA' en la ciudad id=191.	192.168.30.2	2026-09-20 17:02:25.484315
7206	1	UPDATE	sucursal	130	Modificación de la sucursal 'Sucursal Tarija Centro QA'. Campos: direccion=Calle Sucre #789 (Modificado), telefono=66449988.	192.168.30.3	2026-09-20 17:02:25.517862
7207	1	INSERT	categoria	147	Alta de la categoría 'Deportes QA'.	192.168.50.1	2026-09-20 17:02:25.560142
7208	1	INSERT	categoria	148	Alta de la categoría 'Calzado Deportivo QA'.	192.168.1.50	2026-09-20 17:02:25.590571
7209	1	UPDATE	categoria	147	Modificación de la categoría 'Deportes QA'. Campos: descripcion=Ropa de running y fitness.	192.168.50.2	2026-09-20 17:02:25.64475
7210	1	INACTIVAR	categoria	148	Baja lógica de la categoría 'Calzado Deportivo QA' (0 prenda(s) asociadas).	192.168.50.3	2026-09-20 17:02:25.674499
7211	1	INACTIVAR	categoria	147	Baja lógica de la categoría 'Deportes QA' (0 prenda(s) asociadas).	192.168.50.3	2026-09-20 17:02:25.695143
8486	\N	IA_TRYON	prenda	3	Vestidor Virtual IA (opencv_fallback, 16.55ms) para prenda ID 3.	172.20.0.1	2026-09-20 19:43:08.981908
8488	\N	IA_TRYON	prenda	3	Vestidor Virtual IA (opencv_fallback, 22.82ms) para prenda ID 3.	172.20.0.1	2026-09-20 19:43:09.038961
8494	\N	IA_TRYON	prenda	\N	Vestidor Virtual IA (opencv_fallback, 10.23ms) para prenda externa personalizada.	172.20.0.1	2026-09-20 19:43:09.195442
8496	\N	IA_TRYON	prenda	3	Vestidor Virtual IA (opencv_fallback, 18.29ms) para prenda ID 3.	172.20.0.1	2026-09-20 19:43:34.805452
8497	\N	IA_TRYON	prenda	\N	Vestidor Virtual IA (opencv_fallback, 24.2ms) para prenda externa personalizada.	172.20.0.1	2026-09-20 19:43:34.862317
8498	1	LOGIN_EXITOSO	usuario	1	Inicio de sesión exitoso de 'Alejandro Sistemas' (admin@fashionstore.com) con rol 'Administrador'.	172.20.0.1	2026-09-20 19:43:34.869178
8499	1	IA_TRYON	prenda	\N	Vestidor Virtual IA (opencv_fallback, 8.93ms) para prenda externa personalizada.	192.168.42.100	2026-09-20 19:43:35.135653
8500	\N	IA_TRYON	prenda	\N	Vestidor Virtual IA (opencv_fallback, 8.25ms) para prenda externa personalizada.	200.10.20.30	2026-09-20 19:43:35.366622
8503	\N	IA_TRYON	prenda	\N	Vestidor Virtual IA (opencv_fallback, 137.58ms) para prenda externa personalizada.	172.20.0.1	2026-09-20 19:43:38.023161
8504	\N	IA_TRYON	prenda	3	Vestidor Virtual IA (opencv_fallback, 18.35ms) para prenda ID 3.	172.20.0.1	2026-09-20 19:43:40.90061
8652	\N	IA_TRYON	prenda	3	Vestidor Virtual IA (opencv_fallback, 157.68ms) para prenda ID 3.	172.20.0.1	2026-09-20 19:44:30.960554
7257	1	IA_RECOMENDACION	inventario	180	Recomendación IA (Fallback Catálogo): 3 prendas sugeridas para estilo 'Formal' y ocasión 'Trabajo'.	192.168.1.50	2026-09-20 17:02:29.82512
7258	1	IA_RECOMENDACION	inventario	180	Recomendación IA (Fallback Catálogo): 2 prendas sugeridas para estilo 'Deportivo' y ocasión 'General'.	192.168.1.50	2026-09-20 17:02:30.254972
7259	1	IA_RECOMENDACION	inventario	180	Recomendación IA (Fallback Catálogo): 5 prendas sugeridas para estilo 'Urbano' y ocasión 'General'.	192.168.1.50	2026-09-20 17:02:30.909395
7260	1	IA_RECOMENDACION	inventario	180	Recomendación IA (Fallback Catálogo): 6 prendas sugeridas para estilo 'Elegante' y ocasión 'Cena'.	10.0.0.77	2026-09-20 17:02:31.193515
7261	1	IA_ANALITICA_VOZ	inventario	\N	Analítica por voz CU23: 'Cuántas prendas tenemos en stock en todas las sucursales' -> Métrica 'inventario_stock', Resultados=4, PDF=False.	192.168.1.50	2026-09-20 17:02:31.838819
7263	1	IA_ANALITICA_VOZ	venta	\N	Analítica por voz CU23: 'Generar reporte ejecutivo de ventas globales del mes' -> Métrica 'ventas_total', Resultados=2, PDF=True.	192.168.1.50	2026-09-20 17:02:32.75768
7264	1	IA_ANALITICA_VOZ	inventario	\N	Analítica por voz CU23: 'Reporte de existencias para auditoria' -> Métrica 'inventario_stock', Resultados=4, PDF=False.	172.16.5.99	2026-09-20 17:02:33.03647
7265	1	LOGIN_EXITOSO	usuario	1	Inicio de sesión exitoso de 'Alejandro Sistemas' (admin@fashionstore.com) con rol 'Administrador'.	172.20.0.1	2026-09-20 17:13:11.593863
7266	1	LOGIN_EXITOSO	usuario	1	Inicio de sesión exitoso de 'Alejandro Sistemas' (admin@fashionstore.com) con rol 'Administrador'.	172.20.0.1	2026-09-20 17:13:17.17302
7267	1	LOGIN_EXITOSO	usuario	1	Inicio de sesión exitoso de 'Alejandro Sistemas' (admin@fashionstore.com) con rol 'Administrador'.	172.20.0.1	2026-09-20 17:20:02.460727
7268	1	LOGIN_EXITOSO	usuario	1	Inicio de sesión exitoso de 'Alejandro Sistemas' (admin@fashionstore.com) con rol 'Administrador'.	172.20.0.1	2026-09-20 17:53:05.443281
7269	1	IA_TRYON	prenda	176	Vestidor Virtual IA (warping_hsv_local, 3320.67ms) para prenda ID 176.	172.20.0.1	2026-09-20 17:53:15.583861
7166	\N	LOGIN_EXITOSO	usuario	1246	Inicio de sesión exitoso de 'Usuario Cliente QA' (qa_cliente_rbac@fashionstore.com) con rol 'Cliente'.	127.0.0.1	2026-09-20 17:02:19.706537
7272	\N	IA_TRYON	prenda	3	Vestidor Virtual IA (warping_hsv_local, 1782.93ms) para prenda ID 3.	172.20.0.1	2026-09-20 18:53:08.651305
7273	\N	IA_TRYON	prenda	\N	Vestidor Virtual IA (warping_hsv_local, 16.06ms) para prenda ID None.	172.20.0.1	2026-09-20 18:53:10.469329
7274	1	LOGIN_EXITOSO	usuario	1	Inicio de sesión exitoso de 'Alejandro Sistemas' (admin@fashionstore.com) con rol 'Administrador'.	172.20.0.1	2026-09-20 18:53:10.480858
7275	1	IA_TRYON	prenda	\N	Vestidor Virtual IA (warping_hsv_local, 8.42ms) para prenda ID None.	192.168.42.100	2026-09-20 18:53:10.769386
7276	\N	IA_TRYON	prenda	\N	Vestidor Virtual IA (warping_hsv_local, 9.61ms) para prenda ID None.	200.10.20.30	2026-09-20 18:53:11.001943
7277	\N	IA_TRYON	prenda	3	Vestidor Virtual IA (warping_hsv_local, 152.93ms) para prenda ID 3.	172.20.0.1	2026-09-20 18:53:17.183273
7278	\N	IA_TRYON	prenda	3	Vestidor Virtual IA (warping_hsv_local, 122.66ms) para prenda ID 3.	172.20.0.1	2026-09-20 18:53:17.380239
7279	\N	IA_TRYON	prenda	\N	Vestidor Virtual IA (warping_hsv_local, 8.71ms) para prenda ID None.	172.20.0.1	2026-09-20 18:53:17.903562
7280	\N	IA_TRYON	prenda	\N	Vestidor Virtual IA (warping_hsv_local, 9.58ms) para prenda ID None.	172.20.0.1	2026-09-20 18:53:17.921633
7281	\N	IA_TRYON	prenda	3	Vestidor Virtual IA (warping_hsv_local, 12.45ms) para prenda ID 3.	172.20.0.1	2026-09-20 18:53:17.930498
7282	\N	IA_TRYON	prenda	3	Vestidor Virtual IA (warping_hsv_local, 30.75ms) para prenda ID 3.	172.20.0.1	2026-09-20 18:53:17.951402
7283	\N	IA_TRYON	prenda	3	Vestidor Virtual IA (warping_hsv_local, 12.28ms) para prenda ID 3.	172.20.0.1	2026-09-20 18:53:17.988572
7284	\N	IA_TRYON	prenda	3	Vestidor Virtual IA (warping_hsv_local, 12.82ms) para prenda ID 3.	172.20.0.1	2026-09-20 18:53:18.00608
7285	\N	IA_TRYON	prenda	3	Vestidor Virtual IA (warping_hsv_local, 12.3ms) para prenda ID 3.	172.20.0.1	2026-09-20 18:53:18.023888
7286	\N	IA_TRYON	prenda	3	Vestidor Virtual IA (warping_hsv_local, 15.88ms) para prenda ID 3.	172.20.0.1	2026-09-20 18:53:18.057679
7287	\N	IA_TRYON	prenda	3	Vestidor Virtual IA (warping_hsv_local, 13.65ms) para prenda ID 3.	172.20.0.1	2026-09-20 18:53:18.079386
7288	\N	IA_TRYON	prenda	3	Vestidor Virtual IA (warping_hsv_local, 12.48ms) para prenda ID 3.	172.20.0.1	2026-09-20 18:53:18.098107
7290	\N	IA_TRYON	prenda	3	Vestidor Virtual IA (warping_hsv_local, 12.86ms) para prenda ID 3.	172.20.0.1	2026-09-20 18:53:18.133201
8489	\N	IA_TRYON	prenda	3	Vestidor Virtual IA (opencv_fallback, 23.56ms) para prenda ID 3.	172.20.0.1	2026-09-20 19:43:09.04669
8584	1	UPDATE	sucursal	144	Modificación de la sucursal 'Sucursal Tarija Centro QA'. Campos: direccion=Calle Sucre #789 (Modificado), telefono=66449988.	192.168.30.3	2026-09-20 19:44:08.25489
8585	1	INSERT	categoria	161	Alta de la categoría 'Deportes QA'.	192.168.50.1	2026-09-20 19:44:08.430816
8586	1	INSERT	categoria	162	Alta de la categoría 'Calzado Deportivo QA'.	192.168.1.50	2026-09-20 19:44:08.488847
8587	1	UPDATE	categoria	161	Modificación de la categoría 'Deportes QA'. Campos: descripcion=Ropa de running y fitness.	192.168.50.2	2026-09-20 19:44:08.692165
8588	1	INACTIVAR	categoria	162	Baja lógica de la categoría 'Calzado Deportivo QA' (0 prenda(s) asociadas).	192.168.50.3	2026-09-20 19:44:08.797284
8589	1	INACTIVAR	categoria	161	Baja lógica de la categoría 'Deportes QA' (0 prenda(s) asociadas).	192.168.50.3	2026-09-20 19:44:08.845689
8637	1	IA_RECOMENDACION	inventario	180	Recomendación IA (Fallback Catálogo): 3 prendas sugeridas para estilo 'Formal' y ocasión 'Trabajo'.	192.168.1.50	2026-09-20 19:44:17.193632
8638	1	IA_RECOMENDACION	inventario	180	Recomendación IA (Fallback Catálogo): 2 prendas sugeridas para estilo 'Deportivo' y ocasión 'General'.	192.168.1.50	2026-09-20 19:44:17.625759
8639	1	IA_RECOMENDACION	inventario	180	Recomendación IA (Fallback Catálogo): 5 prendas sugeridas para estilo 'Urbano' y ocasión 'General'.	192.168.1.50	2026-09-20 19:44:18.28942
8640	1	IA_RECOMENDACION	inventario	180	Recomendación IA (Fallback Catálogo): 6 prendas sugeridas para estilo 'Elegante' y ocasión 'Cena'.	10.0.0.77	2026-09-20 19:44:18.569287
8641	1	IA_ANALITICA_VOZ	inventario	\N	Analítica por voz CU23: 'Cuántas prendas tenemos en stock en todas las sucursales' -> Métrica 'inventario_stock', Resultados=4, PDF=False.	192.168.1.50	2026-09-20 19:44:19.265178
8643	1	IA_ANALITICA_VOZ	venta	\N	Analítica por voz CU23: 'Generar reporte ejecutivo de ventas globales del mes' -> Métrica 'ventas_total', Resultados=2, PDF=True.	192.168.1.50	2026-09-20 19:44:20.219885
8645	1	INSERT	ciudad	205	Alta de la ciudad 'Pando QA IP Test'.	200.87.100.45	2026-09-20 19:44:21.177728
8646	\N	LOGIN_FALLIDO	usuario	\N	Intento de inicio de sesión fallido para el correo: no_existe_seguro@fashionstore.com (correo no registrado).	192.168.99.99	2026-09-20 19:44:21.448319
8647	1	UPDATE	rol_permiso	3	Se actualizaron los permisos del rol 'Cajero (POS)' (ID: 3). Total asignados: 3.	198.51.100.22	2026-09-20 19:44:21.716017
8648	1	INSERT	usuario	1387	Alta de usuario 'Audit CU04' (qa_bitacora_cu04@fashionstore.com) con rol id=4.	192.168.1.50	2026-09-20 19:44:22.087611
8651	\N	IA_TRYON	prenda	3	Vestidor Virtual IA (opencv_fallback, 121.22ms) para prenda ID 3.	172.20.0.1	2026-09-20 19:44:30.732483
8653	\N	IA_TRYON	prenda	\N	Vestidor Virtual IA (opencv_fallback, 27.59ms) para prenda externa personalizada.	172.20.0.1	2026-09-20 19:44:31.322501
8655	\N	IA_TRYON	prenda	3	Vestidor Virtual IA (opencv_fallback, 28.17ms) para prenda ID 3.	172.20.0.1	2026-09-20 19:44:31.366025
8656	\N	IA_TRYON	prenda	3	Vestidor Virtual IA (opencv_fallback, 15.85ms) para prenda ID 3.	172.20.0.1	2026-09-20 19:44:31.399302
8657	\N	IA_TRYON	prenda	3	Vestidor Virtual IA (opencv_fallback, 16.59ms) para prenda ID 3.	172.20.0.1	2026-09-20 19:44:31.420314
8658	\N	IA_TRYON	prenda	3	Vestidor Virtual IA (opencv_fallback, 16.72ms) para prenda ID 3.	172.20.0.1	2026-09-20 19:44:31.442781
8660	\N	IA_TRYON	prenda	3	Vestidor Virtual IA (opencv_fallback, 17.9ms) para prenda ID 3.	172.20.0.1	2026-09-20 19:44:31.499937
8661	\N	IA_TRYON	prenda	3	Vestidor Virtual IA (opencv_fallback, 19.44ms) para prenda ID 3.	172.20.0.1	2026-09-20 19:44:31.525969
8662	\N	IA_TRYON	prenda	3	Vestidor Virtual IA (opencv_fallback, 17.0ms) para prenda ID 3.	172.20.0.1	2026-09-20 19:44:31.550728
8664	\N	IA_TRYON	prenda	3	Vestidor Virtual IA (opencv_fallback, 20.07ms) para prenda ID 3.	172.20.0.1	2026-09-20 19:44:31.614441
8667	\N	IA_TRYON	prenda	3	Vestidor Virtual IA (opencv_fallback, 45.05ms) para prenda ID 3.	172.20.0.1	2026-09-20 19:44:31.686679
8709	\N	IA_TRYON	prenda	3	Vestidor Virtual IA (opencv_fallback, 42.83ms) para prenda ID 3.	172.20.0.1	2026-09-20 19:46:39.702474
8740	\N	IA_TRYON	prenda	3	Vestidor Virtual IA (opencv_fallback, 30.87ms) para prenda ID 3.	172.20.0.1	2026-09-20 19:49:35.092543
8884	\N	IA_TRYON	prenda	3	Vestidor Virtual IA (opencv_fallback, 34.21ms) para prenda ID 3.	172.20.0.1	2026-09-20 19:51:15.443682
8895	1	IA_TRYON	prenda	\N	Vestidor Virtual IA (gemini_multimodal_tryon, 16.57ms) para prenda externa personalizada.	192.168.10.77	2026-09-20 19:51:17.942255
8896	1	IA_TRYON	prenda	\N	Vestidor Virtual IA (opencv_fallback, 13.62ms) para prenda externa personalizada.	192.168.10.88	2026-09-20 19:51:18.184358
8919	\N	IA_TRYON	prenda	3	Vestidor Virtual IA (opencv_fallback, 19.18ms) para prenda ID 3.	172.20.0.1	2026-09-20 19:55:38.901577
8921	\N	IA_TRYON	prenda	3	Vestidor Virtual IA (opencv_fallback, 18.54ms) para prenda ID 3.	172.20.0.1	2026-09-20 19:55:38.951518
8929	\N	IA_TRYON	prenda	3	Vestidor Virtual IA (opencv_fallback, 30.29ms) para prenda ID 3.	172.20.0.1	2026-09-20 19:55:39.099476
8937	\N	IA_TRYON	prenda	173	Vestidor Virtual IA (fashn_vton_ai, 49224.18ms) para prenda ID 173.	172.20.0.1	2026-09-20 21:16:58.610141
8953	1	IA_TRYON	prenda	\N	Vestidor Virtual IA (gemini_multimodal_tryon, 13.99ms) para prenda externa personalizada.	192.168.10.77	2026-09-20 21:20:50.883795
8954	1	IA_TRYON	prenda	\N	Vestidor Virtual IA (opencv_fallback, 15.24ms) para prenda externa personalizada.	192.168.10.88	2026-09-20 21:20:51.123258
8970	\N	IA_TRYON	prenda	3	Vestidor Virtual IA (opencv_fallback, 29.62ms) para prenda ID 3.	172.20.0.1	2026-09-20 21:21:39.138019
8976	\N	IA_TRYON	prenda	3	Vestidor Virtual IA (opencv_fallback, 28.59ms) para prenda ID 3.	172.20.0.1	2026-09-20 21:21:39.286058
9010	1	UPDATE	rol_permiso	3	Se actualizaron los permisos del rol 'Cajero (POS)' (ID: 3). Total asignados: 5.	192.168.1.50	2026-09-20 21:22:07.36701
9011	1	UPDATE	rol_permiso	3	Se actualizaron los permisos del rol 'Cajero (POS)' (ID: 3). Total asignados: 4.	192.168.1.50	2026-09-20 21:22:07.473884
9012	1	INSERT	usuario	1411	Alta de usuario 'Cajero POS QA' (qa_cajero_rbac@fashionstore.com) con rol id=3.	192.168.1.50	2026-09-20 21:22:07.598602
9014	1	UPDATE	rol_permiso	3	Se actualizaron los permisos del rol 'Cajero (POS)' (ID: 3). Total asignados: 5.	192.168.1.50	2026-09-20 21:22:08.222064
9015	1	INSERT	usuario	1412	Alta de usuario 'Carlos Recuperador' (qa_recovery_user@fashionstore.com) con rol id=4.	192.168.1.50	2026-09-20 21:22:08.394892
9017	1	INSERT	usuario	1413	Alta de usuario 'Carlos Recuperador' (qa_recovery_user@fashionstore.com) con rol id=4.	192.168.1.50	2026-09-20 21:22:08.763264
7289	\N	IA_TRYON	prenda	3	Vestidor Virtual IA (warping_hsv_local, 12.71ms) para prenda ID 3.	172.20.0.1	2026-09-20 18:53:18.115675
7291	\N	IA_TRYON	prenda	3	Vestidor Virtual IA (warping_hsv_local, 18.09ms) para prenda ID 3.	172.20.0.1	2026-09-20 18:53:18.174142
7292	\N	IA_TRYON	prenda	3	Vestidor Virtual IA (warping_hsv_local, 41.45ms) para prenda ID 3.	172.20.0.1	2026-09-20 18:53:18.168009
7293	\N	IA_TRYON	prenda	3	Vestidor Virtual IA (warping_hsv_local, 24.09ms) para prenda ID 3.	172.20.0.1	2026-09-20 18:53:18.184843
7294	\N	IA_TRYON	prenda	3	Vestidor Virtual IA (warping_hsv_local, 24.76ms) para prenda ID 3.	172.20.0.1	2026-09-20 18:53:18.197277
7295	\N	IA_TRYON	prenda	3	Vestidor Virtual IA (warping_hsv_local, 23.16ms) para prenda ID 3.	172.20.0.1	2026-09-20 18:53:18.211764
7296	\N	IA_TRYON	prenda	3	Vestidor Virtual IA (warping_hsv_local, 19.99ms) para prenda ID 3.	172.20.0.1	2026-09-20 18:53:18.227325
7297	\N	IA_TRYON	prenda	\N	Vestidor Virtual IA (warping_hsv_local, 9.34ms) para prenda ID None.	172.20.0.1	2026-09-20 18:53:18.320132
7298	\N	IA_TRYON	prenda	\N	Vestidor Virtual IA (warping_hsv_local, 12.17ms) para prenda ID None.	172.20.0.1	2026-09-20 18:53:18.337821
7299	\N	IA_TRYON	prenda	3	Vestidor Virtual IA (opencv_fallback, 1058.62ms) para prenda ID 3.	172.20.0.1	2026-09-20 18:57:42.565653
7300	\N	IA_TRYON	prenda	\N	Vestidor Virtual IA (opencv_fallback, 9.75ms) para prenda ID None.	172.20.0.1	2026-09-20 18:57:43.652905
7301	1	LOGIN_EXITOSO	usuario	1	Inicio de sesión exitoso de 'Alejandro Sistemas' (admin@fashionstore.com) con rol 'Administrador'.	172.20.0.1	2026-09-20 18:57:43.668953
7302	1	IA_TRYON	prenda	\N	Vestidor Virtual IA (opencv_fallback, 9.29ms) para prenda ID None.	192.168.42.100	2026-09-20 18:57:43.970365
7303	\N	IA_TRYON	prenda	\N	Vestidor Virtual IA (opencv_fallback, 8.44ms) para prenda ID None.	200.10.20.30	2026-09-20 18:57:44.200968
7304	\N	IA_TRYON	prenda	3	Vestidor Virtual IA (opencv_fallback, 131.56ms) para prenda ID 3.	172.20.0.1	2026-09-20 18:57:46.537829
7305	\N	IA_TRYON	prenda	3	Vestidor Virtual IA (opencv_fallback, 101.84ms) para prenda ID 3.	172.20.0.1	2026-09-20 18:57:46.738372
7306	\N	IA_TRYON	prenda	\N	Vestidor Virtual IA (opencv_fallback, 8.6ms) para prenda ID None.	172.20.0.1	2026-09-20 18:57:47.145685
7307	\N	IA_TRYON	prenda	\N	Vestidor Virtual IA (opencv_fallback, 10.13ms) para prenda ID None.	172.20.0.1	2026-09-20 18:57:47.162466
7308	\N	IA_TRYON	prenda	3	Vestidor Virtual IA (opencv_fallback, 12.36ms) para prenda ID 3.	172.20.0.1	2026-09-20 18:57:47.171444
7309	\N	IA_TRYON	prenda	3	Vestidor Virtual IA (opencv_fallback, 19.58ms) para prenda ID 3.	172.20.0.1	2026-09-20 18:57:47.190092
7310	\N	IA_TRYON	prenda	3	Vestidor Virtual IA (opencv_fallback, 17.5ms) para prenda ID 3.	172.20.0.1	2026-09-20 18:57:47.226441
7311	\N	IA_TRYON	prenda	3	Vestidor Virtual IA (opencv_fallback, 12.64ms) para prenda ID 3.	172.20.0.1	2026-09-20 18:57:47.250056
7312	\N	IA_TRYON	prenda	3	Vestidor Virtual IA (opencv_fallback, 12.34ms) para prenda ID 3.	172.20.0.1	2026-09-20 18:57:47.267424
7313	\N	IA_TRYON	prenda	3	Vestidor Virtual IA (opencv_fallback, 12.77ms) para prenda ID 3.	172.20.0.1	2026-09-20 18:57:47.284713
7314	\N	IA_TRYON	prenda	3	Vestidor Virtual IA (opencv_fallback, 13.16ms) para prenda ID 3.	172.20.0.1	2026-09-20 18:57:47.302972
7315	\N	IA_TRYON	prenda	3	Vestidor Virtual IA (opencv_fallback, 18.02ms) para prenda ID 3.	172.20.0.1	2026-09-20 18:57:47.331074
7316	\N	IA_TRYON	prenda	3	Vestidor Virtual IA (opencv_fallback, 14.56ms) para prenda ID 3.	172.20.0.1	2026-09-20 18:57:47.355435
7317	\N	IA_TRYON	prenda	3	Vestidor Virtual IA (opencv_fallback, 15.79ms) para prenda ID 3.	172.20.0.1	2026-09-20 18:57:47.38546
7318	\N	IA_TRYON	prenda	3	Vestidor Virtual IA (opencv_fallback, 21.21ms) para prenda ID 3.	172.20.0.1	2026-09-20 18:57:47.427134
7319	\N	IA_TRYON	prenda	3	Vestidor Virtual IA (opencv_fallback, 26.05ms) para prenda ID 3.	172.20.0.1	2026-09-20 18:57:47.438208
7320	\N	IA_TRYON	prenda	3	Vestidor Virtual IA (opencv_fallback, 44.93ms) para prenda ID 3.	172.20.0.1	2026-09-20 18:57:47.42185
7321	\N	IA_TRYON	prenda	3	Vestidor Virtual IA (opencv_fallback, 25.88ms) para prenda ID 3.	172.20.0.1	2026-09-20 18:57:47.453747
7322	\N	IA_TRYON	prenda	3	Vestidor Virtual IA (opencv_fallback, 24.75ms) para prenda ID 3.	172.20.0.1	2026-09-20 18:57:47.467651
7323	\N	IA_TRYON	prenda	3	Vestidor Virtual IA (opencv_fallback, 29.58ms) para prenda ID 3.	172.20.0.1	2026-09-20 18:57:47.48431
7324	\N	IA_TRYON	prenda	\N	Vestidor Virtual IA (opencv_fallback, 10.52ms) para prenda ID None.	172.20.0.1	2026-09-20 18:57:47.588309
7325	\N	IA_TRYON	prenda	\N	Vestidor Virtual IA (opencv_fallback, 17.53ms) para prenda ID None.	172.20.0.1	2026-09-20 18:57:47.623198
7326	\N	IA_TRYON	prenda	3	Vestidor Virtual IA (opencv_fallback, 20.64ms) para prenda ID 3.	172.20.0.1	2026-09-20 18:58:12.9556
7327	\N	IA_TRYON	prenda	\N	Vestidor Virtual IA (opencv_fallback, 10.54ms) para prenda ID None.	172.20.0.1	2026-09-20 18:58:12.998912
7328	1	LOGIN_EXITOSO	usuario	1	Inicio de sesión exitoso de 'Alejandro Sistemas' (admin@fashionstore.com) con rol 'Administrador'.	172.20.0.1	2026-09-20 18:58:13.005627
7329	1	IA_TRYON	prenda	\N	Vestidor Virtual IA (opencv_fallback, 9.15ms) para prenda ID None.	192.168.42.100	2026-09-20 18:58:13.270066
7330	\N	IA_TRYON	prenda	\N	Vestidor Virtual IA (opencv_fallback, 8.13ms) para prenda ID None.	200.10.20.30	2026-09-20 18:58:13.502313
7331	1	IA_TRYON	prenda	\N	Vestidor Virtual IA (opencv_fallback, 449.77ms) para prenda ID None.	192.168.10.77	2026-09-20 18:58:15.571563
7332	1	IA_TRYON	prenda	\N	Vestidor Virtual IA (opencv_fallback, 419.13ms) para prenda ID None.	192.168.10.88	2026-09-20 18:58:16.258395
7333	\N	IA_TRYON	prenda	\N	Vestidor Virtual IA (opencv_fallback, 297.1ms) para prenda ID None.	172.20.0.1	2026-09-20 18:58:17.189306
7334	\N	IA_TRYON	prenda	3	Vestidor Virtual IA (opencv_fallback, 14.14ms) para prenda ID 3.	172.20.0.1	2026-09-20 18:59:28.249692
7335	\N	IA_TRYON	prenda	\N	Vestidor Virtual IA (opencv_fallback, 11.62ms) para prenda ID None.	172.20.0.1	2026-09-20 18:59:28.290092
7336	1	LOGIN_EXITOSO	usuario	1	Inicio de sesión exitoso de 'Alejandro Sistemas' (admin@fashionstore.com) con rol 'Administrador'.	172.20.0.1	2026-09-20 18:59:28.297334
7337	1	IA_TRYON	prenda	\N	Vestidor Virtual IA (opencv_fallback, 8.79ms) para prenda ID None.	192.168.42.100	2026-09-20 18:59:28.565901
7338	\N	IA_TRYON	prenda	\N	Vestidor Virtual IA (opencv_fallback, 8.01ms) para prenda ID None.	200.10.20.30	2026-09-20 18:59:28.796888
7339	\N	IA_TRYON	prenda	\N	Vestidor Virtual IA (opencv_fallback, 1057.78ms) para prenda ID None.	172.20.0.1	2026-09-20 18:59:32.954699
7340	\N	IA_TRYON	prenda	3	Vestidor Virtual IA (opencv_fallback, 19.54ms) para prenda ID 3.	172.20.0.1	2026-09-20 19:00:02.487046
7341	\N	IA_TRYON	prenda	\N	Vestidor Virtual IA (opencv_fallback, 13.48ms) para prenda ID None.	172.20.0.1	2026-09-20 19:00:02.542945
7342	1	LOGIN_EXITOSO	usuario	1	Inicio de sesión exitoso de 'Alejandro Sistemas' (admin@fashionstore.com) con rol 'Administrador'.	172.20.0.1	2026-09-20 19:00:02.553761
7343	1	IA_TRYON	prenda	\N	Vestidor Virtual IA (opencv_fallback, 9.58ms) para prenda ID None.	192.168.42.100	2026-09-20 19:00:02.817628
7344	\N	IA_TRYON	prenda	\N	Vestidor Virtual IA (opencv_fallback, 9.46ms) para prenda ID None.	200.10.20.30	2026-09-20 19:00:03.049406
7345	1	IA_TRYON	prenda	\N	Vestidor Virtual IA (gemini_multimodal_tryon, 14.35ms) para prenda ID None.	192.168.10.77	2026-09-20 19:00:05.25578
7346	1	IA_TRYON	prenda	\N	Vestidor Virtual IA (opencv_fallback, 14.34ms) para prenda ID None.	192.168.10.88	2026-09-20 19:00:05.517716
8490	\N	IA_TRYON	prenda	3	Vestidor Virtual IA (opencv_fallback, 32.2ms) para prenda ID 3.	172.20.0.1	2026-09-20 19:43:09.059572
8668	\N	IA_TRYON	prenda	3	Vestidor Virtual IA (opencv_fallback, 50.53ms) para prenda ID 3.	172.20.0.1	2026-09-20 19:44:31.710603
8710	\N	IA_TRYON	prenda	3	Vestidor Virtual IA (opencv_fallback, 43.98ms) para prenda ID 3.	172.20.0.1	2026-09-20 19:46:39.719658
8741	\N	IA_TRYON	prenda	3	Vestidor Virtual IA (opencv_fallback, 31.88ms) para prenda ID 3.	172.20.0.1	2026-09-20 19:49:35.105728
8858	1	IA_RECOMENDACION	inventario	180	Recomendación IA (Fallback Catálogo): 6 prendas sugeridas para estilo 'Elegante' y ocasión 'Cena'.	10.0.0.77	2026-09-20 19:51:02.723063
8859	1	IA_ANALITICA_VOZ	inventario	\N	Analítica por voz CU23: 'Cuántas prendas tenemos en stock en todas las sucursales' -> Métrica 'inventario_stock', Resultados=4, PDF=False.	192.168.1.50	2026-09-20 19:51:03.432022
8861	1	IA_ANALITICA_VOZ	venta	\N	Analítica por voz CU23: 'Generar reporte ejecutivo de ventas globales del mes' -> Métrica 'ventas_total', Resultados=2, PDF=True.	192.168.1.50	2026-09-20 19:51:04.380194
8862	1	IA_ANALITICA_VOZ	inventario	\N	Analítica por voz CU23: 'Reporte de existencias para auditoria' -> Métrica 'inventario_stock', Resultados=4, PDF=False.	172.16.5.99	2026-09-20 19:51:04.640411
8863	1	INSERT	ciudad	207	Alta de la ciudad 'Pando QA IP Test'.	200.87.100.45	2026-09-20 19:51:05.339039
8864	\N	LOGIN_FALLIDO	usuario	\N	Intento de inicio de sesión fallido para el correo: no_existe_seguro@fashionstore.com (correo no registrado).	192.168.99.99	2026-09-20 19:51:05.604854
8865	1	UPDATE	rol_permiso	3	Se actualizaron los permisos del rol 'Cajero (POS)' (ID: 3). Total asignados: 3.	198.51.100.22	2026-09-20 19:51:05.875263
8866	1	INSERT	usuario	1405	Alta de usuario 'Audit CU04' (qa_bitacora_cu04@fashionstore.com) con rol id=4.	192.168.1.50	2026-09-20 19:51:06.248469
8869	\N	IA_TRYON	prenda	3	Vestidor Virtual IA (opencv_fallback, 123.91ms) para prenda ID 3.	172.20.0.1	2026-09-20 19:51:14.576912
8870	\N	IA_TRYON	prenda	3	Vestidor Virtual IA (opencv_fallback, 141.39ms) para prenda ID 3.	172.20.0.1	2026-09-20 19:51:14.781544
8871	\N	IA_TRYON	prenda	\N	Vestidor Virtual IA (opencv_fallback, 11.59ms) para prenda externa personalizada.	172.20.0.1	2026-09-20 19:51:15.129208
8873	\N	IA_TRYON	prenda	3	Vestidor Virtual IA (opencv_fallback, 25.19ms) para prenda ID 3.	172.20.0.1	2026-09-20 19:51:15.169997
8875	\N	IA_TRYON	prenda	3	Vestidor Virtual IA (opencv_fallback, 15.84ms) para prenda ID 3.	172.20.0.1	2026-09-20 19:51:15.234896
8876	\N	IA_TRYON	prenda	3	Vestidor Virtual IA (opencv_fallback, 13.81ms) para prenda ID 3.	172.20.0.1	2026-09-20 19:51:15.256322
8878	\N	IA_TRYON	prenda	3	Vestidor Virtual IA (opencv_fallback, 14.15ms) para prenda ID 3.	172.20.0.1	2026-09-20 19:51:15.307269
8880	\N	IA_TRYON	prenda	3	Vestidor Virtual IA (opencv_fallback, 14.43ms) para prenda ID 3.	172.20.0.1	2026-09-20 19:51:15.358949
8882	\N	IA_TRYON	prenda	3	Vestidor Virtual IA (opencv_fallback, 14.58ms) para prenda ID 3.	172.20.0.1	2026-09-20 19:51:15.398222
8885	\N	IA_TRYON	prenda	3	Vestidor Virtual IA (opencv_fallback, 36.65ms) para prenda ID 3.	172.20.0.1	2026-09-20 19:51:15.4649
8925	\N	IA_TRYON	prenda	3	Vestidor Virtual IA (opencv_fallback, 29.8ms) para prenda ID 3.	172.20.0.1	2026-09-20 19:55:39.04867
8931	\N	IA_TRYON	prenda	\N	Vestidor Virtual IA (opencv_fallback, 15.87ms) para prenda externa personalizada.	172.20.0.1	2026-09-20 19:55:39.232547
8938	\N	IA_TRYON	prenda	174	Vestidor Virtual IA (opencv_fallback, 1366.02ms) para prenda ID 174.	172.20.0.1	2026-09-20 21:18:30.923821
8960	\N	IA_TRYON	prenda	\N	Vestidor Virtual IA (opencv_fallback, 10.43ms) para prenda externa personalizada.	172.20.0.1	2026-09-20 21:21:38.853184
8972	\N	IA_TRYON	prenda	3	Vestidor Virtual IA (opencv_fallback, 29.77ms) para prenda ID 3.	172.20.0.1	2026-09-20 21:21:39.234551
8978	\N	IA_TRYON	prenda	\N	Vestidor Virtual IA (opencv_fallback, 12.76ms) para prenda externa personalizada.	172.20.0.1	2026-09-20 21:21:39.4128
9020	1	INSERT	usuario	1414	Alta de usuario 'Carlos Recuperador' (qa_recovery_user@fashionstore.com) con rol id=4.	192.168.1.50	2026-09-20 21:22:09.137568
9022	1	INSERT	usuario	1415	Alta de usuario 'Carlos Recuperador' (qa_recovery_user@fashionstore.com) con rol id=4.	192.168.1.50	2026-09-20 21:22:09.505306
9027	1	INSERT	usuario	1416	Alta de usuario 'Carlos Recuperador' (qa_recovery_user@fashionstore.com) con rol id=4.	192.168.1.50	2026-09-20 21:22:10.681555
9029	1	INSERT	usuario	1417	Alta de usuario 'Carlos Recuperador' (qa_recovery_user@fashionstore.com) con rol id=4.	192.168.1.50	2026-09-20 21:22:11.051511
9030	1	INSERT	usuario	1418	Alta de usuario 'Carlos Recuperador' (qa_recovery_user@fashionstore.com) con rol id=4.	192.168.1.50	2026-09-20 21:22:11.384663
9033	1	INSERT	usuario	1419	Alta de usuario 'Carlos Recuperador' (qa_recovery_user@fashionstore.com) con rol id=4.	192.168.1.50	2026-09-20 21:22:12.023867
9034	1	INSERT	usuario	1420	Alta de usuario 'Inactivo QA' (qa_user_inactivo_recovery@fashionstore.com) con rol id=4.	192.168.1.50	2026-09-20 21:22:12.499651
9035	1	INSERT	usuario	1421	Alta de usuario 'Carlos Recuperador' (qa_recovery_user@fashionstore.com) con rol id=4.	192.168.1.50	2026-09-20 21:22:12.810222
9037	1	INSERT	usuario	1422	Alta de usuario 'Carlos Recuperador' (qa_recovery_user@fashionstore.com) con rol id=4.	192.168.1.50	2026-09-20 21:22:13.232136
9042	1	INSERT	usuario	1423	Alta de usuario 'Carlos Recuperador' (qa_recovery_user@fashionstore.com) con rol id=4.	192.168.1.50	2026-09-20 21:22:14.391254
9046	1	INSERT	cliente	73	Alta del cliente 'Lucía Morales Paz' (CI 88997711).	192.168.40.1	2026-09-20 21:22:15.500187
9047	1	UPDATE	cliente	73	Modificación del cliente CI 88997711. Campos: nombre_completo=Lucía Morales de Mendoza, telefono=78999999.	192.168.40.2	2026-09-20 21:22:15.799781
9048	1	INACTIVAR	cliente	73	Baja lógica del cliente 'Lucía Morales de Mendoza' (CI 88997711).	192.168.40.3	2026-09-20 21:22:15.852216
9049	1	INSERT	ciudad	209	Alta de la ciudad 'Tarija QA'.	192.168.30.1	2026-09-20 21:22:16.056954
9050	1	INSERT	sucursal	148	Alta de la sucursal 'Sucursal Tarija Centro QA' en la ciudad id=209.	192.168.30.2	2026-09-20 21:22:16.312056
9051	1	UPDATE	sucursal	148	Modificación de la sucursal 'Sucursal Tarija Centro QA'. Campos: direccion=Calle Sucre #789 (Modificado), telefono=66449988.	192.168.30.3	2026-09-20 21:22:16.46496
9052	1	INSERT	categoria	165	Alta de la categoría 'Deportes QA'.	192.168.50.1	2026-09-20 21:22:16.636321
9053	1	INSERT	categoria	166	Alta de la categoría 'Calzado Deportivo QA'.	192.168.1.50	2026-09-20 21:22:16.686973
9054	1	UPDATE	categoria	165	Modificación de la categoría 'Deportes QA'. Campos: descripcion=Ropa de running y fitness.	192.168.50.2	2026-09-20 21:22:16.889986
9055	1	INACTIVAR	categoria	166	Baja lógica de la categoría 'Calzado Deportivo QA' (0 prenda(s) asociadas).	192.168.50.3	2026-09-20 21:22:16.993854
9056	1	INACTIVAR	categoria	165	Baja lógica de la categoría 'Deportes QA' (0 prenda(s) asociadas).	192.168.50.3	2026-09-20 21:22:17.043773
7347	\N	IA_TRYON	prenda	\N	Vestidor Virtual IA (opencv_fallback, 367.63ms) para prenda ID None.	172.20.0.1	2026-09-20 19:00:06.116807
7348	\N	IA_TRYON	prenda	3	Vestidor Virtual IA (opencv_fallback, 93.03ms) para prenda ID 3.	172.20.0.1	2026-09-20 19:00:12.34718
7349	\N	IA_TRYON	prenda	3	Vestidor Virtual IA (opencv_fallback, 85.07ms) para prenda ID 3.	172.20.0.1	2026-09-20 19:00:12.486247
7350	\N	IA_TRYON	prenda	\N	Vestidor Virtual IA (opencv_fallback, 10.28ms) para prenda ID None.	172.20.0.1	2026-09-20 19:00:12.808356
7351	\N	IA_TRYON	prenda	\N	Vestidor Virtual IA (opencv_fallback, 11.71ms) para prenda ID None.	172.20.0.1	2026-09-20 19:00:12.826081
7352	\N	IA_TRYON	prenda	3	Vestidor Virtual IA (opencv_fallback, 17.67ms) para prenda ID 3.	172.20.0.1	2026-09-20 19:00:12.835439
7353	\N	IA_TRYON	prenda	3	Vestidor Virtual IA (opencv_fallback, 12.79ms) para prenda ID 3.	172.20.0.1	2026-09-20 19:00:12.859465
7354	\N	IA_TRYON	prenda	3	Vestidor Virtual IA (opencv_fallback, 15.95ms) para prenda ID 3.	172.20.0.1	2026-09-20 19:00:12.887071
7355	\N	IA_TRYON	prenda	3	Vestidor Virtual IA (opencv_fallback, 12.09ms) para prenda ID 3.	172.20.0.1	2026-09-20 19:00:12.908414
7356	\N	IA_TRYON	prenda	3	Vestidor Virtual IA (opencv_fallback, 13.05ms) para prenda ID 3.	172.20.0.1	2026-09-20 19:00:12.925253
7357	\N	IA_TRYON	prenda	3	Vestidor Virtual IA (opencv_fallback, 12.64ms) para prenda ID 3.	172.20.0.1	2026-09-20 19:00:12.943155
7358	\N	IA_TRYON	prenda	3	Vestidor Virtual IA (opencv_fallback, 12.29ms) para prenda ID 3.	172.20.0.1	2026-09-20 19:00:12.961552
7359	\N	IA_TRYON	prenda	3	Vestidor Virtual IA (opencv_fallback, 14.94ms) para prenda ID 3.	172.20.0.1	2026-09-20 19:00:12.988092
7360	\N	IA_TRYON	prenda	3	Vestidor Virtual IA (opencv_fallback, 12.57ms) para prenda ID 3.	172.20.0.1	2026-09-20 19:00:13.008709
7361	\N	IA_TRYON	prenda	3	Vestidor Virtual IA (opencv_fallback, 12.85ms) para prenda ID 3.	172.20.0.1	2026-09-20 19:00:13.026109
7362	\N	IA_TRYON	prenda	3	Vestidor Virtual IA (opencv_fallback, 27.57ms) para prenda ID 3.	172.20.0.1	2026-09-20 19:00:13.058412
7363	\N	IA_TRYON	prenda	3	Vestidor Virtual IA (opencv_fallback, 25.43ms) para prenda ID 3.	172.20.0.1	2026-09-20 19:00:13.065193
7364	\N	IA_TRYON	prenda	3	Vestidor Virtual IA (opencv_fallback, 22.72ms) para prenda ID 3.	172.20.0.1	2026-09-20 19:00:13.07499
7365	\N	IA_TRYON	prenda	3	Vestidor Virtual IA (opencv_fallback, 18.81ms) para prenda ID 3.	172.20.0.1	2026-09-20 19:00:13.090087
7366	\N	IA_TRYON	prenda	3	Vestidor Virtual IA (opencv_fallback, 28.27ms) para prenda ID 3.	172.20.0.1	2026-09-20 19:00:13.10167
7367	\N	IA_TRYON	prenda	3	Vestidor Virtual IA (opencv_fallback, 18.66ms) para prenda ID 3.	172.20.0.1	2026-09-20 19:00:13.113266
7368	\N	IA_TRYON	prenda	\N	Vestidor Virtual IA (opencv_fallback, 9.79ms) para prenda ID None.	172.20.0.1	2026-09-20 19:00:13.199596
7369	\N	IA_TRYON	prenda	\N	Vestidor Virtual IA (opencv_fallback, 12.16ms) para prenda ID None.	172.20.0.1	2026-09-20 19:00:13.225678
7370	1	LOGIN_EXITOSO	usuario	1	Inicio de sesión exitoso de 'Alejandro Sistemas' (admin@fashionstore.com) con rol 'Administrador'.	192.168.10.101	2026-09-20 19:00:22.773302
7371	1	LOGIN_EXITOSO	usuario	1	Inicio de sesión exitoso de 'Alejandro Sistemas' (admin@fashionstore.com) con rol 'Administrador'.	172.20.0.1	2026-09-20 19:00:23.023802
7372	1	LOGIN_FALLIDO	usuario	1	Intento de inicio de sesión fallido para el correo: admin@fashionstore.com (contraseña incorrecta).	192.168.10.102	2026-09-20 19:00:23.303571
7373	\N	LOGIN_FALLIDO	usuario	\N	Intento de inicio de sesión fallido para el correo: no_existe_qa_999@fashionstore.com (correo no registrado).	192.168.10.103	2026-09-20 19:00:23.585274
7374	1	LOGIN_EXITOSO	usuario	1	Inicio de sesión exitoso de 'Alejandro Sistemas' (admin@fashionstore.com) con rol 'Administrador'.	172.20.0.1	2026-09-20 19:00:23.887753
7376	1	INSERT	usuario	1263	Alta de usuario 'Usuario Cliente QA' (qa_cliente_rbac@fashionstore.com) con rol id=4.	192.168.1.50	2026-09-20 19:00:24.874134
8491	\N	IA_TRYON	prenda	3	Vestidor Virtual IA (opencv_fallback, 33.68ms) para prenda ID 3.	172.20.0.1	2026-09-20 19:43:09.070171
7378	1	INSERT	usuario	1264	Alta de usuario 'Carlos Cajero QA' (qa_nuevo_cajero@fashionstore.com) con rol id=3.	192.168.20.1	2026-09-20 19:00:25.520276
7379	1	UPDATE	usuario	1264	Modificación del usuario 'qa_nuevo_cajero@fashionstore.com'. Campos actualizados: nombre=Carlos Alberto, telefono=71122334.	192.168.20.2	2026-09-20 19:00:25.986163
7380	1	INACTIVAR	usuario	1264	Baja lógica del usuario 'qa_nuevo_cajero@fashionstore.com': estado cambiado de 'Activo' a 'Inactivo'.	192.168.20.3	2026-09-20 19:00:26.18136
7381	1	UPDATE	rol_permiso	3	Se actualizaron los permisos del rol 'Cajero (POS)' (ID: 3). Total asignados: 2.	192.168.1.50	2026-09-20 19:00:26.553304
7382	1	UPDATE	rol_permiso	3	Se actualizaron los permisos del rol 'Cajero (POS)' (ID: 3). Total asignados: 4.	192.168.1.50	2026-09-20 19:00:26.772256
7383	1	UPDATE	rol_permiso	3	Se actualizaron los permisos del rol 'Cajero (POS)' (ID: 3). Total asignados: 0.	192.168.1.50	2026-09-20 19:00:26.839964
7384	1	INSERT	usuario	1265	Alta de usuario 'Cajero POS QA' (qa_cajero_rbac@fashionstore.com) con rol id=3.	192.168.1.50	2026-09-20 19:00:27.096705
7386	1	UPDATE	rol_permiso	3	Se actualizaron los permisos del rol 'Cajero (POS)' (ID: 3). Total asignados: 5.	192.168.1.50	2026-09-20 19:00:27.663424
7387	1	UPDATE	rol_permiso	3	Se actualizaron los permisos del rol 'Cajero (POS)' (ID: 3). Total asignados: 4.	192.168.1.50	2026-09-20 19:00:27.773488
7388	1	INSERT	usuario	1266	Alta de usuario 'Cajero POS QA' (qa_cajero_rbac@fashionstore.com) con rol id=3.	192.168.1.50	2026-09-20 19:00:27.895027
7390	1	UPDATE	rol_permiso	3	Se actualizaron los permisos del rol 'Cajero (POS)' (ID: 3). Total asignados: 5.	192.168.1.50	2026-09-20 19:00:28.522617
7391	1	INSERT	usuario	1267	Alta de usuario 'Carlos Recuperador' (qa_recovery_user@fashionstore.com) con rol id=4.	192.168.1.50	2026-09-20 19:00:28.693913
7393	1	INSERT	usuario	1268	Alta de usuario 'Carlos Recuperador' (qa_recovery_user@fashionstore.com) con rol id=4.	192.168.1.50	2026-09-20 19:00:29.088646
7396	1	INSERT	usuario	1269	Alta de usuario 'Carlos Recuperador' (qa_recovery_user@fashionstore.com) con rol id=4.	192.168.1.50	2026-09-20 19:00:29.464218
7398	1	INSERT	usuario	1270	Alta de usuario 'Carlos Recuperador' (qa_recovery_user@fashionstore.com) con rol id=4.	192.168.1.50	2026-09-20 19:00:29.837319
7403	1	INSERT	usuario	1271	Alta de usuario 'Carlos Recuperador' (qa_recovery_user@fashionstore.com) con rol id=4.	192.168.1.50	2026-09-20 19:00:31.00842
7405	1	INSERT	usuario	1272	Alta de usuario 'Carlos Recuperador' (qa_recovery_user@fashionstore.com) con rol id=4.	192.168.1.50	2026-09-20 19:00:31.390503
7406	1	INSERT	usuario	1273	Alta de usuario 'Carlos Recuperador' (qa_recovery_user@fashionstore.com) con rol id=4.	192.168.1.50	2026-09-20 19:00:31.711687
7409	1	INSERT	usuario	1274	Alta de usuario 'Carlos Recuperador' (qa_recovery_user@fashionstore.com) con rol id=4.	192.168.1.50	2026-09-20 19:00:32.339358
7410	1	INSERT	usuario	1275	Alta de usuario 'Inactivo QA' (qa_user_inactivo_recovery@fashionstore.com) con rol id=4.	192.168.1.50	2026-09-20 19:00:32.815606
7411	1	INSERT	usuario	1276	Alta de usuario 'Carlos Recuperador' (qa_recovery_user@fashionstore.com) con rol id=4.	192.168.1.50	2026-09-20 19:00:33.129963
7413	1	INSERT	usuario	1277	Alta de usuario 'Carlos Recuperador' (qa_recovery_user@fashionstore.com) con rol id=4.	192.168.1.50	2026-09-20 19:00:33.554712
8492	\N	IA_TRYON	prenda	3	Vestidor Virtual IA (opencv_fallback, 28.42ms) para prenda ID 3.	172.20.0.1	2026-09-20 19:43:09.097121
8669	\N	IA_TRYON	prenda	3	Vestidor Virtual IA (opencv_fallback, 37.23ms) para prenda ID 3.	172.20.0.1	2026-09-20 19:44:31.729291
8711	\N	IA_TRYON	prenda	3	Vestidor Virtual IA (opencv_fallback, 36.91ms) para prenda ID 3.	172.20.0.1	2026-09-20 19:46:39.739415
7418	1	INSERT	usuario	1278	Alta de usuario 'Carlos Recuperador' (qa_recovery_user@fashionstore.com) con rol id=4.	192.168.1.50	2026-09-20 19:00:34.702918
8742	\N	IA_TRYON	prenda	3	Vestidor Virtual IA (opencv_fallback, 27.49ms) para prenda ID 3.	172.20.0.1	2026-09-20 19:49:35.119866
8886	\N	IA_TRYON	prenda	3	Vestidor Virtual IA (opencv_fallback, 34.57ms) para prenda ID 3.	172.20.0.1	2026-09-20 19:51:15.47273
7422	1	INSERT	cliente	65	Alta del cliente 'Lucía Morales Paz' (CI 88997711).	192.168.40.1	2026-09-20 19:00:35.811859
7423	1	UPDATE	cliente	65	Modificación del cliente CI 88997711. Campos: nombre_completo=Lucía Morales de Mendoza, telefono=78999999.	192.168.40.2	2026-09-20 19:00:36.124213
7424	1	INACTIVAR	cliente	65	Baja lógica del cliente 'Lucía Morales de Mendoza' (CI 88997711).	192.168.40.3	2026-09-20 19:00:36.179605
7425	1	INSERT	ciudad	192	Alta de la ciudad 'Tarija QA'.	192.168.30.1	2026-09-20 19:00:36.383408
7426	1	INSERT	sucursal	132	Alta de la sucursal 'Sucursal Tarija Centro QA' en la ciudad id=192.	192.168.30.2	2026-09-20 19:00:36.632232
7427	1	UPDATE	sucursal	132	Modificación de la sucursal 'Sucursal Tarija Centro QA'. Campos: direccion=Calle Sucre #789 (Modificado), telefono=66449988.	192.168.30.3	2026-09-20 19:00:36.790152
7428	1	INSERT	categoria	149	Alta de la categoría 'Deportes QA'.	192.168.50.1	2026-09-20 19:00:36.966178
7429	1	INSERT	categoria	150	Alta de la categoría 'Calzado Deportivo QA'.	192.168.1.50	2026-09-20 19:00:37.021902
7430	1	UPDATE	categoria	149	Modificación de la categoría 'Deportes QA'. Campos: descripcion=Ropa de running y fitness.	192.168.50.2	2026-09-20 19:00:37.224803
7431	1	INACTIVAR	categoria	150	Baja lógica de la categoría 'Calzado Deportivo QA' (0 prenda(s) asociadas).	192.168.50.3	2026-09-20 19:00:37.328938
7432	1	INACTIVAR	categoria	149	Baja lógica de la categoría 'Deportes QA' (0 prenda(s) asociadas).	192.168.50.3	2026-09-20 19:00:37.377748
8901	\N	IA_TRYON	prenda	3	Vestidor Virtual IA (opencv_fallback, 17.48ms) para prenda ID 3.	172.20.0.1	2026-09-20 19:55:23.09086
8902	\N	IA_TRYON	prenda	\N	Vestidor Virtual IA (opencv_fallback, 10.65ms) para prenda externa personalizada.	172.20.0.1	2026-09-20 19:55:23.130358
8903	1	LOGIN_EXITOSO	usuario	1	Inicio de sesión exitoso de 'Alejandro Sistemas' (admin@fashionstore.com) con rol 'Administrador'.	172.20.0.1	2026-09-20 19:55:23.136626
8904	1	IA_TRYON	prenda	\N	Vestidor Virtual IA (opencv_fallback, 9.63ms) para prenda externa personalizada.	192.168.42.100	2026-09-20 19:55:23.395749
8905	\N	IA_TRYON	prenda	\N	Vestidor Virtual IA (opencv_fallback, 7.92ms) para prenda externa personalizada.	200.10.20.30	2026-09-20 19:55:23.626762
8908	\N	IA_TRYON	prenda	\N	Vestidor Virtual IA (opencv_fallback, 141.24ms) para prenda externa personalizada.	172.20.0.1	2026-09-20 19:55:26.091137
8909	\N	IA_TRYON	prenda	3	Vestidor Virtual IA (opencv_fallback, 15.57ms) para prenda ID 3.	172.20.0.1	2026-09-20 19:55:28.718163
8910	\N	IA_TRYON	prenda	3	Vestidor Virtual IA (opencv_fallback, 98.38ms) para prenda ID 3.	172.20.0.1	2026-09-20 19:55:38.160061
8911	\N	IA_TRYON	prenda	3	Vestidor Virtual IA (opencv_fallback, 180.98ms) para prenda ID 3.	172.20.0.1	2026-09-20 19:55:38.360275
8912	\N	IA_TRYON	prenda	\N	Vestidor Virtual IA (opencv_fallback, 9.4ms) para prenda externa personalizada.	172.20.0.1	2026-09-20 19:55:38.724888
8913	\N	IA_TRYON	prenda	\N	Vestidor Virtual IA (opencv_fallback, 11.29ms) para prenda externa personalizada.	172.20.0.1	2026-09-20 19:55:38.742441
8914	\N	IA_TRYON	prenda	3	Vestidor Virtual IA (opencv_fallback, 17.16ms) para prenda ID 3.	172.20.0.1	2026-09-20 19:55:38.751647
7480	1	IA_RECOMENDACION	inventario	180	Recomendación IA (Fallback Catálogo): 3 prendas sugeridas para estilo 'Formal' y ocasión 'Trabajo'.	192.168.1.50	2026-09-20 19:00:45.738709
7508	\N	IA_TRYON	prenda	3	Vestidor Virtual IA (opencv_fallback, 20.76ms) para prenda ID 3.	172.20.0.1	2026-09-20 19:00:59.743751
7481	1	IA_RECOMENDACION	inventario	180	Recomendación IA (Fallback Catálogo): 2 prendas sugeridas para estilo 'Deportivo' y ocasión 'General'.	192.168.1.50	2026-09-20 19:00:46.210807
7482	1	IA_RECOMENDACION	inventario	180	Recomendación IA (Fallback Catálogo): 5 prendas sugeridas para estilo 'Urbano' y ocasión 'General'.	192.168.1.50	2026-09-20 19:00:46.85824
7483	1	IA_RECOMENDACION	inventario	180	Recomendación IA (Fallback Catálogo): 6 prendas sugeridas para estilo 'Elegante' y ocasión 'Cena'.	10.0.0.77	2026-09-20 19:00:47.140723
7484	1	IA_ANALITICA_VOZ	inventario	\N	Analítica por voz CU23: 'Cuántas prendas tenemos en stock en todas las sucursales' -> Métrica 'inventario_stock', Resultados=4, PDF=False.	192.168.1.50	2026-09-20 19:00:47.861503
7486	1	IA_ANALITICA_VOZ	venta	\N	Analítica por voz CU23: 'Generar reporte ejecutivo de ventas globales del mes' -> Métrica 'ventas_total', Resultados=2, PDF=True.	192.168.1.50	2026-09-20 19:00:48.80789
7488	1	INSERT	ciudad	193	Alta de la ciudad 'Pando QA IP Test'.	200.87.100.45	2026-09-20 19:00:49.759769
7489	\N	LOGIN_FALLIDO	usuario	\N	Intento de inicio de sesión fallido para el correo: no_existe_seguro@fashionstore.com (correo no registrado).	192.168.99.99	2026-09-20 19:00:50.026165
7490	1	UPDATE	rol_permiso	3	Se actualizaron los permisos del rol 'Cajero (POS)' (ID: 3). Total asignados: 3.	198.51.100.22	2026-09-20 19:00:50.30501
7491	1	INSERT	usuario	1279	Alta de usuario 'Audit CU04' (qa_bitacora_cu04@fashionstore.com) con rol id=4.	192.168.1.50	2026-09-20 19:00:50.69209
7494	\N	IA_TRYON	prenda	3	Vestidor Virtual IA (opencv_fallback, 84.97ms) para prenda ID 3.	172.20.0.1	2026-09-20 19:00:59.001727
7495	\N	IA_TRYON	prenda	3	Vestidor Virtual IA (opencv_fallback, 103.78ms) para prenda ID 3.	172.20.0.1	2026-09-20 19:00:59.144234
7496	\N	IA_TRYON	prenda	\N	Vestidor Virtual IA (opencv_fallback, 9.29ms) para prenda ID None.	172.20.0.1	2026-09-20 19:00:59.477101
7498	\N	IA_TRYON	prenda	3	Vestidor Virtual IA (opencv_fallback, 20.57ms) para prenda ID 3.	172.20.0.1	2026-09-20 19:00:59.513618
7499	\N	IA_TRYON	prenda	3	Vestidor Virtual IA (opencv_fallback, 12.86ms) para prenda ID 3.	172.20.0.1	2026-09-20 19:00:59.540643
7501	\N	IA_TRYON	prenda	3	Vestidor Virtual IA (opencv_fallback, 12.83ms) para prenda ID 3.	172.20.0.1	2026-09-20 19:00:59.590019
7487	1	IA_ANALITICA_VOZ	inventario	\N	Analítica por voz CU23: 'Reporte de existencias para auditoria' -> Métrica 'inventario_stock', Resultados=4, PDF=False.	172.16.5.99	2026-09-20 19:00:49.032524
8438	\N	IA_TRYON	prenda	3	Vestidor Virtual IA (opencv_fallback, 17.93ms) para prenda ID 3.	172.20.0.1	2026-09-20 19:35:26.893015
7497	\N	IA_TRYON	prenda	\N	Vestidor Virtual IA (opencv_fallback, 10.73ms) para prenda ID None.	172.20.0.1	2026-09-20 19:00:59.502584
7500	\N	IA_TRYON	prenda	3	Vestidor Virtual IA (opencv_fallback, 16.2ms) para prenda ID 3.	172.20.0.1	2026-09-20 19:00:59.567638
7502	\N	IA_TRYON	prenda	3	Vestidor Virtual IA (opencv_fallback, 11.82ms) para prenda ID 3.	172.20.0.1	2026-09-20 19:00:59.608211
8440	\N	IA_TRYON	prenda	3	Vestidor Virtual IA (opencv_fallback, 15.55ms) para prenda ID 3.	172.20.0.1	2026-09-20 19:35:26.937382
8442	\N	IA_TRYON	prenda	3	Vestidor Virtual IA (opencv_fallback, 13.86ms) para prenda ID 3.	172.20.0.1	2026-09-20 19:35:26.989893
8444	\N	IA_TRYON	prenda	3	Vestidor Virtual IA (opencv_fallback, 17.43ms) para prenda ID 3.	172.20.0.1	2026-09-20 19:35:27.029886
8493	\N	IA_TRYON	prenda	3	Vestidor Virtual IA (opencv_fallback, 43.58ms) para prenda ID 3.	172.20.0.1	2026-09-20 19:43:09.082491
8670	\N	IA_TRYON	prenda	3	Vestidor Virtual IA (opencv_fallback, 34.58ms) para prenda ID 3.	172.20.0.1	2026-09-20 19:44:31.748234
8713	\N	IA_TRYON	prenda	\N	Vestidor Virtual IA (opencv_fallback, 15.62ms) para prenda externa personalizada.	172.20.0.1	2026-09-20 19:46:39.885392
8744	\N	IA_TRYON	prenda	\N	Vestidor Virtual IA (opencv_fallback, 13.43ms) para prenda externa personalizada.	172.20.0.1	2026-09-20 19:49:35.242231
8872	\N	IA_TRYON	prenda	\N	Vestidor Virtual IA (opencv_fallback, 10.55ms) para prenda externa personalizada.	172.20.0.1	2026-09-20 19:51:15.15731
8887	\N	IA_TRYON	prenda	3	Vestidor Virtual IA (opencv_fallback, 34.15ms) para prenda ID 3.	172.20.0.1	2026-09-20 19:51:15.485725
8906	1	IA_TRYON	prenda	\N	Vestidor Virtual IA (gemini_multimodal_tryon, 13.82ms) para prenda externa personalizada.	192.168.10.77	2026-09-20 19:55:25.479992
8907	1	IA_TRYON	prenda	\N	Vestidor Virtual IA (opencv_fallback, 13.38ms) para prenda externa personalizada.	192.168.10.88	2026-09-20 19:55:25.719148
8926	\N	IA_TRYON	prenda	3	Vestidor Virtual IA (opencv_fallback, 35.33ms) para prenda ID 3.	172.20.0.1	2026-09-20 19:55:39.058664
8934	\N	IA_TRYON	prenda	186	Vestidor Virtual IA (opencv_fallback, 3699.79ms) para prenda ID 186.	172.20.0.1	2026-09-20 21:13:46.513561
8939	\N	IA_TRYON	prenda	3	Vestidor Virtual IA (opencv_fallback, 1202.03ms) para prenda ID 3.	172.20.0.1	2026-09-20 21:19:58.860633
8940	\N	IA_TRYON	prenda	\N	Vestidor Virtual IA (opencv_fallback, 11.9ms) para prenda externa personalizada.	172.20.0.1	2026-09-20 21:20:00.090388
8941	1	LOGIN_EXITOSO	usuario	1	Inicio de sesión exitoso de 'Alejandro Sistemas' (admin@fashionstore.com) con rol 'Administrador'.	172.20.0.1	2026-09-20 21:20:00.105442
8942	1	IA_TRYON	prenda	\N	Vestidor Virtual IA (opencv_fallback, 14.4ms) para prenda externa personalizada.	192.168.42.100	2026-09-20 21:20:00.408619
8943	\N	IA_TRYON	prenda	\N	Vestidor Virtual IA (opencv_fallback, 9.36ms) para prenda externa personalizada.	200.10.20.30	2026-09-20 21:20:00.645563
8947	\N	IA_TRYON	prenda	\N	Vestidor Virtual IA (fashn_vton_ai, 27998.98ms) para prenda externa personalizada.	172.20.0.1	2026-09-20 21:20:31.505408
8962	\N	IA_TRYON	prenda	3	Vestidor Virtual IA (opencv_fallback, 19.49ms) para prenda ID 3.	172.20.0.1	2026-09-20 21:21:38.895003
8964	\N	IA_TRYON	prenda	3	Vestidor Virtual IA (opencv_fallback, 16.44ms) para prenda ID 3.	172.20.0.1	2026-09-20 21:21:38.949471
8966	\N	IA_TRYON	prenda	3	Vestidor Virtual IA (opencv_fallback, 17.47ms) para prenda ID 3.	172.20.0.1	2026-09-20 21:21:39.004136
8973	\N	IA_TRYON	prenda	3	Vestidor Virtual IA (opencv_fallback, 40.58ms) para prenda ID 3.	172.20.0.1	2026-09-20 21:21:39.246766
9102	1	IA_RECOMENDACION	inventario	180	Recomendación IA (Fallback Catálogo): 3 prendas sugeridas para estilo 'Formal' y ocasión 'Trabajo'.	192.168.1.50	2026-09-20 21:22:26.01193
9103	1	IA_RECOMENDACION	inventario	180	Recomendación IA (Fallback Catálogo): 2 prendas sugeridas para estilo 'Deportivo' y ocasión 'General'.	192.168.1.50	2026-09-20 21:22:26.427223
9104	1	IA_RECOMENDACION	inventario	180	Recomendación IA (Fallback Catálogo): 5 prendas sugeridas para estilo 'Urbano' y ocasión 'General'.	192.168.1.50	2026-09-20 21:22:27.103246
9106	1	IA_ANALITICA_VOZ	inventario	\N	Analítica por voz CU23: 'Cuántas prendas tenemos en stock en todas las sucursales' -> Métrica 'inventario_stock', Resultados=4, PDF=False.	192.168.1.50	2026-09-20 21:22:28.067271
7503	\N	IA_TRYON	prenda	3	Vestidor Virtual IA (opencv_fallback, 13.03ms) para prenda ID 3.	172.20.0.1	2026-09-20 19:00:59.625415
7504	\N	IA_TRYON	prenda	3	Vestidor Virtual IA (opencv_fallback, 15.2ms) para prenda ID 3.	172.20.0.1	2026-09-20 19:00:59.651466
7505	\N	IA_TRYON	prenda	3	Vestidor Virtual IA (opencv_fallback, 12.89ms) para prenda ID 3.	172.20.0.1	2026-09-20 19:00:59.673469
7506	\N	IA_TRYON	prenda	3	Vestidor Virtual IA (opencv_fallback, 12.02ms) para prenda ID 3.	172.20.0.1	2026-09-20 19:00:59.691237
7507	\N	IA_TRYON	prenda	3	Vestidor Virtual IA (opencv_fallback, 12.26ms) para prenda ID 3.	172.20.0.1	2026-09-20 19:00:59.708093
7509	\N	IA_TRYON	prenda	3	Vestidor Virtual IA (opencv_fallback, 38.68ms) para prenda ID 3.	172.20.0.1	2026-09-20 19:00:59.739417
7510	\N	IA_TRYON	prenda	3	Vestidor Virtual IA (opencv_fallback, 26.29ms) para prenda ID 3.	172.20.0.1	2026-09-20 19:00:59.754762
7511	\N	IA_TRYON	prenda	3	Vestidor Virtual IA (opencv_fallback, 25.71ms) para prenda ID 3.	172.20.0.1	2026-09-20 19:00:59.768085
7512	\N	IA_TRYON	prenda	3	Vestidor Virtual IA (opencv_fallback, 28.56ms) para prenda ID 3.	172.20.0.1	2026-09-20 19:00:59.78214
7513	\N	IA_TRYON	prenda	3	Vestidor Virtual IA (opencv_fallback, 24.77ms) para prenda ID 3.	172.20.0.1	2026-09-20 19:00:59.794036
7514	\N	IA_TRYON	prenda	\N	Vestidor Virtual IA (opencv_fallback, 8.84ms) para prenda ID None.	172.20.0.1	2026-09-20 19:00:59.889698
7515	\N	IA_TRYON	prenda	\N	Vestidor Virtual IA (opencv_fallback, 11.19ms) para prenda ID None.	172.20.0.1	2026-09-20 19:00:59.91425
7516	\N	IA_TRYON	prenda	3	Vestidor Virtual IA (opencv_fallback, 28.94ms) para prenda ID 3.	172.20.0.1	2026-09-20 19:01:00.081154
7517	\N	IA_TRYON	prenda	\N	Vestidor Virtual IA (opencv_fallback, 11.54ms) para prenda ID None.	172.20.0.1	2026-09-20 19:01:00.135306
7518	1	IA_TRYON	prenda	\N	Vestidor Virtual IA (opencv_fallback, 10.22ms) para prenda ID None.	192.168.42.100	2026-09-20 19:01:00.147518
7519	\N	IA_TRYON	prenda	\N	Vestidor Virtual IA (opencv_fallback, 8.5ms) para prenda ID None.	200.10.20.30	2026-09-20 19:01:00.383311
7520	1	IA_TRYON	prenda	\N	Vestidor Virtual IA (gemini_multimodal_tryon, 12.78ms) para prenda ID None.	192.168.10.77	2026-09-20 19:01:02.518852
7521	1	IA_TRYON	prenda	\N	Vestidor Virtual IA (opencv_fallback, 15.69ms) para prenda ID None.	192.168.10.88	2026-09-20 19:01:02.762269
7522	\N	IA_TRYON	prenda	\N	Vestidor Virtual IA (opencv_fallback, 356.22ms) para prenda ID None.	172.20.0.1	2026-09-20 19:01:03.35427
7525	\N	IA_TRYON	prenda	3	Vestidor Virtual IA (opencv_fallback, 18.76ms) para prenda ID 3.	172.20.0.1	2026-09-20 19:05:05.081111
7526	\N	IA_TRYON	prenda	\N	Vestidor Virtual IA (opencv_fallback, 8.82ms) para prenda ID None.	172.20.0.1	2026-09-20 19:05:05.12947
7527	1	LOGIN_EXITOSO	usuario	1	Inicio de sesión exitoso de 'Alejandro Sistemas' (admin@fashionstore.com) con rol 'Administrador'.	172.20.0.1	2026-09-20 19:05:05.136498
7528	1	IA_TRYON	prenda	\N	Vestidor Virtual IA (opencv_fallback, 11.21ms) para prenda ID None.	192.168.42.100	2026-09-20 19:05:05.399378
7529	\N	IA_TRYON	prenda	\N	Vestidor Virtual IA (opencv_fallback, 8.27ms) para prenda ID None.	200.10.20.30	2026-09-20 19:05:05.631537
7530	1	IA_TRYON	prenda	\N	Vestidor Virtual IA (gemini_multimodal_tryon, 13.96ms) para prenda ID None.	192.168.10.77	2026-09-20 19:05:08.067138
7531	1	IA_TRYON	prenda	\N	Vestidor Virtual IA (opencv_fallback, 14.35ms) para prenda ID None.	192.168.10.88	2026-09-20 19:05:08.312697
7532	\N	IA_TRYON	prenda	\N	Vestidor Virtual IA (opencv_fallback, 361.32ms) para prenda ID None.	172.20.0.1	2026-09-20 19:05:08.905505
7533	\N	IA_TRYON	prenda	3	Vestidor Virtual IA (opencv_fallback, 12.76ms) para prenda ID 3.	172.20.0.1	2026-09-20 19:06:30.064581
7534	\N	IA_TRYON	prenda	\N	Vestidor Virtual IA (opencv_fallback, 9.53ms) para prenda ID None.	172.20.0.1	2026-09-20 19:06:30.098654
7535	1	LOGIN_EXITOSO	usuario	1	Inicio de sesión exitoso de 'Alejandro Sistemas' (admin@fashionstore.com) con rol 'Administrador'.	172.20.0.1	2026-09-20 19:06:30.105156
7536	1	IA_TRYON	prenda	\N	Vestidor Virtual IA (opencv_fallback, 10.31ms) para prenda ID None.	192.168.42.100	2026-09-20 19:06:30.374223
7537	\N	IA_TRYON	prenda	\N	Vestidor Virtual IA (opencv_fallback, 10.49ms) para prenda ID None.	200.10.20.30	2026-09-20 19:06:30.611242
7538	1	IA_TRYON	prenda	\N	Vestidor Virtual IA (gemini_multimodal_tryon, 15.1ms) para prenda ID None.	192.168.10.77	2026-09-20 19:06:32.758261
7539	1	IA_TRYON	prenda	\N	Vestidor Virtual IA (opencv_fallback, 21.13ms) para prenda ID None.	192.168.10.88	2026-09-20 19:06:33.005229
7540	\N	IA_TRYON	prenda	\N	Vestidor Virtual IA (opencv_fallback, 372.41ms) para prenda ID None.	172.20.0.1	2026-09-20 19:06:33.61855
7541	\N	IA_TRYON	prenda	3	Vestidor Virtual IA (opencv_fallback, 94.02ms) para prenda ID 3.	172.20.0.1	2026-09-20 19:06:37.651787
7542	\N	IA_TRYON	prenda	3	Vestidor Virtual IA (opencv_fallback, 100.24ms) para prenda ID 3.	172.20.0.1	2026-09-20 19:06:37.803968
7543	\N	IA_TRYON	prenda	\N	Vestidor Virtual IA (opencv_fallback, 8.51ms) para prenda ID None.	172.20.0.1	2026-09-20 19:06:38.153206
7544	\N	IA_TRYON	prenda	\N	Vestidor Virtual IA (opencv_fallback, 10.33ms) para prenda ID None.	172.20.0.1	2026-09-20 19:06:38.179648
7545	\N	IA_TRYON	prenda	3	Vestidor Virtual IA (opencv_fallback, 12.35ms) para prenda ID 3.	172.20.0.1	2026-09-20 19:06:38.190867
7546	\N	IA_TRYON	prenda	3	Vestidor Virtual IA (opencv_fallback, 12.92ms) para prenda ID 3.	172.20.0.1	2026-09-20 19:06:38.209809
7547	\N	IA_TRYON	prenda	3	Vestidor Virtual IA (opencv_fallback, 15.69ms) para prenda ID 3.	172.20.0.1	2026-09-20 19:06:38.236406
7548	\N	IA_TRYON	prenda	3	Vestidor Virtual IA (opencv_fallback, 12.64ms) para prenda ID 3.	172.20.0.1	2026-09-20 19:06:38.258542
7549	\N	IA_TRYON	prenda	3	Vestidor Virtual IA (opencv_fallback, 18.14ms) para prenda ID 3.	172.20.0.1	2026-09-20 19:06:38.277402
7550	\N	IA_TRYON	prenda	3	Vestidor Virtual IA (opencv_fallback, 15.86ms) para prenda ID 3.	172.20.0.1	2026-09-20 19:06:38.309792
7551	\N	IA_TRYON	prenda	3	Vestidor Virtual IA (opencv_fallback, 12.73ms) para prenda ID 3.	172.20.0.1	2026-09-20 19:06:38.331829
7552	\N	IA_TRYON	prenda	3	Vestidor Virtual IA (opencv_fallback, 12.64ms) para prenda ID 3.	172.20.0.1	2026-09-20 19:06:38.350001
7553	\N	IA_TRYON	prenda	3	Vestidor Virtual IA (opencv_fallback, 13.03ms) para prenda ID 3.	172.20.0.1	2026-09-20 19:06:38.368227
7554	\N	IA_TRYON	prenda	3	Vestidor Virtual IA (opencv_fallback, 16.47ms) para prenda ID 3.	172.20.0.1	2026-09-20 19:06:38.396024
7555	\N	IA_TRYON	prenda	3	Vestidor Virtual IA (opencv_fallback, 16.16ms) para prenda ID 3.	172.20.0.1	2026-09-20 19:06:38.431693
7556	\N	IA_TRYON	prenda	3	Vestidor Virtual IA (opencv_fallback, 22.05ms) para prenda ID 3.	172.20.0.1	2026-09-20 19:06:38.441178
7557	\N	IA_TRYON	prenda	3	Vestidor Virtual IA (opencv_fallback, 21.32ms) para prenda ID 3.	172.20.0.1	2026-09-20 19:06:38.451616
7558	\N	IA_TRYON	prenda	3	Vestidor Virtual IA (opencv_fallback, 34.65ms) para prenda ID 3.	172.20.0.1	2026-09-20 19:06:38.462788
7559	\N	IA_TRYON	prenda	3	Vestidor Virtual IA (opencv_fallback, 33.78ms) para prenda ID 3.	172.20.0.1	2026-09-20 19:06:38.475078
7560	\N	IA_TRYON	prenda	3	Vestidor Virtual IA (opencv_fallback, 22.01ms) para prenda ID 3.	172.20.0.1	2026-09-20 19:06:38.486922
7561	\N	IA_TRYON	prenda	\N	Vestidor Virtual IA (opencv_fallback, 8.52ms) para prenda ID None.	172.20.0.1	2026-09-20 19:06:38.576914
7562	\N	IA_TRYON	prenda	\N	Vestidor Virtual IA (opencv_fallback, 12.36ms) para prenda ID None.	172.20.0.1	2026-09-20 19:06:38.602502
7563	1	LOGIN_EXITOSO	usuario	1	Inicio de sesión exitoso de 'Alejandro Sistemas' (admin@fashionstore.com) con rol 'Administrador'.	192.168.10.101	2026-09-20 19:14:25.890883
7564	1	LOGIN_EXITOSO	usuario	1	Inicio de sesión exitoso de 'Alejandro Sistemas' (admin@fashionstore.com) con rol 'Administrador'.	172.20.0.1	2026-09-20 19:14:26.143502
7565	1	LOGIN_FALLIDO	usuario	1	Intento de inicio de sesión fallido para el correo: admin@fashionstore.com (contraseña incorrecta).	192.168.10.102	2026-09-20 19:14:26.407459
7566	\N	LOGIN_FALLIDO	usuario	\N	Intento de inicio de sesión fallido para el correo: no_existe_qa_999@fashionstore.com (correo no registrado).	192.168.10.103	2026-09-20 19:14:26.67576
7567	1	LOGIN_EXITOSO	usuario	1	Inicio de sesión exitoso de 'Alejandro Sistemas' (admin@fashionstore.com) con rol 'Administrador'.	172.20.0.1	2026-09-20 19:14:26.940296
8441	\N	IA_TRYON	prenda	3	Vestidor Virtual IA (opencv_fallback, 17.03ms) para prenda ID 3.	172.20.0.1	2026-09-20 19:35:26.966597
7569	1	INSERT	usuario	1281	Alta de usuario 'Usuario Cliente QA' (qa_cliente_rbac@fashionstore.com) con rol id=4.	192.168.1.50	2026-09-20 19:14:27.860035
8443	\N	IA_TRYON	prenda	3	Vestidor Virtual IA (opencv_fallback, 14.51ms) para prenda ID 3.	172.20.0.1	2026-09-20 19:35:27.009103
7571	1	INSERT	usuario	1282	Alta de usuario 'Carlos Cajero QA' (qa_nuevo_cajero@fashionstore.com) con rol id=3.	192.168.20.1	2026-09-20 19:14:28.480361
7572	1	UPDATE	usuario	1282	Modificación del usuario 'qa_nuevo_cajero@fashionstore.com'. Campos actualizados: nombre=Carlos Alberto, telefono=71122334.	192.168.20.2	2026-09-20 19:14:28.964846
7573	1	INACTIVAR	usuario	1282	Baja lógica del usuario 'qa_nuevo_cajero@fashionstore.com': estado cambiado de 'Activo' a 'Inactivo'.	192.168.20.3	2026-09-20 19:14:29.168033
7574	1	UPDATE	rol_permiso	3	Se actualizaron los permisos del rol 'Cajero (POS)' (ID: 3). Total asignados: 2.	192.168.1.50	2026-09-20 19:14:29.531404
7575	1	UPDATE	rol_permiso	3	Se actualizaron los permisos del rol 'Cajero (POS)' (ID: 3). Total asignados: 4.	192.168.1.50	2026-09-20 19:14:29.748801
7576	1	UPDATE	rol_permiso	3	Se actualizaron los permisos del rol 'Cajero (POS)' (ID: 3). Total asignados: 0.	192.168.1.50	2026-09-20 19:14:29.818511
7577	1	INSERT	usuario	1283	Alta de usuario 'Cajero POS QA' (qa_cajero_rbac@fashionstore.com) con rol id=3.	192.168.1.50	2026-09-20 19:14:30.076635
8445	\N	IA_TRYON	prenda	3	Vestidor Virtual IA (opencv_fallback, 21.82ms) para prenda ID 3.	172.20.0.1	2026-09-20 19:35:27.072513
7579	1	UPDATE	rol_permiso	3	Se actualizaron los permisos del rol 'Cajero (POS)' (ID: 3). Total asignados: 5.	192.168.1.50	2026-09-20 19:14:30.650557
7580	1	UPDATE	rol_permiso	3	Se actualizaron los permisos del rol 'Cajero (POS)' (ID: 3). Total asignados: 4.	192.168.1.50	2026-09-20 19:14:30.753336
7581	1	INSERT	usuario	1284	Alta de usuario 'Cajero POS QA' (qa_cajero_rbac@fashionstore.com) con rol id=3.	192.168.1.50	2026-09-20 19:14:30.87758
8446	\N	IA_TRYON	prenda	3	Vestidor Virtual IA (opencv_fallback, 23.94ms) para prenda ID 3.	172.20.0.1	2026-09-20 19:35:27.10078
7583	1	UPDATE	rol_permiso	3	Se actualizaron los permisos del rol 'Cajero (POS)' (ID: 3). Total asignados: 5.	192.168.1.50	2026-09-20 19:14:31.499244
7584	1	INSERT	usuario	1285	Alta de usuario 'Carlos Recuperador' (qa_recovery_user@fashionstore.com) con rol id=4.	192.168.1.50	2026-09-20 19:14:31.673977
8447	\N	IA_TRYON	prenda	3	Vestidor Virtual IA (opencv_fallback, 39.98ms) para prenda ID 3.	172.20.0.1	2026-09-20 19:35:27.167936
7586	1	INSERT	usuario	1286	Alta de usuario 'Carlos Recuperador' (qa_recovery_user@fashionstore.com) con rol id=4.	192.168.1.50	2026-09-20 19:14:32.048558
8453	\N	IA_TRYON	prenda	\N	Vestidor Virtual IA (opencv_fallback, 10.77ms) para prenda externa personalizada.	172.20.0.1	2026-09-20 19:35:27.337046
8455	\N	IA_TRYON	prenda	3	Vestidor Virtual IA (opencv_fallback, 15.66ms) para prenda ID 3.	172.20.0.1	2026-09-20 19:35:27.518997
7589	1	INSERT	usuario	1287	Alta de usuario 'Carlos Recuperador' (qa_recovery_user@fashionstore.com) con rol id=4.	192.168.1.50	2026-09-20 19:14:32.413994
8456	\N	IA_TRYON	prenda	\N	Vestidor Virtual IA (opencv_fallback, 13.41ms) para prenda externa personalizada.	172.20.0.1	2026-09-20 19:35:27.564059
7591	1	INSERT	usuario	1288	Alta de usuario 'Carlos Recuperador' (qa_recovery_user@fashionstore.com) con rol id=4.	192.168.1.50	2026-09-20 19:14:32.781926
7596	1	INSERT	usuario	1289	Alta de usuario 'Carlos Recuperador' (qa_recovery_user@fashionstore.com) con rol id=4.	192.168.1.50	2026-09-20 19:14:33.924688
7598	1	INSERT	usuario	1290	Alta de usuario 'Carlos Recuperador' (qa_recovery_user@fashionstore.com) con rol id=4.	192.168.1.50	2026-09-20 19:14:34.301039
7599	1	INSERT	usuario	1291	Alta de usuario 'Carlos Recuperador' (qa_recovery_user@fashionstore.com) con rol id=4.	192.168.1.50	2026-09-20 19:14:34.614364
7602	1	INSERT	usuario	1292	Alta de usuario 'Carlos Recuperador' (qa_recovery_user@fashionstore.com) con rol id=4.	192.168.1.50	2026-09-20 19:14:35.245282
7603	1	INSERT	usuario	1293	Alta de usuario 'Inactivo QA' (qa_user_inactivo_recovery@fashionstore.com) con rol id=4.	192.168.1.50	2026-09-20 19:14:35.716539
7604	1	INSERT	usuario	1294	Alta de usuario 'Carlos Recuperador' (qa_recovery_user@fashionstore.com) con rol id=4.	192.168.1.50	2026-09-20 19:14:36.059478
7606	1	INSERT	usuario	1295	Alta de usuario 'Carlos Recuperador' (qa_recovery_user@fashionstore.com) con rol id=4.	192.168.1.50	2026-09-20 19:14:36.486369
7611	1	INSERT	usuario	1296	Alta de usuario 'Carlos Recuperador' (qa_recovery_user@fashionstore.com) con rol id=4.	192.168.1.50	2026-09-20 19:14:37.632799
7615	1	INSERT	cliente	66	Alta del cliente 'Lucía Morales Paz' (CI 88997711).	192.168.40.1	2026-09-20 19:14:38.7163
7616	1	UPDATE	cliente	66	Modificación del cliente CI 88997711. Campos: nombre_completo=Lucía Morales de Mendoza, telefono=78999999.	192.168.40.2	2026-09-20 19:14:39.01601
7617	1	INACTIVAR	cliente	66	Baja lógica del cliente 'Lucía Morales de Mendoza' (CI 88997711).	192.168.40.3	2026-09-20 19:14:39.069018
7618	1	INSERT	ciudad	194	Alta de la ciudad 'Tarija QA'.	192.168.30.1	2026-09-20 19:14:39.270686
7619	1	INSERT	sucursal	134	Alta de la sucursal 'Sucursal Tarija Centro QA' en la ciudad id=194.	192.168.30.2	2026-09-20 19:14:39.51972
7620	1	UPDATE	sucursal	134	Modificación de la sucursal 'Sucursal Tarija Centro QA'. Campos: direccion=Calle Sucre #789 (Modificado), telefono=66449988.	192.168.30.3	2026-09-20 19:14:39.679323
7621	1	INSERT	categoria	151	Alta de la categoría 'Deportes QA'.	192.168.50.1	2026-09-20 19:14:39.838899
7622	1	INSERT	categoria	152	Alta de la categoría 'Calzado Deportivo QA'.	192.168.1.50	2026-09-20 19:14:39.89197
7623	1	UPDATE	categoria	151	Modificación de la categoría 'Deportes QA'. Campos: descripcion=Ropa de running y fitness.	192.168.50.2	2026-09-20 19:14:40.090143
7624	1	INACTIVAR	categoria	152	Baja lógica de la categoría 'Calzado Deportivo QA' (0 prenda(s) asociadas).	192.168.50.3	2026-09-20 19:14:40.200968
7625	1	INACTIVAR	categoria	151	Baja lógica de la categoría 'Deportes QA' (0 prenda(s) asociadas).	192.168.50.3	2026-09-20 19:14:40.247824
8448	\N	IA_TRYON	prenda	3	Vestidor Virtual IA (opencv_fallback, 43.47ms) para prenda ID 3.	172.20.0.1	2026-09-20 19:35:27.169346
8495	\N	IA_TRYON	prenda	\N	Vestidor Virtual IA (opencv_fallback, 11.85ms) para prenda externa personalizada.	172.20.0.1	2026-09-20 19:43:09.222772
8672	\N	IA_TRYON	prenda	\N	Vestidor Virtual IA (opencv_fallback, 17.4ms) para prenda externa personalizada.	172.20.0.1	2026-09-20 19:44:31.895988
8717	1	IA_TRYON	prenda	\N	Vestidor Virtual IA (opencv_fallback, 9.07ms) para prenda externa personalizada.	192.168.42.100	2026-09-20 19:49:22.010603
8718	\N	IA_TRYON	prenda	\N	Vestidor Virtual IA (opencv_fallback, 9.32ms) para prenda externa personalizada.	200.10.20.30	2026-09-20 19:49:22.242759
8721	\N	IA_TRYON	prenda	\N	Vestidor Virtual IA (opencv_fallback, 144.31ms) para prenda externa personalizada.	172.20.0.1	2026-09-20 19:49:24.966875
8722	\N	IA_TRYON	prenda	3	Vestidor Virtual IA (opencv_fallback, 17.71ms) para prenda ID 3.	172.20.0.1	2026-09-20 19:49:27.564886
8723	\N	IA_TRYON	prenda	3	Vestidor Virtual IA (opencv_fallback, 81.08ms) para prenda ID 3.	172.20.0.1	2026-09-20 19:49:34.260222
8724	\N	IA_TRYON	prenda	3	Vestidor Virtual IA (opencv_fallback, 153.74ms) para prenda ID 3.	172.20.0.1	2026-09-20 19:49:34.455877
8725	\N	IA_TRYON	prenda	\N	Vestidor Virtual IA (opencv_fallback, 10.13ms) para prenda externa personalizada.	172.20.0.1	2026-09-20 19:49:34.779281
8726	\N	IA_TRYON	prenda	\N	Vestidor Virtual IA (opencv_fallback, 10.58ms) para prenda externa personalizada.	172.20.0.1	2026-09-20 19:49:34.795924
8727	\N	IA_TRYON	prenda	3	Vestidor Virtual IA (opencv_fallback, 16.75ms) para prenda ID 3.	172.20.0.1	2026-09-20 19:49:34.806262
8728	\N	IA_TRYON	prenda	3	Vestidor Virtual IA (opencv_fallback, 15.0ms) para prenda ID 3.	172.20.0.1	2026-09-20 19:49:34.829337
8730	\N	IA_TRYON	prenda	3	Vestidor Virtual IA (opencv_fallback, 15.41ms) para prenda ID 3.	172.20.0.1	2026-09-20 19:49:34.888138
8753	1	INSERT	usuario	1390	Alta de usuario 'Carlos Cajero QA' (qa_nuevo_cajero@fashionstore.com) con rol id=3.	192.168.20.1	2026-09-20 19:50:41.395341
8754	1	UPDATE	usuario	1390	Modificación del usuario 'qa_nuevo_cajero@fashionstore.com'. Campos actualizados: nombre=Carlos Alberto, telefono=71122334.	192.168.20.2	2026-09-20 19:50:41.85986
8755	1	INACTIVAR	usuario	1390	Baja lógica del usuario 'qa_nuevo_cajero@fashionstore.com': estado cambiado de 'Activo' a 'Inactivo'.	192.168.20.3	2026-09-20 19:50:42.05946
8756	1	UPDATE	rol_permiso	3	Se actualizaron los permisos del rol 'Cajero (POS)' (ID: 3). Total asignados: 2.	192.168.1.50	2026-09-20 19:50:42.407325
8757	1	UPDATE	rol_permiso	3	Se actualizaron los permisos del rol 'Cajero (POS)' (ID: 3). Total asignados: 4.	192.168.1.50	2026-09-20 19:50:42.623218
8758	1	UPDATE	rol_permiso	3	Se actualizaron los permisos del rol 'Cajero (POS)' (ID: 3). Total asignados: 0.	192.168.1.50	2026-09-20 19:50:42.694677
8759	1	INSERT	usuario	1391	Alta de usuario 'Cajero POS QA' (qa_cajero_rbac@fashionstore.com) con rol id=3.	192.168.1.50	2026-09-20 19:50:42.959239
8761	1	UPDATE	rol_permiso	3	Se actualizaron los permisos del rol 'Cajero (POS)' (ID: 3). Total asignados: 5.	192.168.1.50	2026-09-20 19:50:43.525926
8762	1	UPDATE	rol_permiso	3	Se actualizaron los permisos del rol 'Cajero (POS)' (ID: 3). Total asignados: 4.	192.168.1.50	2026-09-20 19:50:43.632359
8763	1	INSERT	usuario	1392	Alta de usuario 'Cajero POS QA' (qa_cajero_rbac@fashionstore.com) con rol id=3.	192.168.1.50	2026-09-20 19:50:43.770014
8765	1	UPDATE	rol_permiso	3	Se actualizaron los permisos del rol 'Cajero (POS)' (ID: 3). Total asignados: 5.	192.168.1.50	2026-09-20 19:50:44.396974
8766	1	INSERT	usuario	1393	Alta de usuario 'Carlos Recuperador' (qa_recovery_user@fashionstore.com) con rol id=4.	192.168.1.50	2026-09-20 19:50:44.565837
8768	1	INSERT	usuario	1394	Alta de usuario 'Carlos Recuperador' (qa_recovery_user@fashionstore.com) con rol id=4.	192.168.1.50	2026-09-20 19:50:44.935425
8771	1	INSERT	usuario	1395	Alta de usuario 'Carlos Recuperador' (qa_recovery_user@fashionstore.com) con rol id=4.	192.168.1.50	2026-09-20 19:50:45.30638
8773	1	INSERT	usuario	1396	Alta de usuario 'Carlos Recuperador' (qa_recovery_user@fashionstore.com) con rol id=4.	192.168.1.50	2026-09-20 19:50:45.674576
8778	1	INSERT	usuario	1397	Alta de usuario 'Carlos Recuperador' (qa_recovery_user@fashionstore.com) con rol id=4.	192.168.1.50	2026-09-20 19:50:46.820081
8780	1	INSERT	usuario	1398	Alta de usuario 'Carlos Recuperador' (qa_recovery_user@fashionstore.com) con rol id=4.	192.168.1.50	2026-09-20 19:50:47.19215
8781	1	INSERT	usuario	1399	Alta de usuario 'Carlos Recuperador' (qa_recovery_user@fashionstore.com) con rol id=4.	192.168.1.50	2026-09-20 19:50:47.53159
8784	1	INSERT	usuario	1400	Alta de usuario 'Carlos Recuperador' (qa_recovery_user@fashionstore.com) con rol id=4.	192.168.1.50	2026-09-20 19:50:48.181852
8785	1	INSERT	usuario	1401	Alta de usuario 'Inactivo QA' (qa_user_inactivo_recovery@fashionstore.com) con rol id=4.	192.168.1.50	2026-09-20 19:50:48.649219
8786	1	INSERT	usuario	1402	Alta de usuario 'Carlos Recuperador' (qa_recovery_user@fashionstore.com) con rol id=4.	192.168.1.50	2026-09-20 19:50:48.972909
8788	1	INSERT	usuario	1403	Alta de usuario 'Carlos Recuperador' (qa_recovery_user@fashionstore.com) con rol id=4.	192.168.1.50	2026-09-20 19:50:49.391414
8793	1	INSERT	usuario	1404	Alta de usuario 'Carlos Recuperador' (qa_recovery_user@fashionstore.com) con rol id=4.	192.168.1.50	2026-09-20 19:50:50.532978
8797	1	INSERT	cliente	72	Alta del cliente 'Lucía Morales Paz' (CI 88997711).	192.168.40.1	2026-09-20 19:50:51.620337
8798	1	UPDATE	cliente	72	Modificación del cliente CI 88997711. Campos: nombre_completo=Lucía Morales de Mendoza, telefono=78999999.	192.168.40.2	2026-09-20 19:50:51.915007
8799	1	INACTIVAR	cliente	72	Baja lógica del cliente 'Lucía Morales de Mendoza' (CI 88997711).	192.168.40.3	2026-09-20 19:50:51.967924
8800	1	INSERT	ciudad	206	Alta de la ciudad 'Tarija QA'.	192.168.30.1	2026-09-20 19:50:52.169093
8801	1	INSERT	sucursal	146	Alta de la sucursal 'Sucursal Tarija Centro QA' en la ciudad id=206.	192.168.30.2	2026-09-20 19:50:52.420262
8802	1	UPDATE	sucursal	146	Modificación de la sucursal 'Sucursal Tarija Centro QA'. Campos: direccion=Calle Sucre #789 (Modificado), telefono=66449988.	192.168.30.3	2026-09-20 19:50:52.571354
8803	1	INSERT	categoria	163	Alta de la categoría 'Deportes QA'.	192.168.50.1	2026-09-20 19:50:52.730992
8804	1	INSERT	categoria	164	Alta de la categoría 'Calzado Deportivo QA'.	192.168.1.50	2026-09-20 19:50:52.789071
8805	1	UPDATE	categoria	163	Modificación de la categoría 'Deportes QA'. Campos: descripcion=Ropa de running y fitness.	192.168.50.2	2026-09-20 19:50:52.995196
8806	1	INACTIVAR	categoria	164	Baja lógica de la categoría 'Calzado Deportivo QA' (0 prenda(s) asociadas).	192.168.50.3	2026-09-20 19:50:53.099579
8807	1	INACTIVAR	categoria	163	Baja lógica de la categoría 'Deportes QA' (0 prenda(s) asociadas).	192.168.50.3	2026-09-20 19:50:53.148629
7673	1	IA_RECOMENDACION	inventario	180	Recomendación IA (Fallback Catálogo): 3 prendas sugeridas para estilo 'Formal' y ocasión 'Trabajo'.	192.168.1.50	2026-09-20 19:14:48.448733
7674	1	IA_RECOMENDACION	inventario	180	Recomendación IA (Fallback Catálogo): 2 prendas sugeridas para estilo 'Deportivo' y ocasión 'General'.	192.168.1.50	2026-09-20 19:14:48.981805
7675	1	IA_RECOMENDACION	inventario	180	Recomendación IA (Fallback Catálogo): 5 prendas sugeridas para estilo 'Urbano' y ocasión 'General'.	192.168.1.50	2026-09-20 19:14:49.65807
7676	1	IA_RECOMENDACION	inventario	180	Recomendación IA (Fallback Catálogo): 6 prendas sugeridas para estilo 'Elegante' y ocasión 'Cena'.	10.0.0.77	2026-09-20 19:14:49.913231
7677	1	IA_ANALITICA_VOZ	inventario	\N	Analítica por voz CU23: 'Cuántas prendas tenemos en stock en todas las sucursales' -> Métrica 'inventario_stock', Resultados=4, PDF=False.	192.168.1.50	2026-09-20 19:14:50.641681
7679	1	IA_ANALITICA_VOZ	venta	\N	Analítica por voz CU23: 'Generar reporte ejecutivo de ventas globales del mes' -> Métrica 'ventas_total', Resultados=2, PDF=True.	192.168.1.50	2026-09-20 19:14:51.595123
7680	1	IA_ANALITICA_VOZ	inventario	\N	Analítica por voz CU23: 'Reporte de existencias para auditoria' -> Métrica 'inventario_stock', Resultados=4, PDF=False.	172.16.5.99	2026-09-20 19:14:51.835351
7681	1	INSERT	ciudad	195	Alta de la ciudad 'Pando QA IP Test'.	200.87.100.45	2026-09-20 19:14:52.54046
7682	\N	LOGIN_FALLIDO	usuario	\N	Intento de inicio de sesión fallido para el correo: no_existe_seguro@fashionstore.com (correo no registrado).	192.168.99.99	2026-09-20 19:14:52.805914
7683	1	UPDATE	rol_permiso	3	Se actualizaron los permisos del rol 'Cajero (POS)' (ID: 3). Total asignados: 3.	198.51.100.22	2026-09-20 19:14:53.067731
7684	1	INSERT	usuario	1297	Alta de usuario 'Audit CU04' (qa_bitacora_cu04@fashionstore.com) con rol id=4.	192.168.1.50	2026-09-20 19:14:53.438255
7687	\N	IA_TRYON	prenda	3	Vestidor Virtual IA (opencv_fallback, 107.05ms) para prenda ID 3.	172.20.0.1	2026-09-20 19:15:02.527267
7688	\N	IA_TRYON	prenda	3	Vestidor Virtual IA (opencv_fallback, 85.88ms) para prenda ID 3.	172.20.0.1	2026-09-20 19:15:02.683522
7689	\N	IA_TRYON	prenda	\N	Vestidor Virtual IA (opencv_fallback, 9.82ms) para prenda ID None.	172.20.0.1	2026-09-20 19:15:03.013933
7690	\N	IA_TRYON	prenda	\N	Vestidor Virtual IA (opencv_fallback, 9.96ms) para prenda ID None.	172.20.0.1	2026-09-20 19:15:03.038442
7691	\N	IA_TRYON	prenda	3	Vestidor Virtual IA (opencv_fallback, 13.12ms) para prenda ID 3.	172.20.0.1	2026-09-20 19:15:03.048941
7692	\N	IA_TRYON	prenda	3	Vestidor Virtual IA (opencv_fallback, 14.88ms) para prenda ID 3.	172.20.0.1	2026-09-20 19:15:03.06962
7693	\N	IA_TRYON	prenda	3	Vestidor Virtual IA (opencv_fallback, 15.35ms) para prenda ID 3.	172.20.0.1	2026-09-20 19:15:03.098278
7694	\N	IA_TRYON	prenda	3	Vestidor Virtual IA (opencv_fallback, 14.0ms) para prenda ID 3.	172.20.0.1	2026-09-20 19:15:03.120608
7695	\N	IA_TRYON	prenda	3	Vestidor Virtual IA (opencv_fallback, 12.62ms) para prenda ID 3.	172.20.0.1	2026-09-20 19:15:03.140303
7696	\N	IA_TRYON	prenda	3	Vestidor Virtual IA (opencv_fallback, 12.2ms) para prenda ID 3.	172.20.0.1	2026-09-20 19:15:03.158984
7697	\N	IA_TRYON	prenda	3	Vestidor Virtual IA (opencv_fallback, 12.58ms) para prenda ID 3.	172.20.0.1	2026-09-20 19:15:03.176785
7698	\N	IA_TRYON	prenda	3	Vestidor Virtual IA (opencv_fallback, 13.2ms) para prenda ID 3.	172.20.0.1	2026-09-20 19:15:03.194809
7699	\N	IA_TRYON	prenda	3	Vestidor Virtual IA (opencv_fallback, 15.35ms) para prenda ID 3.	172.20.0.1	2026-09-20 19:15:03.224427
7700	\N	IA_TRYON	prenda	3	Vestidor Virtual IA (opencv_fallback, 12.76ms) para prenda ID 3.	172.20.0.1	2026-09-20 19:15:03.246112
7701	\N	IA_TRYON	prenda	3	Vestidor Virtual IA (opencv_fallback, 18.66ms) para prenda ID 3.	172.20.0.1	2026-09-20 19:15:03.284996
7702	\N	IA_TRYON	prenda	3	Vestidor Virtual IA (opencv_fallback, 22.35ms) para prenda ID 3.	172.20.0.1	2026-09-20 19:15:03.295339
7703	\N	IA_TRYON	prenda	3	Vestidor Virtual IA (opencv_fallback, 23.33ms) para prenda ID 3.	172.20.0.1	2026-09-20 19:15:03.307924
7704	\N	IA_TRYON	prenda	3	Vestidor Virtual IA (opencv_fallback, 67.22ms) para prenda ID 3.	172.20.0.1	2026-09-20 19:15:03.279598
7705	\N	IA_TRYON	prenda	3	Vestidor Virtual IA (opencv_fallback, 31.75ms) para prenda ID 3.	172.20.0.1	2026-09-20 19:15:03.322203
7706	\N	IA_TRYON	prenda	3	Vestidor Virtual IA (opencv_fallback, 28.79ms) para prenda ID 3.	172.20.0.1	2026-09-20 19:15:03.337344
7707	\N	IA_TRYON	prenda	\N	Vestidor Virtual IA (opencv_fallback, 9.97ms) para prenda ID None.	172.20.0.1	2026-09-20 19:15:03.473962
7708	\N	IA_TRYON	prenda	\N	Vestidor Virtual IA (opencv_fallback, 11.33ms) para prenda ID None.	172.20.0.1	2026-09-20 19:15:03.500023
7709	\N	IA_TRYON	prenda	3	Vestidor Virtual IA (opencv_fallback, 20.83ms) para prenda ID 3.	172.20.0.1	2026-09-20 19:15:03.656171
7710	\N	IA_TRYON	prenda	\N	Vestidor Virtual IA (opencv_fallback, 8.83ms) para prenda ID None.	172.20.0.1	2026-09-20 19:15:03.698476
7711	1	IA_TRYON	prenda	\N	Vestidor Virtual IA (opencv_fallback, 8.9ms) para prenda ID None.	192.168.42.100	2026-09-20 19:15:03.7103
7712	\N	IA_TRYON	prenda	\N	Vestidor Virtual IA (opencv_fallback, 8.02ms) para prenda ID None.	200.10.20.30	2026-09-20 19:15:03.941616
7713	1	IA_TRYON	prenda	\N	Vestidor Virtual IA (gemini_multimodal_tryon, 13.54ms) para prenda ID None.	192.168.10.77	2026-09-20 19:15:06.103728
7714	1	IA_TRYON	prenda	\N	Vestidor Virtual IA (opencv_fallback, 14.31ms) para prenda ID None.	192.168.10.88	2026-09-20 19:15:06.344576
7715	\N	IA_TRYON	prenda	\N	Vestidor Virtual IA (opencv_fallback, 364.41ms) para prenda ID None.	172.20.0.1	2026-09-20 19:15:06.941276
7718	\N	IA_TRYON	prenda	3	Vestidor Virtual IA (opencv_fallback, 1409.24ms) para prenda ID 3.	172.20.0.1	2026-09-20 19:18:28.031345
7719	\N	IA_TRYON	prenda	\N	Vestidor Virtual IA (opencv_fallback, 10.14ms) para prenda externa personalizada.	172.20.0.1	2026-09-20 19:18:29.465335
7720	1	LOGIN_EXITOSO	usuario	1	Inicio de sesión exitoso de 'Alejandro Sistemas' (admin@fashionstore.com) con rol 'Administrador'.	172.20.0.1	2026-09-20 19:18:29.478141
7721	1	IA_TRYON	prenda	\N	Vestidor Virtual IA (opencv_fallback, 10.01ms) para prenda externa personalizada.	192.168.42.100	2026-09-20 19:18:29.771093
7722	\N	IA_TRYON	prenda	\N	Vestidor Virtual IA (opencv_fallback, 8.26ms) para prenda externa personalizada.	200.10.20.30	2026-09-20 19:18:30.001334
7723	1	IA_TRYON	prenda	\N	Vestidor Virtual IA (gemini_multimodal_tryon, 15.07ms) para prenda externa personalizada.	192.168.10.77	2026-09-20 19:18:32.176522
7724	1	IA_TRYON	prenda	\N	Vestidor Virtual IA (opencv_fallback, 14.46ms) para prenda externa personalizada.	192.168.10.88	2026-09-20 19:18:32.418876
7725	\N	IA_TRYON	prenda	\N	Vestidor Virtual IA (opencv_fallback, 426.08ms) para prenda externa personalizada.	172.20.0.1	2026-09-20 19:18:33.077871
7726	\N	IA_TRYON	prenda	3	Vestidor Virtual IA (opencv_fallback, 132.46ms) para prenda ID 3.	172.20.0.1	2026-09-20 19:18:44.595165
7727	\N	IA_TRYON	prenda	3	Vestidor Virtual IA (opencv_fallback, 149.9ms) para prenda ID 3.	172.20.0.1	2026-09-20 19:18:44.824335
7728	\N	IA_TRYON	prenda	\N	Vestidor Virtual IA (opencv_fallback, 11.28ms) para prenda externa personalizada.	172.20.0.1	2026-09-20 19:18:45.213083
7729	\N	IA_TRYON	prenda	\N	Vestidor Virtual IA (opencv_fallback, 11.63ms) para prenda externa personalizada.	172.20.0.1	2026-09-20 19:18:45.231552
7730	\N	IA_TRYON	prenda	3	Vestidor Virtual IA (opencv_fallback, 18.66ms) para prenda ID 3.	172.20.0.1	2026-09-20 19:18:45.241008
7731	\N	IA_TRYON	prenda	3	Vestidor Virtual IA (opencv_fallback, 17.84ms) para prenda ID 3.	172.20.0.1	2026-09-20 19:18:45.266989
7732	\N	IA_TRYON	prenda	3	Vestidor Virtual IA (opencv_fallback, 14.32ms) para prenda ID 3.	172.20.0.1	2026-09-20 19:18:45.290193
7733	\N	IA_TRYON	prenda	3	Vestidor Virtual IA (opencv_fallback, 15.04ms) para prenda ID 3.	172.20.0.1	2026-09-20 19:18:45.310414
7734	\N	IA_TRYON	prenda	3	Vestidor Virtual IA (opencv_fallback, 16.75ms) para prenda ID 3.	172.20.0.1	2026-09-20 19:18:45.339411
7735	\N	IA_TRYON	prenda	3	Vestidor Virtual IA (opencv_fallback, 14.53ms) para prenda ID 3.	172.20.0.1	2026-09-20 19:18:45.362348
7736	\N	IA_TRYON	prenda	3	Vestidor Virtual IA (opencv_fallback, 14.98ms) para prenda ID 3.	172.20.0.1	2026-09-20 19:18:45.382165
7737	\N	IA_TRYON	prenda	3	Vestidor Virtual IA (opencv_fallback, 20.06ms) para prenda ID 3.	172.20.0.1	2026-09-20 19:18:45.411878
7738	\N	IA_TRYON	prenda	3	Vestidor Virtual IA (opencv_fallback, 17.34ms) para prenda ID 3.	172.20.0.1	2026-09-20 19:18:45.437992
7739	\N	IA_TRYON	prenda	3	Vestidor Virtual IA (opencv_fallback, 15.98ms) para prenda ID 3.	172.20.0.1	2026-09-20 19:18:45.46103
7740	\N	IA_TRYON	prenda	3	Vestidor Virtual IA (opencv_fallback, 22.57ms) para prenda ID 3.	172.20.0.1	2026-09-20 19:18:45.501314
7741	\N	IA_TRYON	prenda	3	Vestidor Virtual IA (opencv_fallback, 28.97ms) para prenda ID 3.	172.20.0.1	2026-09-20 19:18:45.511674
7742	\N	IA_TRYON	prenda	3	Vestidor Virtual IA (opencv_fallback, 25.31ms) para prenda ID 3.	172.20.0.1	2026-09-20 19:18:45.525749
7743	\N	IA_TRYON	prenda	3	Vestidor Virtual IA (opencv_fallback, 44.06ms) para prenda ID 3.	172.20.0.1	2026-09-20 19:18:45.537899
7744	\N	IA_TRYON	prenda	3	Vestidor Virtual IA (opencv_fallback, 49.31ms) para prenda ID 3.	172.20.0.1	2026-09-20 19:18:45.551465
7745	\N	IA_TRYON	prenda	3	Vestidor Virtual IA (opencv_fallback, 47.07ms) para prenda ID 3.	172.20.0.1	2026-09-20 19:18:45.566619
7746	\N	IA_TRYON	prenda	\N	Vestidor Virtual IA (opencv_fallback, 9.09ms) para prenda externa personalizada.	172.20.0.1	2026-09-20 19:18:45.674367
7747	\N	IA_TRYON	prenda	\N	Vestidor Virtual IA (opencv_fallback, 12.15ms) para prenda externa personalizada.	172.20.0.1	2026-09-20 19:18:45.700609
7748	1	LOGIN_EXITOSO	usuario	1	Inicio de sesión exitoso de 'Alejandro Sistemas' (admin@fashionstore.com) con rol 'Administrador'.	192.168.10.101	2026-09-20 19:19:54.653093
7749	1	LOGIN_EXITOSO	usuario	1	Inicio de sesión exitoso de 'Alejandro Sistemas' (admin@fashionstore.com) con rol 'Administrador'.	172.20.0.1	2026-09-20 19:19:54.897605
7750	1	LOGIN_FALLIDO	usuario	1	Intento de inicio de sesión fallido para el correo: admin@fashionstore.com (contraseña incorrecta).	192.168.10.102	2026-09-20 19:19:55.158781
7751	\N	LOGIN_FALLIDO	usuario	\N	Intento de inicio de sesión fallido para el correo: no_existe_qa_999@fashionstore.com (correo no registrado).	192.168.10.103	2026-09-20 19:19:55.420621
7752	1	LOGIN_EXITOSO	usuario	1	Inicio de sesión exitoso de 'Alejandro Sistemas' (admin@fashionstore.com) con rol 'Administrador'.	172.20.0.1	2026-09-20 19:19:55.683985
8449	\N	IA_TRYON	prenda	3	Vestidor Virtual IA (opencv_fallback, 30.61ms) para prenda ID 3.	172.20.0.1	2026-09-20 19:35:27.187525
7754	1	INSERT	usuario	1299	Alta de usuario 'Usuario Cliente QA' (qa_cliente_rbac@fashionstore.com) con rol id=4.	192.168.1.50	2026-09-20 19:19:56.621512
8501	1	IA_TRYON	prenda	\N	Vestidor Virtual IA (gemini_multimodal_tryon, 14.75ms) para prenda externa personalizada.	192.168.10.77	2026-09-20 19:43:37.408386
7756	1	INSERT	usuario	1300	Alta de usuario 'Carlos Cajero QA' (qa_nuevo_cajero@fashionstore.com) con rol id=3.	192.168.20.1	2026-09-20 19:19:57.244538
7757	1	UPDATE	usuario	1300	Modificación del usuario 'qa_nuevo_cajero@fashionstore.com'. Campos actualizados: nombre=Carlos Alberto, telefono=71122334.	192.168.20.2	2026-09-20 19:19:57.710347
7758	1	INACTIVAR	usuario	1300	Baja lógica del usuario 'qa_nuevo_cajero@fashionstore.com': estado cambiado de 'Activo' a 'Inactivo'.	192.168.20.3	2026-09-20 19:19:57.91692
7759	1	UPDATE	rol_permiso	3	Se actualizaron los permisos del rol 'Cajero (POS)' (ID: 3). Total asignados: 2.	192.168.1.50	2026-09-20 19:19:58.307029
7760	1	UPDATE	rol_permiso	3	Se actualizaron los permisos del rol 'Cajero (POS)' (ID: 3). Total asignados: 4.	192.168.1.50	2026-09-20 19:19:58.528484
7761	1	UPDATE	rol_permiso	3	Se actualizaron los permisos del rol 'Cajero (POS)' (ID: 3). Total asignados: 0.	192.168.1.50	2026-09-20 19:19:58.600454
7762	1	INSERT	usuario	1301	Alta de usuario 'Cajero POS QA' (qa_cajero_rbac@fashionstore.com) con rol id=3.	192.168.1.50	2026-09-20 19:19:58.861282
8502	1	IA_TRYON	prenda	\N	Vestidor Virtual IA (opencv_fallback, 14.27ms) para prenda externa personalizada.	192.168.10.88	2026-09-20 19:43:37.651345
7764	1	UPDATE	rol_permiso	3	Se actualizaron los permisos del rol 'Cajero (POS)' (ID: 3). Total asignados: 5.	192.168.1.50	2026-09-20 19:19:59.4388
7765	1	UPDATE	rol_permiso	3	Se actualizaron los permisos del rol 'Cajero (POS)' (ID: 3). Total asignados: 4.	192.168.1.50	2026-09-20 19:19:59.541648
7766	1	INSERT	usuario	1302	Alta de usuario 'Cajero POS QA' (qa_cajero_rbac@fashionstore.com) con rol id=3.	192.168.1.50	2026-09-20 19:19:59.667904
8677	1	IA_TRYON	prenda	\N	Vestidor Virtual IA (gemini_multimodal_tryon, 14.4ms) para prenda externa personalizada.	192.168.10.77	2026-09-20 19:44:34.468401
7768	1	UPDATE	rol_permiso	3	Se actualizaron los permisos del rol 'Cajero (POS)' (ID: 3). Total asignados: 5.	192.168.1.50	2026-09-20 19:20:00.314585
7769	1	INSERT	usuario	1303	Alta de usuario 'Carlos Recuperador' (qa_recovery_user@fashionstore.com) con rol id=4.	192.168.1.50	2026-09-20 19:20:00.491353
7771	1	INSERT	usuario	1304	Alta de usuario 'Carlos Recuperador' (qa_recovery_user@fashionstore.com) con rol id=4.	192.168.1.50	2026-09-20 19:20:00.868394
7774	1	INSERT	usuario	1305	Alta de usuario 'Carlos Recuperador' (qa_recovery_user@fashionstore.com) con rol id=4.	192.168.1.50	2026-09-20 19:20:01.244583
7776	1	INSERT	usuario	1306	Alta de usuario 'Carlos Recuperador' (qa_recovery_user@fashionstore.com) con rol id=4.	192.168.1.50	2026-09-20 19:20:01.622504
7781	1	INSERT	usuario	1307	Alta de usuario 'Carlos Recuperador' (qa_recovery_user@fashionstore.com) con rol id=4.	192.168.1.50	2026-09-20 19:20:02.802536
7783	1	INSERT	usuario	1308	Alta de usuario 'Carlos Recuperador' (qa_recovery_user@fashionstore.com) con rol id=4.	192.168.1.50	2026-09-20 19:20:03.249663
7784	1	INSERT	usuario	1309	Alta de usuario 'Carlos Recuperador' (qa_recovery_user@fashionstore.com) con rol id=4.	192.168.1.50	2026-09-20 19:20:03.586965
7787	1	INSERT	usuario	1310	Alta de usuario 'Carlos Recuperador' (qa_recovery_user@fashionstore.com) con rol id=4.	192.168.1.50	2026-09-20 19:20:04.26951
7788	1	INSERT	usuario	1311	Alta de usuario 'Inactivo QA' (qa_user_inactivo_recovery@fashionstore.com) con rol id=4.	192.168.1.50	2026-09-20 19:20:04.74814
7789	1	INSERT	usuario	1312	Alta de usuario 'Carlos Recuperador' (qa_recovery_user@fashionstore.com) con rol id=4.	192.168.1.50	2026-09-20 19:20:05.061334
7791	1	INSERT	usuario	1313	Alta de usuario 'Carlos Recuperador' (qa_recovery_user@fashionstore.com) con rol id=4.	192.168.1.50	2026-09-20 19:20:05.484009
8450	\N	IA_TRYON	prenda	3	Vestidor Virtual IA (opencv_fallback, 35.92ms) para prenda ID 3.	172.20.0.1	2026-09-20 19:35:27.206395
8505	\N	IA_TRYON	prenda	3	Vestidor Virtual IA (opencv_fallback, 86.86ms) para prenda ID 3.	172.20.0.1	2026-09-20 19:43:42.91036
7796	1	INSERT	usuario	1314	Alta de usuario 'Carlos Recuperador' (qa_recovery_user@fashionstore.com) con rol id=4.	192.168.1.50	2026-09-20 19:20:06.655262
8506	\N	IA_TRYON	prenda	3	Vestidor Virtual IA (opencv_fallback, 168.31ms) para prenda ID 3.	172.20.0.1	2026-09-20 19:43:43.115726
8507	\N	IA_TRYON	prenda	\N	Vestidor Virtual IA (opencv_fallback, 9.35ms) para prenda externa personalizada.	172.20.0.1	2026-09-20 19:43:43.460639
8508	\N	IA_TRYON	prenda	\N	Vestidor Virtual IA (opencv_fallback, 11.03ms) para prenda externa personalizada.	172.20.0.1	2026-09-20 19:43:43.478068
7800	1	INSERT	cliente	67	Alta del cliente 'Lucía Morales Paz' (CI 88997711).	192.168.40.1	2026-09-20 19:20:07.765448
7801	1	UPDATE	cliente	67	Modificación del cliente CI 88997711. Campos: nombre_completo=Lucía Morales de Mendoza, telefono=78999999.	192.168.40.2	2026-09-20 19:20:08.066642
7802	1	INACTIVAR	cliente	67	Baja lógica del cliente 'Lucía Morales de Mendoza' (CI 88997711).	192.168.40.3	2026-09-20 19:20:08.118508
7803	1	INSERT	ciudad	196	Alta de la ciudad 'Tarija QA'.	192.168.30.1	2026-09-20 19:20:08.327319
7804	1	INSERT	sucursal	136	Alta de la sucursal 'Sucursal Tarija Centro QA' en la ciudad id=196.	192.168.30.2	2026-09-20 19:20:08.587961
7805	1	UPDATE	sucursal	136	Modificación de la sucursal 'Sucursal Tarija Centro QA'. Campos: direccion=Calle Sucre #789 (Modificado), telefono=66449988.	192.168.30.3	2026-09-20 19:20:08.748067
7806	1	INSERT	categoria	153	Alta de la categoría 'Deportes QA'.	192.168.50.1	2026-09-20 19:20:08.925563
7807	1	INSERT	categoria	154	Alta de la categoría 'Calzado Deportivo QA'.	192.168.1.50	2026-09-20 19:20:08.97756
7808	1	UPDATE	categoria	153	Modificación de la categoría 'Deportes QA'. Campos: descripcion=Ropa de running y fitness.	192.168.50.2	2026-09-20 19:20:09.183337
7809	1	INACTIVAR	categoria	154	Baja lógica de la categoría 'Calzado Deportivo QA' (0 prenda(s) asociadas).	192.168.50.3	2026-09-20 19:20:09.293638
7810	1	INACTIVAR	categoria	153	Baja lógica de la categoría 'Deportes QA' (0 prenda(s) asociadas).	192.168.50.3	2026-09-20 19:20:09.341562
8509	\N	IA_TRYON	prenda	3	Vestidor Virtual IA (opencv_fallback, 17.31ms) para prenda ID 3.	172.20.0.1	2026-09-20 19:43:43.487843
8510	\N	IA_TRYON	prenda	3	Vestidor Virtual IA (opencv_fallback, 16.72ms) para prenda ID 3.	172.20.0.1	2026-09-20 19:43:43.510341
8512	\N	IA_TRYON	prenda	3	Vestidor Virtual IA (opencv_fallback, 16.63ms) para prenda ID 3.	172.20.0.1	2026-09-20 19:43:43.567652
8514	\N	IA_TRYON	prenda	3	Vestidor Virtual IA (opencv_fallback, 34.06ms) para prenda ID 3.	172.20.0.1	2026-09-20 19:43:43.624874
8516	\N	IA_TRYON	prenda	3	Vestidor Virtual IA (opencv_fallback, 20.42ms) para prenda ID 3.	172.20.0.1	2026-09-20 19:43:43.698225
8518	\N	IA_TRYON	prenda	3	Vestidor Virtual IA (opencv_fallback, 16.12ms) para prenda ID 3.	172.20.0.1	2026-09-20 19:43:43.749067
8519	\N	IA_TRYON	prenda	3	Vestidor Virtual IA (opencv_fallback, 21.79ms) para prenda ID 3.	172.20.0.1	2026-09-20 19:43:43.782046
8525	\N	IA_TRYON	prenda	\N	Vestidor Virtual IA (opencv_fallback, 9.24ms) para prenda externa personalizada.	172.20.0.1	2026-09-20 19:43:43.939411
8526	\N	IA_TRYON	prenda	\N	Vestidor Virtual IA (opencv_fallback, 11.99ms) para prenda externa personalizada.	172.20.0.1	2026-09-20 19:43:43.956636
8527	1	LOGIN_EXITOSO	usuario	1	Inicio de sesión exitoso de 'Alejandro Sistemas' (admin@fashionstore.com) con rol 'Administrador'.	192.168.10.101	2026-09-20 19:43:54.427297
8528	1	LOGIN_EXITOSO	usuario	1	Inicio de sesión exitoso de 'Alejandro Sistemas' (admin@fashionstore.com) con rol 'Administrador'.	172.20.0.1	2026-09-20 19:43:54.652564
8529	1	LOGIN_FALLIDO	usuario	1	Intento de inicio de sesión fallido para el correo: admin@fashionstore.com (contraseña incorrecta).	192.168.10.102	2026-09-20 19:43:54.911395
8530	\N	LOGIN_FALLIDO	usuario	\N	Intento de inicio de sesión fallido para el correo: no_existe_qa_999@fashionstore.com (correo no registrado).	192.168.10.103	2026-09-20 19:43:55.180858
8531	1	LOGIN_EXITOSO	usuario	1	Inicio de sesión exitoso de 'Alejandro Sistemas' (admin@fashionstore.com) con rol 'Administrador'.	172.20.0.1	2026-09-20 19:43:55.447943
8533	1	INSERT	usuario	1371	Alta de usuario 'Usuario Cliente QA' (qa_cliente_rbac@fashionstore.com) con rol id=4.	192.168.1.50	2026-09-20 19:43:56.403831
7858	1	IA_RECOMENDACION	inventario	180	Recomendación IA (Fallback Catálogo): 3 prendas sugeridas para estilo 'Formal' y ocasión 'Trabajo'.	192.168.1.50	2026-09-20 19:20:17.616249
7859	1	IA_RECOMENDACION	inventario	180	Recomendación IA (Fallback Catálogo): 2 prendas sugeridas para estilo 'Deportivo' y ocasión 'General'.	192.168.1.50	2026-09-20 19:20:18.069867
7860	1	IA_RECOMENDACION	inventario	180	Recomendación IA (Fallback Catálogo): 5 prendas sugeridas para estilo 'Urbano' y ocasión 'General'.	192.168.1.50	2026-09-20 19:20:18.72807
7861	1	IA_RECOMENDACION	inventario	180	Recomendación IA (Fallback Catálogo): 6 prendas sugeridas para estilo 'Elegante' y ocasión 'Cena'.	10.0.0.77	2026-09-20 19:20:19.018365
7862	1	IA_ANALITICA_VOZ	inventario	\N	Analítica por voz CU23: 'Cuántas prendas tenemos en stock en todas las sucursales' -> Métrica 'inventario_stock', Resultados=4, PDF=False.	192.168.1.50	2026-09-20 19:20:19.724582
7864	1	IA_ANALITICA_VOZ	venta	\N	Analítica por voz CU23: 'Generar reporte ejecutivo de ventas globales del mes' -> Métrica 'ventas_total', Resultados=2, PDF=True.	192.168.1.50	2026-09-20 19:20:20.671377
7865	1	IA_ANALITICA_VOZ	inventario	\N	Analítica por voz CU23: 'Reporte de existencias para auditoria' -> Métrica 'inventario_stock', Resultados=4, PDF=False.	172.16.5.99	2026-09-20 19:20:20.914086
7866	1	INSERT	ciudad	197	Alta de la ciudad 'Pando QA IP Test'.	200.87.100.45	2026-09-20 19:20:21.623084
7867	\N	LOGIN_FALLIDO	usuario	\N	Intento de inicio de sesión fallido para el correo: no_existe_seguro@fashionstore.com (correo no registrado).	192.168.99.99	2026-09-20 19:20:21.888949
7868	1	UPDATE	rol_permiso	3	Se actualizaron los permisos del rol 'Cajero (POS)' (ID: 3). Total asignados: 3.	198.51.100.22	2026-09-20 19:20:22.160312
7869	1	INSERT	usuario	1315	Alta de usuario 'Audit CU04' (qa_bitacora_cu04@fashionstore.com) con rol id=4.	192.168.1.50	2026-09-20 19:20:22.531231
7872	\N	IA_TRYON	prenda	3	Vestidor Virtual IA (opencv_fallback, 134.43ms) para prenda ID 3.	172.20.0.1	2026-09-20 19:20:30.956408
7873	\N	IA_TRYON	prenda	3	Vestidor Virtual IA (opencv_fallback, 128.31ms) para prenda ID 3.	172.20.0.1	2026-09-20 19:20:31.157485
7874	\N	IA_TRYON	prenda	\N	Vestidor Virtual IA (opencv_fallback, 20.39ms) para prenda externa personalizada.	172.20.0.1	2026-09-20 19:20:31.499643
7875	\N	IA_TRYON	prenda	\N	Vestidor Virtual IA (opencv_fallback, 15.28ms) para prenda externa personalizada.	172.20.0.1	2026-09-20 19:20:31.536605
7876	\N	IA_TRYON	prenda	3	Vestidor Virtual IA (opencv_fallback, 39.29ms) para prenda ID 3.	172.20.0.1	2026-09-20 19:20:31.548222
8451	\N	IA_TRYON	prenda	3	Vestidor Virtual IA (opencv_fallback, 32.16ms) para prenda ID 3.	172.20.0.1	2026-09-20 19:35:27.224514
8511	\N	IA_TRYON	prenda	3	Vestidor Virtual IA (opencv_fallback, 18.52ms) para prenda ID 3.	172.20.0.1	2026-09-20 19:43:43.542224
8513	\N	IA_TRYON	prenda	3	Vestidor Virtual IA (opencv_fallback, 24.35ms) para prenda ID 3.	172.20.0.1	2026-09-20 19:43:43.591333
7877	\N	IA_TRYON	prenda	3	Vestidor Virtual IA (opencv_fallback, 25.04ms) para prenda ID 3.	172.20.0.1	2026-09-20 19:20:31.609684
7879	\N	IA_TRYON	prenda	3	Vestidor Virtual IA (opencv_fallback, 26.51ms) para prenda ID 3.	172.20.0.1	2026-09-20 19:20:31.670168
8515	\N	IA_TRYON	prenda	3	Vestidor Virtual IA (opencv_fallback, 25.12ms) para prenda ID 3.	172.20.0.1	2026-09-20 19:43:43.666571
8517	\N	IA_TRYON	prenda	3	Vestidor Virtual IA (opencv_fallback, 18.5ms) para prenda ID 3.	172.20.0.1	2026-09-20 19:43:43.725039
8644	1	IA_ANALITICA_VOZ	inventario	\N	Analítica por voz CU23: 'Reporte de existencias para auditoria' -> Métrica 'inventario_stock', Resultados=4, PDF=False.	172.16.5.99	2026-09-20 19:44:20.476555
8678	1	IA_TRYON	prenda	\N	Vestidor Virtual IA (opencv_fallback, 13.27ms) para prenda externa personalizada.	192.168.10.88	2026-09-20 19:44:34.708688
8719	1	IA_TRYON	prenda	\N	Vestidor Virtual IA (gemini_multimodal_tryon, 13.45ms) para prenda externa personalizada.	192.168.10.77	2026-09-20 19:49:24.339266
8720	1	IA_TRYON	prenda	\N	Vestidor Virtual IA (opencv_fallback, 17.3ms) para prenda externa personalizada.	192.168.10.88	2026-09-20 19:49:24.581244
8874	\N	IA_TRYON	prenda	3	Vestidor Virtual IA (opencv_fallback, 17.97ms) para prenda ID 3.	172.20.0.1	2026-09-20 19:51:15.21013
8888	\N	IA_TRYON	prenda	3	Vestidor Virtual IA (opencv_fallback, 25.7ms) para prenda ID 3.	172.20.0.1	2026-09-20 19:51:15.501596
8915	\N	IA_TRYON	prenda	3	Vestidor Virtual IA (opencv_fallback, 25.52ms) para prenda ID 3.	172.20.0.1	2026-09-20 19:55:38.784707
8917	\N	IA_TRYON	prenda	3	Vestidor Virtual IA (opencv_fallback, 17.62ms) para prenda ID 3.	172.20.0.1	2026-09-20 19:55:38.84669
8918	\N	IA_TRYON	prenda	3	Vestidor Virtual IA (opencv_fallback, 16.7ms) para prenda ID 3.	172.20.0.1	2026-09-20 19:55:38.869177
8920	\N	IA_TRYON	prenda	3	Vestidor Virtual IA (opencv_fallback, 17.35ms) para prenda ID 3.	172.20.0.1	2026-09-20 19:55:38.928153
8922	\N	IA_TRYON	prenda	3	Vestidor Virtual IA (opencv_fallback, 16.87ms) para prenda ID 3.	172.20.0.1	2026-09-20 19:55:38.97646
8923	\N	IA_TRYON	prenda	3	Vestidor Virtual IA (opencv_fallback, 14.74ms) para prenda ID 3.	172.20.0.1	2026-09-20 19:55:38.998371
8924	\N	IA_TRYON	prenda	3	Vestidor Virtual IA (opencv_fallback, 27.01ms) para prenda ID 3.	172.20.0.1	2026-09-20 19:55:39.032129
8927	\N	IA_TRYON	prenda	3	Vestidor Virtual IA (opencv_fallback, 37.1ms) para prenda ID 3.	172.20.0.1	2026-09-20 19:55:39.073064
8930	\N	IA_TRYON	prenda	\N	Vestidor Virtual IA (opencv_fallback, 10.96ms) para prenda externa personalizada.	172.20.0.1	2026-09-20 19:55:39.201898
8932	1	IA_TRYON	prenda	176	Vestidor Virtual IA (opencv_fallback, 1667.95ms) para prenda ID 176.	172.20.0.1	2026-09-20 19:59:13.108819
8933	1	IA_TRYON	prenda	177	Vestidor Virtual IA (opencv_fallback, 979.2ms) para prenda ID 177.	172.20.0.1	2026-09-20 19:59:48.028463
8935	\N	IA_TRYON	prenda	186	Vestidor Virtual IA (fashn_vton_ai, 14296.32ms) para prenda ID 186.	172.20.0.1	2026-09-20 21:15:42.619574
8944	1	IA_TRYON	prenda	\N	Vestidor Virtual IA (gemini_multimodal_tryon, 14.44ms) para prenda externa personalizada.	192.168.10.77	2026-09-20 21:20:03.012273
8945	1	IA_TRYON	prenda	\N	Vestidor Virtual IA (opencv_fallback, 13.66ms) para prenda externa personalizada.	192.168.10.88	2026-09-20 21:20:03.278158
8965	\N	IA_TRYON	prenda	3	Vestidor Virtual IA (opencv_fallback, 18.43ms) para prenda ID 3.	172.20.0.1	2026-09-20 21:21:38.97986
8967	\N	IA_TRYON	prenda	3	Vestidor Virtual IA (opencv_fallback, 17.11ms) para prenda ID 3.	172.20.0.1	2026-09-20 21:21:39.026544
8969	\N	IA_TRYON	prenda	3	Vestidor Virtual IA (opencv_fallback, 17.02ms) para prenda ID 3.	172.20.0.1	2026-09-20 21:21:39.106146
8971	\N	IA_TRYON	prenda	3	Vestidor Virtual IA (opencv_fallback, 25.53ms) para prenda ID 3.	172.20.0.1	2026-09-20 21:21:39.225403
8974	\N	IA_TRYON	prenda	3	Vestidor Virtual IA (opencv_fallback, 44.89ms) para prenda ID 3.	172.20.0.1	2026-09-20 21:21:39.257027
8977	\N	IA_TRYON	prenda	\N	Vestidor Virtual IA (opencv_fallback, 10.65ms) para prenda externa personalizada.	172.20.0.1	2026-09-20 21:21:39.385224
8979	1	LOGIN_EXITOSO	usuario	1	Inicio de sesión exitoso de 'Alejandro Sistemas' (admin@fashionstore.com) con rol 'Administrador'.	172.20.0.1	2026-09-20 21:21:46.874714
8980	1	IA_RECOMENDACION	inventario	180	Recomendación IA (Fallback Catálogo): 3 prendas sugeridas para estilo 'Formal' y ocasión 'Trabajo'.	192.168.1.50	2026-09-20 21:21:47.141405
8981	1	IA_RECOMENDACION	inventario	180	Recomendación IA (Fallback Catálogo): 2 prendas sugeridas para estilo 'Deportivo' y ocasión 'General'.	192.168.1.50	2026-09-20 21:21:47.663229
8982	1	IA_RECOMENDACION	inventario	180	Recomendación IA (Fallback Catálogo): 5 prendas sugeridas para estilo 'Urbano' y ocasión 'General'.	192.168.1.50	2026-09-20 21:21:48.341246
8983	1	IA_RECOMENDACION	inventario	180	Recomendación IA (Fallback Catálogo): 6 prendas sugeridas para estilo 'Elegante' y ocasión 'Cena'.	10.0.0.77	2026-09-20 21:21:48.602151
8984	1	IA_ANALITICA_VOZ	inventario	\N	Analítica por voz CU23: 'Cuántas prendas tenemos en stock en todas las sucursales' -> Métrica 'inventario_stock', Resultados=3, PDF=False.	192.168.1.50	2026-09-20 21:21:48.912888
8986	1	IA_ANALITICA_VOZ	venta	\N	Analítica por voz CU23: 'Generar reporte ejecutivo de ventas globales del mes' -> Métrica 'ventas_total', Resultados=2, PDF=True.	192.168.1.50	2026-09-20 21:21:49.863717
8987	1	IA_ANALITICA_VOZ	inventario	\N	Analítica por voz CU23: 'Reporte de existencias para auditoria' -> Métrica 'inventario_stock', Resultados=3, PDF=False.	172.16.5.99	2026-09-20 21:21:50.478511
8988	1	INSERT	ciudad	208	Alta de la ciudad 'Pando QA IP Test'.	200.87.100.45	2026-09-20 21:21:50.828448
8989	\N	LOGIN_FALLIDO	usuario	\N	Intento de inicio de sesión fallido para el correo: no_existe_seguro@fashionstore.com (correo no registrado).	192.168.99.99	2026-09-20 21:21:51.092796
8990	1	UPDATE	rol_permiso	3	Se actualizaron los permisos del rol 'Cajero (POS)' (ID: 3). Total asignados: 3.	198.51.100.22	2026-09-20 21:21:51.371417
8991	1	INSERT	usuario	1406	Alta de usuario 'Audit CU04' (qa_bitacora_cu04@fashionstore.com) con rol id=4.	192.168.1.50	2026-09-20 21:21:51.755811
8994	1	LOGIN_EXITOSO	usuario	1	Inicio de sesión exitoso de 'Alejandro Sistemas' (admin@fashionstore.com) con rol 'Administrador'.	192.168.10.101	2026-09-20 21:22:02.61414
8995	1	LOGIN_EXITOSO	usuario	1	Inicio de sesión exitoso de 'Alejandro Sistemas' (admin@fashionstore.com) con rol 'Administrador'.	172.20.0.1	2026-09-20 21:22:02.839612
8996	1	LOGIN_FALLIDO	usuario	1	Intento de inicio de sesión fallido para el correo: admin@fashionstore.com (contraseña incorrecta).	192.168.10.102	2026-09-20 21:22:03.113973
8997	\N	LOGIN_FALLIDO	usuario	\N	Intento de inicio de sesión fallido para el correo: no_existe_qa_999@fashionstore.com (correo no registrado).	192.168.10.103	2026-09-20 21:22:03.384245
7878	\N	IA_TRYON	prenda	3	Vestidor Virtual IA (opencv_fallback, 20.98ms) para prenda ID 3.	172.20.0.1	2026-09-20 19:20:31.641319
7880	\N	IA_TRYON	prenda	3	Vestidor Virtual IA (opencv_fallback, 15.77ms) para prenda ID 3.	172.20.0.1	2026-09-20 19:20:31.699475
7881	\N	IA_TRYON	prenda	3	Vestidor Virtual IA (opencv_fallback, 15.37ms) para prenda ID 3.	172.20.0.1	2026-09-20 19:20:31.721674
7882	\N	IA_TRYON	prenda	3	Vestidor Virtual IA (opencv_fallback, 17.01ms) para prenda ID 3.	172.20.0.1	2026-09-20 19:20:31.749394
7883	\N	IA_TRYON	prenda	3	Vestidor Virtual IA (opencv_fallback, 14.46ms) para prenda ID 3.	172.20.0.1	2026-09-20 19:20:31.772795
7884	\N	IA_TRYON	prenda	3	Vestidor Virtual IA (opencv_fallback, 16.06ms) para prenda ID 3.	172.20.0.1	2026-09-20 19:20:31.792461
7885	\N	IA_TRYON	prenda	3	Vestidor Virtual IA (opencv_fallback, 20.83ms) para prenda ID 3.	172.20.0.1	2026-09-20 19:20:31.8245
7886	\N	IA_TRYON	prenda	3	Vestidor Virtual IA (opencv_fallback, 26.87ms) para prenda ID 3.	172.20.0.1	2026-09-20 19:20:31.871942
7887	\N	IA_TRYON	prenda	3	Vestidor Virtual IA (opencv_fallback, 29.35ms) para prenda ID 3.	172.20.0.1	2026-09-20 19:20:31.883561
7888	\N	IA_TRYON	prenda	3	Vestidor Virtual IA (opencv_fallback, 67.51ms) para prenda ID 3.	172.20.0.1	2026-09-20 19:20:31.867393
7889	\N	IA_TRYON	prenda	3	Vestidor Virtual IA (opencv_fallback, 48.22ms) para prenda ID 3.	172.20.0.1	2026-09-20 19:20:31.898031
7890	\N	IA_TRYON	prenda	3	Vestidor Virtual IA (opencv_fallback, 38.24ms) para prenda ID 3.	172.20.0.1	2026-09-20 19:20:31.91214
7891	\N	IA_TRYON	prenda	3	Vestidor Virtual IA (opencv_fallback, 29.65ms) para prenda ID 3.	172.20.0.1	2026-09-20 19:20:31.927236
7892	\N	IA_TRYON	prenda	\N	Vestidor Virtual IA (opencv_fallback, 8.97ms) para prenda externa personalizada.	172.20.0.1	2026-09-20 19:20:32.066046
7893	\N	IA_TRYON	prenda	\N	Vestidor Virtual IA (opencv_fallback, 15.06ms) para prenda externa personalizada.	172.20.0.1	2026-09-20 19:20:32.09551
7894	\N	IA_TRYON	prenda	3	Vestidor Virtual IA (opencv_fallback, 17.97ms) para prenda ID 3.	172.20.0.1	2026-09-20 19:20:32.257029
7895	\N	IA_TRYON	prenda	\N	Vestidor Virtual IA (opencv_fallback, 10.51ms) para prenda externa personalizada.	172.20.0.1	2026-09-20 19:20:32.297663
7896	1	IA_TRYON	prenda	\N	Vestidor Virtual IA (opencv_fallback, 11.72ms) para prenda externa personalizada.	192.168.42.100	2026-09-20 19:20:32.308937
7897	\N	IA_TRYON	prenda	\N	Vestidor Virtual IA (opencv_fallback, 8.24ms) para prenda externa personalizada.	200.10.20.30	2026-09-20 19:20:32.543378
7898	1	IA_TRYON	prenda	\N	Vestidor Virtual IA (gemini_multimodal_tryon, 13.95ms) para prenda externa personalizada.	192.168.10.77	2026-09-20 19:20:34.71723
7899	1	IA_TRYON	prenda	\N	Vestidor Virtual IA (opencv_fallback, 14.2ms) para prenda externa personalizada.	192.168.10.88	2026-09-20 19:20:34.957866
7900	\N	IA_TRYON	prenda	\N	Vestidor Virtual IA (opencv_fallback, 375.41ms) para prenda externa personalizada.	172.20.0.1	2026-09-20 19:20:35.569511
7903	\N	IA_TRYON	prenda	3	Vestidor Virtual IA (opencv_fallback, 21.89ms) para prenda ID 3.	172.20.0.1	2026-09-20 19:22:00.524739
7904	\N	IA_TRYON	prenda	\N	Vestidor Virtual IA (opencv_fallback, 9.16ms) para prenda externa personalizada.	172.20.0.1	2026-09-20 19:22:00.567599
7905	1	LOGIN_EXITOSO	usuario	1	Inicio de sesión exitoso de 'Alejandro Sistemas' (admin@fashionstore.com) con rol 'Administrador'.	172.20.0.1	2026-09-20 19:22:00.57433
7906	1	IA_TRYON	prenda	\N	Vestidor Virtual IA (opencv_fallback, 9.64ms) para prenda externa personalizada.	192.168.42.100	2026-09-20 19:22:00.839513
7907	\N	IA_TRYON	prenda	\N	Vestidor Virtual IA (opencv_fallback, 8.27ms) para prenda externa personalizada.	200.10.20.30	2026-09-20 19:22:01.069862
7908	1	IA_TRYON	prenda	\N	Vestidor Virtual IA (gemini_multimodal_tryon, 15.69ms) para prenda externa personalizada.	192.168.10.77	2026-09-20 19:22:03.201408
7909	1	IA_TRYON	prenda	\N	Vestidor Virtual IA (opencv_fallback, 14.88ms) para prenda externa personalizada.	192.168.10.88	2026-09-20 19:22:03.443212
7910	\N	IA_TRYON	prenda	\N	Vestidor Virtual IA (opencv_fallback, 386.14ms) para prenda externa personalizada.	172.20.0.1	2026-09-20 19:22:04.063412
7911	\N	IA_TRYON	prenda	3	Vestidor Virtual IA (opencv_fallback, 20.56ms) para prenda ID 3.	172.20.0.1	2026-09-20 19:23:24.414638
7912	\N	IA_TRYON	prenda	\N	Vestidor Virtual IA (opencv_fallback, 9.19ms) para prenda externa personalizada.	172.20.0.1	2026-09-20 19:23:24.456537
7913	1	LOGIN_EXITOSO	usuario	1	Inicio de sesión exitoso de 'Alejandro Sistemas' (admin@fashionstore.com) con rol 'Administrador'.	172.20.0.1	2026-09-20 19:23:24.464429
7914	1	IA_TRYON	prenda	\N	Vestidor Virtual IA (opencv_fallback, 8.87ms) para prenda externa personalizada.	192.168.42.100	2026-09-20 19:23:24.725264
7915	\N	IA_TRYON	prenda	\N	Vestidor Virtual IA (opencv_fallback, 9.43ms) para prenda externa personalizada.	200.10.20.30	2026-09-20 19:23:24.957194
7916	1	IA_TRYON	prenda	\N	Vestidor Virtual IA (gemini_multimodal_tryon, 14.45ms) para prenda externa personalizada.	192.168.10.77	2026-09-20 19:23:27.088663
7917	1	IA_TRYON	prenda	\N	Vestidor Virtual IA (opencv_fallback, 13.58ms) para prenda externa personalizada.	192.168.10.88	2026-09-20 19:23:27.327669
7918	\N	IA_TRYON	prenda	\N	Vestidor Virtual IA (opencv_fallback, 377.11ms) para prenda externa personalizada.	172.20.0.1	2026-09-20 19:23:27.935735
7919	1	LOGIN_EXITOSO	usuario	1	Inicio de sesión exitoso de 'Alejandro Sistemas' (admin@fashionstore.com) con rol 'Administrador'.	192.168.10.101	2026-09-20 19:24:02.741131
7920	1	LOGIN_EXITOSO	usuario	1	Inicio de sesión exitoso de 'Alejandro Sistemas' (admin@fashionstore.com) con rol 'Administrador'.	172.20.0.1	2026-09-20 19:24:02.967361
7921	1	LOGIN_FALLIDO	usuario	1	Intento de inicio de sesión fallido para el correo: admin@fashionstore.com (contraseña incorrecta).	192.168.10.102	2026-09-20 19:24:03.22842
7922	\N	LOGIN_FALLIDO	usuario	\N	Intento de inicio de sesión fallido para el correo: no_existe_qa_999@fashionstore.com (correo no registrado).	192.168.10.103	2026-09-20 19:24:03.488729
7923	1	LOGIN_EXITOSO	usuario	1	Inicio de sesión exitoso de 'Alejandro Sistemas' (admin@fashionstore.com) con rol 'Administrador'.	172.20.0.1	2026-09-20 19:24:03.761949
8452	\N	IA_TRYON	prenda	3	Vestidor Virtual IA (opencv_fallback, 28.21ms) para prenda ID 3.	172.20.0.1	2026-09-20 19:35:27.238332
7925	1	INSERT	usuario	1317	Alta de usuario 'Usuario Cliente QA' (qa_cliente_rbac@fashionstore.com) con rol id=4.	192.168.1.50	2026-09-20 19:24:04.685277
7927	1	INSERT	usuario	1318	Alta de usuario 'Carlos Cajero QA' (qa_nuevo_cajero@fashionstore.com) con rol id=3.	192.168.20.1	2026-09-20 19:24:05.300447
7928	1	UPDATE	usuario	1318	Modificación del usuario 'qa_nuevo_cajero@fashionstore.com'. Campos actualizados: nombre=Carlos Alberto, telefono=71122334.	192.168.20.2	2026-09-20 19:24:05.761091
7929	1	INACTIVAR	usuario	1318	Baja lógica del usuario 'qa_nuevo_cajero@fashionstore.com': estado cambiado de 'Activo' a 'Inactivo'.	192.168.20.3	2026-09-20 19:24:05.961649
7930	1	UPDATE	rol_permiso	3	Se actualizaron los permisos del rol 'Cajero (POS)' (ID: 3). Total asignados: 2.	192.168.1.50	2026-09-20 19:24:06.317745
7931	1	UPDATE	rol_permiso	3	Se actualizaron los permisos del rol 'Cajero (POS)' (ID: 3). Total asignados: 4.	192.168.1.50	2026-09-20 19:24:06.537291
7932	1	UPDATE	rol_permiso	3	Se actualizaron los permisos del rol 'Cajero (POS)' (ID: 3). Total asignados: 0.	192.168.1.50	2026-09-20 19:24:06.609407
7933	1	INSERT	usuario	1319	Alta de usuario 'Cajero POS QA' (qa_cajero_rbac@fashionstore.com) con rol id=3.	192.168.1.50	2026-09-20 19:24:06.866143
8454	\N	IA_TRYON	prenda	\N	Vestidor Virtual IA (opencv_fallback, 11.62ms) para prenda externa personalizada.	172.20.0.1	2026-09-20 19:35:27.363832
7935	1	UPDATE	rol_permiso	3	Se actualizaron los permisos del rol 'Cajero (POS)' (ID: 3). Total asignados: 5.	192.168.1.50	2026-09-20 19:24:07.444229
7936	1	UPDATE	rol_permiso	3	Se actualizaron los permisos del rol 'Cajero (POS)' (ID: 3). Total asignados: 4.	192.168.1.50	2026-09-20 19:24:07.546531
7937	1	INSERT	usuario	1320	Alta de usuario 'Cajero POS QA' (qa_cajero_rbac@fashionstore.com) con rol id=3.	192.168.1.50	2026-09-20 19:24:07.669112
8520	\N	IA_TRYON	prenda	3	Vestidor Virtual IA (opencv_fallback, 26.51ms) para prenda ID 3.	172.20.0.1	2026-09-20 19:43:43.788598
7939	1	UPDATE	rol_permiso	3	Se actualizaron los permisos del rol 'Cajero (POS)' (ID: 3). Total asignados: 5.	192.168.1.50	2026-09-20 19:24:08.307336
7940	1	INSERT	usuario	1321	Alta de usuario 'Carlos Recuperador' (qa_recovery_user@fashionstore.com) con rol id=4.	192.168.1.50	2026-09-20 19:24:08.485474
7942	1	INSERT	usuario	1322	Alta de usuario 'Carlos Recuperador' (qa_recovery_user@fashionstore.com) con rol id=4.	192.168.1.50	2026-09-20 19:24:08.864925
8688	1	IA_TRYON	prenda	\N	Vestidor Virtual IA (gemini_multimodal_tryon, 20.09ms) para prenda externa personalizada.	192.168.10.77	2026-09-20 19:46:25.800384
8689	1	IA_TRYON	prenda	\N	Vestidor Virtual IA (opencv_fallback, 19.39ms) para prenda externa personalizada.	192.168.10.88	2026-09-20 19:46:26.049125
7945	1	INSERT	usuario	1323	Alta de usuario 'Carlos Recuperador' (qa_recovery_user@fashionstore.com) con rol id=4.	192.168.1.50	2026-09-20 19:24:09.232213
8729	\N	IA_TRYON	prenda	3	Vestidor Virtual IA (opencv_fallback, 20.94ms) para prenda ID 3.	172.20.0.1	2026-09-20 19:49:34.858545
7947	1	INSERT	usuario	1324	Alta de usuario 'Carlos Recuperador' (qa_recovery_user@fashionstore.com) con rol id=4.	192.168.1.50	2026-09-20 19:24:09.601645
8731	\N	IA_TRYON	prenda	3	Vestidor Virtual IA (opencv_fallback, 16.28ms) para prenda ID 3.	172.20.0.1	2026-09-20 19:49:34.909379
8732	\N	IA_TRYON	prenda	3	Vestidor Virtual IA (opencv_fallback, 14.34ms) para prenda ID 3.	172.20.0.1	2026-09-20 19:49:34.93073
8733	\N	IA_TRYON	prenda	3	Vestidor Virtual IA (opencv_fallback, 14.5ms) para prenda ID 3.	172.20.0.1	2026-09-20 19:49:34.950014
8735	\N	IA_TRYON	prenda	3	Vestidor Virtual IA (opencv_fallback, 14.0ms) para prenda ID 3.	172.20.0.1	2026-09-20 19:49:35.005202
7952	1	INSERT	usuario	1325	Alta de usuario 'Carlos Recuperador' (qa_recovery_user@fashionstore.com) con rol id=4.	192.168.1.50	2026-09-20 19:24:10.740428
8737	\N	IA_TRYON	prenda	3	Vestidor Virtual IA (opencv_fallback, 18.64ms) para prenda ID 3.	172.20.0.1	2026-09-20 19:49:35.058663
7954	1	INSERT	usuario	1326	Alta de usuario 'Carlos Recuperador' (qa_recovery_user@fashionstore.com) con rol id=4.	192.168.1.50	2026-09-20 19:24:11.116561
7955	1	INSERT	usuario	1327	Alta de usuario 'Carlos Recuperador' (qa_recovery_user@fashionstore.com) con rol id=4.	192.168.1.50	2026-09-20 19:24:11.431641
8743	\N	IA_TRYON	prenda	\N	Vestidor Virtual IA (opencv_fallback, 9.77ms) para prenda externa personalizada.	172.20.0.1	2026-09-20 19:49:35.214545
8745	1	LOGIN_EXITOSO	usuario	1	Inicio de sesión exitoso de 'Alejandro Sistemas' (admin@fashionstore.com) con rol 'Administrador'.	192.168.10.101	2026-09-20 19:50:38.830612
7958	1	INSERT	usuario	1328	Alta de usuario 'Carlos Recuperador' (qa_recovery_user@fashionstore.com) con rol id=4.	192.168.1.50	2026-09-20 19:24:12.060797
7959	1	INSERT	usuario	1329	Alta de usuario 'Inactivo QA' (qa_user_inactivo_recovery@fashionstore.com) con rol id=4.	192.168.1.50	2026-09-20 19:24:12.564195
7960	1	INSERT	usuario	1330	Alta de usuario 'Carlos Recuperador' (qa_recovery_user@fashionstore.com) con rol id=4.	192.168.1.50	2026-09-20 19:24:12.879704
8746	1	LOGIN_EXITOSO	usuario	1	Inicio de sesión exitoso de 'Alejandro Sistemas' (admin@fashionstore.com) con rol 'Administrador'.	172.20.0.1	2026-09-20 19:50:39.061093
7962	1	INSERT	usuario	1331	Alta de usuario 'Carlos Recuperador' (qa_recovery_user@fashionstore.com) con rol id=4.	192.168.1.50	2026-09-20 19:24:13.303026
8747	1	LOGIN_FALLIDO	usuario	1	Intento de inicio de sesión fallido para el correo: admin@fashionstore.com (contraseña incorrecta).	192.168.10.102	2026-09-20 19:50:39.323574
8748	\N	LOGIN_FALLIDO	usuario	\N	Intento de inicio de sesión fallido para el correo: no_existe_qa_999@fashionstore.com (correo no registrado).	192.168.10.103	2026-09-20 19:50:39.583138
8749	1	LOGIN_EXITOSO	usuario	1	Inicio de sesión exitoso de 'Alejandro Sistemas' (admin@fashionstore.com) con rol 'Administrador'.	172.20.0.1	2026-09-20 19:50:39.842755
7967	1	INSERT	usuario	1332	Alta de usuario 'Carlos Recuperador' (qa_recovery_user@fashionstore.com) con rol id=4.	192.168.1.50	2026-09-20 19:24:14.450536
8751	1	INSERT	usuario	1389	Alta de usuario 'Usuario Cliente QA' (qa_cliente_rbac@fashionstore.com) con rol id=4.	192.168.1.50	2026-09-20 19:50:40.774715
7971	1	INSERT	cliente	68	Alta del cliente 'Lucía Morales Paz' (CI 88997711).	192.168.40.1	2026-09-20 19:24:15.540119
7972	1	UPDATE	cliente	68	Modificación del cliente CI 88997711. Campos: nombre_completo=Lucía Morales de Mendoza, telefono=78999999.	192.168.40.2	2026-09-20 19:24:15.840126
7973	1	INACTIVAR	cliente	68	Baja lógica del cliente 'Lucía Morales de Mendoza' (CI 88997711).	192.168.40.3	2026-09-20 19:24:15.892234
7974	1	INSERT	ciudad	198	Alta de la ciudad 'Tarija QA'.	192.168.30.1	2026-09-20 19:24:16.090169
7975	1	INSERT	sucursal	138	Alta de la sucursal 'Sucursal Tarija Centro QA' en la ciudad id=198.	192.168.30.2	2026-09-20 19:24:16.341356
7976	1	UPDATE	sucursal	138	Modificación de la sucursal 'Sucursal Tarija Centro QA'. Campos: direccion=Calle Sucre #789 (Modificado), telefono=66449988.	192.168.30.3	2026-09-20 19:24:16.492307
7977	1	INSERT	categoria	155	Alta de la categoría 'Deportes QA'.	192.168.50.1	2026-09-20 19:24:16.655526
7978	1	INSERT	categoria	156	Alta de la categoría 'Calzado Deportivo QA'.	192.168.1.50	2026-09-20 19:24:16.70905
7979	1	UPDATE	categoria	155	Modificación de la categoría 'Deportes QA'. Campos: descripcion=Ropa de running y fitness.	192.168.50.2	2026-09-20 19:24:16.917211
7980	1	INACTIVAR	categoria	156	Baja lógica de la categoría 'Calzado Deportivo QA' (0 prenda(s) asociadas).	192.168.50.3	2026-09-20 19:24:17.02047
7981	1	INACTIVAR	categoria	155	Baja lógica de la categoría 'Deportes QA' (0 prenda(s) asociadas).	192.168.50.3	2026-09-20 19:24:17.068749
8066	\N	IA_TRYON	prenda	\N	Vestidor Virtual IA (opencv_fallback, 10.29ms) para prenda externa personalizada.	172.20.0.1	2026-09-20 19:24:39.725276
8067	1	IA_TRYON	prenda	\N	Vestidor Virtual IA (opencv_fallback, 9.82ms) para prenda externa personalizada.	192.168.42.100	2026-09-20 19:24:39.739004
8068	\N	IA_TRYON	prenda	\N	Vestidor Virtual IA (opencv_fallback, 8.41ms) para prenda externa personalizada.	200.10.20.30	2026-09-20 19:24:39.971747
8071	\N	IA_TRYON	prenda	\N	Vestidor Virtual IA (opencv_fallback, 1116.25ms) para prenda externa personalizada.	172.20.0.1	2026-09-20 19:24:43.720441
8457	1	IA_TRYON	prenda	\N	Vestidor Virtual IA (opencv_fallback, 11.01ms) para prenda externa personalizada.	192.168.42.100	2026-09-20 19:35:27.578509
8458	\N	IA_TRYON	prenda	\N	Vestidor Virtual IA (opencv_fallback, 8.04ms) para prenda externa personalizada.	200.10.20.30	2026-09-20 19:35:27.815046
8461	\N	IA_TRYON	prenda	\N	Vestidor Virtual IA (opencv_fallback, 360.79ms) para prenda externa personalizada.	172.20.0.1	2026-09-20 19:35:30.817473
8462	\N	IA_TRYON	prenda	3	Vestidor Virtual IA (opencv_fallback, 15.94ms) para prenda ID 3.	172.20.0.1	2026-09-20 19:35:33.466771
8521	\N	IA_TRYON	prenda	3	Vestidor Virtual IA (opencv_fallback, 29.3ms) para prenda ID 3.	172.20.0.1	2026-09-20 19:43:43.80053
8654	\N	IA_TRYON	prenda	\N	Vestidor Virtual IA (opencv_fallback, 13.44ms) para prenda externa personalizada.	172.20.0.1	2026-09-20 19:44:31.354106
8699	\N	IA_TRYON	prenda	3	Vestidor Virtual IA (opencv_fallback, 19.64ms) para prenda ID 3.	172.20.0.1	2026-09-20 19:46:39.452672
8701	\N	IA_TRYON	prenda	3	Vestidor Virtual IA (opencv_fallback, 17.29ms) para prenda ID 3.	172.20.0.1	2026-09-20 19:46:39.505247
8029	1	IA_RECOMENDACION	inventario	180	Recomendación IA (Fallback Catálogo): 3 prendas sugeridas para estilo 'Formal' y ocasión 'Trabajo'.	192.168.1.50	2026-09-20 19:24:25.266485
8030	1	IA_RECOMENDACION	inventario	180	Recomendación IA (Fallback Catálogo): 2 prendas sugeridas para estilo 'Deportivo' y ocasión 'General'.	192.168.1.50	2026-09-20 19:24:25.683589
8031	1	IA_RECOMENDACION	inventario	180	Recomendación IA (Fallback Catálogo): 5 prendas sugeridas para estilo 'Urbano' y ocasión 'General'.	192.168.1.50	2026-09-20 19:24:26.341922
8032	1	IA_RECOMENDACION	inventario	180	Recomendación IA (Fallback Catálogo): 6 prendas sugeridas para estilo 'Elegante' y ocasión 'Cena'.	10.0.0.77	2026-09-20 19:24:26.602325
8033	1	IA_ANALITICA_VOZ	inventario	\N	Analítica por voz CU23: 'Cuántas prendas tenemos en stock en todas las sucursales' -> Métrica 'inventario_stock', Resultados=4, PDF=False.	192.168.1.50	2026-09-20 19:24:27.332985
8703	\N	IA_TRYON	prenda	3	Vestidor Virtual IA (opencv_fallback, 18.14ms) para prenda ID 3.	172.20.0.1	2026-09-20 19:46:39.568227
8035	1	IA_ANALITICA_VOZ	venta	\N	Analítica por voz CU23: 'Generar reporte ejecutivo de ventas globales del mes' -> Métrica 'ventas_total', Resultados=2, PDF=True.	192.168.1.50	2026-09-20 19:24:28.276257
8036	1	IA_ANALITICA_VOZ	inventario	\N	Analítica por voz CU23: 'Reporte de existencias para auditoria' -> Métrica 'inventario_stock', Resultados=4, PDF=False.	172.16.5.99	2026-09-20 19:24:28.529357
8037	1	INSERT	ciudad	199	Alta de la ciudad 'Pando QA IP Test'.	200.87.100.45	2026-09-20 19:24:29.213775
8038	\N	LOGIN_FALLIDO	usuario	\N	Intento de inicio de sesión fallido para el correo: no_existe_seguro@fashionstore.com (correo no registrado).	192.168.99.99	2026-09-20 19:24:29.480768
8039	1	UPDATE	rol_permiso	3	Se actualizaron los permisos del rol 'Cajero (POS)' (ID: 3). Total asignados: 3.	198.51.100.22	2026-09-20 19:24:29.752931
8040	1	INSERT	usuario	1333	Alta de usuario 'Audit CU04' (qa_bitacora_cu04@fashionstore.com) con rol id=4.	192.168.1.50	2026-09-20 19:24:30.126375
8704	\N	IA_TRYON	prenda	3	Vestidor Virtual IA (opencv_fallback, 18.67ms) para prenda ID 3.	172.20.0.1	2026-09-20 19:46:39.59226
8705	\N	IA_TRYON	prenda	3	Vestidor Virtual IA (opencv_fallback, 17.75ms) para prenda ID 3.	172.20.0.1	2026-09-20 19:46:39.617232
8043	\N	IA_TRYON	prenda	3	Vestidor Virtual IA (opencv_fallback, 103.55ms) para prenda ID 3.	172.20.0.1	2026-09-20 19:24:38.487792
8044	\N	IA_TRYON	prenda	3	Vestidor Virtual IA (opencv_fallback, 164.68ms) para prenda ID 3.	172.20.0.1	2026-09-20 19:24:38.704956
8045	\N	IA_TRYON	prenda	\N	Vestidor Virtual IA (opencv_fallback, 10.8ms) para prenda externa personalizada.	172.20.0.1	2026-09-20 19:24:39.044134
8046	\N	IA_TRYON	prenda	\N	Vestidor Virtual IA (opencv_fallback, 10.44ms) para prenda externa personalizada.	172.20.0.1	2026-09-20 19:24:39.069196
8047	\N	IA_TRYON	prenda	3	Vestidor Virtual IA (opencv_fallback, 16.35ms) para prenda ID 3.	172.20.0.1	2026-09-20 19:24:39.081298
8048	\N	IA_TRYON	prenda	3	Vestidor Virtual IA (opencv_fallback, 23.05ms) para prenda ID 3.	172.20.0.1	2026-09-20 19:24:39.114379
8049	\N	IA_TRYON	prenda	3	Vestidor Virtual IA (opencv_fallback, 15.41ms) para prenda ID 3.	172.20.0.1	2026-09-20 19:24:39.144218
8050	\N	IA_TRYON	prenda	3	Vestidor Virtual IA (opencv_fallback, 18.11ms) para prenda ID 3.	172.20.0.1	2026-09-20 19:24:39.166082
8051	\N	IA_TRYON	prenda	3	Vestidor Virtual IA (opencv_fallback, 16.87ms) para prenda ID 3.	172.20.0.1	2026-09-20 19:24:39.189447
8052	\N	IA_TRYON	prenda	3	Vestidor Virtual IA (opencv_fallback, 17.6ms) para prenda ID 3.	172.20.0.1	2026-09-20 19:24:39.21973
8053	\N	IA_TRYON	prenda	3	Vestidor Virtual IA (opencv_fallback, 14.54ms) para prenda ID 3.	172.20.0.1	2026-09-20 19:24:39.242547
8054	\N	IA_TRYON	prenda	3	Vestidor Virtual IA (opencv_fallback, 14.26ms) para prenda ID 3.	172.20.0.1	2026-09-20 19:24:39.261448
8055	\N	IA_TRYON	prenda	3	Vestidor Virtual IA (opencv_fallback, 14.72ms) para prenda ID 3.	172.20.0.1	2026-09-20 19:24:39.280504
8056	\N	IA_TRYON	prenda	3	Vestidor Virtual IA (opencv_fallback, 14.87ms) para prenda ID 3.	172.20.0.1	2026-09-20 19:24:39.300475
8057	\N	IA_TRYON	prenda	3	Vestidor Virtual IA (opencv_fallback, 27.21ms) para prenda ID 3.	172.20.0.1	2026-09-20 19:24:39.334401
8058	\N	IA_TRYON	prenda	3	Vestidor Virtual IA (opencv_fallback, 32.89ms) para prenda ID 3.	172.20.0.1	2026-09-20 19:24:39.338852
8059	\N	IA_TRYON	prenda	3	Vestidor Virtual IA (opencv_fallback, 34.05ms) para prenda ID 3.	172.20.0.1	2026-09-20 19:24:39.351486
8060	\N	IA_TRYON	prenda	3	Vestidor Virtual IA (opencv_fallback, 38.46ms) para prenda ID 3.	172.20.0.1	2026-09-20 19:24:39.367049
8061	\N	IA_TRYON	prenda	3	Vestidor Virtual IA (opencv_fallback, 31.2ms) para prenda ID 3.	172.20.0.1	2026-09-20 19:24:39.378935
8062	\N	IA_TRYON	prenda	3	Vestidor Virtual IA (opencv_fallback, 25.75ms) para prenda ID 3.	172.20.0.1	2026-09-20 19:24:39.390941
8063	\N	IA_TRYON	prenda	\N	Vestidor Virtual IA (opencv_fallback, 9.45ms) para prenda externa personalizada.	172.20.0.1	2026-09-20 19:24:39.484475
8064	\N	IA_TRYON	prenda	\N	Vestidor Virtual IA (opencv_fallback, 12.17ms) para prenda externa personalizada.	172.20.0.1	2026-09-20 19:24:39.510684
8065	\N	IA_TRYON	prenda	3	Vestidor Virtual IA (opencv_fallback, 16.91ms) para prenda ID 3.	172.20.0.1	2026-09-20 19:24:39.685635
8069	1	IA_TRYON	prenda	\N	Vestidor Virtual IA (gemini_multimodal_tryon, 13.63ms) para prenda externa personalizada.	192.168.10.77	2026-09-20 19:24:42.131445
8070	1	IA_TRYON	prenda	\N	Vestidor Virtual IA (opencv_fallback, 16.09ms) para prenda externa personalizada.	192.168.10.88	2026-09-20 19:24:42.370541
8706	\N	IA_TRYON	prenda	3	Vestidor Virtual IA (opencv_fallback, 34.46ms) para prenda ID 3.	172.20.0.1	2026-09-20 19:46:39.661903
8712	\N	IA_TRYON	prenda	\N	Vestidor Virtual IA (opencv_fallback, 11.9ms) para prenda externa personalizada.	172.20.0.1	2026-09-20 19:46:39.853025
8714	\N	IA_TRYON	prenda	3	Vestidor Virtual IA (opencv_fallback, 18.56ms) para prenda ID 3.	172.20.0.1	2026-09-20 19:49:21.697883
8715	\N	IA_TRYON	prenda	\N	Vestidor Virtual IA (opencv_fallback, 10.33ms) para prenda externa personalizada.	172.20.0.1	2026-09-20 19:49:21.73871
8716	1	LOGIN_EXITOSO	usuario	1	Inicio de sesión exitoso de 'Alejandro Sistemas' (admin@fashionstore.com) con rol 'Administrador'.	172.20.0.1	2026-09-20 19:49:21.74558
8459	1	IA_TRYON	prenda	\N	Vestidor Virtual IA (gemini_multimodal_tryon, 16.92ms) para prenda externa personalizada.	192.168.10.77	2026-09-20 19:35:29.978283
8460	1	IA_TRYON	prenda	\N	Vestidor Virtual IA (opencv_fallback, 14.0ms) para prenda externa personalizada.	192.168.10.88	2026-09-20 19:35:30.223082
8074	\N	IA_TRYON	prenda	3	Vestidor Virtual IA (opencv_fallback, 1080.45ms) para prenda ID 3.	172.20.0.1	2026-09-20 19:31:43.265318
8075	\N	IA_TRYON	prenda	\N	Vestidor Virtual IA (opencv_fallback, 13.84ms) para prenda externa personalizada.	172.20.0.1	2026-09-20 19:31:44.37543
8076	1	LOGIN_EXITOSO	usuario	1	Inicio de sesión exitoso de 'Alejandro Sistemas' (admin@fashionstore.com) con rol 'Administrador'.	172.20.0.1	2026-09-20 19:31:44.394659
8077	1	IA_TRYON	prenda	\N	Vestidor Virtual IA (opencv_fallback, 9.42ms) para prenda externa personalizada.	192.168.42.100	2026-09-20 19:31:44.686999
8078	\N	IA_TRYON	prenda	\N	Vestidor Virtual IA (opencv_fallback, 10.06ms) para prenda externa personalizada.	200.10.20.30	2026-09-20 19:31:44.919978
8079	1	IA_TRYON	prenda	\N	Vestidor Virtual IA (gemini_multimodal_tryon, 15.64ms) para prenda externa personalizada.	192.168.10.77	2026-09-20 19:31:47.147053
8080	1	IA_TRYON	prenda	\N	Vestidor Virtual IA (opencv_fallback, 14.66ms) para prenda externa personalizada.	192.168.10.88	2026-09-20 19:31:47.393707
8081	\N	IA_TRYON	prenda	\N	Vestidor Virtual IA (opencv_fallback, 413.61ms) para prenda externa personalizada.	172.20.0.1	2026-09-20 19:31:48.041231
8082	\N	IA_TRYON	prenda	3	Vestidor Virtual IA (opencv_fallback, 24.6ms) para prenda ID 3.	172.20.0.1	2026-09-20 19:32:17.155812
8083	\N	IA_TRYON	prenda	\N	Vestidor Virtual IA (opencv_fallback, 12.76ms) para prenda externa personalizada.	172.20.0.1	2026-09-20 19:32:17.208108
8084	1	LOGIN_EXITOSO	usuario	1	Inicio de sesión exitoso de 'Alejandro Sistemas' (admin@fashionstore.com) con rol 'Administrador'.	172.20.0.1	2026-09-20 19:32:17.214775
8085	1	IA_TRYON	prenda	\N	Vestidor Virtual IA (opencv_fallback, 9.88ms) para prenda externa personalizada.	192.168.42.100	2026-09-20 19:32:17.476702
8086	\N	IA_TRYON	prenda	\N	Vestidor Virtual IA (opencv_fallback, 8.16ms) para prenda externa personalizada.	200.10.20.30	2026-09-20 19:32:17.706839
8087	1	IA_TRYON	prenda	\N	Vestidor Virtual IA (gemini_multimodal_tryon, 16.23ms) para prenda externa personalizada.	192.168.10.77	2026-09-20 19:32:19.804943
8088	1	IA_TRYON	prenda	\N	Vestidor Virtual IA (opencv_fallback, 14.71ms) para prenda externa personalizada.	192.168.10.88	2026-09-20 19:32:20.04715
8089	\N	IA_TRYON	prenda	\N	Vestidor Virtual IA (opencv_fallback, 374.0ms) para prenda externa personalizada.	172.20.0.1	2026-09-20 19:32:20.655833
8090	\N	IA_TRYON	prenda	3	Vestidor Virtual IA (opencv_fallback, 16.78ms) para prenda ID 3.	172.20.0.1	2026-09-20 19:32:23.300202
8091	\N	IA_TRYON	prenda	3	Vestidor Virtual IA (opencv_fallback, 107.3ms) para prenda ID 3.	172.20.0.1	2026-09-20 19:32:31.475272
8092	\N	IA_TRYON	prenda	3	Vestidor Virtual IA (opencv_fallback, 120.07ms) para prenda ID 3.	172.20.0.1	2026-09-20 19:32:31.666601
8093	\N	IA_TRYON	prenda	\N	Vestidor Virtual IA (opencv_fallback, 16.02ms) para prenda externa personalizada.	172.20.0.1	2026-09-20 19:32:32.022321
8094	\N	IA_TRYON	prenda	\N	Vestidor Virtual IA (opencv_fallback, 13.71ms) para prenda externa personalizada.	172.20.0.1	2026-09-20 19:32:32.042762
8095	\N	IA_TRYON	prenda	3	Vestidor Virtual IA (opencv_fallback, 19.79ms) para prenda ID 3.	172.20.0.1	2026-09-20 19:32:32.052437
8096	\N	IA_TRYON	prenda	3	Vestidor Virtual IA (opencv_fallback, 17.89ms) para prenda ID 3.	172.20.0.1	2026-09-20 19:32:32.079457
8097	\N	IA_TRYON	prenda	3	Vestidor Virtual IA (opencv_fallback, 15.67ms) para prenda ID 3.	172.20.0.1	2026-09-20 19:32:32.103233
8098	\N	IA_TRYON	prenda	3	Vestidor Virtual IA (opencv_fallback, 19.86ms) para prenda ID 3.	172.20.0.1	2026-09-20 19:32:32.13376
8099	\N	IA_TRYON	prenda	3	Vestidor Virtual IA (opencv_fallback, 15.32ms) para prenda ID 3.	172.20.0.1	2026-09-20 19:32:32.159068
8100	\N	IA_TRYON	prenda	3	Vestidor Virtual IA (opencv_fallback, 15.76ms) para prenda ID 3.	172.20.0.1	2026-09-20 19:32:32.179139
8101	\N	IA_TRYON	prenda	3	Vestidor Virtual IA (opencv_fallback, 15.8ms) para prenda ID 3.	172.20.0.1	2026-09-20 19:32:32.200556
8102	\N	IA_TRYON	prenda	3	Vestidor Virtual IA (opencv_fallback, 17.83ms) para prenda ID 3.	172.20.0.1	2026-09-20 19:32:32.229928
8103	\N	IA_TRYON	prenda	3	Vestidor Virtual IA (opencv_fallback, 14.59ms) para prenda ID 3.	172.20.0.1	2026-09-20 19:32:32.253647
8104	\N	IA_TRYON	prenda	3	Vestidor Virtual IA (opencv_fallback, 19.41ms) para prenda ID 3.	172.20.0.1	2026-09-20 19:32:32.27368
8105	\N	IA_TRYON	prenda	3	Vestidor Virtual IA (opencv_fallback, 20.85ms) para prenda ID 3.	172.20.0.1	2026-09-20 19:32:32.316381
8106	\N	IA_TRYON	prenda	3	Vestidor Virtual IA (opencv_fallback, 32.85ms) para prenda ID 3.	172.20.0.1	2026-09-20 19:32:32.326719
8107	\N	IA_TRYON	prenda	3	Vestidor Virtual IA (opencv_fallback, 42.65ms) para prenda ID 3.	172.20.0.1	2026-09-20 19:32:32.339699
8108	\N	IA_TRYON	prenda	3	Vestidor Virtual IA (opencv_fallback, 44.72ms) para prenda ID 3.	172.20.0.1	2026-09-20 19:32:32.354553
8109	\N	IA_TRYON	prenda	3	Vestidor Virtual IA (opencv_fallback, 32.8ms) para prenda ID 3.	172.20.0.1	2026-09-20 19:32:32.380954
8110	\N	IA_TRYON	prenda	3	Vestidor Virtual IA (opencv_fallback, 48.46ms) para prenda ID 3.	172.20.0.1	2026-09-20 19:32:32.37659
8111	\N	IA_TRYON	prenda	\N	Vestidor Virtual IA (opencv_fallback, 10.71ms) para prenda externa personalizada.	172.20.0.1	2026-09-20 19:32:32.494845
8112	\N	IA_TRYON	prenda	\N	Vestidor Virtual IA (opencv_fallback, 12.14ms) para prenda externa personalizada.	172.20.0.1	2026-09-20 19:32:32.520352
8113	1	LOGIN_EXITOSO	usuario	1	Inicio de sesión exitoso de 'Alejandro Sistemas' (admin@fashionstore.com) con rol 'Administrador'.	192.168.10.101	2026-09-20 19:32:43.226543
8114	1	LOGIN_EXITOSO	usuario	1	Inicio de sesión exitoso de 'Alejandro Sistemas' (admin@fashionstore.com) con rol 'Administrador'.	172.20.0.1	2026-09-20 19:32:43.458273
8115	1	LOGIN_FALLIDO	usuario	1	Intento de inicio de sesión fallido para el correo: admin@fashionstore.com (contraseña incorrecta).	192.168.10.102	2026-09-20 19:32:43.7393
8116	\N	LOGIN_FALLIDO	usuario	\N	Intento de inicio de sesión fallido para el correo: no_existe_qa_999@fashionstore.com (correo no registrado).	192.168.10.103	2026-09-20 19:32:44.001638
8117	1	LOGIN_EXITOSO	usuario	1	Inicio de sesión exitoso de 'Alejandro Sistemas' (admin@fashionstore.com) con rol 'Administrador'.	172.20.0.1	2026-09-20 19:32:44.268034
8119	1	INSERT	usuario	1335	Alta de usuario 'Usuario Cliente QA' (qa_cliente_rbac@fashionstore.com) con rol id=4.	192.168.1.50	2026-09-20 19:32:45.206101
8121	1	INSERT	usuario	1336	Alta de usuario 'Carlos Cajero QA' (qa_nuevo_cajero@fashionstore.com) con rol id=3.	192.168.20.1	2026-09-20 19:32:45.83282
8122	1	UPDATE	usuario	1336	Modificación del usuario 'qa_nuevo_cajero@fashionstore.com'. Campos actualizados: nombre=Carlos Alberto, telefono=71122334.	192.168.20.2	2026-09-20 19:32:46.294486
8123	1	INACTIVAR	usuario	1336	Baja lógica del usuario 'qa_nuevo_cajero@fashionstore.com': estado cambiado de 'Activo' a 'Inactivo'.	192.168.20.3	2026-09-20 19:32:46.497176
8124	1	UPDATE	rol_permiso	3	Se actualizaron los permisos del rol 'Cajero (POS)' (ID: 3). Total asignados: 2.	192.168.1.50	2026-09-20 19:32:46.863194
8125	1	UPDATE	rol_permiso	3	Se actualizaron los permisos del rol 'Cajero (POS)' (ID: 3). Total asignados: 4.	192.168.1.50	2026-09-20 19:32:47.089742
8126	1	UPDATE	rol_permiso	3	Se actualizaron los permisos del rol 'Cajero (POS)' (ID: 3). Total asignados: 0.	192.168.1.50	2026-09-20 19:32:47.157575
8127	1	INSERT	usuario	1337	Alta de usuario 'Cajero POS QA' (qa_cajero_rbac@fashionstore.com) con rol id=3.	192.168.1.50	2026-09-20 19:32:47.419268
8465	\N	IA_TRYON	prenda	3	Vestidor Virtual IA (opencv_fallback, 1100.52ms) para prenda ID 3.	172.20.0.1	2026-09-20 19:43:01.079666
8129	1	UPDATE	rol_permiso	3	Se actualizaron los permisos del rol 'Cajero (POS)' (ID: 3). Total asignados: 5.	192.168.1.50	2026-09-20 19:32:47.992641
8130	1	UPDATE	rol_permiso	3	Se actualizaron los permisos del rol 'Cajero (POS)' (ID: 3). Total asignados: 4.	192.168.1.50	2026-09-20 19:32:48.097726
8131	1	INSERT	usuario	1338	Alta de usuario 'Cajero POS QA' (qa_cajero_rbac@fashionstore.com) con rol id=3.	192.168.1.50	2026-09-20 19:32:48.220112
8466	\N	IA_TRYON	prenda	\N	Vestidor Virtual IA (opencv_fallback, 9.75ms) para prenda externa personalizada.	172.20.0.1	2026-09-20 19:43:02.202123
8133	1	UPDATE	rol_permiso	3	Se actualizaron los permisos del rol 'Cajero (POS)' (ID: 3). Total asignados: 5.	192.168.1.50	2026-09-20 19:32:48.847352
8134	1	INSERT	usuario	1339	Alta de usuario 'Carlos Recuperador' (qa_recovery_user@fashionstore.com) con rol id=4.	192.168.1.50	2026-09-20 19:32:49.020122
8467	1	LOGIN_EXITOSO	usuario	1	Inicio de sesión exitoso de 'Alejandro Sistemas' (admin@fashionstore.com) con rol 'Administrador'.	172.20.0.1	2026-09-20 19:43:02.215714
8136	1	INSERT	usuario	1340	Alta de usuario 'Carlos Recuperador' (qa_recovery_user@fashionstore.com) con rol id=4.	192.168.1.50	2026-09-20 19:32:49.396146
8468	1	IA_TRYON	prenda	\N	Vestidor Virtual IA (opencv_fallback, 11.08ms) para prenda externa personalizada.	192.168.42.100	2026-09-20 19:43:02.502234
8469	\N	IA_TRYON	prenda	\N	Vestidor Virtual IA (opencv_fallback, 9.07ms) para prenda externa personalizada.	200.10.20.30	2026-09-20 19:43:02.736559
8139	1	INSERT	usuario	1341	Alta de usuario 'Carlos Recuperador' (qa_recovery_user@fashionstore.com) con rol id=4.	192.168.1.50	2026-09-20 19:32:49.763318
8472	\N	IA_TRYON	prenda	\N	Vestidor Virtual IA (opencv_fallback, 184.86ms) para prenda externa personalizada.	172.20.0.1	2026-09-20 19:43:05.464426
8141	1	INSERT	usuario	1342	Alta de usuario 'Carlos Recuperador' (qa_recovery_user@fashionstore.com) con rol id=4.	192.168.1.50	2026-09-20 19:32:50.131895
8473	\N	IA_TRYON	prenda	3	Vestidor Virtual IA (opencv_fallback, 23.72ms) para prenda ID 3.	172.20.0.1	2026-09-20 19:43:08.096755
8474	\N	IA_TRYON	prenda	3	Vestidor Virtual IA (opencv_fallback, 101.05ms) para prenda ID 3.	172.20.0.1	2026-09-20 19:43:08.174978
8475	\N	IA_TRYON	prenda	3	Vestidor Virtual IA (opencv_fallback, 148.89ms) para prenda ID 3.	172.20.0.1	2026-09-20 19:43:08.377933
8476	\N	IA_TRYON	prenda	\N	Vestidor Virtual IA (opencv_fallback, 10.38ms) para prenda externa personalizada.	172.20.0.1	2026-09-20 19:43:08.731188
8146	1	INSERT	usuario	1343	Alta de usuario 'Carlos Recuperador' (qa_recovery_user@fashionstore.com) con rol id=4.	192.168.1.50	2026-09-20 19:32:51.284821
8478	\N	IA_TRYON	prenda	3	Vestidor Virtual IA (opencv_fallback, 15.55ms) para prenda ID 3.	172.20.0.1	2026-09-20 19:43:08.769543
8148	1	INSERT	usuario	1344	Alta de usuario 'Carlos Recuperador' (qa_recovery_user@fashionstore.com) con rol id=4.	192.168.1.50	2026-09-20 19:32:51.658362
8149	1	INSERT	usuario	1345	Alta de usuario 'Carlos Recuperador' (qa_recovery_user@fashionstore.com) con rol id=4.	192.168.1.50	2026-09-20 19:32:51.984081
8480	\N	IA_TRYON	prenda	3	Vestidor Virtual IA (opencv_fallback, 21.39ms) para prenda ID 3.	172.20.0.1	2026-09-20 19:43:08.826977
8481	\N	IA_TRYON	prenda	3	Vestidor Virtual IA (opencv_fallback, 18.52ms) para prenda ID 3.	172.20.0.1	2026-09-20 19:43:08.853502
8152	1	INSERT	usuario	1346	Alta de usuario 'Carlos Recuperador' (qa_recovery_user@fashionstore.com) con rol id=4.	192.168.1.50	2026-09-20 19:32:52.626745
8153	1	INSERT	usuario	1347	Alta de usuario 'Inactivo QA' (qa_user_inactivo_recovery@fashionstore.com) con rol id=4.	192.168.1.50	2026-09-20 19:32:53.093286
8154	1	INSERT	usuario	1348	Alta de usuario 'Carlos Recuperador' (qa_recovery_user@fashionstore.com) con rol id=4.	192.168.1.50	2026-09-20 19:32:53.408912
8482	\N	IA_TRYON	prenda	3	Vestidor Virtual IA (opencv_fallback, 16.36ms) para prenda ID 3.	172.20.0.1	2026-09-20 19:43:08.878365
8156	1	INSERT	usuario	1349	Alta de usuario 'Carlos Recuperador' (qa_recovery_user@fashionstore.com) con rol id=4.	192.168.1.50	2026-09-20 19:32:53.830921
8484	\N	IA_TRYON	prenda	3	Vestidor Virtual IA (opencv_fallback, 13.8ms) para prenda ID 3.	172.20.0.1	2026-09-20 19:43:08.933015
8522	\N	IA_TRYON	prenda	3	Vestidor Virtual IA (opencv_fallback, 31.78ms) para prenda ID 3.	172.20.0.1	2026-09-20 19:43:43.815064
8659	\N	IA_TRYON	prenda	3	Vestidor Virtual IA (opencv_fallback, 19.41ms) para prenda ID 3.	172.20.0.1	2026-09-20 19:44:31.47341
8702	\N	IA_TRYON	prenda	3	Vestidor Virtual IA (opencv_fallback, 21.69ms) para prenda ID 3.	172.20.0.1	2026-09-20 19:46:39.538966
8161	1	INSERT	usuario	1350	Alta de usuario 'Carlos Recuperador' (qa_recovery_user@fashionstore.com) con rol id=4.	192.168.1.50	2026-09-20 19:32:54.982932
8734	\N	IA_TRYON	prenda	3	Vestidor Virtual IA (opencv_fallback, 18.52ms) para prenda ID 3.	172.20.0.1	2026-09-20 19:49:34.979229
8736	\N	IA_TRYON	prenda	3	Vestidor Virtual IA (opencv_fallback, 14.99ms) para prenda ID 3.	172.20.0.1	2026-09-20 19:49:35.024309
8165	1	INSERT	cliente	69	Alta del cliente 'Lucía Morales Paz' (CI 88997711).	192.168.40.1	2026-09-20 19:32:56.087135
8166	1	UPDATE	cliente	69	Modificación del cliente CI 88997711. Campos: nombre_completo=Lucía Morales de Mendoza, telefono=78999999.	192.168.40.2	2026-09-20 19:32:56.390358
8167	1	INACTIVAR	cliente	69	Baja lógica del cliente 'Lucía Morales de Mendoza' (CI 88997711).	192.168.40.3	2026-09-20 19:32:56.443853
8168	1	INSERT	ciudad	200	Alta de la ciudad 'Tarija QA'.	192.168.30.1	2026-09-20 19:32:56.653325
8169	1	INSERT	sucursal	140	Alta de la sucursal 'Sucursal Tarija Centro QA' en la ciudad id=200.	192.168.30.2	2026-09-20 19:32:56.909392
8170	1	UPDATE	sucursal	140	Modificación de la sucursal 'Sucursal Tarija Centro QA'. Campos: direccion=Calle Sucre #789 (Modificado), telefono=66449988.	192.168.30.3	2026-09-20 19:32:57.069581
8171	1	INSERT	categoria	157	Alta de la categoría 'Deportes QA'.	192.168.50.1	2026-09-20 19:32:57.242431
8172	1	INSERT	categoria	158	Alta de la categoría 'Calzado Deportivo QA'.	192.168.1.50	2026-09-20 19:32:57.295205
8173	1	UPDATE	categoria	157	Modificación de la categoría 'Deportes QA'. Campos: descripcion=Ropa de running y fitness.	192.168.50.2	2026-09-20 19:32:57.501068
8174	1	INACTIVAR	categoria	158	Baja lógica de la categoría 'Calzado Deportivo QA' (0 prenda(s) asociadas).	192.168.50.3	2026-09-20 19:32:57.613819
8175	1	INACTIVAR	categoria	157	Baja lógica de la categoría 'Deportes QA' (0 prenda(s) asociadas).	192.168.50.3	2026-09-20 19:32:57.66181
8877	\N	IA_TRYON	prenda	3	Vestidor Virtual IA (opencv_fallback, 17.05ms) para prenda ID 3.	172.20.0.1	2026-09-20 19:51:15.283706
8470	1	IA_TRYON	prenda	\N	Vestidor Virtual IA (gemini_multimodal_tryon, 14.6ms) para prenda externa personalizada.	192.168.10.77	2026-09-20 19:43:04.804356
8471	1	IA_TRYON	prenda	\N	Vestidor Virtual IA (opencv_fallback, 15.45ms) para prenda externa personalizada.	192.168.10.88	2026-09-20 19:43:05.045134
8523	\N	IA_TRYON	prenda	3	Vestidor Virtual IA (opencv_fallback, 30.66ms) para prenda ID 3.	172.20.0.1	2026-09-20 19:43:43.828624
8663	\N	IA_TRYON	prenda	3	Vestidor Virtual IA (opencv_fallback, 22.37ms) para prenda ID 3.	172.20.0.1	2026-09-20 19:44:31.585267
8665	\N	IA_TRYON	prenda	3	Vestidor Virtual IA (opencv_fallback, 32.65ms) para prenda ID 3.	172.20.0.1	2026-09-20 19:44:31.656533
8671	\N	IA_TRYON	prenda	\N	Vestidor Virtual IA (opencv_fallback, 11.8ms) para prenda externa personalizada.	172.20.0.1	2026-09-20 19:44:31.864146
8673	\N	IA_TRYON	prenda	3	Vestidor Virtual IA (opencv_fallback, 16.29ms) para prenda ID 3.	172.20.0.1	2026-09-20 19:44:32.057045
8674	\N	IA_TRYON	prenda	\N	Vestidor Virtual IA (opencv_fallback, 11.2ms) para prenda externa personalizada.	172.20.0.1	2026-09-20 19:44:32.097509
8675	1	IA_TRYON	prenda	\N	Vestidor Virtual IA (opencv_fallback, 10.06ms) para prenda externa personalizada.	192.168.42.100	2026-09-20 19:44:32.110214
8676	\N	IA_TRYON	prenda	\N	Vestidor Virtual IA (opencv_fallback, 9.9ms) para prenda externa personalizada.	200.10.20.30	2026-09-20 19:44:32.346316
8679	\N	IA_TRYON	prenda	\N	Vestidor Virtual IA (opencv_fallback, 144.51ms) para prenda externa personalizada.	172.20.0.1	2026-09-20 19:44:35.086463
8680	\N	IA_TRYON	prenda	3	Vestidor Virtual IA (opencv_fallback, 19.74ms) para prenda ID 3.	172.20.0.1	2026-09-20 19:44:37.849875
8683	\N	IA_TRYON	prenda	3	Vestidor Virtual IA (opencv_fallback, 17.87ms) para prenda ID 3.	172.20.0.1	2026-09-20 19:46:23.132046
8684	\N	IA_TRYON	prenda	\N	Vestidor Virtual IA (opencv_fallback, 22.06ms) para prenda externa personalizada.	172.20.0.1	2026-09-20 19:46:23.185001
8685	1	LOGIN_EXITOSO	usuario	1	Inicio de sesión exitoso de 'Alejandro Sistemas' (admin@fashionstore.com) con rol 'Administrador'.	172.20.0.1	2026-09-20 19:46:23.193331
8686	1	IA_TRYON	prenda	\N	Vestidor Virtual IA (opencv_fallback, 9.24ms) para prenda externa personalizada.	192.168.42.100	2026-09-20 19:46:23.46764
8687	\N	IA_TRYON	prenda	\N	Vestidor Virtual IA (opencv_fallback, 8.36ms) para prenda externa personalizada.	200.10.20.30	2026-09-20 19:46:23.697481
8690	\N	IA_TRYON	prenda	\N	Vestidor Virtual IA (opencv_fallback, 144.5ms) para prenda externa personalizada.	172.20.0.1	2026-09-20 19:46:26.431901
8691	\N	IA_TRYON	prenda	3	Vestidor Virtual IA (opencv_fallback, 16.25ms) para prenda ID 3.	172.20.0.1	2026-09-20 19:46:29.588497
8692	\N	IA_TRYON	prenda	3	Vestidor Virtual IA (opencv_fallback, 96.42ms) para prenda ID 3.	172.20.0.1	2026-09-20 19:46:38.750265
8693	\N	IA_TRYON	prenda	3	Vestidor Virtual IA (opencv_fallback, 175.51ms) para prenda ID 3.	172.20.0.1	2026-09-20 19:46:38.974917
8694	\N	IA_TRYON	prenda	\N	Vestidor Virtual IA (opencv_fallback, 11.62ms) para prenda externa personalizada.	172.20.0.1	2026-09-20 19:46:39.318838
8695	\N	IA_TRYON	prenda	\N	Vestidor Virtual IA (opencv_fallback, 15.47ms) para prenda externa personalizada.	172.20.0.1	2026-09-20 19:46:39.341918
8223	1	IA_RECOMENDACION	inventario	180	Recomendación IA (Fallback Catálogo): 3 prendas sugeridas para estilo 'Formal' y ocasión 'Trabajo'.	192.168.1.50	2026-09-20 19:33:05.936452
8224	1	IA_RECOMENDACION	inventario	180	Recomendación IA (Fallback Catálogo): 2 prendas sugeridas para estilo 'Deportivo' y ocasión 'General'.	192.168.1.50	2026-09-20 19:33:06.376226
8225	1	IA_RECOMENDACION	inventario	180	Recomendación IA (Fallback Catálogo): 5 prendas sugeridas para estilo 'Urbano' y ocasión 'General'.	192.168.1.50	2026-09-20 19:33:06.682172
8226	1	IA_RECOMENDACION	inventario	180	Recomendación IA (Fallback Catálogo): 6 prendas sugeridas para estilo 'Elegante' y ocasión 'Cena'.	10.0.0.77	2026-09-20 19:33:06.927416
8227	1	IA_ANALITICA_VOZ	inventario	\N	Analítica por voz CU23: 'Cuántas prendas tenemos en stock en todas las sucursales' -> Métrica 'inventario_stock', Resultados=4, PDF=False.	192.168.1.50	2026-09-20 19:33:07.24689
8696	\N	IA_TRYON	prenda	3	Vestidor Virtual IA (opencv_fallback, 21.79ms) para prenda ID 3.	172.20.0.1	2026-09-20 19:46:39.352871
8229	1	IA_ANALITICA_VOZ	venta	\N	Analítica por voz CU23: 'Generar reporte ejecutivo de ventas globales del mes' -> Métrica 'ventas_total', Resultados=2, PDF=True.	192.168.1.50	2026-09-20 19:33:07.801981
8230	1	IA_ANALITICA_VOZ	inventario	\N	Analítica por voz CU23: 'Reporte de existencias para auditoria' -> Métrica 'inventario_stock', Resultados=4, PDF=False.	172.16.5.99	2026-09-20 19:33:08.02337
8231	1	INSERT	ciudad	201	Alta de la ciudad 'Pando QA IP Test'.	200.87.100.45	2026-09-20 19:33:08.302406
8232	\N	LOGIN_FALLIDO	usuario	\N	Intento de inicio de sesión fallido para el correo: no_existe_seguro@fashionstore.com (correo no registrado).	192.168.99.99	2026-09-20 19:33:08.567576
8233	1	UPDATE	rol_permiso	3	Se actualizaron los permisos del rol 'Cajero (POS)' (ID: 3). Total asignados: 3.	198.51.100.22	2026-09-20 19:33:08.82821
8234	1	INSERT	usuario	1351	Alta de usuario 'Audit CU04' (qa_bitacora_cu04@fashionstore.com) con rol id=4.	192.168.1.50	2026-09-20 19:33:09.200311
8697	\N	IA_TRYON	prenda	3	Vestidor Virtual IA (opencv_fallback, 22.2ms) para prenda ID 3.	172.20.0.1	2026-09-20 19:46:39.383254
8698	\N	IA_TRYON	prenda	3	Vestidor Virtual IA (opencv_fallback, 28.18ms) para prenda ID 3.	172.20.0.1	2026-09-20 19:46:39.412086
8237	\N	IA_TRYON	prenda	3	Vestidor Virtual IA (opencv_fallback, 93.69ms) para prenda ID 3.	172.20.0.1	2026-09-20 19:33:18.326343
8238	\N	IA_TRYON	prenda	3	Vestidor Virtual IA (opencv_fallback, 149.81ms) para prenda ID 3.	172.20.0.1	2026-09-20 19:33:18.525958
8239	\N	IA_TRYON	prenda	\N	Vestidor Virtual IA (opencv_fallback, 13.05ms) para prenda externa personalizada.	172.20.0.1	2026-09-20 19:33:18.865658
8240	\N	IA_TRYON	prenda	\N	Vestidor Virtual IA (opencv_fallback, 10.68ms) para prenda externa personalizada.	172.20.0.1	2026-09-20 19:33:18.88423
8241	\N	IA_TRYON	prenda	3	Vestidor Virtual IA (opencv_fallback, 17.73ms) para prenda ID 3.	172.20.0.1	2026-09-20 19:33:18.896289
8242	\N	IA_TRYON	prenda	3	Vestidor Virtual IA (opencv_fallback, 23.37ms) para prenda ID 3.	172.20.0.1	2026-09-20 19:33:18.920839
8700	\N	IA_TRYON	prenda	3	Vestidor Virtual IA (opencv_fallback, 18.67ms) para prenda ID 3.	172.20.0.1	2026-09-20 19:46:39.479239
8707	\N	IA_TRYON	prenda	3	Vestidor Virtual IA (opencv_fallback, 35.53ms) para prenda ID 3.	172.20.0.1	2026-09-20 19:46:39.671089
8738	\N	IA_TRYON	prenda	3	Vestidor Virtual IA (opencv_fallback, 25.89ms) para prenda ID 3.	172.20.0.1	2026-09-20 19:49:35.067734
8855	1	IA_RECOMENDACION	inventario	180	Recomendación IA (Fallback Catálogo): 3 prendas sugeridas para estilo 'Formal' y ocasión 'Trabajo'.	192.168.1.50	2026-09-20 19:51:01.325035
8856	1	IA_RECOMENDACION	inventario	180	Recomendación IA (Fallback Catálogo): 2 prendas sugeridas para estilo 'Deportivo' y ocasión 'General'.	192.168.1.50	2026-09-20 19:51:01.774598
8857	1	IA_RECOMENDACION	inventario	180	Recomendación IA (Fallback Catálogo): 5 prendas sugeridas para estilo 'Urbano' y ocasión 'General'.	192.168.1.50	2026-09-20 19:51:02.450169
8243	\N	IA_TRYON	prenda	3	Vestidor Virtual IA (opencv_fallback, 16.64ms) para prenda ID 3.	172.20.0.1	2026-09-20 19:33:18.951543
8244	\N	IA_TRYON	prenda	3	Vestidor Virtual IA (opencv_fallback, 17.48ms) para prenda ID 3.	172.20.0.1	2026-09-20 19:33:18.974961
8245	\N	IA_TRYON	prenda	3	Vestidor Virtual IA (opencv_fallback, 21.78ms) para prenda ID 3.	172.20.0.1	2026-09-20 19:33:19.008586
8246	\N	IA_TRYON	prenda	3	Vestidor Virtual IA (opencv_fallback, 17.82ms) para prenda ID 3.	172.20.0.1	2026-09-20 19:33:19.03684
8247	\N	IA_TRYON	prenda	3	Vestidor Virtual IA (opencv_fallback, 20.05ms) para prenda ID 3.	172.20.0.1	2026-09-20 19:33:19.074124
8248	\N	IA_TRYON	prenda	3	Vestidor Virtual IA (opencv_fallback, 14.34ms) para prenda ID 3.	172.20.0.1	2026-09-20 19:33:19.100764
8249	\N	IA_TRYON	prenda	3	Vestidor Virtual IA (opencv_fallback, 15.83ms) para prenda ID 3.	172.20.0.1	2026-09-20 19:33:19.120801
8250	\N	IA_TRYON	prenda	3	Vestidor Virtual IA (opencv_fallback, 18.43ms) para prenda ID 3.	172.20.0.1	2026-09-20 19:33:19.150174
8251	\N	IA_TRYON	prenda	3	Vestidor Virtual IA (opencv_fallback, 28.31ms) para prenda ID 3.	172.20.0.1	2026-09-20 19:33:19.189034
8252	\N	IA_TRYON	prenda	3	Vestidor Virtual IA (opencv_fallback, 29.63ms) para prenda ID 3.	172.20.0.1	2026-09-20 19:33:19.197045
8253	\N	IA_TRYON	prenda	3	Vestidor Virtual IA (opencv_fallback, 32.81ms) para prenda ID 3.	172.20.0.1	2026-09-20 19:33:19.209259
8254	\N	IA_TRYON	prenda	3	Vestidor Virtual IA (opencv_fallback, 34.4ms) para prenda ID 3.	172.20.0.1	2026-09-20 19:33:19.223351
8255	\N	IA_TRYON	prenda	3	Vestidor Virtual IA (opencv_fallback, 33.28ms) para prenda ID 3.	172.20.0.1	2026-09-20 19:33:19.238149
8256	\N	IA_TRYON	prenda	3	Vestidor Virtual IA (opencv_fallback, 28.53ms) para prenda ID 3.	172.20.0.1	2026-09-20 19:33:19.254796
8257	\N	IA_TRYON	prenda	\N	Vestidor Virtual IA (opencv_fallback, 10.97ms) para prenda externa personalizada.	172.20.0.1	2026-09-20 19:33:19.353873
8258	\N	IA_TRYON	prenda	\N	Vestidor Virtual IA (opencv_fallback, 13.49ms) para prenda externa personalizada.	172.20.0.1	2026-09-20 19:33:19.381845
8259	\N	IA_TRYON	prenda	3	Vestidor Virtual IA (opencv_fallback, 15.0ms) para prenda ID 3.	172.20.0.1	2026-09-20 19:33:19.543673
8260	\N	IA_TRYON	prenda	\N	Vestidor Virtual IA (opencv_fallback, 9.82ms) para prenda externa personalizada.	172.20.0.1	2026-09-20 19:33:19.581284
8261	1	IA_TRYON	prenda	\N	Vestidor Virtual IA (opencv_fallback, 9.63ms) para prenda externa personalizada.	192.168.42.100	2026-09-20 19:33:19.592827
8262	\N	IA_TRYON	prenda	\N	Vestidor Virtual IA (opencv_fallback, 9.06ms) para prenda externa personalizada.	200.10.20.30	2026-09-20 19:33:19.826464
8263	1	IA_TRYON	prenda	\N	Vestidor Virtual IA (gemini_multimodal_tryon, 15.05ms) para prenda externa personalizada.	192.168.10.77	2026-09-20 19:33:21.942869
8264	1	IA_TRYON	prenda	\N	Vestidor Virtual IA (opencv_fallback, 13.79ms) para prenda externa personalizada.	192.168.10.88	2026-09-20 19:33:22.183461
8265	\N	IA_TRYON	prenda	\N	Vestidor Virtual IA (opencv_fallback, 364.54ms) para prenda externa personalizada.	172.20.0.1	2026-09-20 19:33:22.7803
8266	\N	IA_TRYON	prenda	3	Vestidor Virtual IA (opencv_fallback, 14.35ms) para prenda ID 3.	172.20.0.1	2026-09-20 19:33:25.629618
8269	\N	IA_TRYON	prenda	3	Vestidor Virtual IA (opencv_fallback, 22.14ms) para prenda ID 3.	172.20.0.1	2026-09-20 19:33:33.544391
8270	\N	IA_TRYON	prenda	\N	Vestidor Virtual IA (opencv_fallback, 10.59ms) para prenda externa personalizada.	172.20.0.1	2026-09-20 19:33:33.589213
8271	1	LOGIN_EXITOSO	usuario	1	Inicio de sesión exitoso de 'Alejandro Sistemas' (admin@fashionstore.com) con rol 'Administrador'.	172.20.0.1	2026-09-20 19:33:33.595167
8272	1	IA_TRYON	prenda	\N	Vestidor Virtual IA (opencv_fallback, 9.46ms) para prenda externa personalizada.	192.168.42.100	2026-09-20 19:33:33.859123
8273	\N	IA_TRYON	prenda	\N	Vestidor Virtual IA (opencv_fallback, 8.78ms) para prenda externa personalizada.	200.10.20.30	2026-09-20 19:33:34.092002
8274	1	IA_TRYON	prenda	\N	Vestidor Virtual IA (gemini_multimodal_tryon, 13.91ms) para prenda externa personalizada.	192.168.10.77	2026-09-20 19:33:36.197085
8275	1	IA_TRYON	prenda	\N	Vestidor Virtual IA (opencv_fallback, 14.53ms) para prenda externa personalizada.	192.168.10.88	2026-09-20 19:33:36.437945
8276	\N	IA_TRYON	prenda	\N	Vestidor Virtual IA (opencv_fallback, 357.09ms) para prenda externa personalizada.	172.20.0.1	2026-09-20 19:33:37.028357
8277	\N	IA_TRYON	prenda	3	Vestidor Virtual IA (opencv_fallback, 14.84ms) para prenda ID 3.	172.20.0.1	2026-09-20 19:33:39.716566
8278	\N	IA_TRYON	prenda	3	Vestidor Virtual IA (opencv_fallback, 17.03ms) para prenda ID 3.	172.20.0.1	2026-09-20 19:34:36.460328
8279	\N	IA_TRYON	prenda	\N	Vestidor Virtual IA (opencv_fallback, 9.45ms) para prenda externa personalizada.	172.20.0.1	2026-09-20 19:34:36.4997
8280	1	LOGIN_EXITOSO	usuario	1	Inicio de sesión exitoso de 'Alejandro Sistemas' (admin@fashionstore.com) con rol 'Administrador'.	172.20.0.1	2026-09-20 19:34:36.50675
8281	1	IA_TRYON	prenda	\N	Vestidor Virtual IA (opencv_fallback, 10.1ms) para prenda externa personalizada.	192.168.42.100	2026-09-20 19:34:36.773403
8282	\N	IA_TRYON	prenda	\N	Vestidor Virtual IA (opencv_fallback, 9.62ms) para prenda externa personalizada.	200.10.20.30	2026-09-20 19:34:37.005845
8283	1	IA_TRYON	prenda	\N	Vestidor Virtual IA (gemini_multimodal_tryon, 39.57ms) para prenda externa personalizada.	192.168.10.77	2026-09-20 19:34:39.132908
8284	1	IA_TRYON	prenda	\N	Vestidor Virtual IA (opencv_fallback, 16.1ms) para prenda externa personalizada.	192.168.10.88	2026-09-20 19:34:39.400803
8285	\N	IA_TRYON	prenda	\N	Vestidor Virtual IA (opencv_fallback, 360.09ms) para prenda externa personalizada.	172.20.0.1	2026-09-20 19:34:39.995608
8286	\N	IA_TRYON	prenda	3	Vestidor Virtual IA (opencv_fallback, 15.03ms) para prenda ID 3.	172.20.0.1	2026-09-20 19:34:42.626836
8287	\N	IA_TRYON	prenda	3	Vestidor Virtual IA (opencv_fallback, 91.85ms) para prenda ID 3.	172.20.0.1	2026-09-20 19:34:42.696798
8288	\N	IA_TRYON	prenda	3	Vestidor Virtual IA (opencv_fallback, 169.68ms) para prenda ID 3.	172.20.0.1	2026-09-20 19:34:42.917769
8289	\N	IA_TRYON	prenda	\N	Vestidor Virtual IA (opencv_fallback, 9.5ms) para prenda externa personalizada.	172.20.0.1	2026-09-20 19:34:43.253237
8290	\N	IA_TRYON	prenda	\N	Vestidor Virtual IA (opencv_fallback, 9.84ms) para prenda externa personalizada.	172.20.0.1	2026-09-20 19:34:43.277962
8291	\N	IA_TRYON	prenda	3	Vestidor Virtual IA (opencv_fallback, 15.02ms) para prenda ID 3.	172.20.0.1	2026-09-20 19:34:43.289266
8292	\N	IA_TRYON	prenda	3	Vestidor Virtual IA (opencv_fallback, 15.38ms) para prenda ID 3.	172.20.0.1	2026-09-20 19:34:43.310959
8293	\N	IA_TRYON	prenda	3	Vestidor Virtual IA (opencv_fallback, 14.56ms) para prenda ID 3.	172.20.0.1	2026-09-20 19:34:43.332067
8294	\N	IA_TRYON	prenda	3	Vestidor Virtual IA (opencv_fallback, 16.93ms) para prenda ID 3.	172.20.0.1	2026-09-20 19:34:43.360478
8295	\N	IA_TRYON	prenda	3	Vestidor Virtual IA (opencv_fallback, 14.46ms) para prenda ID 3.	172.20.0.1	2026-09-20 19:34:43.383807
8296	\N	IA_TRYON	prenda	3	Vestidor Virtual IA (opencv_fallback, 17.66ms) para prenda ID 3.	172.20.0.1	2026-09-20 19:34:43.41248
8297	\N	IA_TRYON	prenda	3	Vestidor Virtual IA (opencv_fallback, 14.66ms) para prenda ID 3.	172.20.0.1	2026-09-20 19:34:43.436815
8298	\N	IA_TRYON	prenda	3	Vestidor Virtual IA (opencv_fallback, 14.47ms) para prenda ID 3.	172.20.0.1	2026-09-20 19:34:43.457071
8299	\N	IA_TRYON	prenda	3	Vestidor Virtual IA (opencv_fallback, 22.71ms) para prenda ID 3.	172.20.0.1	2026-09-20 19:34:43.485044
8300	\N	IA_TRYON	prenda	3	Vestidor Virtual IA (opencv_fallback, 23.18ms) para prenda ID 3.	172.20.0.1	2026-09-20 19:34:43.516923
8301	\N	IA_TRYON	prenda	3	Vestidor Virtual IA (opencv_fallback, 31.68ms) para prenda ID 3.	172.20.0.1	2026-09-20 19:34:43.570939
8302	\N	IA_TRYON	prenda	3	Vestidor Virtual IA (opencv_fallback, 39.17ms) para prenda ID 3.	172.20.0.1	2026-09-20 19:34:43.589417
8303	\N	IA_TRYON	prenda	3	Vestidor Virtual IA (opencv_fallback, 38.31ms) para prenda ID 3.	172.20.0.1	2026-09-20 19:34:43.604712
8304	\N	IA_TRYON	prenda	3	Vestidor Virtual IA (opencv_fallback, 40.68ms) para prenda ID 3.	172.20.0.1	2026-09-20 19:34:43.618132
8305	\N	IA_TRYON	prenda	3	Vestidor Virtual IA (opencv_fallback, 36.34ms) para prenda ID 3.	172.20.0.1	2026-09-20 19:34:43.632267
8306	\N	IA_TRYON	prenda	3	Vestidor Virtual IA (opencv_fallback, 33.09ms) para prenda ID 3.	172.20.0.1	2026-09-20 19:34:43.650169
8307	\N	IA_TRYON	prenda	\N	Vestidor Virtual IA (opencv_fallback, 10.72ms) para prenda externa personalizada.	172.20.0.1	2026-09-20 19:34:43.758184
8308	\N	IA_TRYON	prenda	\N	Vestidor Virtual IA (opencv_fallback, 12.92ms) para prenda externa personalizada.	172.20.0.1	2026-09-20 19:34:43.784713
8477	\N	IA_TRYON	prenda	\N	Vestidor Virtual IA (opencv_fallback, 10.81ms) para prenda externa personalizada.	172.20.0.1	2026-09-20 19:43:08.757282
8524	\N	IA_TRYON	prenda	3	Vestidor Virtual IA (opencv_fallback, 27.49ms) para prenda ID 3.	172.20.0.1	2026-09-20 19:43:43.845142
8666	\N	IA_TRYON	prenda	3	Vestidor Virtual IA (opencv_fallback, 42.92ms) para prenda ID 3.	172.20.0.1	2026-09-20 19:44:31.670451
8708	\N	IA_TRYON	prenda	3	Vestidor Virtual IA (opencv_fallback, 43.35ms) para prenda ID 3.	172.20.0.1	2026-09-20 19:46:39.687833
8739	\N	IA_TRYON	prenda	3	Vestidor Virtual IA (opencv_fallback, 26.29ms) para prenda ID 3.	172.20.0.1	2026-09-20 19:49:35.081642
8879	\N	IA_TRYON	prenda	3	Vestidor Virtual IA (opencv_fallback, 16.82ms) para prenda ID 3.	172.20.0.1	2026-09-20 19:51:15.335793
8881	\N	IA_TRYON	prenda	3	Vestidor Virtual IA (opencv_fallback, 14.34ms) para prenda ID 3.	172.20.0.1	2026-09-20 19:51:15.378775
8883	\N	IA_TRYON	prenda	3	Vestidor Virtual IA (opencv_fallback, 27.07ms) para prenda ID 3.	172.20.0.1	2026-09-20 19:51:15.435511
8889	\N	IA_TRYON	prenda	\N	Vestidor Virtual IA (opencv_fallback, 10.4ms) para prenda externa personalizada.	172.20.0.1	2026-09-20 19:51:15.597256
8890	\N	IA_TRYON	prenda	\N	Vestidor Virtual IA (opencv_fallback, 12.17ms) para prenda externa personalizada.	172.20.0.1	2026-09-20 19:51:15.624149
8891	\N	IA_TRYON	prenda	3	Vestidor Virtual IA (opencv_fallback, 18.08ms) para prenda ID 3.	172.20.0.1	2026-09-20 19:51:15.784187
8892	\N	IA_TRYON	prenda	\N	Vestidor Virtual IA (opencv_fallback, 10.66ms) para prenda externa personalizada.	172.20.0.1	2026-09-20 19:51:15.826333
8893	1	IA_TRYON	prenda	\N	Vestidor Virtual IA (opencv_fallback, 9.35ms) para prenda externa personalizada.	192.168.42.100	2026-09-20 19:51:15.839952
8894	\N	IA_TRYON	prenda	\N	Vestidor Virtual IA (opencv_fallback, 9.32ms) para prenda externa personalizada.	200.10.20.30	2026-09-20 19:51:16.073602
8897	\N	IA_TRYON	prenda	\N	Vestidor Virtual IA (opencv_fallback, 142.21ms) para prenda externa personalizada.	172.20.0.1	2026-09-20 19:51:18.557528
8898	\N	IA_TRYON	prenda	3	Vestidor Virtual IA (opencv_fallback, 15.62ms) para prenda ID 3.	172.20.0.1	2026-09-20 19:51:21.210159
8916	\N	IA_TRYON	prenda	3	Vestidor Virtual IA (opencv_fallback, 21.79ms) para prenda ID 3.	172.20.0.1	2026-09-20 19:55:38.819717
8928	\N	IA_TRYON	prenda	3	Vestidor Virtual IA (opencv_fallback, 33.88ms) para prenda ID 3.	172.20.0.1	2026-09-20 19:55:39.089292
8936	\N	IA_TRYON	prenda	173	Vestidor Virtual IA (fashn_vton_ai, 15930.8ms) para prenda ID 173.	172.20.0.1	2026-09-20 21:16:23.700728
8946	\N	IA_TRYON	prenda	3	Vestidor Virtual IA (opencv_fallback, 38.5ms) para prenda ID 3.	172.20.0.1	2026-09-20 21:20:21.72475
8948	\N	IA_TRYON	prenda	3	Vestidor Virtual IA (opencv_fallback, 52.0ms) para prenda ID 3.	172.20.0.1	2026-09-20 21:20:48.132817
8949	\N	IA_TRYON	prenda	\N	Vestidor Virtual IA (opencv_fallback, 12.01ms) para prenda externa personalizada.	172.20.0.1	2026-09-20 21:20:48.207942
8950	1	LOGIN_EXITOSO	usuario	1	Inicio de sesión exitoso de 'Alejandro Sistemas' (admin@fashionstore.com) con rol 'Administrador'.	172.20.0.1	2026-09-20 21:20:48.214755
8951	1	IA_TRYON	prenda	\N	Vestidor Virtual IA (opencv_fallback, 9.64ms) para prenda externa personalizada.	192.168.42.100	2026-09-20 21:20:48.485848
8952	\N	IA_TRYON	prenda	\N	Vestidor Virtual IA (opencv_fallback, 9.12ms) para prenda externa personalizada.	200.10.20.30	2026-09-20 21:20:48.717146
8955	\N	IA_TRYON	prenda	\N	Vestidor Virtual IA (fashn_vton_ai, 27747.51ms) para prenda externa personalizada.	172.20.0.1	2026-09-20 21:21:19.406387
8956	\N	IA_TRYON	prenda	3	Vestidor Virtual IA (opencv_fallback, 24.04ms) para prenda ID 3.	172.20.0.1	2026-09-20 21:21:22.090542
8957	\N	IA_TRYON	prenda	3	Vestidor Virtual IA (opencv_fallback, 121.65ms) para prenda ID 3.	172.20.0.1	2026-09-20 21:21:38.284214
8958	\N	IA_TRYON	prenda	3	Vestidor Virtual IA (opencv_fallback, 148.05ms) para prenda ID 3.	172.20.0.1	2026-09-20 21:21:38.496721
8959	\N	IA_TRYON	prenda	\N	Vestidor Virtual IA (opencv_fallback, 9.59ms) para prenda externa personalizada.	172.20.0.1	2026-09-20 21:21:38.82795
8961	\N	IA_TRYON	prenda	3	Vestidor Virtual IA (opencv_fallback, 17.17ms) para prenda ID 3.	172.20.0.1	2026-09-20 21:21:38.863839
8963	\N	IA_TRYON	prenda	3	Vestidor Virtual IA (opencv_fallback, 22.22ms) para prenda ID 3.	172.20.0.1	2026-09-20 21:21:38.921828
8968	\N	IA_TRYON	prenda	3	Vestidor Virtual IA (opencv_fallback, 40.99ms) para prenda ID 3.	172.20.0.1	2026-09-20 21:21:39.058366
8975	\N	IA_TRYON	prenda	3	Vestidor Virtual IA (opencv_fallback, 37.31ms) para prenda ID 3.	172.20.0.1	2026-09-20 21:21:39.269342
8998	1	LOGIN_EXITOSO	usuario	1	Inicio de sesión exitoso de 'Alejandro Sistemas' (admin@fashionstore.com) con rol 'Administrador'.	172.20.0.1	2026-09-20 21:22:03.647261
9000	1	INSERT	usuario	1408	Alta de usuario 'Usuario Cliente QA' (qa_cliente_rbac@fashionstore.com) con rol id=4.	192.168.1.50	2026-09-20 21:22:04.595731
9002	1	INSERT	usuario	1409	Alta de usuario 'Carlos Cajero QA' (qa_nuevo_cajero@fashionstore.com) con rol id=3.	192.168.20.1	2026-09-20 21:22:05.216033
9003	1	UPDATE	usuario	1409	Modificación del usuario 'qa_nuevo_cajero@fashionstore.com'. Campos actualizados: nombre=Carlos Alberto, telefono=71122334.	192.168.20.2	2026-09-20 21:22:05.680977
9004	1	INACTIVAR	usuario	1409	Baja lógica del usuario 'qa_nuevo_cajero@fashionstore.com': estado cambiado de 'Activo' a 'Inactivo'.	192.168.20.3	2026-09-20 21:22:05.880101
9005	1	UPDATE	rol_permiso	3	Se actualizaron los permisos del rol 'Cajero (POS)' (ID: 3). Total asignados: 2.	192.168.1.50	2026-09-20 21:22:06.23178
9006	1	UPDATE	rol_permiso	3	Se actualizaron los permisos del rol 'Cajero (POS)' (ID: 3). Total asignados: 4.	192.168.1.50	2026-09-20 21:22:06.45778
9007	1	UPDATE	rol_permiso	3	Se actualizaron los permisos del rol 'Cajero (POS)' (ID: 3). Total asignados: 0.	192.168.1.50	2026-09-20 21:22:06.532066
9008	1	INSERT	usuario	1410	Alta de usuario 'Cajero POS QA' (qa_cajero_rbac@fashionstore.com) con rol id=3.	192.168.1.50	2026-09-20 21:22:06.799842
9105	1	IA_RECOMENDACION	inventario	180	Recomendación IA (Fallback Catálogo): 6 prendas sugeridas para estilo 'Elegante' y ocasión 'Cena'.	10.0.0.77	2026-09-20 21:22:27.3508
9108	1	IA_ANALITICA_VOZ	venta	\N	Analítica por voz CU23: 'Generar reporte ejecutivo de ventas globales del mes' -> Métrica 'ventas_total', Resultados=2, PDF=True.	192.168.1.50	2026-09-20 21:22:29.005942
9109	1	IA_ANALITICA_VOZ	inventario	\N	Analítica por voz CU23: 'Reporte de existencias para auditoria' -> Métrica 'inventario_stock', Resultados=4, PDF=False.	172.16.5.99	2026-09-20 21:22:29.249057
9110	1	INSERT	ciudad	210	Alta de la ciudad 'Pando QA IP Test'.	200.87.100.45	2026-09-20 21:22:29.953979
9111	\N	LOGIN_FALLIDO	usuario	\N	Intento de inicio de sesión fallido para el correo: no_existe_seguro@fashionstore.com (correo no registrado).	192.168.99.99	2026-09-20 21:22:30.224528
9112	1	UPDATE	rol_permiso	3	Se actualizaron los permisos del rol 'Cajero (POS)' (ID: 3). Total asignados: 3.	198.51.100.22	2026-09-20 21:22:30.504655
9113	1	INSERT	usuario	1424	Alta de usuario 'Audit CU04' (qa_bitacora_cu04@fashionstore.com) con rol id=4.	192.168.1.50	2026-09-20 21:22:30.903055
9116	\N	IA_TRYON	prenda	3	Vestidor Virtual IA (opencv_fallback, 103.22ms) para prenda ID 3.	172.20.0.1	2026-09-20 21:22:39.554676
9117	\N	IA_TRYON	prenda	3	Vestidor Virtual IA (opencv_fallback, 183.41ms) para prenda ID 3.	172.20.0.1	2026-09-20 21:22:39.783811
9118	\N	IA_TRYON	prenda	\N	Vestidor Virtual IA (opencv_fallback, 10.37ms) para prenda externa personalizada.	172.20.0.1	2026-09-20 21:22:40.148247
9119	\N	IA_TRYON	prenda	\N	Vestidor Virtual IA (opencv_fallback, 10.59ms) para prenda externa personalizada.	172.20.0.1	2026-09-20 21:22:40.173328
9120	\N	IA_TRYON	prenda	3	Vestidor Virtual IA (opencv_fallback, 17.03ms) para prenda ID 3.	172.20.0.1	2026-09-20 21:22:40.184328
9121	\N	IA_TRYON	prenda	3	Vestidor Virtual IA (opencv_fallback, 17.7ms) para prenda ID 3.	172.20.0.1	2026-09-20 21:22:40.205669
9122	\N	IA_TRYON	prenda	3	Vestidor Virtual IA (opencv_fallback, 17.62ms) para prenda ID 3.	172.20.0.1	2026-09-20 21:22:40.228171
9123	\N	IA_TRYON	prenda	3	Vestidor Virtual IA (opencv_fallback, 15.02ms) para prenda ID 3.	172.20.0.1	2026-09-20 21:22:40.2505
9124	\N	IA_TRYON	prenda	3	Vestidor Virtual IA (opencv_fallback, 17.48ms) para prenda ID 3.	172.20.0.1	2026-09-20 21:22:40.27034
9125	\N	IA_TRYON	prenda	3	Vestidor Virtual IA (opencv_fallback, 15.47ms) para prenda ID 3.	172.20.0.1	2026-09-20 21:22:40.293135
9126	\N	IA_TRYON	prenda	3	Vestidor Virtual IA (opencv_fallback, 16.83ms) para prenda ID 3.	172.20.0.1	2026-09-20 21:22:40.313265
9127	\N	IA_TRYON	prenda	3	Vestidor Virtual IA (opencv_fallback, 15.8ms) para prenda ID 3.	172.20.0.1	2026-09-20 21:22:40.334955
9128	\N	IA_TRYON	prenda	3	Vestidor Virtual IA (opencv_fallback, 15.79ms) para prenda ID 3.	172.20.0.1	2026-09-20 21:22:40.355802
9129	\N	IA_TRYON	prenda	3	Vestidor Virtual IA (opencv_fallback, 15.83ms) para prenda ID 3.	172.20.0.1	2026-09-20 21:22:40.375983
9130	\N	IA_TRYON	prenda	3	Vestidor Virtual IA (opencv_fallback, 23.71ms) para prenda ID 3.	172.20.0.1	2026-09-20 21:22:40.411435
9131	\N	IA_TRYON	prenda	3	Vestidor Virtual IA (opencv_fallback, 42.5ms) para prenda ID 3.	172.20.0.1	2026-09-20 21:22:40.413427
9132	\N	IA_TRYON	prenda	3	Vestidor Virtual IA (opencv_fallback, 45.94ms) para prenda ID 3.	172.20.0.1	2026-09-20 21:22:40.421352
9133	\N	IA_TRYON	prenda	3	Vestidor Virtual IA (opencv_fallback, 37.98ms) para prenda ID 3.	172.20.0.1	2026-09-20 21:22:40.438037
9134	\N	IA_TRYON	prenda	3	Vestidor Virtual IA (opencv_fallback, 34.21ms) para prenda ID 3.	172.20.0.1	2026-09-20 21:22:40.450014
9135	\N	IA_TRYON	prenda	3	Vestidor Virtual IA (opencv_fallback, 26.37ms) para prenda ID 3.	172.20.0.1	2026-09-20 21:22:40.464214
9136	\N	IA_TRYON	prenda	\N	Vestidor Virtual IA (opencv_fallback, 9.95ms) para prenda externa personalizada.	172.20.0.1	2026-09-20 21:22:40.560706
9137	\N	IA_TRYON	prenda	\N	Vestidor Virtual IA (opencv_fallback, 12.94ms) para prenda externa personalizada.	172.20.0.1	2026-09-20 21:22:40.588909
9138	\N	IA_TRYON	prenda	3	Vestidor Virtual IA (opencv_fallback, 14.89ms) para prenda ID 3.	172.20.0.1	2026-09-20 21:22:40.746619
9139	\N	IA_TRYON	prenda	\N	Vestidor Virtual IA (opencv_fallback, 9.87ms) para prenda externa personalizada.	172.20.0.1	2026-09-20 21:22:40.782531
9140	1	IA_TRYON	prenda	\N	Vestidor Virtual IA (opencv_fallback, 9.36ms) para prenda externa personalizada.	192.168.42.100	2026-09-20 21:22:40.79309
9141	\N	IA_TRYON	prenda	\N	Vestidor Virtual IA (opencv_fallback, 7.88ms) para prenda externa personalizada.	200.10.20.30	2026-09-20 21:22:41.022368
9142	1	IA_TRYON	prenda	\N	Vestidor Virtual IA (gemini_multimodal_tryon, 14.85ms) para prenda externa personalizada.	192.168.10.77	2026-09-20 21:22:43.061578
9143	1	IA_TRYON	prenda	\N	Vestidor Virtual IA (opencv_fallback, 14.89ms) para prenda externa personalizada.	192.168.10.88	2026-09-20 21:22:43.313271
9144	\N	IA_TRYON	prenda	\N	Vestidor Virtual IA (fashn_vton_ai, 28321.66ms) para prenda externa personalizada.	172.20.0.1	2026-09-20 21:23:12.179063
9145	\N	IA_TRYON	prenda	3	Vestidor Virtual IA (opencv_fallback, 16.35ms) para prenda ID 3.	172.20.0.1	2026-09-20 21:23:14.872407
9148	1	LOGIN_EXITOSO	usuario	1	Inicio de sesión exitoso de 'Alejandro Sistemas' (admin@fashionstore.com) con rol 'Administrador'.	172.20.0.1	2026-09-20 21:23:31.387705
9166	1	LOGIN_EXITOSO	usuario	1	Inicio de sesión exitoso de 'Alejandro Sistemas' (admin@fashionstore.com) con rol 'Administrador'.	192.168.10.101	2026-09-20 21:23:42.430286
9167	1	LOGIN_EXITOSO	usuario	1	Inicio de sesión exitoso de 'Alejandro Sistemas' (admin@fashionstore.com) con rol 'Administrador'.	172.20.0.1	2026-09-20 21:23:42.659701
9168	1	LOGIN_FALLIDO	usuario	1	Intento de inicio de sesión fallido para el correo: admin@fashionstore.com (contraseña incorrecta).	192.168.10.102	2026-09-20 21:23:42.927857
9169	\N	LOGIN_FALLIDO	usuario	\N	Intento de inicio de sesión fallido para el correo: no_existe_qa_999@fashionstore.com (correo no registrado).	192.168.10.103	2026-09-20 21:23:43.19801
9170	1	LOGIN_EXITOSO	usuario	1	Inicio de sesión exitoso de 'Alejandro Sistemas' (admin@fashionstore.com) con rol 'Administrador'.	172.20.0.1	2026-09-20 21:23:43.469577
9172	1	INSERT	usuario	1426	Alta de usuario 'Usuario Cliente QA' (qa_cliente_rbac@fashionstore.com) con rol id=4.	192.168.1.50	2026-09-20 21:23:44.421367
9174	1	INSERT	usuario	1427	Alta de usuario 'Carlos Cajero QA' (qa_nuevo_cajero@fashionstore.com) con rol id=3.	192.168.20.1	2026-09-20 21:23:45.0614
9175	1	UPDATE	usuario	1427	Modificación del usuario 'qa_nuevo_cajero@fashionstore.com'. Campos actualizados: nombre=Carlos Alberto, telefono=71122334.	192.168.20.2	2026-09-20 21:23:45.545491
9176	1	INACTIVAR	usuario	1427	Baja lógica del usuario 'qa_nuevo_cajero@fashionstore.com': estado cambiado de 'Activo' a 'Inactivo'.	192.168.20.3	2026-09-20 21:23:45.750172
9177	1	UPDATE	rol_permiso	3	Se actualizaron los permisos del rol 'Cajero (POS)' (ID: 3). Total asignados: 2.	192.168.1.50	2026-09-20 21:23:46.10678
9178	1	UPDATE	rol_permiso	3	Se actualizaron los permisos del rol 'Cajero (POS)' (ID: 3). Total asignados: 4.	192.168.1.50	2026-09-20 21:23:46.338363
9179	1	UPDATE	rol_permiso	3	Se actualizaron los permisos del rol 'Cajero (POS)' (ID: 3). Total asignados: 0.	192.168.1.50	2026-09-20 21:23:46.42341
9180	1	INSERT	usuario	1428	Alta de usuario 'Cajero POS QA' (qa_cajero_rbac@fashionstore.com) con rol id=3.	192.168.1.50	2026-09-20 21:23:46.683139
9182	1	UPDATE	rol_permiso	3	Se actualizaron los permisos del rol 'Cajero (POS)' (ID: 3). Total asignados: 5.	192.168.1.50	2026-09-20 21:23:47.268744
9183	1	UPDATE	rol_permiso	3	Se actualizaron los permisos del rol 'Cajero (POS)' (ID: 3). Total asignados: 4.	192.168.1.50	2026-09-20 21:23:47.374742
9184	1	INSERT	usuario	1429	Alta de usuario 'Cajero POS QA' (qa_cajero_rbac@fashionstore.com) con rol id=3.	192.168.1.50	2026-09-20 21:23:47.499222
9186	1	UPDATE	rol_permiso	3	Se actualizaron los permisos del rol 'Cajero (POS)' (ID: 3). Total asignados: 5.	192.168.1.50	2026-09-20 21:23:48.119529
9187	1	INSERT	usuario	1430	Alta de usuario 'Carlos Recuperador' (qa_recovery_user@fashionstore.com) con rol id=4.	192.168.1.50	2026-09-20 21:23:48.291639
9189	1	INSERT	usuario	1431	Alta de usuario 'Carlos Recuperador' (qa_recovery_user@fashionstore.com) con rol id=4.	192.168.1.50	2026-09-20 21:23:48.677294
9192	1	INSERT	usuario	1432	Alta de usuario 'Carlos Recuperador' (qa_recovery_user@fashionstore.com) con rol id=4.	192.168.1.50	2026-09-20 21:23:49.048888
9194	1	INSERT	usuario	1433	Alta de usuario 'Carlos Recuperador' (qa_recovery_user@fashionstore.com) con rol id=4.	192.168.1.50	2026-09-20 21:23:49.41693
9199	1	INSERT	usuario	1434	Alta de usuario 'Carlos Recuperador' (qa_recovery_user@fashionstore.com) con rol id=4.	192.168.1.50	2026-09-20 21:23:50.597106
9201	1	INSERT	usuario	1435	Alta de usuario 'Carlos Recuperador' (qa_recovery_user@fashionstore.com) con rol id=4.	192.168.1.50	2026-09-20 21:23:50.972078
9202	1	INSERT	usuario	1436	Alta de usuario 'Carlos Recuperador' (qa_recovery_user@fashionstore.com) con rol id=4.	192.168.1.50	2026-09-20 21:23:51.301046
9205	1	INSERT	usuario	1437	Alta de usuario 'Carlos Recuperador' (qa_recovery_user@fashionstore.com) con rol id=4.	192.168.1.50	2026-09-20 21:23:51.92883
9206	1	INSERT	usuario	1438	Alta de usuario 'Inactivo QA' (qa_user_inactivo_recovery@fashionstore.com) con rol id=4.	192.168.1.50	2026-09-20 21:23:52.405103
9207	1	INSERT	usuario	1439	Alta de usuario 'Carlos Recuperador' (qa_recovery_user@fashionstore.com) con rol id=4.	192.168.1.50	2026-09-20 21:23:52.71972
9209	1	INSERT	usuario	1440	Alta de usuario 'Carlos Recuperador' (qa_recovery_user@fashionstore.com) con rol id=4.	192.168.1.50	2026-09-20 21:23:53.142811
9214	1	INSERT	usuario	1441	Alta de usuario 'Carlos Recuperador' (qa_recovery_user@fashionstore.com) con rol id=4.	192.168.1.50	2026-09-20 21:23:54.304099
9218	1	INSERT	cliente	74	Alta del cliente 'Lucía Morales Paz' (CI 88997711).	192.168.40.1	2026-09-20 21:23:55.402595
9219	1	UPDATE	cliente	74	Modificación del cliente CI 88997711. Campos: nombre_completo=Lucía Morales de Mendoza, telefono=78999999.	192.168.40.2	2026-09-20 21:23:55.714295
9220	1	INACTIVAR	cliente	74	Baja lógica del cliente 'Lucía Morales de Mendoza' (CI 88997711).	192.168.40.3	2026-09-20 21:23:55.76701
9221	1	INSERT	ciudad	211	Alta de la ciudad 'Tarija QA'.	192.168.30.1	2026-09-20 21:23:55.969935
9222	1	INSERT	sucursal	150	Alta de la sucursal 'Sucursal Tarija Centro QA' en la ciudad id=211.	192.168.30.2	2026-09-20 21:23:56.23832
9223	1	UPDATE	sucursal	150	Modificación de la sucursal 'Sucursal Tarija Centro QA'. Campos: direccion=Calle Sucre #789 (Modificado), telefono=66449988.	192.168.30.3	2026-09-20 21:23:56.389721
9224	1	INSERT	categoria	167	Alta de la categoría 'Deportes QA'.	192.168.50.1	2026-09-20 21:23:56.549173
9225	1	INSERT	categoria	168	Alta de la categoría 'Calzado Deportivo QA'.	192.168.1.50	2026-09-20 21:23:56.598998
9226	1	UPDATE	categoria	167	Modificación de la categoría 'Deportes QA'. Campos: descripcion=Ropa de running y fitness.	192.168.50.2	2026-09-20 21:23:56.797037
9227	1	INACTIVAR	categoria	168	Baja lógica de la categoría 'Calzado Deportivo QA' (0 prenda(s) asociadas).	192.168.50.3	2026-09-20 21:23:56.897425
9228	1	INACTIVAR	categoria	167	Baja lógica de la categoría 'Deportes QA' (0 prenda(s) asociadas).	192.168.50.3	2026-09-20 21:23:56.947446
9426	\N	IA_TRYON	prenda	3	Vestidor Virtual IA (opencv_fallback, 18.45ms) para prenda ID 3.	172.20.0.1	2026-09-20 21:25:09.531391
9427	\N	IA_TRYON	prenda	3	Vestidor Virtual IA (opencv_fallback, 16.08ms) para prenda ID 3.	172.20.0.1	2026-09-20 21:25:09.556269
9428	\N	IA_TRYON	prenda	3	Vestidor Virtual IA (opencv_fallback, 15.53ms) para prenda ID 3.	172.20.0.1	2026-09-20 21:25:09.577603
9429	\N	IA_TRYON	prenda	3	Vestidor Virtual IA (opencv_fallback, 22.01ms) para prenda ID 3.	172.20.0.1	2026-09-20 21:25:09.608271
9430	\N	IA_TRYON	prenda	3	Vestidor Virtual IA (opencv_fallback, 25.41ms) para prenda ID 3.	172.20.0.1	2026-09-20 21:25:09.64647
9431	\N	IA_TRYON	prenda	3	Vestidor Virtual IA (opencv_fallback, 26.76ms) para prenda ID 3.	172.20.0.1	2026-09-20 21:25:09.658695
9432	\N	IA_TRYON	prenda	3	Vestidor Virtual IA (opencv_fallback, 53.97ms) para prenda ID 3.	172.20.0.1	2026-09-20 21:25:09.674198
9433	\N	IA_TRYON	prenda	3	Vestidor Virtual IA (opencv_fallback, 67.54ms) para prenda ID 3.	172.20.0.1	2026-09-20 21:25:09.68861
9434	\N	IA_TRYON	prenda	3	Vestidor Virtual IA (opencv_fallback, 82.83ms) para prenda ID 3.	172.20.0.1	2026-09-20 21:25:09.697325
9435	\N	IA_TRYON	prenda	3	Vestidor Virtual IA (opencv_fallback, 80.2ms) para prenda ID 3.	172.20.0.1	2026-09-20 21:25:09.70637
9436	\N	IA_TRYON	prenda	\N	Vestidor Virtual IA (opencv_fallback, 10.04ms) para prenda externa personalizada.	172.20.0.1	2026-09-20 21:25:09.857712
9437	\N	IA_TRYON	prenda	\N	Vestidor Virtual IA (opencv_fallback, 12.47ms) para prenda externa personalizada.	172.20.0.1	2026-09-20 21:25:09.884086
9438	\N	IA_TRYON	prenda	3	Vestidor Virtual IA (opencv_fallback, 20.55ms) para prenda ID 3.	172.20.0.1	2026-09-20 21:25:10.055027
9439	\N	IA_TRYON	prenda	\N	Vestidor Virtual IA (opencv_fallback, 20.9ms) para prenda externa personalizada.	172.20.0.1	2026-09-20 21:25:10.11332
9276	1	IA_RECOMENDACION	inventario	180	Recomendación IA (Fallback Catálogo): 3 prendas sugeridas para estilo 'Formal' y ocasión 'Trabajo'.	192.168.1.50	2026-09-20 21:24:05.186291
9277	1	IA_RECOMENDACION	inventario	180	Recomendación IA (Fallback Catálogo): 2 prendas sugeridas para estilo 'Deportivo' y ocasión 'General'.	192.168.1.50	2026-09-20 21:24:05.63268
9278	1	IA_RECOMENDACION	inventario	180	Recomendación IA (Fallback Catálogo): 5 prendas sugeridas para estilo 'Urbano' y ocasión 'General'.	192.168.1.50	2026-09-20 21:24:06.299248
9279	1	IA_RECOMENDACION	inventario	180	Recomendación IA (Fallback Catálogo): 6 prendas sugeridas para estilo 'Elegante' y ocasión 'Cena'.	10.0.0.77	2026-09-20 21:24:06.549408
9280	1	IA_ANALITICA_VOZ	inventario	\N	Analítica por voz CU23: 'Cuántas prendas tenemos en stock en todas las sucursales' -> Métrica 'inventario_stock', Resultados=4, PDF=False.	192.168.1.50	2026-09-20 21:24:07.275856
9282	1	IA_ANALITICA_VOZ	venta	\N	Analítica por voz CU23: 'Generar reporte ejecutivo de ventas globales del mes' -> Métrica 'ventas_total', Resultados=2, PDF=True.	192.168.1.50	2026-09-20 21:24:08.225092
9283	1	IA_ANALITICA_VOZ	inventario	\N	Analítica por voz CU23: 'Reporte de existencias para auditoria' -> Métrica 'inventario_stock', Resultados=4, PDF=False.	172.16.5.99	2026-09-20 21:24:08.448977
9284	1	INSERT	ciudad	212	Alta de la ciudad 'Pando QA IP Test'.	200.87.100.45	2026-09-20 21:24:09.196759
9285	\N	LOGIN_FALLIDO	usuario	\N	Intento de inicio de sesión fallido para el correo: no_existe_seguro@fashionstore.com (correo no registrado).	192.168.99.99	2026-09-20 21:24:09.458998
9286	1	UPDATE	rol_permiso	3	Se actualizaron los permisos del rol 'Cajero (POS)' (ID: 3). Total asignados: 3.	198.51.100.22	2026-09-20 21:24:09.723215
9287	1	INSERT	usuario	1442	Alta de usuario 'Audit CU04' (qa_bitacora_cu04@fashionstore.com) con rol id=4.	192.168.1.50	2026-09-20 21:24:10.098017
9292	1	LOGIN_EXITOSO	usuario	1	Inicio de sesión exitoso de 'Alejandro Sistemas' (admin@fashionstore.com) con rol 'Administrador'.	192.168.10.101	2026-09-20 21:24:32.541829
9293	1	LOGIN_EXITOSO	usuario	1	Inicio de sesión exitoso de 'Alejandro Sistemas' (admin@fashionstore.com) con rol 'Administrador'.	172.20.0.1	2026-09-20 21:24:32.772281
9294	1	LOGIN_FALLIDO	usuario	1	Intento de inicio de sesión fallido para el correo: admin@fashionstore.com (contraseña incorrecta).	192.168.10.102	2026-09-20 21:24:33.037895
9295	\N	LOGIN_FALLIDO	usuario	\N	Intento de inicio de sesión fallido para el correo: no_existe_qa_999@fashionstore.com (correo no registrado).	192.168.10.103	2026-09-20 21:24:33.302099
9296	1	LOGIN_EXITOSO	usuario	1	Inicio de sesión exitoso de 'Alejandro Sistemas' (admin@fashionstore.com) con rol 'Administrador'.	172.20.0.1	2026-09-20 21:24:33.564816
9298	1	INSERT	usuario	1444	Alta de usuario 'Usuario Cliente QA' (qa_cliente_rbac@fashionstore.com) con rol id=4.	192.168.1.50	2026-09-20 21:24:34.497527
9300	1	INSERT	usuario	1445	Alta de usuario 'Carlos Cajero QA' (qa_nuevo_cajero@fashionstore.com) con rol id=3.	192.168.20.1	2026-09-20 21:24:35.113818
9301	1	UPDATE	usuario	1445	Modificación del usuario 'qa_nuevo_cajero@fashionstore.com'. Campos actualizados: nombre=Carlos Alberto, telefono=71122334.	192.168.20.2	2026-09-20 21:24:35.576948
9302	1	INACTIVAR	usuario	1445	Baja lógica del usuario 'qa_nuevo_cajero@fashionstore.com': estado cambiado de 'Activo' a 'Inactivo'.	192.168.20.3	2026-09-20 21:24:35.778132
9303	1	UPDATE	rol_permiso	3	Se actualizaron los permisos del rol 'Cajero (POS)' (ID: 3). Total asignados: 2.	192.168.1.50	2026-09-20 21:24:36.130343
9304	1	UPDATE	rol_permiso	3	Se actualizaron los permisos del rol 'Cajero (POS)' (ID: 3). Total asignados: 4.	192.168.1.50	2026-09-20 21:24:36.365047
9305	1	UPDATE	rol_permiso	3	Se actualizaron los permisos del rol 'Cajero (POS)' (ID: 3). Total asignados: 0.	192.168.1.50	2026-09-20 21:24:36.435797
9306	1	INSERT	usuario	1446	Alta de usuario 'Cajero POS QA' (qa_cajero_rbac@fashionstore.com) con rol id=3.	192.168.1.50	2026-09-20 21:24:36.693771
9308	1	UPDATE	rol_permiso	3	Se actualizaron los permisos del rol 'Cajero (POS)' (ID: 3). Total asignados: 5.	192.168.1.50	2026-09-20 21:24:37.26456
9309	1	UPDATE	rol_permiso	3	Se actualizaron los permisos del rol 'Cajero (POS)' (ID: 3). Total asignados: 4.	192.168.1.50	2026-09-20 21:24:37.371035
9310	1	INSERT	usuario	1447	Alta de usuario 'Cajero POS QA' (qa_cajero_rbac@fashionstore.com) con rol id=3.	192.168.1.50	2026-09-20 21:24:37.499317
9312	1	UPDATE	rol_permiso	3	Se actualizaron los permisos del rol 'Cajero (POS)' (ID: 3). Total asignados: 5.	192.168.1.50	2026-09-20 21:24:38.128326
9313	1	INSERT	usuario	1448	Alta de usuario 'Carlos Recuperador' (qa_recovery_user@fashionstore.com) con rol id=4.	192.168.1.50	2026-09-20 21:24:38.301283
9315	1	INSERT	usuario	1449	Alta de usuario 'Carlos Recuperador' (qa_recovery_user@fashionstore.com) con rol id=4.	192.168.1.50	2026-09-20 21:24:38.677769
9318	1	INSERT	usuario	1450	Alta de usuario 'Carlos Recuperador' (qa_recovery_user@fashionstore.com) con rol id=4.	192.168.1.50	2026-09-20 21:24:39.059367
9320	1	INSERT	usuario	1451	Alta de usuario 'Carlos Recuperador' (qa_recovery_user@fashionstore.com) con rol id=4.	192.168.1.50	2026-09-20 21:24:39.432917
9325	1	INSERT	usuario	1452	Alta de usuario 'Carlos Recuperador' (qa_recovery_user@fashionstore.com) con rol id=4.	192.168.1.50	2026-09-20 21:24:40.620263
9327	1	INSERT	usuario	1453	Alta de usuario 'Carlos Recuperador' (qa_recovery_user@fashionstore.com) con rol id=4.	192.168.1.50	2026-09-20 21:24:40.992662
9328	1	INSERT	usuario	1454	Alta de usuario 'Carlos Recuperador' (qa_recovery_user@fashionstore.com) con rol id=4.	192.168.1.50	2026-09-20 21:24:41.315282
9331	1	INSERT	usuario	1455	Alta de usuario 'Carlos Recuperador' (qa_recovery_user@fashionstore.com) con rol id=4.	192.168.1.50	2026-09-20 21:24:41.952528
9332	1	INSERT	usuario	1456	Alta de usuario 'Inactivo QA' (qa_user_inactivo_recovery@fashionstore.com) con rol id=4.	192.168.1.50	2026-09-20 21:24:42.423373
9333	1	INSERT	usuario	1457	Alta de usuario 'Carlos Recuperador' (qa_recovery_user@fashionstore.com) con rol id=4.	192.168.1.50	2026-09-20 21:24:42.746504
9335	1	INSERT	usuario	1458	Alta de usuario 'Carlos Recuperador' (qa_recovery_user@fashionstore.com) con rol id=4.	192.168.1.50	2026-09-20 21:24:43.168333
9340	1	INSERT	usuario	1459	Alta de usuario 'Carlos Recuperador' (qa_recovery_user@fashionstore.com) con rol id=4.	192.168.1.50	2026-09-20 21:24:44.333342
9344	1	INSERT	cliente	75	Alta del cliente 'Lucía Morales Paz' (CI 88997711).	192.168.40.1	2026-09-20 21:24:45.423446
9345	1	UPDATE	cliente	75	Modificación del cliente CI 88997711. Campos: nombre_completo=Lucía Morales de Mendoza, telefono=78999999.	192.168.40.2	2026-09-20 21:24:45.714839
9346	1	INACTIVAR	cliente	75	Baja lógica del cliente 'Lucía Morales de Mendoza' (CI 88997711).	192.168.40.3	2026-09-20 21:24:45.766863
9347	1	INSERT	ciudad	213	Alta de la ciudad 'Tarija QA'.	192.168.30.1	2026-09-20 21:24:45.960812
9348	1	INSERT	sucursal	152	Alta de la sucursal 'Sucursal Tarija Centro QA' en la ciudad id=213.	192.168.30.2	2026-09-20 21:24:46.219627
9349	1	UPDATE	sucursal	152	Modificación de la sucursal 'Sucursal Tarija Centro QA'. Campos: direccion=Calle Sucre #789 (Modificado), telefono=66449988.	192.168.30.3	2026-09-20 21:24:46.375297
9350	1	INSERT	categoria	169	Alta de la categoría 'Deportes QA'.	192.168.50.1	2026-09-20 21:24:46.534568
9351	1	INSERT	categoria	170	Alta de la categoría 'Calzado Deportivo QA'.	192.168.1.50	2026-09-20 21:24:46.588388
9352	1	UPDATE	categoria	169	Modificación de la categoría 'Deportes QA'. Campos: descripcion=Ropa de running y fitness.	192.168.50.2	2026-09-20 21:24:46.787135
9353	1	INACTIVAR	categoria	170	Baja lógica de la categoría 'Calzado Deportivo QA' (0 prenda(s) asociadas).	192.168.50.3	2026-09-20 21:24:46.891294
9354	1	INACTIVAR	categoria	169	Baja lógica de la categoría 'Deportes QA' (0 prenda(s) asociadas).	192.168.50.3	2026-09-20 21:24:46.9401
9402	1	IA_RECOMENDACION	inventario	180	Recomendación IA (Fallback Catálogo): 3 prendas sugeridas para estilo 'Formal' y ocasión 'Trabajo'.	192.168.1.50	2026-09-20 21:24:55.222599
9403	1	IA_RECOMENDACION	inventario	180	Recomendación IA (Fallback Catálogo): 2 prendas sugeridas para estilo 'Deportivo' y ocasión 'General'.	192.168.1.50	2026-09-20 21:24:55.644944
9404	1	IA_RECOMENDACION	inventario	180	Recomendación IA (Fallback Catálogo): 5 prendas sugeridas para estilo 'Urbano' y ocasión 'General'.	192.168.1.50	2026-09-20 21:24:56.312665
9405	1	IA_RECOMENDACION	inventario	180	Recomendación IA (Fallback Catálogo): 6 prendas sugeridas para estilo 'Elegante' y ocasión 'Cena'.	10.0.0.77	2026-09-20 21:24:56.558828
9406	1	IA_ANALITICA_VOZ	inventario	\N	Analítica por voz CU23: 'Cuántas prendas tenemos en stock en todas las sucursales' -> Métrica 'inventario_stock', Resultados=4, PDF=False.	192.168.1.50	2026-09-20 21:24:57.292214
9408	1	IA_ANALITICA_VOZ	venta	\N	Analítica por voz CU23: 'Generar reporte ejecutivo de ventas globales del mes' -> Métrica 'ventas_total', Resultados=2, PDF=True.	192.168.1.50	2026-09-20 21:24:58.238874
9409	1	IA_ANALITICA_VOZ	inventario	\N	Analítica por voz CU23: 'Reporte de existencias para auditoria' -> Métrica 'inventario_stock', Resultados=4, PDF=False.	172.16.5.99	2026-09-20 21:24:58.49068
9410	1	INSERT	ciudad	214	Alta de la ciudad 'Pando QA IP Test'.	200.87.100.45	2026-09-20 21:24:59.261276
9411	\N	LOGIN_FALLIDO	usuario	\N	Intento de inicio de sesión fallido para el correo: no_existe_seguro@fashionstore.com (correo no registrado).	192.168.99.99	2026-09-20 21:24:59.527928
9412	1	UPDATE	rol_permiso	3	Se actualizaron los permisos del rol 'Cajero (POS)' (ID: 3). Total asignados: 3.	198.51.100.22	2026-09-20 21:24:59.804512
9413	1	INSERT	usuario	1460	Alta de usuario 'Audit CU04' (qa_bitacora_cu04@fashionstore.com) con rol id=4.	192.168.1.50	2026-09-20 21:25:00.17437
9416	\N	IA_TRYON	prenda	3	Vestidor Virtual IA (opencv_fallback, 248.77ms) para prenda ID 3.	172.20.0.1	2026-09-20 21:25:08.67773
9417	\N	IA_TRYON	prenda	3	Vestidor Virtual IA (opencv_fallback, 138.48ms) para prenda ID 3.	172.20.0.1	2026-09-20 21:25:08.970032
9418	\N	IA_TRYON	prenda	\N	Vestidor Virtual IA (opencv_fallback, 10.69ms) para prenda externa personalizada.	172.20.0.1	2026-09-20 21:25:09.300003
9419	\N	IA_TRYON	prenda	\N	Vestidor Virtual IA (opencv_fallback, 10.85ms) para prenda externa personalizada.	172.20.0.1	2026-09-20 21:25:09.326978
9420	\N	IA_TRYON	prenda	3	Vestidor Virtual IA (opencv_fallback, 20.46ms) para prenda ID 3.	172.20.0.1	2026-09-20 21:25:09.339128
9421	\N	IA_TRYON	prenda	3	Vestidor Virtual IA (opencv_fallback, 38.17ms) para prenda ID 3.	172.20.0.1	2026-09-20 21:25:09.366848
9422	\N	IA_TRYON	prenda	3	Vestidor Virtual IA (opencv_fallback, 16.24ms) para prenda ID 3.	172.20.0.1	2026-09-20 21:25:09.408246
9423	\N	IA_TRYON	prenda	3	Vestidor Virtual IA (opencv_fallback, 23.11ms) para prenda ID 3.	172.20.0.1	2026-09-20 21:25:09.441569
9424	\N	IA_TRYON	prenda	3	Vestidor Virtual IA (opencv_fallback, 17.99ms) para prenda ID 3.	172.20.0.1	2026-09-20 21:25:09.471705
9425	\N	IA_TRYON	prenda	3	Vestidor Virtual IA (opencv_fallback, 18.56ms) para prenda ID 3.	172.20.0.1	2026-09-20 21:25:09.496933
9440	1	IA_TRYON	prenda	\N	Vestidor Virtual IA (opencv_fallback, 13.78ms) para prenda externa personalizada.	192.168.42.100	2026-09-20 21:25:10.12968
9441	\N	IA_TRYON	prenda	\N	Vestidor Virtual IA (opencv_fallback, 8.75ms) para prenda externa personalizada.	200.10.20.30	2026-09-20 21:25:10.370567
9442	1	IA_TRYON	prenda	\N	Vestidor Virtual IA (gemini_multimodal_tryon, 14.41ms) para prenda externa personalizada.	192.168.10.77	2026-09-20 21:25:12.474605
9443	1	IA_TRYON	prenda	\N	Vestidor Virtual IA (opencv_fallback, 14.96ms) para prenda externa personalizada.	192.168.10.88	2026-09-20 21:25:12.714224
9444	\N	IA_TRYON	prenda	\N	Vestidor Virtual IA (opencv_fallback, 3495.83ms) para prenda externa personalizada.	172.20.0.1	2026-09-20 21:25:16.733895
9445	\N	IA_TRYON	prenda	3	Vestidor Virtual IA (opencv_fallback, 18.91ms) para prenda ID 3.	172.20.0.1	2026-09-20 21:25:19.459851
9448	1	LOGIN_EXITOSO	usuario	1	Inicio de sesión exitoso de 'Alejandro Sistemas' (admin@fashionstore.com) con rol 'Administrador'.	192.168.10.101	2026-09-20 21:25:42.161981
9449	1	LOGIN_EXITOSO	usuario	1	Inicio de sesión exitoso de 'Alejandro Sistemas' (admin@fashionstore.com) con rol 'Administrador'.	172.20.0.1	2026-09-20 21:25:42.398673
9450	1	LOGIN_FALLIDO	usuario	1	Intento de inicio de sesión fallido para el correo: admin@fashionstore.com (contraseña incorrecta).	192.168.10.102	2026-09-20 21:25:42.658551
9451	\N	LOGIN_FALLIDO	usuario	\N	Intento de inicio de sesión fallido para el correo: no_existe_qa_999@fashionstore.com (correo no registrado).	192.168.10.103	2026-09-20 21:25:42.923697
9452	1	LOGIN_EXITOSO	usuario	1	Inicio de sesión exitoso de 'Alejandro Sistemas' (admin@fashionstore.com) con rol 'Administrador'.	172.20.0.1	2026-09-20 21:25:43.183051
9454	1	INSERT	usuario	1462	Alta de usuario 'Usuario Cliente QA' (qa_cliente_rbac@fashionstore.com) con rol id=4.	192.168.1.50	2026-09-20 21:25:44.127398
9456	1	INSERT	usuario	1463	Alta de usuario 'Carlos Cajero QA' (qa_nuevo_cajero@fashionstore.com) con rol id=3.	192.168.20.1	2026-09-20 21:25:44.750956
9457	1	UPDATE	usuario	1463	Modificación del usuario 'qa_nuevo_cajero@fashionstore.com'. Campos actualizados: nombre=Carlos Alberto, telefono=71122334.	192.168.20.2	2026-09-20 21:25:45.207202
9458	1	INACTIVAR	usuario	1463	Baja lógica del usuario 'qa_nuevo_cajero@fashionstore.com': estado cambiado de 'Activo' a 'Inactivo'.	192.168.20.3	2026-09-20 21:25:45.406381
9459	1	UPDATE	rol_permiso	3	Se actualizaron los permisos del rol 'Cajero (POS)' (ID: 3). Total asignados: 2.	192.168.1.50	2026-09-20 21:25:45.761578
9460	1	UPDATE	rol_permiso	3	Se actualizaron los permisos del rol 'Cajero (POS)' (ID: 3). Total asignados: 4.	192.168.1.50	2026-09-20 21:25:45.978623
9461	1	UPDATE	rol_permiso	3	Se actualizaron los permisos del rol 'Cajero (POS)' (ID: 3). Total asignados: 0.	192.168.1.50	2026-09-20 21:25:46.047495
9462	1	INSERT	usuario	1464	Alta de usuario 'Cajero POS QA' (qa_cajero_rbac@fashionstore.com) con rol id=3.	192.168.1.50	2026-09-20 21:25:46.307751
9464	1	UPDATE	rol_permiso	3	Se actualizaron los permisos del rol 'Cajero (POS)' (ID: 3). Total asignados: 5.	192.168.1.50	2026-09-20 21:25:46.894861
9465	1	UPDATE	rol_permiso	3	Se actualizaron los permisos del rol 'Cajero (POS)' (ID: 3). Total asignados: 4.	192.168.1.50	2026-09-20 21:25:47.001645
9466	1	INSERT	usuario	1465	Alta de usuario 'Cajero POS QA' (qa_cajero_rbac@fashionstore.com) con rol id=3.	192.168.1.50	2026-09-20 21:25:47.129547
9468	1	UPDATE	rol_permiso	3	Se actualizaron los permisos del rol 'Cajero (POS)' (ID: 3). Total asignados: 5.	192.168.1.50	2026-09-20 21:25:47.758478
9469	1	INSERT	usuario	1466	Alta de usuario 'Carlos Recuperador' (qa_recovery_user@fashionstore.com) con rol id=4.	192.168.1.50	2026-09-20 21:25:47.931036
9471	1	INSERT	usuario	1467	Alta de usuario 'Carlos Recuperador' (qa_recovery_user@fashionstore.com) con rol id=4.	192.168.1.50	2026-09-20 21:25:48.315641
9474	1	INSERT	usuario	1468	Alta de usuario 'Carlos Recuperador' (qa_recovery_user@fashionstore.com) con rol id=4.	192.168.1.50	2026-09-20 21:25:48.694413
9476	1	INSERT	usuario	1469	Alta de usuario 'Carlos Recuperador' (qa_recovery_user@fashionstore.com) con rol id=4.	192.168.1.50	2026-09-20 21:25:49.065994
9481	1	INSERT	usuario	1470	Alta de usuario 'Carlos Recuperador' (qa_recovery_user@fashionstore.com) con rol id=4.	192.168.1.50	2026-09-20 21:25:50.258705
9483	1	INSERT	usuario	1471	Alta de usuario 'Carlos Recuperador' (qa_recovery_user@fashionstore.com) con rol id=4.	192.168.1.50	2026-09-20 21:25:50.641952
9484	1	INSERT	usuario	1472	Alta de usuario 'Carlos Recuperador' (qa_recovery_user@fashionstore.com) con rol id=4.	192.168.1.50	2026-09-20 21:25:50.963456
9487	1	INSERT	usuario	1473	Alta de usuario 'Carlos Recuperador' (qa_recovery_user@fashionstore.com) con rol id=4.	192.168.1.50	2026-09-20 21:25:51.596768
9488	1	INSERT	usuario	1474	Alta de usuario 'Inactivo QA' (qa_user_inactivo_recovery@fashionstore.com) con rol id=4.	192.168.1.50	2026-09-20 21:25:52.071292
9489	1	INSERT	usuario	1475	Alta de usuario 'Carlos Recuperador' (qa_recovery_user@fashionstore.com) con rol id=4.	192.168.1.50	2026-09-20 21:25:52.391633
9491	1	INSERT	usuario	1476	Alta de usuario 'Carlos Recuperador' (qa_recovery_user@fashionstore.com) con rol id=4.	192.168.1.50	2026-09-20 21:25:52.813315
9496	1	INSERT	usuario	1477	Alta de usuario 'Carlos Recuperador' (qa_recovery_user@fashionstore.com) con rol id=4.	192.168.1.50	2026-09-20 21:25:54.007953
9500	1	INSERT	cliente	76	Alta del cliente 'Lucía Morales Paz' (CI 88997711).	192.168.40.1	2026-09-20 21:25:55.130748
9501	1	UPDATE	cliente	76	Modificación del cliente CI 88997711. Campos: nombre_completo=Lucía Morales de Mendoza, telefono=78999999.	192.168.40.2	2026-09-20 21:25:55.438711
9502	1	INACTIVAR	cliente	76	Baja lógica del cliente 'Lucía Morales de Mendoza' (CI 88997711).	192.168.40.3	2026-09-20 21:25:55.492
9503	1	INSERT	ciudad	215	Alta de la ciudad 'Tarija QA'.	192.168.30.1	2026-09-20 21:25:55.692839
9504	1	INSERT	sucursal	154	Alta de la sucursal 'Sucursal Tarija Centro QA' en la ciudad id=215.	192.168.30.2	2026-09-20 21:25:55.938313
9505	1	UPDATE	sucursal	154	Modificación de la sucursal 'Sucursal Tarija Centro QA'. Campos: direccion=Calle Sucre #789 (Modificado), telefono=66449988.	192.168.30.3	2026-09-20 21:25:56.087113
9506	1	INSERT	categoria	171	Alta de la categoría 'Deportes QA'.	192.168.50.1	2026-09-20 21:25:56.243613
9507	1	INSERT	categoria	172	Alta de la categoría 'Calzado Deportivo QA'.	192.168.1.50	2026-09-20 21:25:56.296967
9508	1	UPDATE	categoria	171	Modificación de la categoría 'Deportes QA'. Campos: descripcion=Ropa de running y fitness.	192.168.50.2	2026-09-20 21:25:56.493681
9509	1	INACTIVAR	categoria	172	Baja lógica de la categoría 'Calzado Deportivo QA' (0 prenda(s) asociadas).	192.168.50.3	2026-09-20 21:25:56.613472
9510	1	INACTIVAR	categoria	171	Baja lógica de la categoría 'Deportes QA' (0 prenda(s) asociadas).	192.168.50.3	2026-09-20 21:25:56.660571
9558	1	IA_RECOMENDACION	inventario	180	Recomendación IA (Fallback Catálogo): 3 prendas sugeridas para estilo 'Formal' y ocasión 'Trabajo'.	192.168.1.50	2026-09-20 21:26:04.848328
9559	1	IA_RECOMENDACION	inventario	180	Recomendación IA (Fallback Catálogo): 2 prendas sugeridas para estilo 'Deportivo' y ocasión 'General'.	192.168.1.50	2026-09-20 21:26:05.267023
9560	1	IA_RECOMENDACION	inventario	180	Recomendación IA (Fallback Catálogo): 5 prendas sugeridas para estilo 'Urbano' y ocasión 'General'.	192.168.1.50	2026-09-20 21:26:05.945184
9561	1	IA_RECOMENDACION	inventario	180	Recomendación IA (Fallback Catálogo): 6 prendas sugeridas para estilo 'Elegante' y ocasión 'Cena'.	10.0.0.77	2026-09-20 21:26:06.194976
9562	1	IA_ANALITICA_VOZ	inventario	\N	Analítica por voz CU23: 'Cuántas prendas tenemos en stock en todas las sucursales' -> Métrica 'inventario_stock', Resultados=4, PDF=False.	192.168.1.50	2026-09-20 21:26:06.916193
9564	1	IA_ANALITICA_VOZ	venta	\N	Analítica por voz CU23: 'Generar reporte ejecutivo de ventas globales del mes' -> Métrica 'ventas_total', Resultados=2, PDF=True.	192.168.1.50	2026-09-20 21:26:07.863493
9565	1	IA_ANALITICA_VOZ	inventario	\N	Analítica por voz CU23: 'Reporte de existencias para auditoria' -> Métrica 'inventario_stock', Resultados=4, PDF=False.	172.16.5.99	2026-09-20 21:26:08.08793
9566	1	INSERT	ciudad	216	Alta de la ciudad 'Pando QA IP Test'.	200.87.100.45	2026-09-20 21:26:08.786553
9567	\N	LOGIN_FALLIDO	usuario	\N	Intento de inicio de sesión fallido para el correo: no_existe_seguro@fashionstore.com (correo no registrado).	192.168.99.99	2026-09-20 21:26:09.04937
9568	1	UPDATE	rol_permiso	3	Se actualizaron los permisos del rol 'Cajero (POS)' (ID: 3). Total asignados: 3.	198.51.100.22	2026-09-20 21:26:09.316989
9569	1	INSERT	usuario	1478	Alta de usuario 'Audit CU04' (qa_bitacora_cu04@fashionstore.com) con rol id=4.	192.168.1.50	2026-09-20 21:26:09.690787
9572	\N	IA_TRYON	prenda	3	Vestidor Virtual IA (opencv_fallback, 137.79ms) para prenda ID 3.	172.20.0.1	2026-09-20 21:26:17.994171
9573	\N	IA_TRYON	prenda	3	Vestidor Virtual IA (opencv_fallback, 170.9ms) para prenda ID 3.	172.20.0.1	2026-09-20 21:26:18.241636
9574	\N	IA_TRYON	prenda	\N	Vestidor Virtual IA (opencv_fallback, 11.32ms) para prenda externa personalizada.	172.20.0.1	2026-09-20 21:26:18.574973
9575	\N	IA_TRYON	prenda	\N	Vestidor Virtual IA (opencv_fallback, 10.97ms) para prenda externa personalizada.	172.20.0.1	2026-09-20 21:26:18.601401
9576	\N	IA_TRYON	prenda	3	Vestidor Virtual IA (opencv_fallback, 21.89ms) para prenda ID 3.	172.20.0.1	2026-09-20 21:26:18.614292
9577	\N	IA_TRYON	prenda	3	Vestidor Virtual IA (opencv_fallback, 18.31ms) para prenda ID 3.	172.20.0.1	2026-09-20 21:26:18.650356
9578	\N	IA_TRYON	prenda	3	Vestidor Virtual IA (opencv_fallback, 15.91ms) para prenda ID 3.	172.20.0.1	2026-09-20 21:26:18.675306
9602	\N	UPDATE	prenda	265	Se modificó la prenda. SKU anterior: QA-POLO-ATOMIC-001 -> SKU nuevo: QA-POLO-ATOMIC-001	\N	2026-09-20 21:26:37.961279
9603	\N	DELETE	prenda	265	Se eliminó la prenda con SKU: QA-POLO-ATOMIC-001	\N	2026-09-20 21:26:37.964699
9579	\N	IA_TRYON	prenda	3	Vestidor Virtual IA (opencv_fallback, 20.46ms) para prenda ID 3.	172.20.0.1	2026-09-20 21:26:18.706117
9581	\N	IA_TRYON	prenda	3	Vestidor Virtual IA (opencv_fallback, 17.31ms) para prenda ID 3.	172.20.0.1	2026-09-20 21:26:18.753629
9580	\N	IA_TRYON	prenda	3	Vestidor Virtual IA (opencv_fallback, 15.26ms) para prenda ID 3.	172.20.0.1	2026-09-20 21:26:18.733174
9582	\N	IA_TRYON	prenda	3	Vestidor Virtual IA (opencv_fallback, 16.76ms) para prenda ID 3.	172.20.0.1	2026-09-20 21:26:18.777135
9583	\N	IA_TRYON	prenda	3	Vestidor Virtual IA (opencv_fallback, 23.9ms) para prenda ID 3.	172.20.0.1	2026-09-20 21:26:18.807802
9584	\N	IA_TRYON	prenda	3	Vestidor Virtual IA (opencv_fallback, 15.57ms) para prenda ID 3.	172.20.0.1	2026-09-20 21:26:18.838166
9585	\N	IA_TRYON	prenda	3	Vestidor Virtual IA (opencv_fallback, 16.36ms) para prenda ID 3.	172.20.0.1	2026-09-20 21:26:18.858906
9586	\N	IA_TRYON	prenda	3	Vestidor Virtual IA (opencv_fallback, 22.9ms) para prenda ID 3.	172.20.0.1	2026-09-20 21:26:18.893074
9587	\N	IA_TRYON	prenda	3	Vestidor Virtual IA (opencv_fallback, 28.0ms) para prenda ID 3.	172.20.0.1	2026-09-20 21:26:18.902904
9588	\N	IA_TRYON	prenda	3	Vestidor Virtual IA (opencv_fallback, 27.33ms) para prenda ID 3.	172.20.0.1	2026-09-20 21:26:18.914282
9589	\N	IA_TRYON	prenda	3	Vestidor Virtual IA (opencv_fallback, 34.49ms) para prenda ID 3.	172.20.0.1	2026-09-20 21:26:18.930231
9590	\N	IA_TRYON	prenda	3	Vestidor Virtual IA (opencv_fallback, 32.25ms) para prenda ID 3.	172.20.0.1	2026-09-20 21:26:18.944569
9591	\N	IA_TRYON	prenda	3	Vestidor Virtual IA (opencv_fallback, 26.83ms) para prenda ID 3.	172.20.0.1	2026-09-20 21:26:18.956718
9592	\N	IA_TRYON	prenda	\N	Vestidor Virtual IA (opencv_fallback, 10.34ms) para prenda externa personalizada.	172.20.0.1	2026-09-20 21:26:19.053844
9593	\N	IA_TRYON	prenda	\N	Vestidor Virtual IA (opencv_fallback, 13.41ms) para prenda externa personalizada.	172.20.0.1	2026-09-20 21:26:19.081194
9594	\N	IA_TRYON	prenda	3	Vestidor Virtual IA (opencv_fallback, 21.29ms) para prenda ID 3.	172.20.0.1	2026-09-20 21:26:19.246229
9595	\N	IA_TRYON	prenda	\N	Vestidor Virtual IA (opencv_fallback, 10.12ms) para prenda externa personalizada.	172.20.0.1	2026-09-20 21:26:19.289674
9596	1	IA_TRYON	prenda	\N	Vestidor Virtual IA (opencv_fallback, 11.62ms) para prenda externa personalizada.	192.168.42.100	2026-09-20 21:26:19.30257
9597	\N	IA_TRYON	prenda	\N	Vestidor Virtual IA (opencv_fallback, 8.84ms) para prenda externa personalizada.	200.10.20.30	2026-09-20 21:26:19.535803
9598	1	IA_TRYON	prenda	\N	Vestidor Virtual IA (gemini_multimodal_tryon, 15.06ms) para prenda externa personalizada.	192.168.10.77	2026-09-20 21:26:21.711691
9599	1	IA_TRYON	prenda	\N	Vestidor Virtual IA (opencv_fallback, 14.24ms) para prenda externa personalizada.	192.168.10.88	2026-09-20 21:26:21.95266
9600	\N	IA_TRYON	prenda	\N	Vestidor Virtual IA (opencv_fallback, 3429.48ms) para prenda externa personalizada.	172.20.0.1	2026-09-20 21:26:25.915118
9601	\N	IA_TRYON	prenda	3	Vestidor Virtual IA (opencv_fallback, 15.03ms) para prenda ID 3.	172.20.0.1	2026-09-20 21:26:28.570661
9604	1	IA_TRYON	prenda	176	Vestidor Virtual IA (opencv_fallback, 6205.49ms) para prenda ID 176.	172.20.0.1	2026-09-20 21:36:04.611304
9605	1	IA_TRYON	prenda	176	Vestidor Virtual IA (opencv_fallback, 4707.32ms) para prenda ID 176.	172.20.0.1	2026-09-20 21:39:38.998047
9606	1	IA_TRYON	prenda	176	Vestidor Virtual IA (opencv_fallback, 4669.07ms) para prenda ID 176.	172.20.0.1	2026-09-20 21:41:26.824868
9607	1	IA_TRYON	prenda	172	Vestidor Virtual IA (opencv_fallback, 6042.65ms) para prenda ID 172.	172.20.0.1	2026-09-20 21:56:52.609659
9608	1	IA_TRYON	prenda	172	Vestidor Virtual IA (fashn_vton_ai, 32167.21ms) para prenda ID 172.	172.20.0.1	2026-09-20 22:00:54.417691
9609	\N	LOGIN_FALLIDO	usuario	\N	Intento de inicio de sesión fallido para el correo: mateo.suarez@example.com (correo no registrado).	172.20.0.1	2026-09-20 22:27:28.731779
9610	\N	LOGIN_FALLIDO	usuario	\N	Intento de inicio de sesión fallido para el correo: mateo.suarez@example.com (correo no registrado).	172.20.0.1	2026-09-20 22:27:35.168262
9611	1479	INSERT	cliente	77	Auto-registro de nuevo cliente: MATEO SUAREZ (mateo.suarez@example.com) con CI 4325234	172.20.0.1	2026-09-20 22:28:27.045497
9612	1479	IA_TRYON	prenda	179	Vestidor Virtual IA (fashn_vton_ai, 35659.68ms) para prenda ID 179.	172.20.0.1	2026-09-21 02:03:42.307019
9613	1479	LOGIN_EXITOSO	usuario	1479	Inicio de sesión exitoso de 'MATEO SUAREZ' (mateo.suarez@example.com) con rol 'Cliente'.	172.20.0.1	2026-09-21 02:27:54.844574
9614	1	LOGIN_EXITOSO	usuario	1	Inicio de sesión exitoso de 'Alejandro Sistemas' (admin@fashionstore.com) con rol 'Administrador'.	2800:cd0:5426:5800:34da:77ab:3e99:35a9	2026-09-21 03:26:24.390642
9615	1	LOGIN_EXITOSO	usuario	1	Inicio de sesión exitoso de 'Alejandro Sistemas' (admin@fashionstore.com) con rol 'Administrador'.	2800:cd0:5426:5800:34da:77ab:3e99:35a9	2026-09-21 03:26:32.618233
9616	1	LOGIN_FALLIDO	usuario	1	Intento de inicio de sesión fallido para el correo: admin@fashionstore.com (contraseña incorrecta).	192.168.1.6	2026-09-21 03:32:24.856938
9617	1	LOGIN_EXITOSO	usuario	1	Inicio de sesión exitoso de 'Alejandro Sistemas' (admin@fashionstore.com) con rol 'Administrador'.	192.168.1.6	2026-09-21 03:33:03.526284
9618	1	LOGIN_FALLIDO	usuario	1	Intento de inicio de sesión fallido para el correo: admin@fashionstore.com (contraseña incorrecta).	2800:cd0:5422:d500:e9dc:a1a7:ca9b:c56e	2026-09-21 16:38:02.81808
9619	1	LOGIN_EXITOSO	usuario	1	Inicio de sesión exitoso de 'Alejandro Sistemas' (admin@fashionstore.com) con rol 'Administrador'.	2800:cd0:5422:d500:e9dc:a1a7:ca9b:c56e	2026-09-21 16:38:38.430822
9620	1479	LOGIN_EXITOSO	usuario	1479	Inicio de sesión exitoso de 'MATEO SUAREZ' (mateo.suarez@example.com) con rol 'Cliente'.	2800:cd0:5422:d500:b5b4:33ce:df77:65a	2026-09-22 03:26:00.78515
9621	1479	INSERT	reserva	1	Reserva #1 creada por cliente 77 en sucursal 1 por Bs 520.00. 1 ítem(s). Válida hasta 2026-09-23 03:26.	2800:cd0:5422:d500:b5b4:33ce:df77:65a	2026-09-22 03:26:06.598455
9622	1479	INSERT	pago_transaccion	1	Sesión Stripe creada para reserva #1. Monto: Bs 520.00.	2800:cd0:5422:d500:b5b4:33ce:df77:65a	2026-09-22 03:42:41.724273
9625	\N	INSERT	venta	5	Venta online #5 confirmada desde reserva #1. Cliente: 77. Método pago: Tarjeta. Total: Bs 520.00 (1 ítems).	2800:cd0:5422:d500:b5b4:33ce:df77:65a	2026-09-22 03:51:17.429039
9626	\N	INSERT	comprobante	3	Comprobante FS-2026-000002 generado para venta #5. Razón: Mateo Suarez.	2800:cd0:5422:d500:b5b4:33ce:df77:65a	2026-09-22 03:51:17.429039
9627	1479	INSERT	reserva	2	Reserva #2 creada por cliente 77 en sucursal 1 por Bs 520.00. 1 ítem(s). Válida hasta 2026-09-23 04:13.	2800:cd0:5422:d500:b5b4:33ce:df77:65a	2026-09-22 04:13:25.164084
9628	1479	INSERT	pago_transaccion	2	Sesión Stripe creada para reserva #2. Monto: Bs 520.00.	2800:cd0:5422:d500:b5b4:33ce:df77:65a	2026-09-22 04:13:29.351409
9629	1479	INSERT	reserva	3	Reserva #3 creada por cliente 77 en sucursal 1 por Bs 520.00. 1 ítem(s). Válida hasta 2026-09-23 04:33.	2800:cd0:5422:d500:b5b4:33ce:df77:65a	2026-09-22 04:33:08.372012
9630	1479	INSERT	pago_transaccion	3	Sesión Stripe creada para reserva #3. Monto: Bs 520.00.	2800:cd0:5422:d500:b5b4:33ce:df77:65a	2026-09-22 04:33:12.466387
9631	1479	INSERT	reserva	4	Reserva #4 creada por cliente 77 en sucursal 1 por Bs 95.00. 1 ítem(s). Válida hasta 2026-09-23 04:40.	2800:cd0:5422:d500:b5b4:33ce:df77:65a	2026-09-22 04:40:14.092663
9632	1479	INSERT	pago_transaccion	4	Sesión Stripe creada para reserva #4. Monto: Bs 95.00.	2800:cd0:5422:d500:b5b4:33ce:df77:65a	2026-09-22 04:40:17.846374
9633	\N	INSERT	venta	6	Venta online #6 confirmada desde reserva #4. Cliente: 77. Método pago: Tarjeta. Total: Bs 95.00 (1 ítems).	54.187.216.72	2026-09-22 04:40:29.992935
9634	\N	INSERT	comprobante	4	Comprobante FS-2026-000003 generado para venta #6. Razón: Mateo Suarez.	54.187.216.72	2026-09-22 04:40:29.992935
9635	1479	IA_RECOMENDACION	inventario	180	Recomendación IA (Fallback Catálogo): 8 prendas sugeridas para estilo 'Formal' y ocasión 'Deporte'.	2800:cd0:5422:d500:b5b4:33ce:df77:65a	2026-09-22 04:41:33.917868
9636	1479	IA_RECOMENDACION	inventario	180	Recomendación IA (Fallback Catálogo): 8 prendas sugeridas para estilo 'Formal' y ocasión 'Deporte'.	2800:cd0:5422:d500:b5b4:33ce:df77:65a	2026-09-22 04:41:43.298973
9637	1479	IA_RECOMENDACION	inventario	175	Recomendación IA (Gemini 2.5 Flash): 5 prendas sugeridas para estilo 'Formal' y ocasión 'Deporte'.	2800:cd0:5422:d500:b5b4:33ce:df77:65a	2026-09-22 04:48:59.247836
9638	1	LOGIN_FALLIDO	usuario	1	Intento de inicio de sesión fallido para el correo: admin@fashionstore.com (contraseña incorrecta).	2800:cd0:5422:d500:b5b4:33ce:df77:65a	2026-09-22 04:49:58.964693
9639	1	LOGIN_EXITOSO	usuario	1	Inicio de sesión exitoso de 'Alejandro Sistemas' (admin@fashionstore.com) con rol 'Administrador'.	2800:cd0:5422:d500:b5b4:33ce:df77:65a	2026-09-22 04:50:18.192001
9640	1	IA_ANALITICA_VOZ	venta	\N	Analítica por voz CU23: 'Total de ventas de la sucursal central en verano, 2026.' -> Métrica 'ventas_total', Resultados=0, PDF=False.	2800:cd0:5422:d500:b5b4:33ce:df77:65a	2026-09-22 04:51:21.697494
9641	1	IA_TRYON	prenda	172	Vestidor Virtual IA (replicate_idm_vton, 23656.51ms) para prenda ID 172.	2800:cd0:5422:d500:b5b4:33ce:df77:65a	2026-09-22 04:54:50.141533
9642	1	INSERT	reserva	5	Reserva para probador #5 (TKT-000005) creada por cliente 1 ('María René Ortiz') en sucursal 2 ('Sucursal Centro'). 1 prendas separadas. Vigencia: 24 horas.	2800:cd0:5422:d500:b5b4:33ce:df77:65a	2026-09-22 04:55:47.35671
9643	1480	LOGIN_EXITOSO	usuario	1480	Inicio de sesión exitoso de 'Roberto Carlos Flores Mendizábal' (roberto.flores@fashionstore.com) con rol 'Encargado de Sucursal'.	127.0.0.1	2026-09-22 05:03:55.750907
9644	1481	LOGIN_EXITOSO	usuario	1481	Inicio de sesión exitoso de 'Valeria Morales Justiniano' (valeria.morales@fashionstore.com) con rol 'Encargado de Sucursal'.	127.0.0.1	2026-09-22 05:03:56.245029
9645	1482	LOGIN_EXITOSO	usuario	1482	Inicio de sesión exitoso de 'Carlos Fernando Gutierrez Paz' (carlos.gutierrez@fashionstore.com) con rol 'Encargado de Sucursal'.	127.0.0.1	2026-09-22 05:03:56.662533
9646	3	LOGIN_EXITOSO	usuario	3	Inicio de sesión exitoso de 'Camila Rojas' (camila.rojas@fashionstore.com) con rol 'Cajero (POS)'.	127.0.0.1	2026-09-22 05:03:57.067934
9647	1483	LOGIN_EXITOSO	usuario	1483	Inicio de sesión exitoso de 'Lucía Méndez Aguilera' (lucia.mendez@fashionstore.com) con rol 'Cajero (POS)'.	127.0.0.1	2026-09-22 05:03:57.472326
9648	1484	LOGIN_EXITOSO	usuario	1484	Inicio de sesión exitoso de 'Rodrigo Benítez Choque' (rodrigo.benitez@fashionstore.com) con rol 'Cajero (POS)'.	127.0.0.1	2026-09-22 05:03:57.903055
9649	1485	LOGIN_EXITOSO	usuario	1485	Inicio de sesión exitoso de 'Sofía Mariana Antelo Vaca' (sofia.antelo@gmail.com) con rol 'Cliente'.	127.0.0.1	2026-09-22 05:03:58.308679
9650	1486	LOGIN_EXITOSO	usuario	1486	Inicio de sesión exitoso de 'Sebastián Farfán Ríos' (sebastian.farfan@gmail.com) con rol 'Cliente'.	127.0.0.1	2026-09-22 05:03:58.738814
9651	1487	LOGIN_EXITOSO	usuario	1487	Inicio de sesión exitoso de 'Andrea Belén Quiroga Pinto' (andrea.quiroga@gmail.com) con rol 'Cliente'.	127.0.0.1	2026-09-22 05:03:59.165978
9652	1480	LOGIN_EXITOSO	usuario	1480	Inicio de sesión exitoso de 'Roberto Carlos Flores Mendizábal' (roberto.flores@fashionstore.com) con rol 'Encargado de Sucursal'.	127.0.0.1	2026-09-22 05:04:21.578501
9653	1484	LOGIN_EXITOSO	usuario	1484	Inicio de sesión exitoso de 'Rodrigo Benítez Choque' (rodrigo.benitez@fashionstore.com) con rol 'Cajero (POS)'.	2800:cd0:5422:d500:b5b4:33ce:df77:65a	2026-09-22 05:08:58.366308
9654	1485	LOGIN_EXITOSO	usuario	1485	Inicio de sesión exitoso de 'Sofía Mariana Antelo Vaca' (sofia.antelo@gmail.com) con rol 'Cliente'.	2800:cd0:5422:d500:8aae:1dff:fecd:5628	2026-09-22 05:13:43.634925
9655	\N	INSERT	venta	7	Venta online #7 confirmada desde reserva #2. Cliente: 77. Método pago: Tarjeta. Total: Bs 520.00 (1 ítems).	54.187.216.72	2026-09-22 05:13:49.281703
9656	\N	INSERT	comprobante	5	Comprobante FS-2026-000004 generado para venta #7. Razón: Mateo Suarez.	54.187.216.72	2026-09-22 05:13:49.281703
9657	1485	LOGIN_EXITOSO	usuario	1485	Inicio de sesión exitoso de 'Sofía Mariana Antelo Vaca' (sofia.antelo@gmail.com) con rol 'Cliente'.	2800:cd0:5422:d500:8aae:1dff:fecd:5628	2026-09-22 05:14:32.936826
9658	1485	LOGIN_EXITOSO	usuario	1485	Inicio de sesión exitoso de 'Sofía Mariana Antelo Vaca' (sofia.antelo@gmail.com) con rol 'Cliente'.	2800:cd0:5422:d500:8aae:1dff:fecd:5628	2026-09-22 05:15:12.424231
9659	1485	INSERT	reserva	6	Reserva #6 creada por cliente 78 en sucursal 1 por Bs 520.00. 1 ítem(s). Válida hasta 2026-09-23 05:15.	2800:cd0:5422:d500:8aae:1dff:fecd:5628	2026-09-22 05:15:14.261283
9660	1485	INSERT	pago_transaccion	6	Sesión Stripe creada para reserva #6. Monto: Bs 520.00.	2800:cd0:5422:d500:8aae:1dff:fecd:5628	2026-09-22 05:15:14.609637
9661	1479	LOGIN_EXITOSO	usuario	1479	Inicio de sesión exitoso de 'MATEO SUAREZ' (mateo.suarez@example.com) con rol 'Cliente'.	2800:cd0:5422:d500:d1af:c084:a390:bd6	2026-09-22 05:20:50.045988
9662	1479	IA_RECOMENDACION	inventario	188	Recomendación IA (Gemini 2.5 Flash): 6 prendas sugeridas para estilo 'Deportivo' y ocasión 'Salida informal'.	166.114.171.96	2026-09-22 05:21:29.683179
9663	\N	INSERT	venta	8	Venta online #8 confirmada desde reserva #3. Cliente: 77. Método pago: Tarjeta. Total: Bs 520.00 (1 ítems).	54.187.174.169	2026-09-22 05:32:40.983045
9664	\N	INSERT	comprobante	6	Comprobante FS-2026-000005 generado para venta #8. Razón: Mateo Suarez.	54.187.174.169	2026-09-22 05:32:40.983045
9665	1479	LOGIN_EXITOSO	usuario	1479	Inicio de sesión exitoso de 'MATEO SUAREZ' (mateo.suarez@example.com) con rol 'Cliente'.	2800:cd0:5422:d500:d1af:c084:a390:bd6	2026-09-22 05:33:20.558943
9666	1479	INSERT	reserva	7	Reserva #7 creada por cliente 77 en sucursal 1 por Bs 520.00. 1 ítem(s). Válida hasta 2026-09-23 05:33.	166.114.171.96	2026-09-22 05:33:37.854815
9667	1479	INSERT	reserva	8	Reserva #8 creada por cliente 77 en sucursal 1 por Bs 520.00. 1 ítem(s). Válida hasta 2026-09-23 05:33.	166.114.171.96	2026-09-22 05:33:43.254353
9668	1479	LOGIN_EXITOSO	usuario	1479	Inicio de sesión exitoso de 'MATEO SUAREZ' (mateo.suarez@example.com) con rol 'Cliente'.	166.114.171.96	2026-09-22 05:41:55.010337
9669	1479	INSERT	reserva	9	Reserva #9 creada por cliente 77 en sucursal 1 por Bs 520.00. 1 ítem(s). Válida hasta 2026-09-23 05:42.	166.114.171.96	2026-09-22 05:42:05.383029
9670	1479	INSERT	pago_transaccion	9	Sesión Stripe creada para reserva #9. Monto: Bs 520.00.	166.114.171.96	2026-09-22 05:42:05.731404
9671	\N	INSERT	venta	9	Venta online #9 confirmada desde reserva #9. Cliente: 77. Método pago: Tarjeta. Total: Bs 520.00 (1 ítems).	54.187.205.235	2026-09-22 05:42:42.73809
9672	\N	INSERT	comprobante	7	Comprobante FS-2026-000006 generado para venta #9. Razón: MATEO SUAREZ.	54.187.205.235	2026-09-22 05:42:42.73809
9673	1479	LOGIN_EXITOSO	usuario	1479	Inicio de sesión exitoso de 'MATEO SUAREZ' (mateo.suarez@example.com) con rol 'Cliente'.	2800:cd0:5422:d500:d1af:c084:a390:bd6	2026-09-22 05:43:12.835357
9674	1479	INSERT	reserva	10	Reserva #10 creada por cliente 77 en sucursal 1 por Bs 520.00. 1 ítem(s). Válida hasta 2026-09-23 05:44.	2800:cd0:5422:d500:d1af:c084:a390:bd6	2026-09-22 05:44:26.709937
9675	1479	INSERT	pago_transaccion	10	Sesión Stripe creada para reserva #10. Monto: Bs 520.00.	2800:cd0:5422:d500:d1af:c084:a390:bd6	2026-09-22 05:44:39.826001
9676	\N	INSERT	venta	10	Venta online #10 confirmada desde reserva #10. Cliente: 77. Método pago: Tarjeta. Total: Bs 520.00 (1 ítems).	54.187.174.169	2026-09-22 05:45:18.093601
9677	\N	INSERT	comprobante	8	Comprobante FS-2026-000007 generado para venta #10. Razón: Mateo.	54.187.174.169	2026-09-22 05:45:18.093601
9678	1479	INSERT	reserva	11	Reserva #11 creada por cliente 77 en sucursal 1 por Bs 175.00. 1 ítem(s). Válida hasta 2026-09-23 05:45.	166.114.171.96	2026-09-22 05:45:36.354182
9679	1479	INSERT	pago_transaccion	11	QR boliviano generado para reserva #11. Ref: FS-4CW298JV3. Monto: Bs 175.00.	166.114.171.96	2026-09-22 05:45:36.672384
9680	1479	INSERT	venta	11	Venta online #11 confirmada desde reserva #11. Cliente: 77. Método pago: QR. Total: Bs 175.00 (1 ítems).	166.114.171.96	2026-09-22 05:45:41.038411
9681	1479	INSERT	comprobante	9	Comprobante FS-2026-000008 generado para venta #11. Razón: MATEO SUAREZ.	166.114.171.96	2026-09-22 05:45:41.309585
9682	\N	INSERT	prenda	269	Se registró una nueva prenda con SKU: 3D-HOODIE-001, Nombre: Hoodie Urbano V2 (Rigged 3D)	\N	2026-09-22 06:01:35.221364
9683	\N	INSERT	prenda	270	Se registró una nueva prenda con SKU: 3D-MONA-002, Nombre: Camiseta Monalisa Streetwear 3D	\N	2026-09-22 06:01:35.221364
9684	\N	INSERT	prenda	271	Se registró una nueva prenda con SKU: 3D-COMBAT-003, Nombre: Combat Shirt Táctica (Rigged Metahuman)	\N	2026-09-22 06:01:35.221364
9685	\N	INSERT	prenda	272	Se registró una nueva prenda con SKU: 3D-SCOTT-004, Nombre: Camisa a Cuadros Scott (Rigged)	\N	2026-09-22 06:01:35.221364
\.


--
-- Data for Name: categoria; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.categoria (id_categoria, nombre, descripcion, id_categoria_padre, estado) FROM stdin;
7	Calzado E2E 1788649379	Categoria de prueba E2E	\N	Activo
1	Damas	Prendas exclusivas y moda femenina	\N	Activo
2	Caballeros	Moda masculina ejecutiva, casual y urbana	\N	Activo
3	Blusas	Blusas formales, de seda, lino y tops elegantes	1	Activo
4	Camisas	Camisas de vestir, slim fit, casuales y lino	2	Activo
5	Jeans	Pantalones denim, cortes straight, slim y wide leg	1	Activo
6	Chaquetas	Casacas de cuero, denim, blazers y abrigos	1	Activo
129	Vestidos	Vestidos de gala, cocktail, midi y casuales	\N	Activo
130	Poleras & Remeras	Remeras de algodon pima, estampadas y basicas	\N	Activo
131	Abrigos & Sweaters	Sueteres tejidos, hoodies y abrigos pesados	\N	Activo
132	Pantalones & Chinos	Pantalones de vestir, sastreros y chinos	\N	Activo
133	Calzados	Sneakers urbanos, zapatillas running y calzado casual	\N	Activo
\.


--
-- Data for Name: ciudad; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.ciudad (id_ciudad, nombre) FROM stdin;
1	Santa Cruz de la Sierra
2	La Paz
3	Cochabamba
4	Tarija
\.


--
-- Data for Name: cliente; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.cliente (id_cliente, ci, nombre_completo, telefono, correo, direccion_envio, estado, created_at, updated_at) FROM stdin;
1	9876543	María René Ortiz	78911223	maria@gmail.com	Avenida Bush, Condominio El Prado, Dpto 4B	Activo	2026-09-05 05:46:31.923288	2026-09-05 05:46:31.923288
2	7654321	Jorge Melgar Vaca	70099999	jorge.melgar@gmail.com	Av. Banzer km 6	Activo	2026-09-05 21:30:33.909434	2026-09-05 21:30:34.934446
3	1122334	Cliente de Mostrador	\N	\N	\N	Activo	2026-09-05 21:32:42.144345	2026-09-05 21:32:42.144345
61	9123847	Camila Suárez Peña	77390123	camila.suarez@gmail.com	Barrio Sirari, Calle Los Claveles #120, Santa Cruz	Activo	2026-09-19 21:25:53.169801	2026-09-19 21:25:53.169801
62	8934120	Mateo Villagómez Arce	+591 76098765	mateo.villagomez@gmail.com	Av. Monseñor Rivero #320, Dpto 4B, Santa Cruz	Activo	2026-09-19 21:35:38.38968	2026-09-19 21:35:38.38968
77	4325234	MATEO SUAREZ	+59174895968	mateo.suarez@example.com	\N	Activo	2026-09-20 22:28:27.045497	2026-09-20 22:28:27.045497
78	8492015	Sofía Mariana Antelo Vaca	78012345	sofia.antelo@gmail.com	Av. Busch, Condominio Sevilla Los Jardines #14, Santa Cruz	Activo	2026-09-22 05:02:51.897323	2026-09-22 05:02:51.897323
79	7129845	Sebastián Farfán Ríos	72987654	sebastian.farfan@gmail.com	Barrio El Tejar, Calle Sucre #450, Tarija	Activo	2026-09-22 05:02:51.897323	2026-09-22 05:02:51.897323
80	6834190	Andrea Belén Quiroga Pinto	77234567	andrea.quiroga@gmail.com	Calacoto, Calle 15 #820, La Paz	Activo	2026-09-22 05:02:51.897323	2026-09-22 05:02:51.897323
\.


--
-- Data for Name: color; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.color (id_color, nombre, codigo_hex) FROM stdin;
1	Negro	#000000
2	Blanco	#FFFFFF
3	Azul Denim	#4682B4
4	Rojo Borgoña	#800020
13	Camel	#C19A6B
14	Verde Oliva	#556B2F
15	Gris Melange	#808080
16	Azul Marino	#000080
\.


--
-- Data for Name: compra; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.compra (id_compra, id_proveedor, id_sucursal, fecha, total, id_usuario) FROM stdin;
95	120	1	2026-09-13 10:45:07.856432	2090.50	1
96	121	2	2026-09-13 10:45:07.954525	1310.80	1
\.


--
-- Data for Name: comprobante; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.comprobante (id_comprobante, id_venta, numero_comprobante, nit_ci, razon_social, fecha_emision, url_pdf) FROM stdin;
1	2	FS-2026-000001	1122334	Cliente Mostrador Test	2026-09-20 04:32:55.285105	http://localhost:8000/static/comprobantes/FS-2026-000001.pdf
3	5	FS-2026-000002	7567567564	Mateo Suarez	2026-09-22 03:51:17.429039	https://fashionstore.aledevcv.me/static/comprobantes/FS-2026-000002.pdf
4	6	FS-2026-000003	7567567564	Mateo Suarez	2026-09-22 04:40:29.992935	https://fashionstore.aledevcv.me/static/comprobantes/FS-2026-000003.pdf
5	7	FS-2026-000004	7567567564	Mateo Suarez	2026-09-22 05:13:49.281703	https://fashionstore.aledevcv.me/static/comprobantes/FS-2026-000004.pdf
6	8	FS-2026-000005	7567567564	Mateo Suarez	2026-09-22 05:32:40.983045	https://fashionstore.aledevcv.me/static/comprobantes/FS-2026-000005.pdf
7	9	FS-2026-000006	4325234	MATEO SUAREZ	2026-09-22 05:42:42.73809	https://fashionstore.aledevcv.me/static/comprobantes/FS-2026-000006.pdf
8	10	FS-2026-000007	585969	Mateo	2026-09-22 05:45:18.093601	https://fashionstore.aledevcv.me/static/comprobantes/FS-2026-000007.pdf
9	11	FS-2026-000008	4325234	MATEO SUAREZ	2026-09-22 05:45:41.309585	https://fashionstore.aledevcv.me/static/comprobantes/FS-2026-000008.pdf
\.


--
-- Data for Name: detalle_compra; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.detalle_compra (id_compra, id_variante_prenda, cantidad, costo_unitario) FROM stdin;
95	4	10	120.00
95	5	5	130.00
96	6	8	145.00
\.


--
-- Data for Name: detalle_reserva; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.detalle_reserva (id_reserva, id_variante_prenda, cantidad, precio_unitario) FROM stdin;
1	348	1	520.00
2	348	1	520.00
3	348	1	520.00
4	377	1	95.00
5	283	1	389.00
6	348	1	520.00
7	351	1	520.00
8	351	1	520.00
9	348	1	520.00
10	348	1	520.00
11	306	1	175.00
\.


--
-- Data for Name: detalle_venta; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.detalle_venta (id_venta, id_variante_prenda, cantidad, precio_unitario, subtotal) FROM stdin;
2	6	1	369.90	369.90
3	6	1	369.90	369.90
5	348	1	520.00	520.00
6	377	1	95.00	95.00
7	348	1	520.00	520.00
8	348	1	520.00	520.00
9	348	1	520.00	520.00
10	348	1	520.00	520.00
11	306	1	175.00	175.00
\.


--
-- Data for Name: imagen_prenda; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.imagen_prenda (id_imagen, id_prenda, url_imagen, es_principal, created_at) FROM stdin;
311	3	https://pngimg.com/uploads/leather_jacket/leather_jacket_PNG51.png	t	2026-09-20 10:25:02.183521
312	4	https://pngimg.com/uploads/running_shoes/running_shoes_PNG5821.png	t	2026-09-20 10:25:02.183521
313	171	https://pngimg.com/uploads/jacket/jacket_PNG8056.png	t	2026-09-20 10:25:02.183521
314	172	https://pngimg.com/uploads/jacket/jacket_PNG8059.png	t	2026-09-20 10:25:02.183521
315	173	https://pngimg.com/uploads/dress_shirt/dress_shirt_PNG8110.png	t	2026-09-20 10:25:02.183521
316	174	https://pngimg.com/uploads/dress_shirt/dress_shirt_PNG8112.png	t	2026-09-20 10:25:02.183521
317	175	https://pngimg.com/uploads/polo_shirt/polo_shirt_PNG8165.png	t	2026-09-20 10:25:02.183521
318	176	https://pngimg.com/uploads/dress_shirt/dress_shirt_PNG8108.png	t	2026-09-20 10:25:02.183521
319	177	https://pngimg.com/uploads/polo_shirt/polo_shirt_PNG8166.png	t	2026-09-20 10:25:02.183521
320	178	https://pngimg.com/uploads/dress/dress_PNG196.png	t	2026-09-20 10:25:02.183521
321	179	https://pngimg.com/uploads/dress/dress_PNG188.png	t	2026-09-20 10:25:02.183521
322	180	https://pngimg.com/uploads/sweater/sweater_PNG83.png	t	2026-09-20 10:25:02.183521
323	181	https://pngimg.com/uploads/sweater/sweater_PNG80.png	t	2026-09-20 10:25:02.183521
324	182	https://pngimg.com/uploads/coat/coat_PNG72.png	t	2026-09-20 10:25:02.183521
325	183	https://pngimg.com/uploads/jeans/jeans_PNG5771.png	t	2026-09-20 10:25:02.183521
326	184	https://pngimg.com/uploads/jeans/jeans_PNG5776.png	t	2026-09-20 10:25:02.183521
327	185	https://pngimg.com/uploads/jeans/jeans_PNG5778.png	t	2026-09-20 10:25:02.183521
328	186	https://pngimg.com/uploads/tshirt/tshirt_PNG5452.png	t	2026-09-20 10:25:02.183521
329	187	https://pngimg.com/uploads/tshirt/tshirt_PNG5454.png	t	2026-09-20 10:25:02.183521
330	188	https://pngimg.com/uploads/running_shoes/running_shoes_PNG5824.png	t	2026-09-20 10:25:02.183521
373	269	https://images.unsplash.com/photo-1556905055-8f358a7a47b2?w=600&auto=format&fit=crop&q=80	t	2026-09-22 06:01:35.221364
374	270	https://images.unsplash.com/photo-1521572267360-ee0c2909d518?w=600&auto=format&fit=crop&q=80	t	2026-09-22 06:01:35.221364
375	271	https://images.unsplash.com/photo-1578587018452-892bacefd3f2?w=600&auto=format&fit=crop&q=80	t	2026-09-22 06:01:35.221364
376	272	https://images.unsplash.com/photo-1596755094514-f87e34085b2c?w=600&auto=format&fit=crop&q=80	t	2026-09-22 06:01:35.221364
\.


--
-- Data for Name: inventario; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.inventario (id_sucursal, id_variante_prenda, stock) FROM stdin;
3	7	0
1	273	12
2	273	16
1	6	4
2	6	12
2	4	8
3	4	8
2	5	12
3	5	12
3	6	5
1	7	3
2	7	3
1	4	39
3	273	20
1	5	17
1	274	12
2	274	16
3	274	20
1	275	14
2	275	18
3	275	22
1	276	14
2	276	18
3	276	22
1	277	16
2	277	20
3	277	24
1	278	16
2	278	20
3	278	24
1	279	18
2	279	22
3	279	3
1	280	18
2	280	22
3	280	3
1	281	12
2	281	16
3	281	20
1	282	12
2	282	16
3	282	20
1	283	14
3	283	22
1	284	14
2	284	18
3	284	22
1	285	16
2	285	20
3	285	24
1	286	16
2	286	20
3	286	24
1	287	12
2	287	16
3	287	20
1	288	12
2	288	16
3	288	20
1	289	14
2	289	18
3	289	22
1	290	14
2	290	18
3	290	22
1	291	16
2	291	20
3	291	24
1	292	16
2	292	20
3	292	24
1	293	18
2	293	22
3	293	3
1	294	18
2	294	22
3	294	3
1	295	14
2	295	18
3	295	22
1	296	16
2	296	20
3	296	24
1	297	18
2	297	22
3	297	3
1	298	12
2	298	16
3	298	20
1	299	12
2	299	16
3	299	20
1	300	14
2	300	18
3	300	22
1	301	14
2	301	18
3	301	22
1	302	16
2	302	20
3	302	24
1	303	16
2	303	20
3	303	24
1	304	18
2	304	22
3	304	3
1	305	18
2	305	22
3	305	3
2	306	16
3	306	20
1	307	12
2	307	16
3	307	20
1	308	14
2	308	18
3	308	22
1	309	14
2	309	18
3	309	22
1	310	16
2	310	20
3	310	24
1	311	16
2	311	20
3	311	24
1	312	12
2	312	16
3	312	20
1	313	12
2	313	16
3	313	20
1	314	14
2	314	18
3	314	22
1	315	14
2	315	18
3	315	22
1	316	16
2	316	20
3	316	24
1	317	16
2	317	20
3	317	24
1	318	12
2	318	16
3	318	20
1	319	12
2	319	16
3	319	20
1	320	14
2	320	18
3	320	22
1	321	14
2	321	18
3	321	22
1	322	16
2	322	20
3	322	24
1	323	16
2	323	20
3	323	24
1	324	12
2	324	16
3	324	20
1	325	12
2	325	16
3	325	20
1	326	14
2	326	18
3	326	22
1	327	14
2	327	18
3	327	22
1	328	16
2	328	20
3	328	24
1	329	16
2	329	20
3	329	24
1	330	12
2	330	16
3	330	20
1	331	12
2	331	16
3	331	20
1	332	12
2	332	16
3	332	20
1	333	14
2	333	18
3	333	22
1	334	14
2	334	18
3	334	22
1	335	14
2	335	18
3	335	22
1	336	16
2	336	20
3	336	24
1	306	11
1	337	16
2	337	20
3	337	24
1	338	16
2	338	20
3	338	24
1	339	18
2	339	22
3	339	3
1	340	18
2	340	22
3	340	3
1	341	18
2	341	22
3	341	3
1	342	14
2	342	18
3	342	22
1	343	14
2	343	18
3	343	22
1	344	16
2	344	20
3	344	24
1	345	16
2	345	20
3	345	24
1	346	18
2	346	22
3	346	3
1	347	18
2	347	22
3	347	3
2	348	16
3	348	20
1	349	12
2	349	16
3	349	20
1	350	14
2	350	18
3	350	22
1	351	14
2	351	18
3	351	22
1	352	16
2	352	20
3	352	24
1	353	16
2	353	20
3	353	24
1	354	12
2	354	16
3	354	20
1	355	12
2	355	16
3	355	20
1	356	14
2	356	18
3	356	22
1	357	14
2	357	18
3	357	22
1	358	16
2	358	20
3	358	24
1	359	16
2	359	20
3	359	24
1	360	18
2	360	22
3	360	3
1	361	18
2	361	22
3	361	3
1	362	12
2	362	16
3	362	20
1	363	14
2	363	18
3	363	22
1	364	16
2	364	20
3	364	24
1	365	12
2	365	16
3	365	20
1	366	12
2	366	16
3	366	20
1	367	12
2	367	16
3	367	20
1	368	14
2	368	18
3	368	22
1	369	14
2	369	18
3	369	22
1	370	14
2	370	18
3	370	22
1	371	16
2	371	20
3	371	24
1	372	16
2	372	20
3	372	24
1	373	16
2	373	20
3	373	24
1	374	18
2	374	22
3	374	3
1	375	18
2	375	22
3	375	3
1	376	18
2	376	22
3	376	3
2	377	16
3	377	20
1	378	12
2	378	16
3	378	20
1	379	12
2	379	16
3	379	20
1	380	14
2	380	18
3	380	22
1	381	14
2	381	18
3	381	22
1	382	14
2	382	18
3	382	22
1	383	16
2	383	20
3	383	24
1	384	16
2	384	20
3	384	24
1	385	16
2	385	20
3	385	24
1	386	18
2	386	22
3	386	3
1	387	18
2	387	22
3	387	3
1	388	18
2	388	22
3	388	3
1	389	12
2	389	16
3	389	20
1	390	12
2	390	16
3	390	20
1	391	14
2	391	18
3	391	22
1	392	14
2	392	18
3	392	22
1	393	16
2	393	20
3	393	24
1	394	16
2	394	20
3	394	24
1	395	18
2	395	22
3	395	3
1	396	18
2	396	22
3	396	3
1	397	14
2	397	18
3	397	22
1	398	14
2	398	18
3	398	22
1	399	16
2	399	20
3	399	24
1	400	16
2	400	20
3	400	24
1	401	18
2	401	22
3	401	3
1	402	18
2	402	22
3	402	3
1	348	7
1	377	11
2	283	17
1	654	15
2	654	15
3	654	15
1	655	15
2	655	15
3	655	15
1	656	15
2	656	15
3	656	15
1	657	15
2	657	15
3	657	15
1	658	20
2	658	20
3	658	20
1	659	20
2	659	20
3	659	20
1	660	20
2	660	20
3	660	20
1	661	20
2	661	20
3	661	20
1	662	12
2	662	12
3	662	12
1	663	12
2	663	12
3	663	12
1	664	12
2	664	12
3	664	12
1	665	12
2	665	12
3	665	12
1	666	18
2	666	18
3	666	18
1	667	18
2	667	18
3	667	18
1	668	18
2	668	18
3	668	18
1	669	18
2	669	18
3	669	18
\.


--
-- Data for Name: movimiento_inventario; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.movimiento_inventario (id_movimiento, id_sucursal, id_variante_prenda, tipo, cantidad, motivo, id_usuario, fecha) FROM stdin;
203	1	4	Entrada	15	Ingreso de lote por reposición de temporada	1	2026-09-13 10:44:44.370134
204	1	4	Salida	3	Merma por daño menor en exhibición de vitrina	1	2026-09-13 10:44:44.47439
205	1	4	Traspaso	2	Traspaso de stock a Sucursal Equipetrol	1	2026-09-13 10:44:44.566608
705	1	6	Salida	1	Venta presencial POS #2 CU19	1	2026-09-20 04:32:55.285105
706	2	6	Salida	1	Venta presencial POS #3 CU19	1	2026-09-20 04:35:06.480169
909	1	348	Salida	1	Venta online #5 CU15	\N	2026-09-22 03:51:17.429039
910	1	377	Salida	1	Venta online #6 CU15	\N	2026-09-22 04:40:29.992935
911	2	283	Salida	1	Bloqueo temporal por reserva de probador #5 (TKT-000005)	1	2026-09-22 04:55:47.35671
912	1	348	Salida	1	Venta online #7 CU15	\N	2026-09-22 05:13:49.281703
913	1	348	Salida	1	Venta online #8 CU15	\N	2026-09-22 05:32:40.983045
914	1	348	Salida	1	Venta online #9 CU15	\N	2026-09-22 05:42:42.73809
915	1	348	Salida	1	Venta online #10 CU15	\N	2026-09-22 05:45:18.093601
916	1	306	Salida	1	Venta online #11 CU15	1479	2026-09-22 05:45:41.038411
\.


--
-- Data for Name: pago_transaccion; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.pago_transaccion (id_pago, id_venta, pasarela, transaccion_id, monto, estado_pago, payload_respuesta, fecha) FROM stdin;
1	5	Stripe	cs_test_a1rmLgTnzLqcCxdwKS9Ph5gFC2WuzzHcI1GbNocRvSNm9YC4HPcia7XgfV	520.00	Aprobado	{"id_venta": 5, "id_reserva": 1, "session_id": "cs_test_a1rmLgTnzLqcCxdwKS9Ph5gFC2WuzzHcI1GbNocRvSNm9YC4HPcia7XgfV"}	2026-09-22 03:42:41.724273
4	6	Stripe	cs_test_a18hWKujIs4TDkOG4o0CQXDacd0KvbYvCfHiOk1dogAYvQWp1fSDJUjiWc	95.00	Aprobado	{"id_venta": 6, "id_reserva": 4, "session_id": "cs_test_a18hWKujIs4TDkOG4o0CQXDacd0KvbYvCfHiOk1dogAYvQWp1fSDJUjiWc"}	2026-09-22 04:40:17.846374
2	7	Stripe	cs_test_a1hVqNeysPgJ5diPogOBNxa8SYDoY2T4QfNQO3vcHQL04KpRIU3c4dkm7a	520.00	Aprobado	{"id_venta": 7, "id_reserva": 2, "session_id": "cs_test_a1hVqNeysPgJ5diPogOBNxa8SYDoY2T4QfNQO3vcHQL04KpRIU3c4dkm7a"}	2026-09-22 04:13:29.351409
5	\N	Stripe	cs_test_a136T8B0xPwJpcOmSynzlIeu3mGapH8t5xZ05XqibV2kh5e3gpxavEf19M	520.00	Pendiente	{"id_reserva": 6, "session_id": "cs_test_a136T8B0xPwJpcOmSynzlIeu3mGapH8t5xZ05XqibV2kh5e3gpxavEf19M"}	2026-09-22 05:15:14.609637
3	8	Stripe	cs_test_a1S3KXOKBQQS2QR7kQpICO1BhDp7myzc28odHFeL2kDyXwbFFYuqRL8tRo	520.00	Aprobado	{"id_venta": 8, "id_reserva": 3, "session_id": "cs_test_a1S3KXOKBQQS2QR7kQpICO1BhDp7myzc28odHFeL2kDyXwbFFYuqRL8tRo"}	2026-09-22 04:33:12.466387
6	9	Stripe	cs_test_a1RQIB7DO6BKiebng9x7YLYvHJlrmf2D3kP8PCC1tLYZM5C0S6yEoPbBBF	520.00	Aprobado	{"id_venta": 9, "id_reserva": 9, "session_id": "cs_test_a1RQIB7DO6BKiebng9x7YLYvHJlrmf2D3kP8PCC1tLYZM5C0S6yEoPbBBF"}	2026-09-22 05:42:05.731404
7	10	Stripe	cs_test_a1hzVnHTKW8vuDoiGAS4621SQsusuU9Ee5pr111KXL3Bkkva803ako4LeB	520.00	Aprobado	{"id_venta": 10, "id_reserva": 10, "session_id": "cs_test_a1hzVnHTKW8vuDoiGAS4621SQsusuU9Ee5pr111KXL3Bkkva803ako4LeB"}	2026-09-22 05:44:39.826001
8	11	QR Bolivia	FS-4CW298JV3	175.00	Aprobado	{"concepto": "Pedido FashionStore #11", "id_reserva": 11, "referencia": "FS-4CW298JV3"}	2026-09-22 05:45:36.672384
\.


--
-- Data for Name: permiso; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.permiso (id_permiso, nombre, codigo, descripcion, modulo) FROM stdin;
1	Ver Usuarios	usuarios.ver	Permite listar y consultar detalles de usuarios	Usuarios
2	Crear Usuarios	usuarios.crear	Permite registrar nuevas cuentas de usuario	Usuarios
3	Editar Usuarios	usuarios.editar	Permite actualizar datos y estados de usuarios	Usuarios
4	Inactivar Usuarios	usuarios.inactivar	Permite dar de baja lógica a usuarios	Usuarios
5	Ver Roles y Permisos	roles.ver	Permite consultar roles y la matriz de permisos	Roles y Permisos
6	Asignar Permisos a Roles	roles.asignar	Permite modificar los permisos asociados a cada rol	Roles y Permisos
7	Ver Clientes	clientes.ver	Permite listar y consultar fichas de clientes	Clientes
8	Crear Clientes	clientes.crear	Permite registrar nuevos clientes	Clientes
9	Editar Clientes	clientes.editar	Permite actualizar información de clientes	Clientes
10	Inactivar Clientes	clientes.inactivar	Permite dar de baja lógica a clientes	Clientes
11	Ver Geografía	geografia.ver	Permite consultar ciudades y sucursales	Sucursales
12	Gestionar Ciudades	ciudades.gestionar	Permite crear y modificar ciudades	Sucursales
13	Gestionar Sucursales	sucursales.gestionar	Permite crear y actualizar sucursales	Sucursales
14	Ver Categorías	categorias.ver	Permite consultar categorías del catálogo	Catálogo
15	Gestionar Categorías	categorias.gestionar	Permite crear, actualizar y dar baja a categorías	Catálogo
16	Ver Prendas	prendas.ver	Permite listar prendas del catálogo administrativo	Catálogo
17	Gestionar Prendas	prendas.gestionar	Permite crear, modificar y eliminar prendas y variantes	Catálogo
18	Realizar Ventas POS	pos.vender	Permite registrar ventas presenciales en caja física	Ventas/POS
19	Ver Reportes de Ventas	ventas.ver	Permite consultar historial y reportes de ventas	Ventas/POS
20	Ver Bitácora	bitacora.ver	Permite consultar registros inmutables de auditoría del sistema	Auditoría/Bitácora
21	Ver Proveedores	proveedores.ver	Permite consultar el directorio de proveedores	Proveedores
22	Crear Proveedores	proveedores.crear	Permite dar de alta nuevos proveedores	Proveedores
23	Editar Proveedores	proveedores.editar	Permite actualizar datos de proveedores	Proveedores
24	Eliminar Proveedores	proveedores.eliminar	Permite eliminar proveedores sin historial de compras	Proveedores
25	Ver Movimientos Inventario	inventario.movimientos.ver	Permite consultar el kardex y movimientos de existencias	Inventario
26	Registrar Movimientos Inventario	inventario.movimientos.crear	Permite registrar entradas, salidas y traspasos manuales	Inventario
27	Ver Compras	compras.ver	Permite consultar el historial de compras y comprobantes de adquisición	Compras
28	Registrar Compras	compras.crear	Permite registrar adquisiciones de productos	Compras
\.


--
-- Data for Name: prenda; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.prenda (id_prenda, sku, nombre, descripcion, marca, precio_base, id_categoria, id_temporada, estado, created_at, updated_at, genero) FROM stdin;
3	CHQ-CUERO-001	Chaqueta Biker de Cuero Negro	Chaqueta estilo biker confeccionada en cuero vacuno negro genuino con cremalleras metálicas reforzadas, solapas cruzadas y corte ajustado.	Urban Leather Co.	489.00	6	\N	Activo	2026-09-05 21:31:55.700791	2026-09-05 21:31:55.700791	Unisex
4	CALZ-URB-001	Zapatillas Urbanas Running Sport	Calzado deportivo urbano con amortiguación ligera, suela antideslizante y diseño ergonómico transpirable.	Vogue Footwear	319.00	133	\N	Activo	2026-09-05 23:02:59.837562	2026-09-13 19:09:41.556758	Unisex
171	CHQ-DENIM-002	Chaqueta Casual Azul con Cremallera	Chaqueta ligera de corte regular en tono azul con cierre de cremallera frontal, bolsillos laterales y terminaciones elásticas.	Denim Lab	329.00	6	1	Activo	2026-09-20 08:11:37.894841	2026-09-20 08:11:37.894841	Unisex
172	BLZ-EJE-001	Chaqueta Formal Ejecutiva Negra	Chaqueta sastrera ejecutiva en color negro estructurada con solapas clásicas, forro interior satinado y ajuste contemporáneo.	Zara Studio	389.00	6	1	Activo	2026-09-20 08:11:37.894841	2026-09-20 08:11:37.894841	Dama
173	CAM-OXF-001	Camisa Oxford Manga Larga Celeste	Camisa de vestir slim fit en algodón suave color celeste cielo con cuello camisero abotonado y botones perlados.	Nordic Line	189.00	4	1	Activo	2026-09-20 08:11:37.894841	2026-09-20 08:11:37.894841	Caballero
174	CAM-BLA-002	Camisa Formal Blanca Manga Larga	Camisa clásica formal en popelina de algodón blanco puro con cuello reforzado para corbata y puños dobles.	FashionStore Signature	219.00	4	1	Activo	2026-09-20 08:11:37.894841	2026-09-20 08:11:37.894841	Caballero
175	CAM-LEN-003	Polera Polo Clásica Roja	Polera estilo polo en piqué de algodón color rojo intenso con cuello acanalado y tapeta de tres botones.	Urban Outfitter	179.00	4	1	Activo	2026-09-20 08:11:37.894841	2026-09-20 08:11:37.894841	Unisex
176	BLU-FLO-001	Blusa Camisera Rosa Pastel	Blusa femenina de corte estilizado en algodón fino color rosa pastel con botones al tono y cuello refinado.	Atelier Dama	175.00	3	1	Activo	2026-09-20 08:11:37.894841	2026-09-20 08:11:37.894841	Dama
177	BLU-HAL-002	Blusa Polo Piqué Blanca	Blusa tipo polo confeccionada en piqué suave de algodón blanco con corte femenino entallado y cuello abotonado.	Atelier Dama	160.00	3	1	Activo	2026-09-20 08:11:37.894841	2026-09-20 08:11:37.894841	Dama
178	VES-GALA-001	Vestido Elegante de Noche Negro	Vestido de cocktail de corte midi en tono negro satinado con silueta estilizada y diseño refinado para ocasiones formales.	Vogue Evening	449.00	129	1	Activo	2026-09-20 08:11:37.894841	2026-09-20 08:11:37.894841	Dama
179	VES-MIDI-002	Vestido Cocktail Rojo Pasión	Vestido de fiesta en tono rojo carmesí con escote en V y falda con caída natural para celebraciones.	Vogue Evening	269.00	129	1	Activo	2026-09-20 08:11:37.894841	2026-09-20 08:11:37.894841	Dama
180	SWT-HOD-001	Suéter Tejido Urbano Marrón	Suéter abrigado tejido en punto fino de color marrón avellana con cuello redondo acanalado y calce confortable.	Urban Outfitter	249.00	131	1	Activo	2026-09-20 08:11:37.894841	2026-09-20 08:11:37.894841	Unisex
181	SWT-TOR-002	Suéter Tejido de Lana Gris	Suéter clásico de cuello redondo confeccionado en mezcla de lana gris con puños y pretina reforzados.	Nordic Line	279.00	131	1	Activo	2026-09-20 08:11:37.894841	2026-09-20 08:11:37.894841	Caballero
182	ABR-CAM-001	Abrigo Largo Elegante Camel	Abrigo clásico de corte largo confeccionado en paño de lana tono camel con solapas anchas y abotonadura frontal simple.	FashionStore Signature	520.00	131	1	Activo	2026-09-20 08:11:37.894841	2026-09-20 08:11:37.894841	Dama
183	JEA-SLIM-001	Jeans Clásicos Azul Índigo	Pantalón denim corte regular fit en mezclilla de algodón elastano con lavado clásico azul índigo.	Denim Lab	239.00	5	1	Activo	2026-09-20 08:11:37.894841	2026-09-20 08:11:37.894841	Caballero
184	JEA-WIDE-002	Jeans Rectos Clásicos Denim	Jeans de corte recto en mezclilla resistente azul medio con tiro regular y costuras reforzadas en ocre.	Denim Lab	249.00	5	1	Activo	2026-09-20 08:11:37.894841	2026-09-20 08:11:37.894841	Dama
185	PAN-CHI-001	Pantalón Casual Denim Oscuro	Pantalón casual confeccionado en sarga resistente de algodón oscuro con bolsillos diagonales y calce moderno.	Nordic Line	210.00	132	1	Activo	2026-09-20 08:11:37.894841	2026-09-20 08:11:37.894841	Caballero
186	POL-BAS-001	Polera Básica Cuello Redondo Blanca	Polera manga corta elaborada en 100% algodón suave peinado de color blanco con cuello redondo acanalado.	Urban Outfitter	95.00	130	1	Activo	2026-09-20 08:11:37.894841	2026-09-20 08:11:37.894841	Unisex
187	POL-GRA-002	Polera Básica Cuello Redondo Verde	Polera casual de algodón peinado en tono verde esmeralda con calce regular y tejido fresco y transpirable.	Urban Outfitter	120.00	130	1	Activo	2026-09-20 08:11:37.894841	2026-09-20 08:11:37.894841	Caballero
188	CALZ-RUN-002	Zapatillas Running Deportivas Pro	Zapatillas para correr de alto rendimiento con amortiguación reactiva, tejido de malla transpirable y suela de tracción.	Vogue Footwear	399.00	133	1	Activo	2026-09-20 08:11:37.894841	2026-09-20 08:11:37.894841	Unisex
269	3D-HOODIE-001	Hoodie Urbano V2 (Rigged 3D)	Polerón con capucha y 17 huesos articulados. Las mangas se flexionan automáticamente con tus brazos. [3D: /modelos3d/hoodie.glb | RIGGED: true]	FashionStore 3D	299.00	131	\N	Activo	2026-09-22 06:01:35.221364	2026-09-22 06:01:35.221364	Unisex
270	3D-MONA-002	Camiseta Monalisa Streetwear 3D	Camiseta de corte slim con arrugas de tela y estampado gráfico frontal de la Gioconda. [3D: /modelos3d/offwhite_tshirt.glb | RIGGED: false]	FashionStore 3D	189.00	130	\N	Activo	2026-09-22 06:01:35.221364	2026-09-22 06:01:35.221364	Unisex
271	3D-COMBAT-003	Combat Shirt Táctica (Rigged Metahuman)	Camisa militar con armature completo Metahuman adaptado a seguimiento biomecánico. [3D: /modelos3d/combat_shirt.glb | RIGGED: true]	FashionStore 3D	349.00	6	\N	Activo	2026-09-22 06:01:35.221364	2026-09-22 06:01:35.221364	Caballero
272	3D-SCOTT-004	Camisa a Cuadros Scott (Rigged)	Camisa informal abotonada a cuadros con mangas enrolladas y armature 3D. [3D: /modelos3d/shirt_scott.glb | RIGGED: true]	FashionStore 3D	259.00	4	\N	Activo	2026-09-22 06:01:35.221364	2026-09-22 06:01:35.221364	Caballero
\.


--
-- Data for Name: proveedor; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.proveedor (id_proveedor, nit, razon_social, contacto, telefono, correo, direccion, created_at) FROM stdin;
120	1028475029	Textiles Andinos S.R.L.	Lic. Carlos Mendoza	+591 3 3445566	ventas@textilesandinos.bo	Parque Industrial Manzana 12, Galpón 4, Santa Cruz	2026-09-13 10:42:18.371516
121	349182024	Confecciones Alta Costura Bolivia S.A.	María Eugenia Paz	+591 2 2778899	contacto@altacostura.com.bo	Av. Arce 2433, Edif. Multicentro Piso 8, La Paz	2026-09-13 10:42:23.60006
122	582049101	Importadora Milano Fashion S.R.L.	Giovanni Rossi	+591 3 3551122	importaciones@milanofashion.bo	Av. San Martín 150, Equipetrol Norte, Santa Cruz	2026-09-13 10:42:23.69825
\.


--
-- Data for Name: reserva; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.reserva (id_reserva, id_cliente, id_sucursal, fecha_reserva, fecha_limite, estado, total, created_at, updated_at) FROM stdin;
1	77	1	2026-09-22 03:26:06.598455	2026-09-23 03:26:06.635007	Atendido	520.00	2026-09-22 03:26:06.598455	2026-09-22 03:51:17.429039
4	77	1	2026-09-22 04:40:14.092663	2026-09-23 04:40:14.096903	Atendido	95.00	2026-09-22 04:40:14.092663	2026-09-22 04:40:29.992935
5	1	2	2026-09-22 04:55:47.35671	2026-09-23 04:55:47.361511	Pendiente	389.00	2026-09-22 04:55:47.35671	2026-09-22 04:55:47.35671
2	77	1	2026-09-22 04:13:25.164084	2026-09-23 04:13:25.168392	Atendido	520.00	2026-09-22 04:13:25.164084	2026-09-22 05:13:49.281703
6	78	1	2026-09-22 05:15:14.261283	2026-09-23 05:15:14.267966	Pendiente	520.00	2026-09-22 05:15:14.261283	2026-09-22 05:15:14.261283
3	77	1	2026-09-22 04:33:08.372012	2026-09-23 04:33:08.376174	Atendido	520.00	2026-09-22 04:33:08.372012	2026-09-22 05:32:40.983045
7	77	1	2026-09-22 05:33:37.854815	2026-09-23 05:33:37.859915	Pendiente	520.00	2026-09-22 05:33:37.854815	2026-09-22 05:33:37.854815
8	77	1	2026-09-22 05:33:43.254353	2026-09-23 05:33:43.259436	Pendiente	520.00	2026-09-22 05:33:43.254353	2026-09-22 05:33:43.254353
9	77	1	2026-09-22 05:42:05.383029	2026-09-23 05:42:05.388213	Atendido	520.00	2026-09-22 05:42:05.383029	2026-09-22 05:42:42.73809
10	77	1	2026-09-22 05:44:26.709937	2026-09-23 05:44:26.715015	Atendido	520.00	2026-09-22 05:44:26.709937	2026-09-22 05:45:18.093601
11	77	1	2026-09-22 05:45:36.354182	2026-09-23 05:45:36.359345	Atendido	175.00	2026-09-22 05:45:36.354182	2026-09-22 05:45:41.038411
\.


--
-- Data for Name: rol; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.rol (id_rol, nombre, descripcion, created_at, updated_at) FROM stdin;
1	Administrador	Acceso total y administración de la plataforma	2026-09-05 05:46:31.896881	2026-09-05 05:46:31.896881
2	Encargado de Sucursal	Gestión de existencias y preparación de reservas en su sucursal	2026-09-05 05:46:31.896881	2026-09-05 05:46:31.896881
3	Cajero (POS)	Ventas presenciales en la caja física de sucursal	2026-09-05 05:46:31.896881	2026-09-05 05:46:31.896881
4	Cliente	Consulta de catálogo, probador virtual y reserva en línea	2026-09-05 05:46:31.896881	2026-09-05 05:46:31.896881
\.


--
-- Data for Name: rol_permiso; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.rol_permiso (id_rol, id_permiso) FROM stdin;
1	1
1	2
1	3
1	4
1	5
1	6
1	7
1	8
1	9
1	10
1	11
1	12
1	13
1	14
1	15
1	16
1	17
1	18
1	19
1	20
2	1
2	7
2	11
2	13
2	14
2	16
2	17
2	19
1	21
1	22
1	23
1	24
1	25
1	26
1	27
1	28
2	21
2	25
2	26
2	27
2	28
3	8
3	16
3	18
3	7
\.


--
-- Data for Name: sucursal; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.sucursal (id_sucursal, nombre, direccion, telefono, id_ciudad, id_encargado, created_at, updated_at) FROM stdin;
1	Sucursal Equipetrol	Av. San Martín, Calle 8 Este #45	3345678	1	1480	2026-09-05 05:46:31.906708	2026-09-05 05:46:31.906708
2	Sucursal Centro	Calle Junín #123, Frente a la Plaza Principal	3367890	1	1481	2026-09-05 05:46:31.906708	2026-09-05 05:46:31.906708
3	Sucursal Tarija Centro	Calle Bolivar #100	46699999	4	1482	2026-09-05 21:30:16.900525	2026-09-05 21:30:17.004358
\.


--
-- Data for Name: talla; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.talla (id_talla, nombre, descripcion) FROM stdin;
1	S	Talla Pequeña (Small)
2	M	Talla Mediana (Medium)
3	L	Talla Grande (Large)
4	XL	Talla Extra Grande (Extra Large)
\.


--
-- Data for Name: temporada; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.temporada (id_temporada, nombre, descripcion, fecha_inicio, fecha_fin, estado, created_at) FROM stdin;
1	Colección Primavera 2026	Moda de temporada de transición	2026-09-01	2026-11-30	t	2026-09-13 18:58:08.302128
\.


--
-- Data for Name: usuario; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.usuario (id_usuario, nombre, apellido, correo, password_hash, telefono, estado, id_role, created_at, updated_at) FROM stdin;
1479	MATEO	SUAREZ	mateo.suarez@example.com	$2b$12$UsQ.XT3A5nPD3FZa.mu41O2kRSy25EhJbnH9G52ch1oZi1cyG0Gie	+59174895968	Activo	4	2026-09-20 22:28:27.045497	2026-09-20 22:28:27.045497
1209	Camila	Suárez Peña	camila.suarez@gmail.com	$2b$12$NN/hDAAMEw42SWv5SBYMr.a1VQ3.JGh30d4q9xsWh9dUvefyVCvPC	77390123	Activo	4	2026-09-19 21:25:53.169801	2026-09-19 21:25:53.169801
1210	Mateo	Villagómez Arce	mateo.villagomez@gmail.com	$2b$12$xjpVBeyPCqE1YMAnXtA6suv1wBzvjyM9TwFfYQs3SbosY0kQ5E1Ri	+591 76098765	Activo	4	2026-09-19 21:35:38.38968	2026-09-19 21:35:38.38968
1	Alejandro	Sistemas	admin@fashionstore.com	$2b$12$M/iSWcminFwtfF46XN1OF./DVakL4TwhOniZal2TlN/c.ZnwOS58S	77712345	Activo	1	2026-09-05 05:46:31.903349	2026-09-05 05:46:31.903349
1480	Roberto Carlos	Flores Mendizábal	roberto.flores@fashionstore.com	$2b$12$rJ2Kje9HttyFIaxwO1QWb.T2mOXTaD9thpSByaHmYsBzxgcesRoBq	77011223	Activo	2	2026-09-22 05:02:51.897323	2026-09-22 05:02:51.897323
1481	Valeria	Morales Justiniano	valeria.morales@fashionstore.com	$2b$12$GDxQCap97haAww/uSU2bUunzg8w6SqePuGDHCYPeyAWnGTHmaKXlW	78522334	Activo	2	2026-09-22 05:02:51.897323	2026-09-22 05:02:51.897323
1482	Carlos Fernando	Gutierrez Paz	carlos.gutierrez@fashionstore.com	$2b$12$bWxmzO9NDDg/bdioxkY1N.2RnPig5t/ZBxOCqK28w4g3/VJopWKRu	71233445	Activo	2	2026-09-22 05:02:51.897323	2026-09-22 05:02:51.897323
3	Camila	Rojas	camila.rojas@fashionstore.com	$2b$12$n3Vyd/k44JSrtOFmafNutOMQTOssKAfu8Fuke8S5nsYORZ1HkwTYy	76311222	Activo	3	2026-09-05 09:22:55.222211	2026-09-05 09:24:08.447436
1483	Lucía	Méndez Aguilera	lucia.mendez@fashionstore.com	$2b$12$pyW26GGFzNySqKVxE2hUkO8BVhxEZm5nwHqRBtTiUc5.OOWadScxW	76044556	Activo	3	2026-09-22 05:02:51.897323	2026-09-22 05:02:51.897323
1484	Rodrigo	Benítez Choque	rodrigo.benitez@fashionstore.com	$2b$12$C9j5SgIbOKUFc.Rp1yBKweS0scKuuH23WU4x9YFLao7VvLoETOlT6	75055667	Activo	3	2026-09-22 05:02:51.897323	2026-09-22 05:02:51.897323
1485	Sofía Mariana	Antelo Vaca	sofia.antelo@gmail.com	$2b$12$KBeITEOjZFblsWBTG4rzculrKb9K2iLDCH9FQm2AX64THOkpYUnce	78012345	Activo	4	2026-09-22 05:02:51.897323	2026-09-22 05:02:51.897323
1486	Sebastián	Farfán Ríos	sebastian.farfan@gmail.com	$2b$12$qjvo6RT1bpWyq9BXhfqEh.90cEJr2hKuwmANiXAMd3QFG7kKoHgau	72987654	Activo	4	2026-09-22 05:02:51.897323	2026-09-22 05:02:51.897323
1487	Andrea Belén	Quiroga Pinto	andrea.quiroga@gmail.com	$2b$12$693hfSUqETbZe3qai8zeAugAllPqlDC9gcr..lhCG6mGF7dFlZkwm	77234567	Activo	4	2026-09-22 05:02:51.897323	2026-09-22 05:02:51.897323
\.


--
-- Data for Name: usuario_token; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.usuario_token (id_token, id_usuario, token_recuperacion, expiracion, usado, created_at) FROM stdin;
51	1	1hEK1cmQi8UHWMnfBZDGAtOVpBlavdXHu_a4bho9QSc	2026-09-13 04:44:49.668248	f	2026-09-13 04:14:49.666848
\.


--
-- Data for Name: variante_prenda; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.variante_prenda (id_variante_prenda, id_prenda, id_talla, id_color, sku_variante, precio_adicional) FROM stdin;
4	3	1	3	CHQ-JEAN-001-T1-C3	0.00
5	3	2	3	CHQ-JEAN-001-T2-C3	0.00
6	3	3	1	CHQ-JEAN-001-T3-C1	20.00
7	4	1	3	E2E-CALZADO-1788649379-T1-C3	0.00
273	171	1	3	CHQ-DENIM-002-S-AZU	0.00
274	171	1	1	CHQ-DENIM-002-S-NEG	0.00
275	171	2	3	CHQ-DENIM-002-M-AZU	0.00
276	171	2	1	CHQ-DENIM-002-M-NEG	0.00
277	171	3	3	CHQ-DENIM-002-L-AZU	0.00
278	171	3	1	CHQ-DENIM-002-L-NEG	0.00
279	171	4	3	CHQ-DENIM-002-XL-AZU	0.00
280	171	4	1	CHQ-DENIM-002-XL-NEG	0.00
281	172	1	1	BLZ-EJE-001-S-NEG	0.00
282	172	1	16	BLZ-EJE-001-S-AZU	0.00
283	172	2	1	BLZ-EJE-001-M-NEG	0.00
284	172	2	16	BLZ-EJE-001-M-AZU	0.00
285	172	3	1	BLZ-EJE-001-L-NEG	0.00
286	172	3	16	BLZ-EJE-001-L-AZU	0.00
287	173	1	3	CAM-OXF-001-S-AZU	0.00
288	173	1	2	CAM-OXF-001-S-BLA	0.00
289	173	2	3	CAM-OXF-001-M-AZU	0.00
290	173	2	2	CAM-OXF-001-M-BLA	0.00
291	173	3	3	CAM-OXF-001-L-AZU	0.00
292	173	3	2	CAM-OXF-001-L-BLA	0.00
293	173	4	3	CAM-OXF-001-XL-AZU	0.00
294	173	4	2	CAM-OXF-001-XL-BLA	0.00
295	174	2	2	CAM-BLA-002-M-BLA	0.00
296	174	3	2	CAM-BLA-002-L-BLA	0.00
297	174	4	2	CAM-BLA-002-XL-BLA	0.00
298	175	1	4	CAM-LEN-003-S-ROJ	0.00
299	175	1	13	CAM-LEN-003-S-CAM	0.00
300	175	2	4	CAM-LEN-003-M-ROJ	0.00
301	175	2	13	CAM-LEN-003-M-CAM	0.00
302	175	3	4	CAM-LEN-003-L-ROJ	0.00
303	175	3	13	CAM-LEN-003-L-CAM	0.00
304	175	4	4	CAM-LEN-003-XL-ROJ	0.00
305	175	4	13	CAM-LEN-003-XL-CAM	0.00
306	176	1	2	BLU-FLO-001-S-BLA	0.00
307	176	1	13	BLU-FLO-001-S-CAM	0.00
308	176	2	2	BLU-FLO-001-M-BLA	0.00
309	176	2	13	BLU-FLO-001-M-CAM	0.00
310	176	3	2	BLU-FLO-001-L-BLA	0.00
311	176	3	13	BLU-FLO-001-L-CAM	0.00
312	177	1	2	BLU-HAL-002-S-BLA	0.00
313	177	1	1	BLU-HAL-002-S-NEG	0.00
314	177	2	2	BLU-HAL-002-M-BLA	0.00
315	177	2	1	BLU-HAL-002-M-NEG	0.00
316	177	3	2	BLU-HAL-002-L-BLA	0.00
317	177	3	1	BLU-HAL-002-L-NEG	0.00
318	178	1	1	VES-GALA-001-S-NEG	0.00
319	178	1	4	VES-GALA-001-S-ROJ	0.00
320	178	2	1	VES-GALA-001-M-NEG	0.00
321	178	2	4	VES-GALA-001-M-ROJ	0.00
322	178	3	1	VES-GALA-001-L-NEG	0.00
323	178	3	4	VES-GALA-001-L-ROJ	0.00
324	179	1	13	VES-MIDI-002-S-CAM	0.00
325	179	1	14	VES-MIDI-002-S-VER	0.00
326	179	2	13	VES-MIDI-002-M-CAM	0.00
327	179	2	14	VES-MIDI-002-M-VER	0.00
328	179	3	13	VES-MIDI-002-L-CAM	0.00
329	179	3	14	VES-MIDI-002-L-VER	0.00
330	180	1	13	SWT-HOD-001-S-CAM	0.00
331	180	1	15	SWT-HOD-001-S-GRI	0.00
332	180	1	1	SWT-HOD-001-S-NEG	0.00
333	180	2	13	SWT-HOD-001-M-CAM	0.00
334	180	2	15	SWT-HOD-001-M-GRI	0.00
335	180	2	1	SWT-HOD-001-M-NEG	0.00
336	180	3	13	SWT-HOD-001-L-CAM	0.00
337	180	3	15	SWT-HOD-001-L-GRI	0.00
338	180	3	1	SWT-HOD-001-L-NEG	0.00
339	180	4	13	SWT-HOD-001-XL-CAM	0.00
340	180	4	15	SWT-HOD-001-XL-GRI	0.00
341	180	4	1	SWT-HOD-001-XL-NEG	0.00
342	181	2	1	SWT-TOR-002-M-NEG	0.00
343	181	2	15	SWT-TOR-002-M-GRI	0.00
344	181	3	1	SWT-TOR-002-L-NEG	0.00
345	181	3	15	SWT-TOR-002-L-GRI	0.00
346	181	4	1	SWT-TOR-002-XL-NEG	0.00
347	181	4	15	SWT-TOR-002-XL-GRI	0.00
348	182	1	13	ABR-CAM-001-S-CAM	0.00
349	182	1	1	ABR-CAM-001-S-NEG	0.00
350	182	2	13	ABR-CAM-001-M-CAM	0.00
351	182	2	1	ABR-CAM-001-M-NEG	0.00
352	182	3	13	ABR-CAM-001-L-CAM	0.00
353	182	3	1	ABR-CAM-001-L-NEG	0.00
354	183	1	3	JEA-SLIM-001-S-AZU	0.00
355	183	1	1	JEA-SLIM-001-S-NEG	0.00
356	183	2	3	JEA-SLIM-001-M-AZU	0.00
357	183	2	1	JEA-SLIM-001-M-NEG	0.00
358	183	3	3	JEA-SLIM-001-L-AZU	0.00
359	183	3	1	JEA-SLIM-001-L-NEG	0.00
360	183	4	3	JEA-SLIM-001-XL-AZU	0.00
361	183	4	1	JEA-SLIM-001-XL-NEG	0.00
362	184	1	3	JEA-WIDE-002-S-AZU	0.00
363	184	2	3	JEA-WIDE-002-M-AZU	0.00
364	184	3	3	JEA-WIDE-002-L-AZU	0.00
365	185	1	13	PAN-CHI-001-S-CAM	0.00
366	185	1	16	PAN-CHI-001-S-AZU	0.00
367	185	1	14	PAN-CHI-001-S-VER	0.00
368	185	2	13	PAN-CHI-001-M-CAM	0.00
369	185	2	16	PAN-CHI-001-M-AZU	0.00
370	185	2	14	PAN-CHI-001-M-VER	0.00
371	185	3	13	PAN-CHI-001-L-CAM	0.00
372	185	3	16	PAN-CHI-001-L-AZU	0.00
373	185	3	14	PAN-CHI-001-L-VER	0.00
374	185	4	13	PAN-CHI-001-XL-CAM	0.00
375	185	4	16	PAN-CHI-001-XL-AZU	0.00
376	185	4	14	PAN-CHI-001-XL-VER	0.00
377	186	1	2	POL-BAS-001-S-BLA	0.00
378	186	1	1	POL-BAS-001-S-NEG	0.00
379	186	1	15	POL-BAS-001-S-GRI	0.00
380	186	2	2	POL-BAS-001-M-BLA	0.00
381	186	2	1	POL-BAS-001-M-NEG	0.00
382	186	2	15	POL-BAS-001-M-GRI	0.00
383	186	3	2	POL-BAS-001-L-BLA	0.00
384	186	3	1	POL-BAS-001-L-NEG	0.00
385	186	3	15	POL-BAS-001-L-GRI	0.00
386	186	4	2	POL-BAS-001-XL-BLA	0.00
387	186	4	1	POL-BAS-001-XL-NEG	0.00
388	186	4	15	POL-BAS-001-XL-GRI	0.00
389	187	1	1	POL-GRA-002-S-NEG	0.00
390	187	1	2	POL-GRA-002-S-BLA	0.00
391	187	2	1	POL-GRA-002-M-NEG	0.00
392	187	2	2	POL-GRA-002-M-BLA	0.00
393	187	3	1	POL-GRA-002-L-NEG	0.00
394	187	3	2	POL-GRA-002-L-BLA	0.00
395	187	4	1	POL-GRA-002-XL-NEG	0.00
396	187	4	2	POL-GRA-002-XL-BLA	0.00
397	188	2	2	CALZ-RUN-002-M-BLA	0.00
398	188	2	1	CALZ-RUN-002-M-NEG	0.00
399	188	3	2	CALZ-RUN-002-L-BLA	0.00
400	188	3	1	CALZ-RUN-002-L-NEG	0.00
401	188	4	2	CALZ-RUN-002-XL-BLA	0.00
402	188	4	1	CALZ-RUN-002-XL-NEG	0.00
654	269	1	1	3D-HOODIE-001-S-NEG	0.00
655	269	2	1	3D-HOODIE-001-M-NEG	0.00
656	269	3	1	3D-HOODIE-001-L-NEG	0.00
657	269	4	1	3D-HOODIE-001-XL-NEG	0.00
658	270	1	1	3D-MONA-002-S-NEG	0.00
659	270	2	1	3D-MONA-002-M-NEG	0.00
660	270	3	1	3D-MONA-002-L-NEG	0.00
661	270	4	1	3D-MONA-002-XL-NEG	0.00
662	271	1	14	3D-COMBAT-003-S-OLI	0.00
663	271	2	14	3D-COMBAT-003-M-OLI	0.00
664	271	3	14	3D-COMBAT-003-L-OLI	0.00
665	271	4	14	3D-COMBAT-003-XL-OLI	0.00
666	272	1	4	3D-SCOTT-004-S-ROJ	0.00
667	272	2	4	3D-SCOTT-004-M-ROJ	0.00
668	272	3	4	3D-SCOTT-004-L-ROJ	0.00
669	272	4	4	3D-SCOTT-004-XL-ROJ	0.00
\.


--
-- Data for Name: venta; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.venta (id_venta, id_cliente, id_sucursal, id_cajero, id_reserva, tipo_venta, metodo_pago, subtotal, descuento, total, fecha_venta) FROM stdin;
2	3	1	1	\N	Presencial	Efectivo	369.90	0.00	369.90	2026-09-20 04:32:55.285105
3	3	2	1	\N	Presencial	Efectivo	369.90	0.00	369.90	2026-09-20 04:35:06.480169
5	77	1	\N	1	Online	Tarjeta	520.00	0.00	520.00	2026-09-22 03:51:17.429039
6	77	1	\N	4	Online	Tarjeta	95.00	0.00	95.00	2026-09-22 04:40:29.992935
7	77	1	\N	2	Online	Tarjeta	520.00	0.00	520.00	2026-09-22 05:13:49.281703
8	77	1	\N	3	Online	Tarjeta	520.00	0.00	520.00	2026-09-22 05:32:40.983045
9	77	1	\N	9	Online	Tarjeta	520.00	0.00	520.00	2026-09-22 05:42:42.73809
10	77	1	\N	10	Online	Tarjeta	520.00	0.00	520.00	2026-09-22 05:45:18.093601
11	77	1	1479	11	Online	QR	175.00	0.00	175.00	2026-09-22 05:45:41.038411
\.


--
-- Name: bitacora_id_bitacora_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.bitacora_id_bitacora_seq', 9685, true);


--
-- Name: categoria_id_categoria_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.categoria_id_categoria_seq', 172, true);


--
-- Name: ciudad_id_ciudad_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.ciudad_id_ciudad_seq', 216, true);


--
-- Name: cliente_id_cliente_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.cliente_id_cliente_seq', 80, true);


--
-- Name: color_id_color_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.color_id_color_seq', 24, true);


--
-- Name: compra_id_compra_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.compra_id_compra_seq', 531, true);


--
-- Name: comprobante_id_comprobante_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.comprobante_id_comprobante_seq', 9, true);


--
-- Name: imagen_prenda_id_imagen_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.imagen_prenda_id_imagen_seq', 376, true);


--
-- Name: movimiento_inventario_id_movimiento_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.movimiento_inventario_id_movimiento_seq', 916, true);


--
-- Name: pago_transaccion_id_pago_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.pago_transaccion_id_pago_seq', 8, true);


--
-- Name: permiso_id_permiso_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.permiso_id_permiso_seq', 44, true);


--
-- Name: prenda_id_prenda_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.prenda_id_prenda_seq', 272, true);


--
-- Name: proveedor_id_proveedor_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.proveedor_id_proveedor_seq', 998, true);


--
-- Name: reserva_id_reserva_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.reserva_id_reserva_seq', 11, true);


--
-- Name: rol_id_rol_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.rol_id_rol_seq', 4, true);


--
-- Name: sucursal_id_sucursal_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.sucursal_id_sucursal_seq', 155, true);


--
-- Name: talla_id_talla_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.talla_id_talla_seq', 4, true);


--
-- Name: temporada_id_temporada_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.temporada_id_temporada_seq', 170, true);


--
-- Name: usuario_id_usuario_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.usuario_id_usuario_seq', 1487, true);


--
-- Name: usuario_token_id_token_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.usuario_token_id_token_seq', 1038, true);


--
-- Name: variante_prenda_id_variante_prenda_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.variante_prenda_id_variante_prenda_seq', 669, true);


--
-- Name: venta_id_venta_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.venta_id_venta_seq', 11, true);


--
-- Name: bitacora bitacora_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.bitacora
    ADD CONSTRAINT bitacora_pkey PRIMARY KEY (id_bitacora);


--
-- Name: categoria categoria_nombre_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.categoria
    ADD CONSTRAINT categoria_nombre_key UNIQUE (nombre);


--
-- Name: categoria categoria_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.categoria
    ADD CONSTRAINT categoria_pkey PRIMARY KEY (id_categoria);


--
-- Name: ciudad ciudad_nombre_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ciudad
    ADD CONSTRAINT ciudad_nombre_key UNIQUE (nombre);


--
-- Name: ciudad ciudad_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ciudad
    ADD CONSTRAINT ciudad_pkey PRIMARY KEY (id_ciudad);


--
-- Name: cliente cliente_ci_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cliente
    ADD CONSTRAINT cliente_ci_key UNIQUE (ci);


--
-- Name: cliente cliente_correo_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cliente
    ADD CONSTRAINT cliente_correo_key UNIQUE (correo);


--
-- Name: cliente cliente_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cliente
    ADD CONSTRAINT cliente_pkey PRIMARY KEY (id_cliente);


--
-- Name: color color_nombre_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.color
    ADD CONSTRAINT color_nombre_key UNIQUE (nombre);


--
-- Name: color color_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.color
    ADD CONSTRAINT color_pkey PRIMARY KEY (id_color);


--
-- Name: compra compra_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.compra
    ADD CONSTRAINT compra_pkey PRIMARY KEY (id_compra);


--
-- Name: comprobante comprobante_numero_comprobante_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.comprobante
    ADD CONSTRAINT comprobante_numero_comprobante_key UNIQUE (numero_comprobante);


--
-- Name: comprobante comprobante_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.comprobante
    ADD CONSTRAINT comprobante_pkey PRIMARY KEY (id_comprobante);


--
-- Name: detalle_compra detalle_compra_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.detalle_compra
    ADD CONSTRAINT detalle_compra_pkey PRIMARY KEY (id_compra, id_variante_prenda);


--
-- Name: detalle_reserva detalle_reserva_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.detalle_reserva
    ADD CONSTRAINT detalle_reserva_pkey PRIMARY KEY (id_reserva, id_variante_prenda);


--
-- Name: detalle_venta detalle_venta_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.detalle_venta
    ADD CONSTRAINT detalle_venta_pkey PRIMARY KEY (id_venta, id_variante_prenda);


--
-- Name: imagen_prenda imagen_prenda_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.imagen_prenda
    ADD CONSTRAINT imagen_prenda_pkey PRIMARY KEY (id_imagen);


--
-- Name: inventario inventario_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.inventario
    ADD CONSTRAINT inventario_pkey PRIMARY KEY (id_sucursal, id_variante_prenda);


--
-- Name: movimiento_inventario movimiento_inventario_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movimiento_inventario
    ADD CONSTRAINT movimiento_inventario_pkey PRIMARY KEY (id_movimiento);


--
-- Name: pago_transaccion pago_transaccion_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.pago_transaccion
    ADD CONSTRAINT pago_transaccion_pkey PRIMARY KEY (id_pago);


--
-- Name: pago_transaccion pago_transaccion_transaccion_id_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.pago_transaccion
    ADD CONSTRAINT pago_transaccion_transaccion_id_key UNIQUE (transaccion_id);


--
-- Name: permiso permiso_codigo_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.permiso
    ADD CONSTRAINT permiso_codigo_key UNIQUE (codigo);


--
-- Name: permiso permiso_nombre_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.permiso
    ADD CONSTRAINT permiso_nombre_key UNIQUE (nombre);


--
-- Name: permiso permiso_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.permiso
    ADD CONSTRAINT permiso_pkey PRIMARY KEY (id_permiso);


--
-- Name: prenda prenda_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.prenda
    ADD CONSTRAINT prenda_pkey PRIMARY KEY (id_prenda);


--
-- Name: prenda prenda_sku_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.prenda
    ADD CONSTRAINT prenda_sku_key UNIQUE (sku);


--
-- Name: proveedor proveedor_nit_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.proveedor
    ADD CONSTRAINT proveedor_nit_key UNIQUE (nit);


--
-- Name: proveedor proveedor_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.proveedor
    ADD CONSTRAINT proveedor_pkey PRIMARY KEY (id_proveedor);


--
-- Name: reserva reserva_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.reserva
    ADD CONSTRAINT reserva_pkey PRIMARY KEY (id_reserva);


--
-- Name: rol rol_nombre_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.rol
    ADD CONSTRAINT rol_nombre_key UNIQUE (nombre);


--
-- Name: rol_permiso rol_permiso_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.rol_permiso
    ADD CONSTRAINT rol_permiso_pkey PRIMARY KEY (id_rol, id_permiso);


--
-- Name: rol rol_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.rol
    ADD CONSTRAINT rol_pkey PRIMARY KEY (id_rol);


--
-- Name: sucursal sucursal_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sucursal
    ADD CONSTRAINT sucursal_pkey PRIMARY KEY (id_sucursal);


--
-- Name: talla talla_nombre_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.talla
    ADD CONSTRAINT talla_nombre_key UNIQUE (nombre);


--
-- Name: talla talla_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.talla
    ADD CONSTRAINT talla_pkey PRIMARY KEY (id_talla);


--
-- Name: temporada temporada_nombre_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.temporada
    ADD CONSTRAINT temporada_nombre_key UNIQUE (nombre);


--
-- Name: temporada temporada_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.temporada
    ADD CONSTRAINT temporada_pkey PRIMARY KEY (id_temporada);


--
-- Name: usuario usuario_correo_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.usuario
    ADD CONSTRAINT usuario_correo_key UNIQUE (correo);


--
-- Name: usuario usuario_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.usuario
    ADD CONSTRAINT usuario_pkey PRIMARY KEY (id_usuario);


--
-- Name: usuario_token usuario_token_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.usuario_token
    ADD CONSTRAINT usuario_token_pkey PRIMARY KEY (id_token);


--
-- Name: variante_prenda variante_prenda_id_prenda_id_talla_id_color_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.variante_prenda
    ADD CONSTRAINT variante_prenda_id_prenda_id_talla_id_color_key UNIQUE (id_prenda, id_talla, id_color);


--
-- Name: variante_prenda variante_prenda_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.variante_prenda
    ADD CONSTRAINT variante_prenda_pkey PRIMARY KEY (id_variante_prenda);


--
-- Name: variante_prenda variante_prenda_sku_variante_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.variante_prenda
    ADD CONSTRAINT variante_prenda_sku_variante_key UNIQUE (sku_variante);


--
-- Name: venta venta_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.venta
    ADD CONSTRAINT venta_pkey PRIMARY KEY (id_venta);


--
-- Name: idx_compra_fecha; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_compra_fecha ON public.compra USING btree (fecha DESC);


--
-- Name: idx_compra_proveedor; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_compra_proveedor ON public.compra USING btree (id_proveedor);


--
-- Name: idx_compra_sucursal; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_compra_sucursal ON public.compra USING btree (id_sucursal);


--
-- Name: idx_detalle_compra_variante; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_detalle_compra_variante ON public.detalle_compra USING btree (id_variante_prenda);


--
-- Name: idx_inventario_sucursal_variante; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_inventario_sucursal_variante ON public.inventario USING btree (id_sucursal, id_variante_prenda);


--
-- Name: idx_movimiento_fecha; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_movimiento_fecha ON public.movimiento_inventario USING btree (fecha DESC);


--
-- Name: idx_movimiento_sucursal; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_movimiento_sucursal ON public.movimiento_inventario USING btree (id_sucursal);


--
-- Name: idx_movimiento_variante; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_movimiento_variante ON public.movimiento_inventario USING btree (id_variante_prenda);


--
-- Name: idx_prenda_id_temporada; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_prenda_id_temporada ON public.prenda USING btree (id_temporada);


--
-- Name: idx_proveedor_nit; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_proveedor_nit ON public.proveedor USING btree (nit);


--
-- Name: idx_proveedor_razon_social; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_proveedor_razon_social ON public.proveedor USING btree (razon_social);


--
-- Name: idx_temporada_fechas; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_temporada_fechas ON public.temporada USING btree (fecha_inicio, fecha_fin);


--
-- Name: idx_usuario_token_id_usuario; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_usuario_token_id_usuario ON public.usuario_token USING btree (id_usuario);


--
-- Name: idx_usuario_token_recuperacion; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX idx_usuario_token_recuperacion ON public.usuario_token USING btree (token_recuperacion);


--
-- Name: idx_usuario_token_usuario_usado; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_usuario_token_usuario_usado ON public.usuario_token USING btree (id_usuario, usado);


--
-- Name: idx_variante_prenda_id_prenda; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_variante_prenda_id_prenda ON public.variante_prenda USING btree (id_prenda);


--
-- Name: prenda trg_auditoria_prendas; Type: TRIGGER; Schema: public; Owner: postgres
--

CREATE TRIGGER trg_auditoria_prendas AFTER INSERT OR DELETE OR UPDATE ON public.prenda FOR EACH ROW EXECUTE FUNCTION public.auditar_prendas();


--
-- Name: movimiento_inventario trg_movimiento_inventario; Type: TRIGGER; Schema: public; Owner: postgres
--

CREATE TRIGGER trg_movimiento_inventario AFTER INSERT ON public.movimiento_inventario FOR EACH ROW EXECUTE FUNCTION public.actualizar_stock_por_movimiento();


--
-- Name: bitacora bitacora_id_usuario_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.bitacora
    ADD CONSTRAINT bitacora_id_usuario_fkey FOREIGN KEY (id_usuario) REFERENCES public.usuario(id_usuario) ON DELETE SET NULL;


--
-- Name: categoria categoria_id_categoria_padre_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.categoria
    ADD CONSTRAINT categoria_id_categoria_padre_fkey FOREIGN KEY (id_categoria_padre) REFERENCES public.categoria(id_categoria) ON DELETE SET NULL;


--
-- Name: compra compra_id_proveedor_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.compra
    ADD CONSTRAINT compra_id_proveedor_fkey FOREIGN KEY (id_proveedor) REFERENCES public.proveedor(id_proveedor) ON DELETE RESTRICT;


--
-- Name: compra compra_id_sucursal_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.compra
    ADD CONSTRAINT compra_id_sucursal_fkey FOREIGN KEY (id_sucursal) REFERENCES public.sucursal(id_sucursal) ON DELETE RESTRICT;


--
-- Name: compra compra_id_usuario_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.compra
    ADD CONSTRAINT compra_id_usuario_fkey FOREIGN KEY (id_usuario) REFERENCES public.usuario(id_usuario) ON DELETE RESTRICT;


--
-- Name: comprobante comprobante_id_venta_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.comprobante
    ADD CONSTRAINT comprobante_id_venta_fkey FOREIGN KEY (id_venta) REFERENCES public.venta(id_venta) ON DELETE CASCADE;


--
-- Name: detalle_compra detalle_compra_id_compra_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.detalle_compra
    ADD CONSTRAINT detalle_compra_id_compra_fkey FOREIGN KEY (id_compra) REFERENCES public.compra(id_compra) ON DELETE CASCADE;


--
-- Name: detalle_compra detalle_compra_id_variante_prenda_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.detalle_compra
    ADD CONSTRAINT detalle_compra_id_variante_prenda_fkey FOREIGN KEY (id_variante_prenda) REFERENCES public.variante_prenda(id_variante_prenda) ON DELETE RESTRICT;


--
-- Name: detalle_reserva detalle_reserva_id_reserva_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.detalle_reserva
    ADD CONSTRAINT detalle_reserva_id_reserva_fkey FOREIGN KEY (id_reserva) REFERENCES public.reserva(id_reserva) ON DELETE CASCADE;


--
-- Name: detalle_reserva detalle_reserva_id_variante_prenda_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.detalle_reserva
    ADD CONSTRAINT detalle_reserva_id_variante_prenda_fkey FOREIGN KEY (id_variante_prenda) REFERENCES public.variante_prenda(id_variante_prenda) ON DELETE RESTRICT;


--
-- Name: detalle_venta detalle_venta_id_variante_prenda_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.detalle_venta
    ADD CONSTRAINT detalle_venta_id_variante_prenda_fkey FOREIGN KEY (id_variante_prenda) REFERENCES public.variante_prenda(id_variante_prenda) ON DELETE RESTRICT;


--
-- Name: detalle_venta detalle_venta_id_venta_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.detalle_venta
    ADD CONSTRAINT detalle_venta_id_venta_fkey FOREIGN KEY (id_venta) REFERENCES public.venta(id_venta) ON DELETE CASCADE;


--
-- Name: imagen_prenda imagen_prenda_id_prenda_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.imagen_prenda
    ADD CONSTRAINT imagen_prenda_id_prenda_fkey FOREIGN KEY (id_prenda) REFERENCES public.prenda(id_prenda) ON DELETE CASCADE;


--
-- Name: inventario inventario_id_sucursal_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.inventario
    ADD CONSTRAINT inventario_id_sucursal_fkey FOREIGN KEY (id_sucursal) REFERENCES public.sucursal(id_sucursal) ON DELETE RESTRICT;


--
-- Name: inventario inventario_id_variante_prenda_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.inventario
    ADD CONSTRAINT inventario_id_variante_prenda_fkey FOREIGN KEY (id_variante_prenda) REFERENCES public.variante_prenda(id_variante_prenda) ON DELETE RESTRICT;


--
-- Name: movimiento_inventario movimiento_inventario_id_sucursal_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movimiento_inventario
    ADD CONSTRAINT movimiento_inventario_id_sucursal_fkey FOREIGN KEY (id_sucursal) REFERENCES public.sucursal(id_sucursal) ON DELETE RESTRICT;


--
-- Name: movimiento_inventario movimiento_inventario_id_usuario_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movimiento_inventario
    ADD CONSTRAINT movimiento_inventario_id_usuario_fkey FOREIGN KEY (id_usuario) REFERENCES public.usuario(id_usuario) ON DELETE RESTRICT;


--
-- Name: movimiento_inventario movimiento_inventario_id_variante_prenda_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movimiento_inventario
    ADD CONSTRAINT movimiento_inventario_id_variante_prenda_fkey FOREIGN KEY (id_variante_prenda) REFERENCES public.variante_prenda(id_variante_prenda) ON DELETE RESTRICT;


--
-- Name: pago_transaccion pago_transaccion_id_venta_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.pago_transaccion
    ADD CONSTRAINT pago_transaccion_id_venta_fkey FOREIGN KEY (id_venta) REFERENCES public.venta(id_venta) ON DELETE CASCADE;


--
-- Name: prenda prenda_id_categoria_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.prenda
    ADD CONSTRAINT prenda_id_categoria_fkey FOREIGN KEY (id_categoria) REFERENCES public.categoria(id_categoria) ON DELETE RESTRICT;


--
-- Name: prenda prenda_id_temporada_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.prenda
    ADD CONSTRAINT prenda_id_temporada_fkey FOREIGN KEY (id_temporada) REFERENCES public.temporada(id_temporada) ON DELETE SET NULL;


--
-- Name: reserva reserva_id_cliente_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.reserva
    ADD CONSTRAINT reserva_id_cliente_fkey FOREIGN KEY (id_cliente) REFERENCES public.cliente(id_cliente) ON DELETE RESTRICT;


--
-- Name: reserva reserva_id_sucursal_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.reserva
    ADD CONSTRAINT reserva_id_sucursal_fkey FOREIGN KEY (id_sucursal) REFERENCES public.sucursal(id_sucursal) ON DELETE RESTRICT;


--
-- Name: rol_permiso rol_permiso_id_permiso_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.rol_permiso
    ADD CONSTRAINT rol_permiso_id_permiso_fkey FOREIGN KEY (id_permiso) REFERENCES public.permiso(id_permiso) ON DELETE CASCADE;


--
-- Name: rol_permiso rol_permiso_id_rol_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.rol_permiso
    ADD CONSTRAINT rol_permiso_id_rol_fkey FOREIGN KEY (id_rol) REFERENCES public.rol(id_rol) ON DELETE CASCADE;


--
-- Name: sucursal sucursal_id_ciudad_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sucursal
    ADD CONSTRAINT sucursal_id_ciudad_fkey FOREIGN KEY (id_ciudad) REFERENCES public.ciudad(id_ciudad) ON DELETE RESTRICT;


--
-- Name: sucursal sucursal_id_encargado_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sucursal
    ADD CONSTRAINT sucursal_id_encargado_fkey FOREIGN KEY (id_encargado) REFERENCES public.usuario(id_usuario) ON DELETE SET NULL;


--
-- Name: usuario usuario_id_role_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.usuario
    ADD CONSTRAINT usuario_id_role_fkey FOREIGN KEY (id_role) REFERENCES public.rol(id_rol) ON DELETE RESTRICT;


--
-- Name: usuario_token usuario_token_id_usuario_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.usuario_token
    ADD CONSTRAINT usuario_token_id_usuario_fkey FOREIGN KEY (id_usuario) REFERENCES public.usuario(id_usuario) ON DELETE CASCADE;


--
-- Name: variante_prenda variante_prenda_id_color_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.variante_prenda
    ADD CONSTRAINT variante_prenda_id_color_fkey FOREIGN KEY (id_color) REFERENCES public.color(id_color) ON DELETE RESTRICT;


--
-- Name: variante_prenda variante_prenda_id_prenda_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.variante_prenda
    ADD CONSTRAINT variante_prenda_id_prenda_fkey FOREIGN KEY (id_prenda) REFERENCES public.prenda(id_prenda) ON DELETE CASCADE;


--
-- Name: variante_prenda variante_prenda_id_talla_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.variante_prenda
    ADD CONSTRAINT variante_prenda_id_talla_fkey FOREIGN KEY (id_talla) REFERENCES public.talla(id_talla) ON DELETE RESTRICT;


--
-- Name: venta venta_id_cajero_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.venta
    ADD CONSTRAINT venta_id_cajero_fkey FOREIGN KEY (id_cajero) REFERENCES public.usuario(id_usuario) ON DELETE RESTRICT;


--
-- Name: venta venta_id_cliente_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.venta
    ADD CONSTRAINT venta_id_cliente_fkey FOREIGN KEY (id_cliente) REFERENCES public.cliente(id_cliente) ON DELETE RESTRICT;


--
-- Name: venta venta_id_reserva_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.venta
    ADD CONSTRAINT venta_id_reserva_fkey FOREIGN KEY (id_reserva) REFERENCES public.reserva(id_reserva) ON DELETE SET NULL;


--
-- Name: venta venta_id_sucursal_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.venta
    ADD CONSTRAINT venta_id_sucursal_fkey FOREIGN KEY (id_sucursal) REFERENCES public.sucursal(id_sucursal) ON DELETE RESTRICT;


--
-- PostgreSQL database dump complete
--

\unrestrict ePzbOxa20W98saZz7uao2UT7bl0UxY9yZexmct4KcKI9c6CHEtnehhltOysfrpk

