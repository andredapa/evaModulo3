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