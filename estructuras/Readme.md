# Práctica de DDL en SQL - Gestión de Estructuras de Datos

Este proyecto demuestra el uso de **Lenguaje de Definición de Datos (DDL)** en SQL para crear y mantener objetos en una base de datos relacional.

---

## ¿Qué incluye este script?
- **Creación de tabla** `Empleados` con clave primaria y campos básicos.
- **Modificación de la estructura**:
  - Agregar nuevas columnas (`telefono`).
  - Modificar tipos de datos (`salario` a `DECIMAL`).
- **Gestión de índices**:
  - Creación (`CREATE INDEX`).
  - Eliminación (`DROP INDEX`).
- **Eliminación de la tabla** (`DROP TABLE`).

---

## ¿Qué es DDL?
**DDL (Data Definition Language)** es el conjunto de comandos SQL que permite:
- **Crear** (`CREATE`) objetos como tablas e índices.
- **Modificar** (`ALTER`) estructuras existentes.
- **Eliminar** (`DROP`) objetos de la base de datos.

Estas operaciones afectan directamente la estructura de la base de datos, no los datos.

---

## Requisitos Previos
- **Servidor de base de datos**: MySQL o MariaDB.
- Cliente para ejecutar SQL:
  - MySQL Workbench
  - phpMyAdmin
  - CLI de MySQL

---

## Ejecución
1. Conéctate a tu servidor MySQL:
   ```bash
   mysql -u usuario -p
