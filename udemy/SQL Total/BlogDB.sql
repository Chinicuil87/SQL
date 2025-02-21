-- Crear Base de Datos BlogDB
CREATE SCHEMA `blogdb`;

-- Crear Tabla de Usuarios
/*
Campos:
UserID -> Numero entero, no acepta valores nulos, es auto incrementable y se utiliza como llave primaria
Nombre -> Tipo Varchar hasta 45 caracteres 
Email -> Tipo Varchar hasta 45 caracteres
FechaRegistro -> Tipo Fecha
 */
CREATE TABLE
  `blogdb`.`usuarios` (
    `UserID` INT NOT NULL AUTO_INCREMENT,
    `Nombre` VARCHAR(45) NULL,
    `Email` VARCHAR(45) NULL,
    `FechaRegistro` DATE NULL,
    PRIMARY KEY (`UserID`)
  );

-- Crear tabala de Publicaciones
/*
Campos:
PostID -> Tipo Entero, no acepta volres nulos, es autoincrementable y se utilizara como llave primaria
Titulo -> Tipo texto hasta 45 caracteres
Contenido -> Tipo texto hasta 45 caracteres
FechaPublicacion -> Tipo fecha
 */
CREATE TABLE
  `blogdb`.`publicaciones` (
    `PostID` INT NOT NULL AUTO_INCREMENT,
    `Titulo` VARCHAR(45) NULL,
    `Contenido` VARCHAR(45) NULL,
    `FechaPublicacion` DATE NULL,
    PRIMARY KEY (`PostID`)
  );

-- Crear tabla de comentarios
/*
Campos:
ComentAD -> Tipo entero, no nulo, autoincrementable, llave primaria
PostID -> Tipo texto hace referencia al post en que se comento
UserID -> Tipo texto hace referencia al usuario que comento
Contenido -> Tipo texto
FechaComentario -> Tipo fecha
 */
CREATE TABLE
  `blogdb`.`comentarios` (
    `ComentID` INT NOT NULL AUTO_INCREMENT,
    `PostID` VARCHAR(45) NULL,
    `UserID` VARCHAR(45) NULL,
    `Contenido` VARCHAR(45) NULL,
    `FechaComentario` DATE NULL,
    PRIMARY KEY (`ComentID`)
  );

-- Se crea la llave foranea entre la tabla de comentarios y usuarios atraves de la UserID
/*
Primera parte del codigo se modifican dos columnas ya existentes la de PostID y UserID,
pasan de ser de tipo texto(varchar) a tipo entero y se añade un nuevo indice a la tabla
(userid_idx)
En la segunda parte se especifica que UserID de la tabla de comentarios sera una llave foranea
y se relacio con UserID de la tabla de Usuarios
 */
ALTER TABLE `blogdb`.`comentarios` CHANGE COLUMN `PostID` `PostID` INT NULL DEFAULT NULL,
CHANGE COLUMN `UserID` `UserID` INT NULL DEFAULT NULL,
ADD INDEX `userid_idx` (`UserID` ASC) VISIBLE;

;

ALTER TABLE `blogdb`.`comentarios` ADD CONSTRAINT `userid` FOREIGN KEY (`UserID`) REFERENCES `blogdb`.`usuarios` (`UserID`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--Se crea la llave foranea entre la tabla de comentarios y la tabla de publicaciones
/*
En la primera parte se añade el indice en la tabla de comentarios(posrid_idx)
En la segunda parte se especifica que PostID de la tabla de comentarios sera una llave foranea
y se relaciona con PostID de la tabla de publicaciones
 */
ALTER TABLE `blogdb`.`comentarios` ADD INDEX `postid_idx` (`PostID` ASC) VISIBLE;

ALTER TABLE `blogdb`.`comentarios` ADD CONSTRAINT `postid` FOREIGN KEY (`PostID`) REFERENCES `blogdb`.`publicaciones` (`PostID`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--Agrgar datos a la tabla de Usuarios
INSERT INTO
  Usuarios (Nombre, Email, FechaRegistro)
VALUES
  ("Cesar Lopez", "clopez@ejemplo.com", "1987-12-17")