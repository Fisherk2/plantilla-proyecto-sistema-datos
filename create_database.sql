-- 🮙🮘🮙🮘🮙🮙🮘🮙🮘🮙🮙🮘🮙🮘🮙🮙🮘🮙🮘🮙🮙🮘🮙🮙🮘🮙🮙🮘🮙🮙🮘🮙🮙🮘🮙🮙🮘🮙🮙🮘🮙🮙🮘🮙🮙🮘🮙🮙🮘🮙🮙🮘🮙🮙🮘🮙🮙🮘🮙🮙🮘🮙🮙🮘🮙🮙🮘🮙🮙🮘🮙🮙🮘🮙
-- Database Script de creación de base de datos
-- Purpose: Crear una base de datos PostgreSQL con locale y encoding UTF-8
-- Author: fisherk2
-- Version: 1.0
-- Date: 2026-03-13
-- 🮙🮘🮙🮘🮙🮙🮘🮙🮘🮙🮙🮘🮙🮘🮙🮙🮘🮙🮘🮙🮙🮘🮙🮙🮘🮙🮙🮘🮙🮙🮘🮙🮙🮘🮙🮙🮘🮙🮙🮘🮙🮙🮘🮙🮙🮘🮙🮙🮘🮙🮙🮘🮙🮙🮘🮙🮙🮘🮙🮙🮘🮙🮙🮘🮙🮙🮘🮙🮙🮘🮙🮙🮘🮙

-- ■■■■■■■■■■■■■ Establecer variables de sesión para creación consistente de base de datos ■■■■■■■■■■■■■
SET client_encoding = 'UTF8';
SET client_min_messages = warning;

-- ■■■■■■■■■■■■■ Crear base de datos con encoding UTF8 y locale apropiado ■■■■■■■■■■■■■
-- Usando template0 para evitar copiar configuraciones de base de datos existentes
-- LC_COLLATE y LC_CTYPE configurados a 'en_US.UTF-8' para operaciones consistentes de strings
CREATE DATABASE IF NOT EXISTS your_database_name
    WITH 
    OWNER = postgres
    ENCODING = 'UTF8'
    LC_COLLATE = 'en_US.UTF-8'
    LC_CTYPE = 'en_US.UTF-8'
    TABLESPACE = pg_default
    CONNECTION LIMIT = -1
    TEMPLATE = template0;

-- ■■■■■■■■■■■■■ Verificar creación de base de datos y proporcionar retroalimentación ■■■■■■■■■■■■■
-- Esto ayuda en scripts automatizados para confirmar creación exitosa
DO $$
BEGIN
    IF EXISTS (SELECT 1 FROM pg_database WHERE datname = 'your_database_name') THEN
        RAISE NOTICE 'Base de datos "your_database_name" creada exitosamente o ya existe';
    ELSE
        RAISE EXCEPTION 'Falló la creación de la base de datos "your_database_name"';
    END IF;
END $$;

-- ■■■■■■■■■■■■■ Otorgar permisos básicos al usuario postgres (personalizable por ambiente) ■■■■■■■■■■■■■
-- Esto asegura que la base de datos sea accesible para scripts de migración subsecuentes
GRANT ALL PRIVILEGES ON DATABASE your_database_name TO postgres;

-- ■■■■■■■■■■■■■ Proporcionar instrucciones de uso para desarrolladores ■■■■■■■■■■■■■
-- Este comentario sirve como documentación para miembros del equipo
COMMENT ON DATABASE your_database_name IS 'Base de datos principal de la aplicación - creada con create_database.sql';

-- ■■■■■■■■■■■■■ Desconectarse de la nueva base de datos para retornar al estado de conexión original ■■■■■■■■■■■■■
-- Esto previene que scripts subsecuentes se ejecuten accidentalmente contra la base de datos incorrecta
\c postgres

-- ■■■■■■■■■■■■■ Mensaje de finalización del script de creación de base de datos ■■■■■■■■■■■■■
-- Esto proporciona retroalimentación clara de que la base de datos está lista para migraciones
RAISE NOTICE 'Script de creación de base de datos completado. Base de datos "your_database_name" está lista para migraciones.';