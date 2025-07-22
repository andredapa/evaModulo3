--EVA_Portafolio
--Andrea Correa Valdés
-- 1- Distinguir las características, rol y elementos fundamentales de una base de
-- datos relacional para la gestión de la información en una organización.
-- Crear base de datos
-- Base de datos tienda_mascotas
CREATE DATABASE IF NOT EXISTS tienda_mascotas;
USE tienda_mascotas;

-- Tabla Clientes
CREATE TABLE Clientes (
    cliente_id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100),
    email VARCHAR(100) UNIQUE,
    direccion VARCHAR(150),
    telefono VARCHAR(20)
);

-- Tabla Productos
CREATE TABLE Productos (
    producto_id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100),
    categoria VARCHAR(50),
    precio DECIMAL(10,2),
    stock INT
);

-- Tabla Métodos de Pago
CREATE TABLE Metodos_Pago (
    metodo_id INT AUTO_INCREMENT PRIMARY KEY,
    tipo VARCHAR(50) NOT NULL,
    descripcion VARCHAR(100)
);

-- Tabla Pedidos
CREATE TABLE Pedidos (
    pedido_id INT AUTO_INCREMENT PRIMARY KEY,
    cliente_id INT NOT NULL,
    metodo_id INT NOT NULL,
    fecha DATE NOT NULL,
    estado VARCHAR(20) DEFAULT 'pendiente',
    total DECIMAL(10,2),
    FOREIGN KEY (cliente_id) REFERENCES Clientes(cliente_id),
    FOREIGN KEY (metodo_id) REFERENCES Metodos_Pago(metodo_id)
);

-- Tabla Detalle_Pedidos
CREATE TABLE Detalle_Pedidos (
    detalle_id INT AUTO_INCREMENT PRIMARY KEY,
    pedido_id INT NOT NULL,
    producto_id INT NOT NULL,
    cantidad INT NOT NULL,
    precio_unitario DECIMAL(10,2) NOT NULL,
    FOREIGN KEY (pedido_id) REFERENCES Pedidos(pedido_id),
    FOREIGN KEY (producto_id) REFERENCES Productos(producto_id)
);

-- Insertar Métodos de Pago
INSERT INTO Metodos_Pago (tipo, descripcion) VALUES
('Tarjeta de crédito', 'Visa, Mastercard, AMEX'),
('Transferencia bancaria', 'Pago mediante cuenta bancaria'),
('Efectivo', 'Pago en tienda');


INSERT INTO Clientes (nombre, email, direccion, telefono) VALUES
('Anastasia Torres', 'anastasia.torres@mail.com', 'Av. Las Flores 123', '5551234'),
('Luisa Gómez', 'luisa.gomez@mail.com', 'Calle Los Olivos 456', '5555678'),
('Carlos Ramírez', 'carlos.ramirez@mail.com', 'Pasaje Los Pinos 789', '5559101');


INSERT INTO Productos (nombre, categoria, precio, stock) VALUES
('Alimento para perros 10kg', 'Alimentos', 15000, 50),
('Juguete mordedor', 'Juguetes', 2000, 100),
('Collar ajustable', 'Accesorios', 5500, 75),
('Arena para gatos 20kg', 'Alimentos', 6000, 60),
('Cama para mascotas', 'Accesorios', 8390, 30);


INSERT INTO Pedidos (cliente_id, fecha, estado, total) VALUES
(1, '2025-07-15', 'pendiente', 23000),
(2, '2025-07-16', 'enviado', 5500),
(3, '2025-07-18', 'pendiente', 14390);


INSERT INTO Detalle_Pedidos (pedido_id, producto_id, cantidad, precio_unitario) VALUES
(1, 1, 1, 35000),
(1, 2, 2, 8390),
(2, 5, 1, 45000),
(3, 4, 2, 18000),
(3, 3, 1, 21000);

-- 2 Utilizar Lenguaje Estructurado de Consultas (SQL) para la obtención de información que 
-- satisface los requerimientos planteados a partir de un modelo de datos dado.

-- Pedidos realizados por un cliente

SELECT p.pedido_id, p.fecha, p.estado, p.total
FROM Pedidos p
INNER JOIN Clientes c ON p.cliente_id = c.cliente_id
WHERE c.nombre = 'Ana Torres';

-- Stock menor a 50

SELECT producto_id, nombre, categoria, stock
FROM Productos
WHERE stock < 50;

-- Detalle pedido por cliente

SELECT p.pedido_id, c.nombre AS cliente, pr.nombre AS producto,
       dp.cantidad, dp.precio_unitario, (dp.cantidad * dp.precio_unitario) AS subtotal
FROM Detalle_Pedidos dp
INNER JOIN Pedidos p ON dp.pedido_id = p.pedido_id
INNER JOIN Clientes c ON p.cliente_id = c.cliente_id
INNER JOIN Productos pr ON dp.producto_id = pr.producto_id
WHERE p.pedido_id = 2;

-- Totald de ventas

SELECT estado, SUM(total) AS total_ventas
FROM Pedidos
GROUP BY estado;

-- Producto más vendido

SELECT pr.nombre, SUM(dp.cantidad) AS total_vendido
FROM Detalle_Pedidos dp
INNER JOIN Productos pr ON dp.producto_id = pr.producto_id
GROUP BY pr.nombre
ORDER BY total_vendido DESC
LIMIT 3;

-- 3- Utilizar lenguaje de manipulación de datos (DML) para la modificación de los datos 
-- existentes en una base de datos dando solución a un problema planteado.

-- Insert

INSERT INTO Clientes (nombre, email, direccion, telefono)
VALUES ('Pedro Pascal', 'pedro.pascal@mail.com', 'Av. Los Perros 101', '555-4321');

INSERT INTO Productos (nombre, categoria, precio, stock)
VALUES ('Rascador para gatos', 'Accesorios', 9500, 40);

-- Update

UPDATE Clientes
SET direccion = 'Calle Renovada 202'
WHERE cliente_id = 2;

UPDATE Productos
SET stock = stock - 5
WHERE producto_id = 3;

-- Delete

DELETE FROM Pedidos
WHERE pedido_id = 5;

DELETE FROM Productos
WHERE producto_id = 4;

-- Implementar estructuras de datos relacionales utilizando lenguaje de definición de datos
-- (DDL) a partir de un modelo de datos para la creación y mantención de las definiciones de
-- los objetos de una base de datos.

CREATE TABLE Empleados (
    empleado_id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    puesto VARCHAR(50),
    salario INT,
    fecha_ingreso DATE
);

ALTER TABLE Empleados
ADD telefono VARCHAR(20);

ALTER TABLE Empleados
MODIFY salario DECIMAL(12,2);

CREATE INDEX idx_nombre_empleado
ON Empleados(nombre);

DROP INDEX idx_nombre_empleado ON Empleados;

DROP TABLE Empleados;
