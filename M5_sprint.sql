# Creación de usuario y base de datos

CREATE SCHEMA m5sprint;

CREATE USER 'user_sprint'@'localhost' IDENTIFIED BY '12345';
GRANT ALL PRIVILEGES ON m5sprint.* TO 'user_sprint'@'localhost';

# Creacion de tablas

USE m5sprint;

CREATE TABLE usuarios (
    id_usuario INT PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(70),
    edad SMALLINT,
    correo_electronico VARCHAR(50),
    veces_utilizada INT DEFAULT 1
);

CREATE TABLE operarios (
    id_operario INT PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(70),
    edad SMALLINT,
    correo_electronico VARCHAR(50),
    veces_soporte INT DEFAULT 1
);

CREATE TABLE operacionesSoporte (
    id_operacion INT PRIMARY KEY AUTO_INCREMENT,
    id_usuario INT,
    id_operario INT,
    fecha TIMESTAMP,
    calificacion TINYINT,
    FOREIGN KEY (id_usuario) REFERENCES usuarios(id_usuario),
    FOREIGN KEY (id_operario) REFERENCES operarios(id_operario)
);

INSERT INTO usuarios
(nombre, edad, correo_electronico, veces_utilizada)
VALUES
    ("Alba Pascual", 21, "apascual@example.com", 5),
    ("Nicolás Fuentes", 32, "nfuentes@example.com", 4),
    ("Consuelo Méndez", 27, "cmendez@example.com", 7),
    ("Salvador Santos", 40, "ssantos@example.com", 3),
    ("Esther Jara", 34, "ejara@example.com", 9)
;

INSERT INTO operarios
(nombre, edad, correo_electronico, veces_soporte)
VALUES
    ("Diego Martín", 19, "dmartin@example.org", 3),
    ("Nuria Alarcon", 28, "nalarcon@example.org", 2),
    ("Rayan Ramos", 40, "rramos@example.org", 1),
    ("Amaia Cáceres", 18, "acaceres@example.org", 2),
    ("Catalina Blanco", 36, "cblanco@example.org", 2)
;

INSERT INTO operacionesSoporte
(id_usuario, id_operario, fecha, calificacion)
VALUES
    (3, 5, "2023-03-10 12:45:01", 4),
    (1, 1, "2023-03-10 14:10:32", 6),
    (4, 4, "2023-03-11 10:43:57", 4),
    (3, 2, "2023-03-11 13:03:45", 5),
    (2, 3, "2023-03-11 18:23:49", 7),
    (1, 2, "2023-03-12 15:20:12", 2),
    (2, 1, "2023-03-13 12:58:19", 5),
    (1, 4, "2023-03-13 20:39:21", 2),
    (4, 1, "2023-03-14 15:03:41", 3),
    (1, 5, "2023-03-15 12:29:06", 6)
;

# Seleccione las 3 operaciones con mejor evaluación.
SELECT * FROM operacionesSoporte
ORDER BY calificacion DESC
LIMIT 3;

# Seleccione las 3 operaciones con menos evaluación.
SELECT * FROM operacionesSoporte
ORDER BY calificacion ASC
LIMIT 3;

# Seleccione al operario que más soportes ha realizado.
SELECT * FROM operarios
ORDER BY veces_soporte DESC
LIMIT 1;

# Seleccione al cliente que menos veces ha utilizado la aplicación.
SELECT * FROM usuarios
ORDER BY veces_utilizada ASC
LIMIT 1;

# Agregue 10 años a los tres primeros usuarios registrados.
UPDATE usuarios
SET
    edad = edad + 10
WHERE id_usuario IN (1, 2, 3);

# Renombre todas las columnas correo electrónico. El nuevo nombre debe ser email.
ALTER TABLE usuarios
RENAME COLUMN correo_electronico TO email;

ALTER TABLE operarios
RENAME COLUMN correo_electronico TO email;

# Seleccione solo los operarios mayores de 20 años.
SELECT * FROM operarios
WHERE edad > 20;


