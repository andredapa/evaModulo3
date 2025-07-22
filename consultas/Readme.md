# Proyecto SQL - Gestión de Pedidos y Clientes

Este proyecto contiene un conjunto de **consultas SQL (DQL)** y **sentencias de manipulación de datos (DML)** diseñadas para trabajar con un modelo de base de datos de una tienda.  

## Contenido

1. **Consultas (DQL)**:
   - Pedidos realizados por un cliente específico.
   - Listado de productos con stock menor a 50 unidades.
   - Detalle de un pedido por cliente.
   - Total de ventas agrupadas por estado.
   - Top 3 productos más vendidos.

2. **Operaciones de Manipulación de Datos (DML)**:
   - **INSERT**: agregar nuevos clientes y productos.
   - **UPDATE**: modificar dirección de clientes y actualizar stock.
   - **DELETE**: eliminar pedidos y productos específicos.

---

## Requisitos Previos

- **Servidor de Base de Datos**: MySQL o MariaDB.
- Base de datos con las siguientes tablas:
  - `Clientes`
  - `Pedidos`
  - `Detalle_Pedidos`
  - `Productos`
- Cliente SQL instalado:
  - **MySQL Workbench**, **phpMyAdmin** o **CLI de MySQL**.

---

## Ejecución

1. **Clona o descarga** este proyecto.
2. Abre tu cliente SQL y conéctate a tu servidor de base de datos.
3. **Selecciona la base de datos** correspondiente:
   ```sql
   USE nombre_de_tu_base_de_datos;
