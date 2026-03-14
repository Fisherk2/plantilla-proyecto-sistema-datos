#!/bin/bash

# Script para probar la conexion a la base de datos utilizando .env
# ...

# Creacion de base de datos
psql -U postgres -h localhost -d postgres -f create_database.sql

# Crear tabla usuarios
psql -U postgres -h localhost -d your_database_name -f migrations/001_create_users_table.sql

# Crear tabla proyectos
psql -U postgres -h localhost -d your_database_name -f migrations/002_create_projects_table.sql

# Insertar usuarios de prueba
psql -U postgres -h localhost -d your_database_name -f seeds/001_seed_users.sql

# Insertar proyectos de prueba
psql -U postgres -h localhost -d your_database_name -f seeds/002_seed_projects.sql
