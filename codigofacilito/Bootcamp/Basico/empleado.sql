-- Tabla de empleados

CREATE TABLE empleados(
    id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(50) NOT NULL,
    apellido VARCHAR(50) NOT NULL,
    correo VARCHAR(100),
    contratacion DATE,
    salario DECIMAL(10, 2) NOT NULL,
    estatus ENUM("activo", "inactivo") DEFAULT "activo",
    creacion timestamp DEFAULT CURRENT_TIMESTAMP
);

-- Ver todos los registros de una tabla
SELECT * FROM empleados;

SELECT * FROM empleados\G;


-- Insertar registros

INSERT INTO empleados (nombre, apellido, correo, salario) VALUES("Cesar", "Lopez","clopeori@gmail.com", 15300);

-- Insertar varios registros 

INSERT INTO empleados (nombre, apellido, correo, salario) VALUES
    ("Alan", "Vazquez","avazquez@gmail.com", 11200),
    ("Miguel", "Castañeda","mcastañeda@gmail.com", 3000);


-- Actulizar registro 

UPDATE empleados SET contratacion = CURDATE();

-- Actualizar campo con una consicion.

UPDATE empleados SET nombre = "Armando" WHERE nombre = "Alan";

-- Eliminar registro

-- Elimina todos los registros

DELETE FROM empleados;

-- Elimina lo sregistros que complen con la condicion

DELETE FROM empleados WHERE id = 2;

-- Reinicar tabla

TRUNCATE empleados;

-- Eliminar tabla

DROP TABLE empleados;

