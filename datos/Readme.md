Se desarrolló una base de datos relacional para la gestión integral de una tienda de mascotas, contemplando clientes, mascotas, productos, proveedores, ventas y servicios ofrecidos. Se diseñaron tablas considerando las entidades principales y sus atributos, aplicando claves primarias y foráneas para garantizar la integridad referencial. Se establecieron relaciones uno a muchos (por ejemplo, un cliente puede tener varias mascotas) y muchas a muchos (productos vendidos en distintos pedidos, gestionadas mediante tablas intermedias). Durante el diseño se aplicaron principios de normalización hasta la tercera forma normal (3FN), eliminando redundancias y asegurando consistencia en la información.

Posteriormente, se realizó la carga inicial de datos y se llevaron a cabo operaciones de manipulación (DML) como inserción de registros, actualizaciones de precios y datos de clientes, eliminación de productos descontinuados y ajuste de inventario según ventas realizadas. También se ejecutaron consultas para obtener información relevante, incluyendo reportes de ventas, historial de compras por cliente, control de stock y seguimiento de servicios prestados. Estas actividades permitieron optimizar la organización, garantizar la fiabilidad de los datos y facilitar el acceso a la información esencial para la gestión de la tienda.

# EVA Portafolio - Gestión de Base de Datos Tienda de Mascotas

Este proyecto corresponde a la creación y manipulación de una **base de datos relacional** para la gestión de información en una tienda de mascotas. Forma parte de la evidencia del portafolio del estudiante **Andrea Correa Valdés**.

---

## Descripción del Proyecto

El objetivo es demostrar el uso de **SQL** en la creación de estructuras, inserción de datos y gestión de la información.  
La base de datos `tienda_mascotas` permite gestionar clientes, productos, pedidos y métodos de pago, incluyendo el detalle de cada pedido.

### Tablas principales:

- **Clientes**: Información de los clientes de la tienda.
- **Productos**: Catálogo de productos, categorías, precios y stock.
- **Metodos_Pago**: Métodos disponibles para realizar pagos.
- **Pedidos**: Registro de las órdenes realizadas por clientes.
- **Detalle_Pedidos**: Detalle de cada pedido (productos, cantidades, precios).

---

## Funcionalidades Incluidas

1. **Creación de la base de datos**: `tienda_mascotas`.
2. **Definición de tablas con claves primarias y foráneas** para mantener la integridad referencial.
3. **Inserción de datos iniciales** en todas las tablas:
   - Métodos de pago.
   - Clientes.
   - Productos.
   - Pedidos y detalles de pedidos.

---

## Requisitos Previos

- **Servidor de Base de Datos**: MySQL o MariaDB.
- **Herramienta para ejecutar consultas**:
  - MySQL Workbench.
  - phpMyAdmin.
  - CLI de MySQL.

---

## Ejecución

1. **Clona o descarga** este repositorio.
2. Abre tu cliente SQL y conéctate al servidor MySQL.
3. **Crea y selecciona la base de datos**:
   ```sql
   CREATE DATABASE IF NOT EXISTS tienda_mascotas;
   USE tienda_mascotas;
