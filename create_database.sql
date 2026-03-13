-- 🮙🮘🮙🮘🮙🮙🮘🮙🮘🮙🮙🮘🮙🮘🮙🮙🮘🮙🮘🮙🮙🮘🮙🮙🮘🮙🮙🮘🮙🮙🮘🮙🮙🮘🮙🮙🮘🮙🮙🮘🮙🮙🮘🮙🮙🮘🮙🮙🮘🮙🮙🮘🮙🮙🮘🮙🮙🮘🮙🮙🮘🮙🮙🮘🮙🮙🮘🮙🮙🮘🮙🮙🮘🮙
-- Database Script de creación de base de datos
-- Purpose: Crear una base de datos PostgreSQL con locale y encoding UTF-8
-- Author: fisherk2
-- Version: 1.0
-- Date: 2026-03-13
-- 🮙🮘🮙🮘🮙🮙🮘🮙🮘🮙🮙🮘🮙🮘🮙🮙🮘🮙🮘🮙🮙🮘🮙🮙🮘🮙🮙🮘🮙🮙🮘🮙🮙🮘🮙🮙🮘🮙🮙🮘🮙🮙🮘🮙🮙🮘🮙🮙🮘🮙🮙🮘🮙🮙🮘🮙🮙🮘🮙🮙🮘🮙🮙🮘🮙🮙🮘🮙🮙🮘🮙🮙🮘🮙

-- ■■■■■■■■■■■■■ Set session variables for consistent database creation ■■■■■■■■■■■■■
SET client_encoding = 'UTF8';
SET client_min_messages = warning;

-- ■■■■■■■■■■■■■ Create database with UTF8 encoding and proper locale ■■■■■■■■■■■■■
-- Using template0 to avoid copying any existing database configurations
-- LC_COLLATE and LC_CTYPE set to 'en_US.UTF-8' for consistent string operations
CREATE DATABASE IF NOT EXISTS your_database_name
    WITH 
    OWNER = postgres
    ENCODING = 'UTF8'
    LC_COLLATE = 'en_US.UTF-8'
    LC_CTYPE = 'en_US.UTF-8'
    TABLESPACE = pg_default
    CONNECTION LIMIT = -1
    TEMPLATE = template0;

-- ■■■■■■■■■■■■■ Verify database creation and provide feedback ■■■■■■■■■■■■■
-- This helps in automated scripts to confirm successful creation
DO $$
BEGIN
    IF EXISTS (SELECT 1 FROM pg_database WHERE datname = 'your_database_name') THEN
        RAISE NOTICE 'Database "your_database_name" created successfully or already exists';
    ELSE
        RAISE EXCEPTION 'Failed to create database "your_database_name"';
    END IF;
END $$;

-- ■■■■■■■■■■■■■ Grant basic permissions to postgres user (can be customized per environment) ■■■■■■■■■■■■■
-- This ensures the database is accessible for subsequent migration scripts
GRANT ALL PRIVILEGES ON DATABASE your_database_name TO postgres;

-- ■■■■■■■■■■■■■ Provide usage instructions for developers ■■■■■■■■■■■■■
-- This comment serves as documentation for team members
COMMENT ON DATABASE your_database_name IS 'Main application database - created with create_database.sql';

-- ■■■■■■■■■■■■■ Disconnect from the new database to return to original connection state ■■■■■■■■■■■■■
-- This prevents subsequent scripts from accidentally running against the wrong database
\c postgres

-- ■■■■■■■■■■■■■ Database creation script completed message ■■■■■■■■■■■■■
-- This provides clear feedback that the database is ready for migrations
RAISE NOTICE 'Database creation script completed. Database "your_database_name" is ready for migrations.';