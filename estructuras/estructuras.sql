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