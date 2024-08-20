-- Trabajo Practico 1 - Base de Datos I - TUIA C2

-- Previgliano, Marco
-- Demarre, Lucas
-- Donnarumma, Cesar

-- Para realizar la carga de los datos de la base de datos seleccionar desde la linea 12 a la 1062
-- y presionar F5

-- 2) Escriba las instrucciones SQL para la creacion de las tablas correspondientes al diagrama.

CREATE DATABASE cinema_paraiso;
GO
USE cinema_paraiso;

CREATE TABLE sucursal (
  id int IDENTITY(1,1) PRIMARY KEY,
  ciudad varchar(40) NOT NULL,
  );
  
CREATE TABLE sala(
  id int IDENTITY(1,1),
  id_sucursal int FOREIGN KEY REFERENCES sucursal(id),
  cantidad_butacas int NOT NULL,
  PRIMARY KEY(id, cantidad_butacas)
  );
 
CREATE TABLE pelicula(
  id int IDENTITY(1,1) PRIMARY KEY,
  nombre varchar(80) NOT NULL,
  atp bit NOT NULL,
  subtitulos bit NOT NULL,
  genero varchar(20) NOT NULL,
  );

CREATE TABLE funcion(
  id int IDENTITY(1,1) PRIMARY KEY,
  id_pelicula int,
  id_sala int NOT NULL,
  cantidad_butacas int NOT NULL,
  dia date NOT NULL,
  horario time NOT NULL 
  CONSTRAINT FK_funcion_pelicula FOREIGN KEY (id_pelicula)
  REFERENCES pelicula(id),
  CONSTRAINT FK_funcion_sala FOREIGN KEY (id_sala, cantidad_butacas)
  REFERENCES sala(id, cantidad_butacas),
  );

CREATE TABLE entrada(
	id_funcion int,
	nro_butaca int,
	vendida bit NOT NULL,
	id_sala int NOT NULL,
	maximo_butacas int NOT NULL,
	PRIMARY KEY (id_funcion, nro_butaca),
	CHECK (nro_butaca >= 1 AND nro_butaca <= maximo_butacas),
	CONSTRAINT FK_entrada_funcion FOREIGN KEY (id_funcion)
	REFERENCES funcion(id),
	CONSTRAINT FK_entrada_sala FOREIGN KEY (id_sala, maximo_butacas)
	REFERENCES sala(id, cantidad_butacas),
);

-- 3) Escriba instrucciones SQL para la insercion de datos, de modo de tener informacion sobre:
-- a. Las 3 sucursales existentes actualmente.

INSERT INTO sucursal VALUES ('Rosario');
INSERT INTO sucursal VALUES ('Cordoba');
INSERT INTO sucursal VALUES ('La Plata');

-- b. Al menos 3 salas por sucursal.
-- c. Al menos 20 butacas por sala.

INSERT INTO sala VALUES (1, 20);
INSERT INTO sala VALUES (1, 25);
INSERT INTO sala VALUES (1, 30);

INSERT INTO sala VALUES (2, 20);
INSERT INTO sala VALUES (2, 25);
INSERT INTO sala VALUES (2, 30);

INSERT INTO sala VALUES (3, 20);
INSERT INTO sala VALUES (3, 25);
INSERT INTO sala VALUES (3, 30);

-- d. Al menos 5 peliculas (una de ellas es Argentina, 1985, y otra de ellas es de genero ciencia
-- ficcion).

INSERT INTO pelicula VALUES ('Argentina, 1985', 0, 0, 'Historia');
INSERT INTO pelicula VALUES ('Terminator 2', 0, 1, 'Ciencia Ficcion');
INSERT INTO pelicula VALUES ('Eterno resplandor de una mente sin recuerdo', 0, 1, 'Drama');
INSERT INTO pelicula VALUES ('La otra Bolena', 0, 1, 'Drama');
INSERT INTO pelicula VALUES ('Lost in translation', 1, 1, 'Drama');
INSERT INTO pelicula VALUES ('Matrix', 0, 1, 'Ciencia Ficcion');
INSERT INTO pelicula VALUES ('Jurassic Park', 0, 1, 'Ciencia Ficcion');
INSERT INTO pelicula VALUES ('Avatar', 0, 1, 'Ciencia Ficcion');
INSERT INTO pelicula VALUES ('Match Point', 0, 1, 'Drama');
INSERT INTO pelicula VALUES ('El camino hacia el dorado', 1, 0, 'Aventura');

-- e) Al menos 5 funciones (algunas de ellas deben ocurrir entre el 24 y el 31 de octubre de
-- 2022).

-- Seguida a la inserccion de cada funcion se insertan los datos correspondientes a las entradas (sea
-- que esten vendidas o no)

INSERT INTO funcion VALUES (1, 1, 20, '2022-10-24', '21:30');
INSERT INTO entrada VALUES (1, 1, 0, 1, 20);
INSERT INTO entrada VALUES (1, 2, 1, 1, 20);
INSERT INTO entrada VALUES (1, 3, 0, 1, 20);
INSERT INTO entrada VALUES (1, 4, 0, 1, 20);
INSERT INTO entrada VALUES (1, 5, 0, 1, 20);
INSERT INTO entrada VALUES (1, 6, 0, 1, 20);
INSERT INTO entrada VALUES (1, 7, 1, 1, 20);
INSERT INTO entrada VALUES (1, 8, 1, 1, 20);
INSERT INTO entrada VALUES (1, 9, 1, 1, 20);
INSERT INTO entrada VALUES (1, 10, 0, 1, 20);
INSERT INTO entrada VALUES (1, 11, 1, 1, 20);
INSERT INTO entrada VALUES (1, 12, 1, 1, 20);
INSERT INTO entrada VALUES (1, 13, 0, 1, 20);
INSERT INTO entrada VALUES (1, 14, 0, 1, 20);
INSERT INTO entrada VALUES (1, 15, 0, 1, 20);
INSERT INTO entrada VALUES (1, 16, 1, 1, 20);
INSERT INTO entrada VALUES (1, 17, 1, 1, 20);
INSERT INTO entrada VALUES (1, 18, 0, 1, 20);
INSERT INTO entrada VALUES (1, 19, 1, 1, 20);
INSERT INTO entrada VALUES (1, 20, 0, 1, 20);

INSERT INTO funcion VALUES (1, 1, 20, '2022-10-24', '23:00');
INSERT INTO entrada VALUES (2, 1, 0, 1, 20);
INSERT INTO entrada VALUES (2, 2, 0, 1, 20);
INSERT INTO entrada VALUES (2, 3, 1, 1, 20);
INSERT INTO entrada VALUES (2, 4, 1, 1, 20);
INSERT INTO entrada VALUES (2, 5, 0, 1, 20);
INSERT INTO entrada VALUES (2, 6, 0, 1, 20);
INSERT INTO entrada VALUES (2, 7, 1, 1, 20);
INSERT INTO entrada VALUES (2, 8, 0, 1, 20);
INSERT INTO entrada VALUES (2, 9, 0, 1, 20);
INSERT INTO entrada VALUES (2, 10, 0, 1, 20);
INSERT INTO entrada VALUES (2, 11, 0, 1, 20);
INSERT INTO entrada VALUES (2, 12, 0, 1, 20);
INSERT INTO entrada VALUES (2, 13, 1, 1, 20);
INSERT INTO entrada VALUES (2, 14, 0, 1, 20);
INSERT INTO entrada VALUES (2, 15, 0, 1, 20);
INSERT INTO entrada VALUES (2, 16, 0, 1, 20);
INSERT INTO entrada VALUES (2, 17, 0, 1, 20);
INSERT INTO entrada VALUES (2, 18, 0, 1, 20);
INSERT INTO entrada VALUES (2, 19, 0, 1, 20);
INSERT INTO entrada VALUES (2, 20, 0, 1, 20);

INSERT INTO funcion VALUES (1, 1, 20, '2022-10-24', '01:00');
INSERT INTO entrada VALUES (3, 1, 0, 1, 20);
INSERT INTO entrada VALUES (3, 2, 0, 1, 20);
INSERT INTO entrada VALUES (3, 3, 0, 1, 20);
INSERT INTO entrada VALUES (3, 4, 0, 1, 20);
INSERT INTO entrada VALUES (3, 5, 0, 1, 20);
INSERT INTO entrada VALUES (3, 6, 1, 1, 20);
INSERT INTO entrada VALUES (3, 7, 1, 1, 20);
INSERT INTO entrada VALUES (3, 8, 1, 1, 20);
INSERT INTO entrada VALUES (3, 9, 0, 1, 20);
INSERT INTO entrada VALUES (3, 10, 0, 1, 20);
INSERT INTO entrada VALUES (3, 11, 0, 1, 20);
INSERT INTO entrada VALUES (3, 12, 0, 1, 20);
INSERT INTO entrada VALUES (3, 13, 0, 1, 20);
INSERT INTO entrada VALUES (3, 14, 0, 1, 20);
INSERT INTO entrada VALUES (3, 15, 0, 1, 20);
INSERT INTO entrada VALUES (3, 16, 0, 1, 20);
INSERT INTO entrada VALUES (3, 17, 0, 1, 20);
INSERT INTO entrada VALUES (3, 18, 0, 1, 20);
INSERT INTO entrada VALUES (3, 19, 0, 1, 20);
INSERT INTO entrada VALUES (3, 20, 0, 1, 20);

INSERT INTO funcion VALUES (1, 2, 25, '2022-10-24', '21:30');
INSERT INTO entrada VALUES (4, 1, 1, 2, 25);
INSERT INTO entrada VALUES (4, 2, 1, 2, 25);
INSERT INTO entrada VALUES (4, 3, 0, 2, 25);
INSERT INTO entrada VALUES (4, 4, 1, 2, 25);
INSERT INTO entrada VALUES (4, 5, 0, 2, 25);
INSERT INTO entrada VALUES (4, 6, 1, 2, 25);
INSERT INTO entrada VALUES (4, 7, 1, 2, 25);
INSERT INTO entrada VALUES (4, 8, 0, 2, 25);
INSERT INTO entrada VALUES (4, 9, 1, 2, 25);
INSERT INTO entrada VALUES (4, 10, 1, 2, 25);
INSERT INTO entrada VALUES (4, 11, 0, 2, 25);
INSERT INTO entrada VALUES (4, 12, 0, 2, 25);
INSERT INTO entrada VALUES (4, 13, 1, 2, 25);
INSERT INTO entrada VALUES (4, 14, 1, 2, 25);
INSERT INTO entrada VALUES (4, 15, 1, 2, 25);
INSERT INTO entrada VALUES (4, 16, 1, 2, 25);
INSERT INTO entrada VALUES (4, 17, 0, 2, 25);
INSERT INTO entrada VALUES (4, 18, 1, 2, 25);
INSERT INTO entrada VALUES (4, 19, 1, 2, 25);
INSERT INTO entrada VALUES (4, 20, 0, 2, 25);
INSERT INTO entrada VALUES (4, 21, 0, 2, 25);
INSERT INTO entrada VALUES (4, 22, 1, 2, 25);
INSERT INTO entrada VALUES (4, 23, 1, 2, 25);
INSERT INTO entrada VALUES (4, 24, 1, 2, 25);
INSERT INTO entrada VALUES (4, 25, 0, 2, 25);

INSERT INTO funcion VALUES (1, 2, 25, '2022-10-24', '23:00');
INSERT INTO entrada VALUES (5, 1, 0, 2, 25);
INSERT INTO entrada VALUES (5, 2, 0, 2, 25);
INSERT INTO entrada VALUES (5, 3, 0, 2, 25);
INSERT INTO entrada VALUES (5, 4, 1, 2, 25);
INSERT INTO entrada VALUES (5, 5, 0, 2, 25);
INSERT INTO entrada VALUES (5, 6, 1, 2, 25);
INSERT INTO entrada VALUES (5, 7, 1, 2, 25);
INSERT INTO entrada VALUES (5, 8, 1, 2, 25);
INSERT INTO entrada VALUES (5, 9, 1, 2, 25);
INSERT INTO entrada VALUES (5, 10, 1, 2, 25);
INSERT INTO entrada VALUES (5, 11, 0, 2, 25);
INSERT INTO entrada VALUES (5, 12, 0, 2, 25);
INSERT INTO entrada VALUES (5, 13, 1, 2, 25);
INSERT INTO entrada VALUES (5, 14, 1, 2, 25);
INSERT INTO entrada VALUES (5, 15, 0, 2, 25);
INSERT INTO entrada VALUES (5, 16, 1, 2, 25);
INSERT INTO entrada VALUES (5, 17, 0, 2, 25);
INSERT INTO entrada VALUES (5, 18, 1, 2, 25);
INSERT INTO entrada VALUES (5, 19, 0, 2, 25);
INSERT INTO entrada VALUES (5, 20, 0, 2, 25);
INSERT INTO entrada VALUES (5, 21, 0, 2, 25);
INSERT INTO entrada VALUES (5, 22, 1, 2, 25);
INSERT INTO entrada VALUES (5, 23, 0, 2, 25);
INSERT INTO entrada VALUES (5, 24, 1, 2, 25);
INSERT INTO entrada VALUES (5, 25, 1, 2, 25);

INSERT INTO funcion VALUES (1, 4, 20, '2022-10-24', '21:00');
INSERT INTO entrada VALUES (6, 1, 1, 4, 20);
INSERT INTO entrada VALUES (6, 2, 1, 4, 20);
INSERT INTO entrada VALUES (6, 3, 0, 4, 20);
INSERT INTO entrada VALUES (6, 4, 0, 4, 20);
INSERT INTO entrada VALUES (6, 5, 0, 4, 20);
INSERT INTO entrada VALUES (6, 6, 1, 4, 20);
INSERT INTO entrada VALUES (6, 7, 0, 4, 20);
INSERT INTO entrada VALUES (6, 8, 1, 4, 20);
INSERT INTO entrada VALUES (6, 9, 1, 4, 20);
INSERT INTO entrada VALUES (6, 10, 1, 4, 20);
INSERT INTO entrada VALUES (6, 11, 0, 4, 20);
INSERT INTO entrada VALUES (6, 12, 1, 4, 20);
INSERT INTO entrada VALUES (6, 13, 1, 4, 20);
INSERT INTO entrada VALUES (6, 14, 1, 4, 20);
INSERT INTO entrada VALUES (6, 15, 1, 4, 20);
INSERT INTO entrada VALUES (6, 16, 0, 4, 20);
INSERT INTO entrada VALUES (6, 17, 1, 4, 20);
INSERT INTO entrada VALUES (6, 18, 1, 4, 20);
INSERT INTO entrada VALUES (6, 19, 1, 4, 20);
INSERT INTO entrada VALUES (6, 20, 1, 4, 20);

INSERT INTO funcion VALUES (1, 4, 20, '2022-10-24', '23:00');
INSERT INTO entrada VALUES (7, 1, 0, 4, 20);
INSERT INTO entrada VALUES (7, 2, 0, 4, 20);
INSERT INTO entrada VALUES (7, 3, 0, 4, 20);
INSERT INTO entrada VALUES (7, 4, 1, 4, 20);
INSERT INTO entrada VALUES (7, 5, 0, 4, 20);
INSERT INTO entrada VALUES (7, 6, 0, 4, 20);
INSERT INTO entrada VALUES (7, 7, 0, 4, 20);
INSERT INTO entrada VALUES (7, 8, 0, 4, 20);
INSERT INTO entrada VALUES (7, 9, 1, 4, 20);
INSERT INTO entrada VALUES (7, 10, 0, 4, 20);
INSERT INTO entrada VALUES (7, 11, 0, 4, 20);
INSERT INTO entrada VALUES (7, 12, 1, 4, 20);
INSERT INTO entrada VALUES (7, 13, 0, 4, 20);
INSERT INTO entrada VALUES (7, 14, 1, 4, 20);
INSERT INTO entrada VALUES (7, 15, 1, 4, 20);
INSERT INTO entrada VALUES (7, 16, 0, 4, 20);
INSERT INTO entrada VALUES (7, 17, 1, 4, 20);
INSERT INTO entrada VALUES (7, 18, 1, 4, 20);
INSERT INTO entrada VALUES (7, 19, 1, 4, 20);
INSERT INTO entrada VALUES (7, 20, 1, 4, 20);

INSERT INTO funcion VALUES (1, 4, 20, '2022-10-24', '00:30');
INSERT INTO entrada VALUES (8, 1, 0, 4, 20);
INSERT INTO entrada VALUES (8, 2, 0, 4, 20);
INSERT INTO entrada VALUES (8, 3, 0, 4, 20);
INSERT INTO entrada VALUES (8, 4, 0, 4, 20);
INSERT INTO entrada VALUES (8, 5, 0, 4, 20);
INSERT INTO entrada VALUES (8, 6, 0, 4, 20);
INSERT INTO entrada VALUES (8, 7, 0, 4, 20);
INSERT INTO entrada VALUES (8, 8, 0, 4, 20);
INSERT INTO entrada VALUES (8, 9, 1, 4, 20);
INSERT INTO entrada VALUES (8, 10, 1, 4, 20);
INSERT INTO entrada VALUES (8, 11, 0, 4, 20);
INSERT INTO entrada VALUES (8, 12, 1, 4, 20);
INSERT INTO entrada VALUES (8, 13, 0, 4, 20);
INSERT INTO entrada VALUES (8, 14, 0, 4, 20);
INSERT INTO entrada VALUES (8, 15, 0, 4, 20);
INSERT INTO entrada VALUES (8, 16, 0, 4, 20);
INSERT INTO entrada VALUES (8, 17, 0, 4, 20);
INSERT INTO entrada VALUES (8, 18, 0, 4, 20);
INSERT INTO entrada VALUES (8, 19, 0, 4, 20);
INSERT INTO entrada VALUES (8, 20, 0, 4, 20);

INSERT INTO funcion VALUES (1, 6, 30, '2022-10-24', '21:00');
INSERT INTO entrada VALUES (9, 1, 1, 6, 30);
INSERT INTO entrada VALUES (9, 2, 1, 6, 30);
INSERT INTO entrada VALUES (9, 3, 0, 6, 30);
INSERT INTO entrada VALUES (9, 4, 1, 6, 30);
INSERT INTO entrada VALUES (9, 5, 0, 6, 30);
INSERT INTO entrada VALUES (9, 6, 1, 6, 30);
INSERT INTO entrada VALUES (9, 7, 1, 6, 30);
INSERT INTO entrada VALUES (9, 8, 1, 6, 30);
INSERT INTO entrada VALUES (9, 9, 1, 6, 30);
INSERT INTO entrada VALUES (9, 10, 1, 6, 30);
INSERT INTO entrada VALUES (9, 11, 0, 6, 30);
INSERT INTO entrada VALUES (9, 12, 1, 6, 30);
INSERT INTO entrada VALUES (9, 13, 0, 6, 30);
INSERT INTO entrada VALUES (9, 14, 1, 6, 30);
INSERT INTO entrada VALUES (9, 15, 0, 6, 30);
INSERT INTO entrada VALUES (9, 16, 1, 6, 30);
INSERT INTO entrada VALUES (9, 17, 0, 6, 30);
INSERT INTO entrada VALUES (9, 18, 1, 6, 30);
INSERT INTO entrada VALUES (9, 19, 0, 6, 30);
INSERT INTO entrada VALUES (9, 20, 0, 6, 30);
INSERT INTO entrada VALUES (9, 21, 1, 6, 30);
INSERT INTO entrada VALUES (9, 22, 1, 6, 30);
INSERT INTO entrada VALUES (9, 23, 0, 6, 30);
INSERT INTO entrada VALUES (9, 24, 1, 6, 30);
INSERT INTO entrada VALUES (9, 25, 1, 6, 30);
INSERT INTO entrada VALUES (9, 26, 0, 6, 30);
INSERT INTO entrada VALUES (9, 27, 1, 6, 30);
INSERT INTO entrada VALUES (9, 28, 1, 6, 30);
INSERT INTO entrada VALUES (9, 29, 1, 6, 30);
INSERT INTO entrada VALUES (9, 30, 1, 6, 30);

INSERT INTO funcion VALUES (1, 6, 30, '2022-10-24', '23:00');
INSERT INTO entrada VALUES (10, 1, 0, 6, 30);
INSERT INTO entrada VALUES (10, 2, 0, 6, 30);
INSERT INTO entrada VALUES (10, 3, 0, 6, 30);
INSERT INTO entrada VALUES (10, 4, 1, 6, 30);
INSERT INTO entrada VALUES (10, 5, 0, 6, 30);
INSERT INTO entrada VALUES (10, 6, 1, 6, 30);
INSERT INTO entrada VALUES (10, 7, 0, 6, 30);
INSERT INTO entrada VALUES (10, 8, 0, 6, 30);
INSERT INTO entrada VALUES (10, 9, 1, 6, 30);
INSERT INTO entrada VALUES (10, 10, 1, 6, 30);
INSERT INTO entrada VALUES (10, 11, 0, 6, 30);
INSERT INTO entrada VALUES (10, 12, 1, 6, 30);
INSERT INTO entrada VALUES (10, 13, 0, 6, 30);
INSERT INTO entrada VALUES (10, 14, 1, 6, 30);
INSERT INTO entrada VALUES (10, 15, 0, 6, 30);
INSERT INTO entrada VALUES (10, 16, 0, 6, 30);
INSERT INTO entrada VALUES (10, 17, 0, 6, 30);
INSERT INTO entrada VALUES (10, 18, 0, 6, 30);
INSERT INTO entrada VALUES (10, 19, 0, 6, 30);
INSERT INTO entrada VALUES (10, 20, 0, 6, 30);
INSERT INTO entrada VALUES (10, 21, 1, 6, 30);
INSERT INTO entrada VALUES (10, 22, 1, 6, 30);
INSERT INTO entrada VALUES (10, 23, 0, 6, 30);
INSERT INTO entrada VALUES (10, 24, 1, 6, 30);
INSERT INTO entrada VALUES (10, 25, 0, 6, 30);
INSERT INTO entrada VALUES (10, 26, 0, 6, 30);
INSERT INTO entrada VALUES (10, 27, 1, 6, 30);
INSERT INTO entrada VALUES (10, 28, 1, 6, 30);
INSERT INTO entrada VALUES (10, 29, 1, 6, 30);
INSERT INTO entrada VALUES (10, 30, 0, 6, 30);

INSERT INTO funcion VALUES (1, 6, 30, '2022-10-24', '00:30');
INSERT INTO entrada VALUES (11, 1, 1, 6, 30);
INSERT INTO entrada VALUES (11, 2, 0, 6, 30);
INSERT INTO entrada VALUES (11, 3, 1, 6, 30);
INSERT INTO entrada VALUES (11, 4, 0, 6, 30);
INSERT INTO entrada VALUES (11, 5, 0, 6, 30);
INSERT INTO entrada VALUES (11, 6, 0, 6, 30);
INSERT INTO entrada VALUES (11, 7, 0, 6, 30);
INSERT INTO entrada VALUES (11, 8, 0, 6, 30);
INSERT INTO entrada VALUES (11, 9, 0, 6, 30);
INSERT INTO entrada VALUES (11, 10, 0, 6, 30);
INSERT INTO entrada VALUES (11, 11, 0, 6, 30);
INSERT INTO entrada VALUES (11, 12, 1, 6, 30);
INSERT INTO entrada VALUES (11, 13, 0, 6, 30);
INSERT INTO entrada VALUES (11, 14, 0, 6, 30);
INSERT INTO entrada VALUES (11, 15, 1, 6, 30);
INSERT INTO entrada VALUES (11, 16, 0, 6, 30);
INSERT INTO entrada VALUES (11, 17, 1, 6, 30);
INSERT INTO entrada VALUES (11, 18, 0, 6, 30);
INSERT INTO entrada VALUES (11, 19, 0, 6, 30);
INSERT INTO entrada VALUES (11, 20, 0, 6, 30);
INSERT INTO entrada VALUES (11, 21, 0, 6, 30);
INSERT INTO entrada VALUES (11, 22, 1, 6, 30);
INSERT INTO entrada VALUES (11, 23, 0, 6, 30);
INSERT INTO entrada VALUES (11, 24, 0, 6, 30);
INSERT INTO entrada VALUES (11, 25, 0, 6, 30);
INSERT INTO entrada VALUES (11, 26, 0, 6, 30);
INSERT INTO entrada VALUES (11, 27, 0, 6, 30);
INSERT INTO entrada VALUES (11, 28, 0, 6, 30);
INSERT INTO entrada VALUES (11, 29, 0, 6, 30);
INSERT INTO entrada VALUES (11, 30, 0, 6, 30);

INSERT INTO funcion VALUES (1, 8, 25, '2022-10-24', '19:00');
INSERT INTO entrada VALUES (12, 1, 1, 8, 25);
INSERT INTO entrada VALUES (12, 2, 1, 8, 25);
INSERT INTO entrada VALUES (12, 3, 1, 8, 25);
INSERT INTO entrada VALUES (12, 4, 0, 8, 25);
INSERT INTO entrada VALUES (12, 5, 1, 8, 25);
INSERT INTO entrada VALUES (12, 6, 1, 8, 25);
INSERT INTO entrada VALUES (12, 7, 1, 8, 25);
INSERT INTO entrada VALUES (12, 8, 1, 8, 25);
INSERT INTO entrada VALUES (12, 9, 1, 8, 25);
INSERT INTO entrada VALUES (12, 10, 0, 8, 25);
INSERT INTO entrada VALUES (12, 11, 0, 8, 25);
INSERT INTO entrada VALUES (12, 12, 1, 8, 25);
INSERT INTO entrada VALUES (12, 13, 0, 8, 25);
INSERT INTO entrada VALUES (12, 14, 1, 8, 25);
INSERT INTO entrada VALUES (12, 15, 1, 8, 25);
INSERT INTO entrada VALUES (12, 16, 0, 8, 25);
INSERT INTO entrada VALUES (12, 17, 1, 8, 25);
INSERT INTO entrada VALUES (12, 18, 0, 8, 25);
INSERT INTO entrada VALUES (12, 19, 0, 8, 25);
INSERT INTO entrada VALUES (12, 20, 0, 8, 25);
INSERT INTO entrada VALUES (12, 21, 0, 8, 25);
INSERT INTO entrada VALUES (12, 22, 1, 8, 25);
INSERT INTO entrada VALUES (12, 23, 0, 8, 25);
INSERT INTO entrada VALUES (12, 24, 1, 8, 25);
INSERT INTO entrada VALUES (12, 25, 0, 8, 25);

INSERT INTO funcion VALUES (5, 9, 30, '2022-10-25', '22:00');
INSERT INTO entrada VALUES (13, 1, 0, 9, 30);
INSERT INTO entrada VALUES (13, 2, 1, 9, 30);
INSERT INTO entrada VALUES (13, 3, 1, 9, 30);
INSERT INTO entrada VALUES (13, 4, 0, 9, 30);
INSERT INTO entrada VALUES (13, 5, 0, 9, 30);
INSERT INTO entrada VALUES (13, 6, 0, 9, 30);
INSERT INTO entrada VALUES (13, 7, 0, 9, 30);
INSERT INTO entrada VALUES (13, 8, 1, 9, 30);
INSERT INTO entrada VALUES (13, 9, 1, 9, 30);
INSERT INTO entrada VALUES (13, 10, 0, 9, 30);
INSERT INTO entrada VALUES (13, 11, 0, 9, 30);
INSERT INTO entrada VALUES (13, 12, 1, 9, 30);
INSERT INTO entrada VALUES (13, 13, 1, 9, 30);
INSERT INTO entrada VALUES (13, 14, 0, 9, 30);
INSERT INTO entrada VALUES (13, 15, 0, 9, 30);
INSERT INTO entrada VALUES (13, 16, 1, 9, 30);
INSERT INTO entrada VALUES (13, 17, 1, 9, 30);
INSERT INTO entrada VALUES (13, 18, 0, 9, 30);
INSERT INTO entrada VALUES (13, 19, 0, 9, 30);
INSERT INTO entrada VALUES (13, 20, 0, 9, 30);
INSERT INTO entrada VALUES (13, 21, 0, 9, 30);
INSERT INTO entrada VALUES (13, 22, 0, 9, 30);
INSERT INTO entrada VALUES (13, 23, 0, 9, 30);
INSERT INTO entrada VALUES (13, 24, 0, 9, 30);
INSERT INTO entrada VALUES (13, 25, 0, 9, 30);
INSERT INTO entrada VALUES (13, 26, 0, 9, 30);
INSERT INTO entrada VALUES (13, 27, 1, 9, 30);
INSERT INTO entrada VALUES (13, 28, 1, 9, 30);
INSERT INTO entrada VALUES (13, 29, 0, 9, 30);
INSERT INTO entrada VALUES (13, 30, 0, 9, 30);

INSERT INTO funcion VALUES (7, 1, 20, '2022-10-25', '21:30');
INSERT INTO entrada VALUES (14, 1, 1, 1, 20);
INSERT INTO entrada VALUES (14, 2, 1, 1, 20);
INSERT INTO entrada VALUES (14, 3, 1, 1, 20);
INSERT INTO entrada VALUES (14, 4, 0, 1, 20);
INSERT INTO entrada VALUES (14, 5, 0, 1, 20);
INSERT INTO entrada VALUES (14, 6, 1, 1, 20);
INSERT INTO entrada VALUES (14, 7, 1, 1, 20);
INSERT INTO entrada VALUES (14, 8, 1, 1, 20);
INSERT INTO entrada VALUES (14, 9, 0, 1, 20);
INSERT INTO entrada VALUES (14, 10, 1, 1, 20);
INSERT INTO entrada VALUES (14, 11, 1, 1, 20);
INSERT INTO entrada VALUES (14, 12, 0, 1, 20);
INSERT INTO entrada VALUES (14, 13, 1, 1, 20);
INSERT INTO entrada VALUES (14, 14, 1, 1, 20);
INSERT INTO entrada VALUES (14, 15, 1, 1, 20);
INSERT INTO entrada VALUES (14, 16, 1, 1, 20);
INSERT INTO entrada VALUES (14, 17, 1, 1, 20);
INSERT INTO entrada VALUES (14, 18, 1, 1, 20);
INSERT INTO entrada VALUES (14, 19, 1, 1, 20);
INSERT INTO entrada VALUES (14, 20, 1, 1, 20);

INSERT INTO funcion VALUES (7, 1, 20, '2022-10-25', '23:00');
INSERT INTO entrada VALUES (15, 1, 0, 1, 20);
INSERT INTO entrada VALUES (15, 2, 0, 1, 20);
INSERT INTO entrada VALUES (15, 3, 1, 1, 20);
INSERT INTO entrada VALUES (15, 4, 1, 1, 20);
INSERT INTO entrada VALUES (15, 5, 0, 1, 20);
INSERT INTO entrada VALUES (15, 6, 0, 1, 20);
INSERT INTO entrada VALUES (15, 7, 0, 1, 20);
INSERT INTO entrada VALUES (15, 8, 1, 1, 20);
INSERT INTO entrada VALUES (15, 9, 0, 1, 20);
INSERT INTO entrada VALUES (15, 10, 1, 1, 20);
INSERT INTO entrada VALUES (15, 11, 1, 1, 20);
INSERT INTO entrada VALUES (15, 12, 1, 1, 20);
INSERT INTO entrada VALUES (15, 13, 1, 1, 20);
INSERT INTO entrada VALUES (15, 14, 1, 1, 20);
INSERT INTO entrada VALUES (15, 15, 0, 1, 20);
INSERT INTO entrada VALUES (15, 16, 0, 1, 20);
INSERT INTO entrada VALUES (15, 17, 1, 1, 20);
INSERT INTO entrada VALUES (15, 18, 0, 1, 20);
INSERT INTO entrada VALUES (15, 19, 1, 1, 20);
INSERT INTO entrada VALUES (15, 20, 0, 1, 20);

INSERT INTO funcion VALUES (7, 1, 20, '2022-10-25', '00:30');
INSERT INTO entrada VALUES (16, 1, 0, 1, 20);
INSERT INTO entrada VALUES (16, 2, 0, 1, 20);
INSERT INTO entrada VALUES (16, 3, 0, 1, 20);
INSERT INTO entrada VALUES (16, 4, 1, 1, 20);
INSERT INTO entrada VALUES (16, 5, 0, 1, 20);
INSERT INTO entrada VALUES (16, 6, 1, 1, 20);
INSERT INTO entrada VALUES (16, 7, 0, 1, 20);
INSERT INTO entrada VALUES (16, 8, 1, 1, 20);
INSERT INTO entrada VALUES (16, 9, 0, 1, 20);
INSERT INTO entrada VALUES (16, 10, 1, 1, 20);
INSERT INTO entrada VALUES (16, 11, 0, 1, 20);
INSERT INTO entrada VALUES (16, 12, 0, 1, 20);
INSERT INTO entrada VALUES (16, 13, 0, 1, 20);
INSERT INTO entrada VALUES (16, 14, 1, 1, 20);
INSERT INTO entrada VALUES (16, 15, 0, 1, 20);
INSERT INTO entrada VALUES (16, 16, 0, 1, 20);
INSERT INTO entrada VALUES (16, 17, 1, 1, 20);
INSERT INTO entrada VALUES (16, 18, 0, 1, 20);
INSERT INTO entrada VALUES (16, 19, 0, 1, 20);
INSERT INTO entrada VALUES (16, 20, 0, 1, 20);

INSERT INTO funcion VALUES (2, 5, 25, '2022-10-26', '23:30');
INSERT INTO entrada VALUES (17, 1, 0, 5, 25);
INSERT INTO entrada VALUES (17, 2, 1, 5, 25);
INSERT INTO entrada VALUES (17, 3, 1, 5, 25);
INSERT INTO entrada VALUES (17, 4, 0, 5, 25);
INSERT INTO entrada VALUES (17, 5, 1, 5, 25);
INSERT INTO entrada VALUES (17, 6, 1, 5, 25);
INSERT INTO entrada VALUES (17, 7, 0, 5, 25);
INSERT INTO entrada VALUES (17, 8, 1, 5, 25);
INSERT INTO entrada VALUES (17, 9, 1, 5, 25);
INSERT INTO entrada VALUES (17, 10, 0, 5, 25);
INSERT INTO entrada VALUES (17, 11, 0, 5, 25);
INSERT INTO entrada VALUES (17, 12, 1, 5, 25);
INSERT INTO entrada VALUES (17, 13, 1, 5, 25);
INSERT INTO entrada VALUES (17, 14, 1, 5, 25);
INSERT INTO entrada VALUES (17, 15, 1, 5, 25);
INSERT INTO entrada VALUES (17, 16, 0, 5, 25);
INSERT INTO entrada VALUES (17, 17, 1, 5, 25);
INSERT INTO entrada VALUES (17, 18, 1, 5, 25);
INSERT INTO entrada VALUES (17, 19, 1, 5, 25);
INSERT INTO entrada VALUES (17, 20, 0, 5, 25);
INSERT INTO entrada VALUES (17, 21, 0, 5, 25);
INSERT INTO entrada VALUES (17, 22, 1, 5, 25);
INSERT INTO entrada VALUES (17, 23, 0, 5, 25);
INSERT INTO entrada VALUES (17, 24, 1, 5, 25);
INSERT INTO entrada VALUES (17, 25, 0, 5, 25);

INSERT INTO funcion VALUES (2, 7, 20, '2022-10-26', '21:15');
INSERT INTO entrada VALUES (18, 1, 1, 7, 20);
INSERT INTO entrada VALUES (18, 2, 1, 7, 20);
INSERT INTO entrada VALUES (18, 3, 1, 7, 20);
INSERT INTO entrada VALUES (18, 4, 1, 7, 20);
INSERT INTO entrada VALUES (18, 5, 1, 7, 20);
INSERT INTO entrada VALUES (18, 6, 0, 7, 20);
INSERT INTO entrada VALUES (18, 7, 0, 7, 20);
INSERT INTO entrada VALUES (18, 8, 1, 7, 20);
INSERT INTO entrada VALUES (18, 9, 1, 7, 20);
INSERT INTO entrada VALUES (18, 10, 1, 7, 20);
INSERT INTO entrada VALUES (18, 11, 0, 7, 20);
INSERT INTO entrada VALUES (18, 12, 1, 7, 20);
INSERT INTO entrada VALUES (18, 13, 1, 7, 20);
INSERT INTO entrada VALUES (18, 14, 0, 7, 20);
INSERT INTO entrada VALUES (18, 15, 1, 7, 20);
INSERT INTO entrada VALUES (18, 16, 1, 7, 20);
INSERT INTO entrada VALUES (18, 17, 1, 7, 20);
INSERT INTO entrada VALUES (18, 18, 1, 7, 20);
INSERT INTO entrada VALUES (18, 19, 1, 7, 20);
INSERT INTO entrada VALUES (18, 20, 1, 7, 20);

INSERT INTO funcion VALUES (6, 3, 30, '2022-10-27', '21:30');
INSERT INTO entrada VALUES (19, 1, 1, 3, 30);
INSERT INTO entrada VALUES (19, 2, 1, 3, 30);
INSERT INTO entrada VALUES (19, 3, 0, 3, 30);
INSERT INTO entrada VALUES (19, 4, 0, 3, 30);
INSERT INTO entrada VALUES (19, 5, 1, 3, 30);
INSERT INTO entrada VALUES (19, 6, 1, 3, 30);
INSERT INTO entrada VALUES (19, 7, 0, 3, 30);
INSERT INTO entrada VALUES (19, 8, 1, 3, 30);
INSERT INTO entrada VALUES (19, 9, 1, 3, 30);
INSERT INTO entrada VALUES (19, 10, 0, 3, 30);
INSERT INTO entrada VALUES (19, 11, 0, 3, 30);
INSERT INTO entrada VALUES (19, 12, 1, 3, 30);
INSERT INTO entrada VALUES (19, 13, 1, 3, 30);
INSERT INTO entrada VALUES (19, 14, 0, 3, 30);
INSERT INTO entrada VALUES (19, 15, 0, 3, 30);
INSERT INTO entrada VALUES (19, 16, 0, 3, 30);
INSERT INTO entrada VALUES (19, 17, 1, 3, 30);
INSERT INTO entrada VALUES (19, 18, 0, 3, 30);
INSERT INTO entrada VALUES (19, 19, 0, 3, 30);
INSERT INTO entrada VALUES (19, 20, 0, 3, 30);
INSERT INTO entrada VALUES (19, 21, 0, 3, 30);
INSERT INTO entrada VALUES (19, 22, 0, 3, 30);
INSERT INTO entrada VALUES (19, 23, 1, 3, 30);
INSERT INTO entrada VALUES (19, 24, 1, 3, 30);
INSERT INTO entrada VALUES (19, 25, 0, 3, 30);
INSERT INTO entrada VALUES (19, 26, 0, 3, 30);
INSERT INTO entrada VALUES (19, 27, 1, 3, 30);
INSERT INTO entrada VALUES (19, 28, 1, 3, 30);
INSERT INTO entrada VALUES (19, 29, 0, 3, 30);
INSERT INTO entrada VALUES (19, 30, 0, 3, 30);

INSERT INTO funcion VALUES (6, 3, 30, '2022-10-27', '23:00');
INSERT INTO entrada VALUES (20, 1, 0, 3, 30);
INSERT INTO entrada VALUES (20, 2, 0, 3, 30);
INSERT INTO entrada VALUES (20, 3, 1, 3, 30);
INSERT INTO entrada VALUES (20, 4, 1, 3, 30);
INSERT INTO entrada VALUES (20, 5, 0, 3, 30);
INSERT INTO entrada VALUES (20, 6, 1, 3, 30);
INSERT INTO entrada VALUES (20, 7, 1, 3, 30);
INSERT INTO entrada VALUES (20, 8, 1, 3, 30);
INSERT INTO entrada VALUES (20, 9, 1, 3, 30);
INSERT INTO entrada VALUES (20, 10, 0, 3, 30);
INSERT INTO entrada VALUES (20, 11, 1, 3, 30);
INSERT INTO entrada VALUES (20, 12, 1, 3, 30);
INSERT INTO entrada VALUES (20, 13, 0, 3, 30);
INSERT INTO entrada VALUES (20, 14, 0, 3, 30);
INSERT INTO entrada VALUES (20, 15, 0, 3, 30);
INSERT INTO entrada VALUES (20, 16, 0, 3, 30);
INSERT INTO entrada VALUES (20, 17, 0, 3, 30);
INSERT INTO entrada VALUES (20, 18, 0, 3, 30);
INSERT INTO entrada VALUES (20, 19, 0, 3, 30);
INSERT INTO entrada VALUES (20, 20, 0, 3, 30);
INSERT INTO entrada VALUES (20, 21, 0, 3, 30);
INSERT INTO entrada VALUES (20, 22, 0, 3, 30);
INSERT INTO entrada VALUES (20, 23, 1, 3, 30);
INSERT INTO entrada VALUES (20, 24, 1, 3, 30);
INSERT INTO entrada VALUES (20, 25, 0, 3, 30);
INSERT INTO entrada VALUES (20, 26, 0, 3, 30);
INSERT INTO entrada VALUES (20, 27, 1, 3, 30);
INSERT INTO entrada VALUES (20, 28, 1, 3, 30);
INSERT INTO entrada VALUES (20, 29, 0, 3, 30);
INSERT INTO entrada VALUES (20, 30, 1, 3, 30);

INSERT INTO funcion VALUES (6, 3, 30, '2022-10-27', '00:30');
INSERT INTO entrada VALUES (21, 1, 1, 3, 30);
INSERT INTO entrada VALUES (21, 2, 0, 3, 30);
INSERT INTO entrada VALUES (21, 3, 0, 3, 30);
INSERT INTO entrada VALUES (21, 4, 0, 3, 30);
INSERT INTO entrada VALUES (21, 5, 0, 3, 30);
INSERT INTO entrada VALUES (21, 6, 1, 3, 30);
INSERT INTO entrada VALUES (21, 7, 0, 3, 30);
INSERT INTO entrada VALUES (21, 8, 1, 3, 30);
INSERT INTO entrada VALUES (21, 9, 0, 3, 30);
INSERT INTO entrada VALUES (21, 10, 1, 3, 30);
INSERT INTO entrada VALUES (21, 11, 0, 3, 30);
INSERT INTO entrada VALUES (21, 12, 0, 3, 30);
INSERT INTO entrada VALUES (21, 13, 0, 3, 30);
INSERT INTO entrada VALUES (21, 14, 0, 3, 30);
INSERT INTO entrada VALUES (21, 15, 0, 3, 30);
INSERT INTO entrada VALUES (21, 16, 0, 3, 30);
INSERT INTO entrada VALUES (21, 17, 0, 3, 30);
INSERT INTO entrada VALUES (21, 18, 1, 3, 30);
INSERT INTO entrada VALUES (21, 19, 0, 3, 30);
INSERT INTO entrada VALUES (21, 20, 0, 3, 30);
INSERT INTO entrada VALUES (21, 21, 0, 3, 30);
INSERT INTO entrada VALUES (21, 22, 0, 3, 30);
INSERT INTO entrada VALUES (21, 23, 0, 3, 30);
INSERT INTO entrada VALUES (21, 24, 1, 3, 30);
INSERT INTO entrada VALUES (21, 25, 0, 3, 30);
INSERT INTO entrada VALUES (21, 26, 1, 3, 30);
INSERT INTO entrada VALUES (21, 27, 1, 3, 30);
INSERT INTO entrada VALUES (21, 28, 0, 3, 30);
INSERT INTO entrada VALUES (21, 29, 0, 3, 30);
INSERT INTO entrada VALUES (21, 30, 0, 3, 30);

INSERT INTO funcion VALUES (3, 4, 20, '2022-10-27', '20:00');
INSERT INTO entrada VALUES (22, 1, 1, 4, 20);
INSERT INTO entrada VALUES (22, 2, 1, 4, 20);
INSERT INTO entrada VALUES (22, 3, 1, 4, 20);
INSERT INTO entrada VALUES (22, 4, 1, 4, 20);
INSERT INTO entrada VALUES (22, 5, 1, 4, 20);
INSERT INTO entrada VALUES (22, 6, 1, 4, 20);
INSERT INTO entrada VALUES (22, 7, 1, 4, 20);
INSERT INTO entrada VALUES (22, 8, 1, 4, 20);
INSERT INTO entrada VALUES (22, 9, 1, 4, 20);
INSERT INTO entrada VALUES (22, 10, 1, 4, 20);
INSERT INTO entrada VALUES (22, 11, 1, 4, 20);
INSERT INTO entrada VALUES (22, 12, 1, 4, 20);
INSERT INTO entrada VALUES (22, 13, 1, 4, 20);
INSERT INTO entrada VALUES (22, 14, 1, 4, 20);
INSERT INTO entrada VALUES (22, 15, 1, 4, 20);
INSERT INTO entrada VALUES (22, 16, 1, 4, 20);
INSERT INTO entrada VALUES (22, 17, 1, 4, 20);
INSERT INTO entrada VALUES (22, 18, 1, 4, 20);
INSERT INTO entrada VALUES (22, 19, 1, 4, 20);
INSERT INTO entrada VALUES (22, 20, 1, 4, 20);

INSERT INTO funcion VALUES (5, 4, 20, '2022-10-27', '23:30');
INSERT INTO entrada VALUES (23, 1, 0, 4, 20);
INSERT INTO entrada VALUES (23, 2, 0, 4, 20);
INSERT INTO entrada VALUES (23, 3, 0, 4, 20);
INSERT INTO entrada VALUES (23, 4, 1, 4, 20);
INSERT INTO entrada VALUES (23, 5, 0, 4, 20);
INSERT INTO entrada VALUES (23, 6, 1, 4, 20);
INSERT INTO entrada VALUES (23, 7, 0, 4, 20);
INSERT INTO entrada VALUES (23, 8, 1, 4, 20);
INSERT INTO entrada VALUES (23, 9, 1, 4, 20);
INSERT INTO entrada VALUES (23, 10, 1, 4, 20);
INSERT INTO entrada VALUES (23, 11, 1, 4, 20);
INSERT INTO entrada VALUES (23, 12, 1, 4, 20);
INSERT INTO entrada VALUES (23, 13, 0, 4, 20);
INSERT INTO entrada VALUES (23, 14, 1, 4, 20);
INSERT INTO entrada VALUES (23, 15, 1, 4, 20);
INSERT INTO entrada VALUES (23, 16, 1, 4, 20);
INSERT INTO entrada VALUES (23, 17, 0, 4, 20);
INSERT INTO entrada VALUES (23, 18, 1, 4, 20);
INSERT INTO entrada VALUES (23, 19, 1, 4, 20);
INSERT INTO entrada VALUES (23, 20, 1, 4, 20);

INSERT INTO funcion VALUES (4, 7, 20, '2022-10-28', '22:55');
INSERT INTO entrada VALUES (24, 1, 1, 7, 20);
INSERT INTO entrada VALUES (24, 2, 1, 7, 20);
INSERT INTO entrada VALUES (24, 3, 0, 7, 20);
INSERT INTO entrada VALUES (24, 4, 1, 7, 20);
INSERT INTO entrada VALUES (24, 5, 0, 7, 20);
INSERT INTO entrada VALUES (24, 6, 1, 7, 20);
INSERT INTO entrada VALUES (24, 7, 0, 7, 20);
INSERT INTO entrada VALUES (24, 8, 1, 7, 20);
INSERT INTO entrada VALUES (24, 9, 1, 7, 20);
INSERT INTO entrada VALUES (24, 10, 1, 7, 20);
INSERT INTO entrada VALUES (24, 11, 0, 7, 20);
INSERT INTO entrada VALUES (24, 12, 1, 7, 20);
INSERT INTO entrada VALUES (24, 13, 1, 7, 20);
INSERT INTO entrada VALUES (24, 14, 1, 7, 20);
INSERT INTO entrada VALUES (24, 15, 0, 7, 20);
INSERT INTO entrada VALUES (24, 16, 1, 7, 20);
INSERT INTO entrada VALUES (24, 17, 0, 7, 20);
INSERT INTO entrada VALUES (24, 18, 1, 7, 20);
INSERT INTO entrada VALUES (24, 19, 0, 7, 20);
INSERT INTO entrada VALUES (24, 20, 0, 7, 20);

INSERT INTO funcion VALUES (1, 8, 25, '2022-10-28', '23:00');
INSERT INTO entrada VALUES (25, 1, 0, 8, 25);
INSERT INTO entrada VALUES (25, 2, 1, 8, 25);
INSERT INTO entrada VALUES (25, 3, 1, 8, 25);
INSERT INTO entrada VALUES (25, 4, 1, 8, 25);
INSERT INTO entrada VALUES (25, 5, 1, 8, 25);
INSERT INTO entrada VALUES (25, 6, 1, 8, 25);
INSERT INTO entrada VALUES (25, 7, 1, 8, 25);
INSERT INTO entrada VALUES (25, 8, 1, 8, 25);
INSERT INTO entrada VALUES (25, 9, 1, 8, 25);
INSERT INTO entrada VALUES (25, 10, 0, 8, 25);
INSERT INTO entrada VALUES (25, 11, 1, 8, 25);
INSERT INTO entrada VALUES (25, 12, 1, 8, 25);
INSERT INTO entrada VALUES (25, 13, 1, 8, 25);
INSERT INTO entrada VALUES (25, 14, 1, 8, 25);
INSERT INTO entrada VALUES (25, 15, 1, 8, 25);
INSERT INTO entrada VALUES (25, 16, 0, 8, 25);
INSERT INTO entrada VALUES (25, 17, 1, 8, 25);
INSERT INTO entrada VALUES (25, 18, 1, 8, 25);
INSERT INTO entrada VALUES (25, 19, 0, 8, 25);
INSERT INTO entrada VALUES (25, 20, 1, 8, 25);
INSERT INTO entrada VALUES (25, 21, 1, 8, 25);
INSERT INTO entrada VALUES (25, 22, 1, 8, 25);
INSERT INTO entrada VALUES (25, 23, 1, 8, 25);
INSERT INTO entrada VALUES (25, 24, 1, 8, 25);
INSERT INTO entrada VALUES (25, 25, 1, 8, 25);

INSERT INTO funcion VALUES (3, 4, 20, '2022-10-28', '20:00');
INSERT INTO entrada VALUES (26, 1, 1, 4, 20);
INSERT INTO entrada VALUES (26, 2, 1, 4, 20);
INSERT INTO entrada VALUES (26, 3, 1, 4, 20);
INSERT INTO entrada VALUES (26, 4, 1, 4, 20);
INSERT INTO entrada VALUES (26, 5, 1, 4, 20);
INSERT INTO entrada VALUES (26, 6, 1, 4, 20);
INSERT INTO entrada VALUES (26, 7, 1, 4, 20);
INSERT INTO entrada VALUES (26, 8, 1, 4, 20);
INSERT INTO entrada VALUES (26, 9, 1, 4, 20);
INSERT INTO entrada VALUES (26, 10, 1, 4, 20);
INSERT INTO entrada VALUES (26, 11, 1, 4, 20);
INSERT INTO entrada VALUES (26, 12, 1, 4, 20);
INSERT INTO entrada VALUES (26, 13, 1, 4, 20);
INSERT INTO entrada VALUES (26, 14, 1, 4, 20);
INSERT INTO entrada VALUES (26, 15, 1, 4, 20);
INSERT INTO entrada VALUES (26, 16, 1, 4, 20);
INSERT INTO entrada VALUES (26, 17, 1, 4, 20);
INSERT INTO entrada VALUES (26, 18, 1, 4, 20);
INSERT INTO entrada VALUES (26, 19, 1, 4, 20);
INSERT INTO entrada VALUES (26, 20, 1, 4, 20);

INSERT INTO funcion VALUES (3, 6, 30, '2022-10-28', '20:00');
INSERT INTO entrada VALUES (27, 1, 1, 6, 30);
INSERT INTO entrada VALUES (27, 2, 1, 6, 30);
INSERT INTO entrada VALUES (27, 3, 1, 6, 30);
INSERT INTO entrada VALUES (27, 4, 1, 6, 30);
INSERT INTO entrada VALUES (27, 5, 1, 6, 30);
INSERT INTO entrada VALUES (27, 6, 1, 6, 30);
INSERT INTO entrada VALUES (27, 7, 1, 6, 30);
INSERT INTO entrada VALUES (27, 8, 1, 6, 30);
INSERT INTO entrada VALUES (27, 9, 1, 6, 30);
INSERT INTO entrada VALUES (27, 10, 1, 6, 30);
INSERT INTO entrada VALUES (27, 11, 1, 6, 30);
INSERT INTO entrada VALUES (27, 12, 1, 6, 30);
INSERT INTO entrada VALUES (27, 13, 1, 6, 30);
INSERT INTO entrada VALUES (27, 14, 1, 6, 30);
INSERT INTO entrada VALUES (27, 15, 1, 6, 30);
INSERT INTO entrada VALUES (27, 16, 1, 6, 30);
INSERT INTO entrada VALUES (27, 17, 1, 6, 30);
INSERT INTO entrada VALUES (27, 18, 1, 6, 30);
INSERT INTO entrada VALUES (27, 19, 1, 6, 30);
INSERT INTO entrada VALUES (27, 20, 1, 6, 30);
INSERT INTO entrada VALUES (27, 21, 1, 6, 30);
INSERT INTO entrada VALUES (27, 22, 1, 6, 30);
INSERT INTO entrada VALUES (27, 23, 1, 6, 30);
INSERT INTO entrada VALUES (27, 24, 1, 6, 30);
INSERT INTO entrada VALUES (27, 25, 1, 6, 30);
INSERT INTO entrada VALUES (27, 26, 1, 6, 30);
INSERT INTO entrada VALUES (27, 27, 1, 6, 30);
INSERT INTO entrada VALUES (27, 28, 1, 6, 30);
INSERT INTO entrada VALUES (27, 29, 1, 6, 30);
INSERT INTO entrada VALUES (27, 30, 1, 6, 30);

INSERT INTO funcion VALUES (3, 5, 25, '2022-10-28', '20:00');
INSERT INTO entrada VALUES (28, 1, 1, 5, 25);
INSERT INTO entrada VALUES (28, 2, 1, 5, 25);
INSERT INTO entrada VALUES (28, 3, 1, 5, 25);
INSERT INTO entrada VALUES (28, 4, 1, 5, 25);
INSERT INTO entrada VALUES (28, 5, 1, 5, 25);
INSERT INTO entrada VALUES (28, 6, 1, 5, 25);
INSERT INTO entrada VALUES (28, 7, 1, 5, 25);
INSERT INTO entrada VALUES (28, 8, 1, 5, 25);
INSERT INTO entrada VALUES (28, 9, 1, 5, 25);
INSERT INTO entrada VALUES (28, 10, 1, 5, 25);
INSERT INTO entrada VALUES (28, 11, 1, 5, 25);
INSERT INTO entrada VALUES (28, 12, 1, 5, 25);
INSERT INTO entrada VALUES (28, 13, 1, 5, 25);
INSERT INTO entrada VALUES (28, 14, 1, 5, 25);
INSERT INTO entrada VALUES (28, 15, 1, 5, 25);
INSERT INTO entrada VALUES (28, 16, 1, 5, 25);
INSERT INTO entrada VALUES (28, 17, 1, 5, 25);
INSERT INTO entrada VALUES (28, 18, 1, 5, 25);
INSERT INTO entrada VALUES (28, 19, 1, 5, 25);
INSERT INTO entrada VALUES (28, 20, 1, 5, 25);
INSERT INTO entrada VALUES (28, 21, 1, 5, 25);
INSERT INTO entrada VALUES (28, 22, 1, 5, 25);
INSERT INTO entrada VALUES (28, 23, 1, 5, 25);
INSERT INTO entrada VALUES (28, 24, 1, 5, 25);
INSERT INTO entrada VALUES (28, 25, 1, 5, 25);

INSERT INTO funcion VALUES (2, 5, 25, '2022-10-28', '23:30');
INSERT INTO entrada VALUES (29, 1, 0, 5, 25);
INSERT INTO entrada VALUES (29, 2, 1, 5, 25);
INSERT INTO entrada VALUES (29, 3, 1, 5, 25);
INSERT INTO entrada VALUES (29, 4, 1, 5, 25);
INSERT INTO entrada VALUES (29, 5, 1, 5, 25);
INSERT INTO entrada VALUES (29, 6, 1, 5, 25);
INSERT INTO entrada VALUES (29, 7, 1, 5, 25);
INSERT INTO entrada VALUES (29, 8, 1, 5, 25);
INSERT INTO entrada VALUES (29, 9, 1, 5, 25);
INSERT INTO entrada VALUES (29, 10, 0, 5, 25);
INSERT INTO entrada VALUES (29, 11, 1, 5, 25);
INSERT INTO entrada VALUES (29, 12, 1, 5, 25);
INSERT INTO entrada VALUES (29, 13, 1, 5, 25);
INSERT INTO entrada VALUES (29, 14, 0, 5, 25);
INSERT INTO entrada VALUES (29, 15, 1, 5, 25);
INSERT INTO entrada VALUES (29, 16, 0, 5, 25);
INSERT INTO entrada VALUES (29, 17, 1, 5, 25);
INSERT INTO entrada VALUES (29, 18, 0, 5, 25);
INSERT INTO entrada VALUES (29, 19, 1, 5, 25);
INSERT INTO entrada VALUES (29, 20, 0, 5, 25);
INSERT INTO entrada VALUES (29, 21, 1, 5, 25);
INSERT INTO entrada VALUES (29, 22, 1, 5, 25);
INSERT INTO entrada VALUES (29, 23, 1, 5, 25);
INSERT INTO entrada VALUES (29, 24, 0, 5, 25);
INSERT INTO entrada VALUES (29, 25, 0, 5, 25);

INSERT INTO funcion VALUES (4, 4, 20, '2022-10-28', '23:30');
INSERT INTO entrada VALUES (30, 1, 1, 4, 20);
INSERT INTO entrada VALUES (30, 2, 1, 4, 20);
INSERT INTO entrada VALUES (30, 3, 1, 4, 20);
INSERT INTO entrada VALUES (30, 4, 0, 4, 20);
INSERT INTO entrada VALUES (30, 5, 1, 4, 20);
INSERT INTO entrada VALUES (30, 6, 0, 4, 20);
INSERT INTO entrada VALUES (30, 7, 1, 4, 20);
INSERT INTO entrada VALUES (30, 8, 0, 4, 20);
INSERT INTO entrada VALUES (30, 9, 0, 4, 20);
INSERT INTO entrada VALUES (30, 10, 1, 4, 20);
INSERT INTO entrada VALUES (30, 11, 0, 4, 20);
INSERT INTO entrada VALUES (30, 12, 1, 4, 20);
INSERT INTO entrada VALUES (30, 13, 0, 4, 20);
INSERT INTO entrada VALUES (30, 14, 1, 4, 20);
INSERT INTO entrada VALUES (30, 15, 1, 4, 20);
INSERT INTO entrada VALUES (30, 16, 1, 4, 20);
INSERT INTO entrada VALUES (30, 17, 1, 4, 20);
INSERT INTO entrada VALUES (30, 18, 0, 4, 20);
INSERT INTO entrada VALUES (30, 19, 0, 4, 20);
INSERT INTO entrada VALUES (30, 20, 0, 4, 20);

INSERT INTO funcion VALUES (2, 2, 25, '2022-10-29', '21:30');
INSERT INTO entrada VALUES (31, 1, 1, 2, 25);
INSERT INTO entrada VALUES (31, 2, 0, 2, 25);
INSERT INTO entrada VALUES (31, 3, 0, 2, 25);
INSERT INTO entrada VALUES (31, 4, 1, 2, 25);
INSERT INTO entrada VALUES (31, 5, 0, 2, 25);
INSERT INTO entrada VALUES (31, 6, 1, 2, 25);
INSERT INTO entrada VALUES (31, 7, 1, 2, 25);
INSERT INTO entrada VALUES (31, 8, 0, 2, 25);
INSERT INTO entrada VALUES (31, 9, 1, 2, 25);
INSERT INTO entrada VALUES (31, 10, 1, 2, 25);
INSERT INTO entrada VALUES (31, 11, 0, 2, 25);
INSERT INTO entrada VALUES (31, 12, 1, 2, 25);
INSERT INTO entrada VALUES (31, 13, 1, 2, 25);
INSERT INTO entrada VALUES (31, 14, 0, 2, 25);
INSERT INTO entrada VALUES (31, 15, 0, 2, 25);
INSERT INTO entrada VALUES (31, 16, 1, 2, 25);
INSERT INTO entrada VALUES (31, 17, 1, 2, 25);
INSERT INTO entrada VALUES (31, 18, 0, 2, 25);
INSERT INTO entrada VALUES (31, 19, 0, 2, 25);
INSERT INTO entrada VALUES (31, 20, 0, 2, 25);
INSERT INTO entrada VALUES (31, 21, 0, 2, 25);
INSERT INTO entrada VALUES (31, 22, 1, 2, 25);
INSERT INTO entrada VALUES (31, 23, 0, 2, 25);
INSERT INTO entrada VALUES (31, 24, 0, 2, 25);
INSERT INTO entrada VALUES (31, 25, 0, 2, 25);

INSERT INTO funcion VALUES (2, 2, 25, '2022-10-29', '23:00');
INSERT INTO entrada VALUES (32, 1, 1, 2, 25);
INSERT INTO entrada VALUES (32, 2, 1, 2, 25);
INSERT INTO entrada VALUES (32, 3, 1, 2, 25);
INSERT INTO entrada VALUES (32, 4, 0, 2, 25);
INSERT INTO entrada VALUES (32, 5, 0, 2, 25);
INSERT INTO entrada VALUES (32, 6, 0, 2, 25);
INSERT INTO entrada VALUES (32, 7, 1, 2, 25);
INSERT INTO entrada VALUES (32, 8, 1, 2, 25);
INSERT INTO entrada VALUES (32, 9, 0, 2, 25);
INSERT INTO entrada VALUES (32, 10, 1, 2, 25);
INSERT INTO entrada VALUES (32, 11, 0, 2, 25);
INSERT INTO entrada VALUES (32, 12, 1, 2, 25);
INSERT INTO entrada VALUES (32, 13, 1, 2, 25);
INSERT INTO entrada VALUES (32, 14, 0, 2, 25);
INSERT INTO entrada VALUES (32, 15, 0, 2, 25);
INSERT INTO entrada VALUES (32, 16, 0, 2, 25);
INSERT INTO entrada VALUES (32, 17, 1, 2, 25);
INSERT INTO entrada VALUES (32, 18, 0, 2, 25);
INSERT INTO entrada VALUES (32, 19, 0, 2, 25);
INSERT INTO entrada VALUES (32, 20, 0, 2, 25);
INSERT INTO entrada VALUES (32, 21, 0, 2, 25);
INSERT INTO entrada VALUES (32, 22, 0, 2, 25);
INSERT INTO entrada VALUES (32, 23, 0, 2, 25);
INSERT INTO entrada VALUES (32, 24, 1, 2, 25);
INSERT INTO entrada VALUES (32, 25, 0, 2, 25);

INSERT INTO funcion VALUES (2, 2, 25, '2022-10-29', '00:30');
INSERT INTO entrada VALUES (33, 1, 0, 2, 25);
INSERT INTO entrada VALUES (33, 2, 0, 2, 25);
INSERT INTO entrada VALUES (33, 3, 0, 2, 25);
INSERT INTO entrada VALUES (33, 4, 0, 2, 25);
INSERT INTO entrada VALUES (33, 5, 1, 2, 25);
INSERT INTO entrada VALUES (33, 6, 0, 2, 25);
INSERT INTO entrada VALUES (33, 7, 0, 2, 25);
INSERT INTO entrada VALUES (33, 8, 1, 2, 25);
INSERT INTO entrada VALUES (33, 9, 1, 2, 25);
INSERT INTO entrada VALUES (33, 10, 1, 2, 25);
INSERT INTO entrada VALUES (33, 11, 0, 2, 25);
INSERT INTO entrada VALUES (33, 12, 0, 2, 25);
INSERT INTO entrada VALUES (33, 13, 1, 2, 25);
INSERT INTO entrada VALUES (33, 14, 0, 2, 25);
INSERT INTO entrada VALUES (33, 15, 1, 2, 25);
INSERT INTO entrada VALUES (33, 16, 0, 2, 25);
INSERT INTO entrada VALUES (33, 17, 0, 2, 25);
INSERT INTO entrada VALUES (33, 18, 0, 2, 25);
INSERT INTO entrada VALUES (33, 19, 0, 2, 25);
INSERT INTO entrada VALUES (33, 20, 0, 2, 25);
INSERT INTO entrada VALUES (33, 21, 1, 2, 25);
INSERT INTO entrada VALUES (33, 22, 0, 2, 25);
INSERT INTO entrada VALUES (33, 23, 0, 2, 25);
INSERT INTO entrada VALUES (33, 24, 0, 2, 25);
INSERT INTO entrada VALUES (33, 25, 1, 2, 25);

INSERT INTO funcion VALUES (8, 2, 25, '2022-11-01', '21:30');
INSERT INTO entrada VALUES (34, 1, 0, 2, 25);
INSERT INTO entrada VALUES (34, 2, 0, 2, 25);
INSERT INTO entrada VALUES (34, 3, 0, 2, 25);
INSERT INTO entrada VALUES (34, 4, 0, 2, 25);
INSERT INTO entrada VALUES (34, 5, 0, 2, 25);
INSERT INTO entrada VALUES (34, 6, 0, 2, 25);
INSERT INTO entrada VALUES (34, 7, 0, 2, 25);
INSERT INTO entrada VALUES (34, 8, 0, 2, 25);
INSERT INTO entrada VALUES (34, 9, 1, 2, 25);
INSERT INTO entrada VALUES (34, 10, 1, 2, 25);
INSERT INTO entrada VALUES (34, 11, 0, 2, 25);
INSERT INTO entrada VALUES (34, 12, 1, 2, 25);
INSERT INTO entrada VALUES (34, 13, 1, 2, 25);
INSERT INTO entrada VALUES (34, 14, 0, 2, 25);
INSERT INTO entrada VALUES (34, 15, 0, 2, 25);
INSERT INTO entrada VALUES (34, 16, 0, 2, 25);
INSERT INTO entrada VALUES (34, 17, 0, 2, 25);
INSERT INTO entrada VALUES (34, 18, 0, 2, 25);
INSERT INTO entrada VALUES (34, 19, 0, 2, 25);
INSERT INTO entrada VALUES (34, 20, 0, 2, 25);
INSERT INTO entrada VALUES (34, 21, 0, 2, 25);
INSERT INTO entrada VALUES (34, 22, 0, 2, 25);
INSERT INTO entrada VALUES (34, 23, 1, 2, 25);
INSERT INTO entrada VALUES (34, 24, 0, 2, 25);
INSERT INTO entrada VALUES (34, 25, 0, 2, 25);

INSERT INTO funcion VALUES (8, 2, 25, '2022-11-01', '23:00');
INSERT INTO entrada VALUES (35, 1, 0, 2, 25);
INSERT INTO entrada VALUES (35, 2, 0, 2, 25);
INSERT INTO entrada VALUES (35, 3, 0, 2, 25);
INSERT INTO entrada VALUES (35, 4, 0, 2, 25);
INSERT INTO entrada VALUES (35, 5, 0, 2, 25);
INSERT INTO entrada VALUES (35, 6, 0, 2, 25);
INSERT INTO entrada VALUES (35, 7, 0, 2, 25);
INSERT INTO entrada VALUES (35, 8, 0, 2, 25);
INSERT INTO entrada VALUES (35, 9, 0, 2, 25);
INSERT INTO entrada VALUES (35, 10, 0, 2, 25);
INSERT INTO entrada VALUES (35, 11, 0, 2, 25);
INSERT INTO entrada VALUES (35, 12, 0, 2, 25);
INSERT INTO entrada VALUES (35, 13, 0, 2, 25);
INSERT INTO entrada VALUES (35, 14, 0, 2, 25);
INSERT INTO entrada VALUES (35, 15, 1, 2, 25);
INSERT INTO entrada VALUES (35, 16, 1, 2, 25);
INSERT INTO entrada VALUES (35, 17, 0, 2, 25);
INSERT INTO entrada VALUES (35, 18, 0, 2, 25);
INSERT INTO entrada VALUES (35, 19, 1, 2, 25);
INSERT INTO entrada VALUES (35, 20, 1, 2, 25);
INSERT INTO entrada VALUES (35, 21, 0, 2, 25);
INSERT INTO entrada VALUES (35, 22, 0, 2, 25);
INSERT INTO entrada VALUES (35, 23, 0, 2, 25);
INSERT INTO entrada VALUES (35, 24, 0, 2, 25);
INSERT INTO entrada VALUES (35, 25, 0, 2, 25);

INSERT INTO funcion VALUES (8, 2, 25, '2022-11-01', '00:30');
INSERT INTO entrada VALUES (36, 1, 0, 2, 25);
INSERT INTO entrada VALUES (36, 2, 0, 2, 25);
INSERT INTO entrada VALUES (36, 3, 0, 2, 25);
INSERT INTO entrada VALUES (36, 4, 0, 2, 25);
INSERT INTO entrada VALUES (36, 5, 0, 2, 25);
INSERT INTO entrada VALUES (36, 6, 0, 2, 25);
INSERT INTO entrada VALUES (36, 7, 0, 2, 25);
INSERT INTO entrada VALUES (36, 8, 0, 2, 25);
INSERT INTO entrada VALUES (36, 9, 0, 2, 25);
INSERT INTO entrada VALUES (36, 10, 0, 2, 25);
INSERT INTO entrada VALUES (36, 11, 0, 2, 25);
INSERT INTO entrada VALUES (36, 12, 0, 2, 25);
INSERT INTO entrada VALUES (36, 13, 0, 2, 25);
INSERT INTO entrada VALUES (36, 14, 0, 2, 25);
INSERT INTO entrada VALUES (36, 15, 0, 2, 25);
INSERT INTO entrada VALUES (36, 16, 0, 2, 25);
INSERT INTO entrada VALUES (36, 17, 0, 2, 25);
INSERT INTO entrada VALUES (36, 18, 0, 2, 25);
INSERT INTO entrada VALUES (36, 19, 0, 2, 25);
INSERT INTO entrada VALUES (36, 20, 0, 2, 25);
INSERT INTO entrada VALUES (36, 21, 0, 2, 25);
INSERT INTO entrada VALUES (36, 22, 0, 2, 25);
INSERT INTO entrada VALUES (36, 23, 0, 2, 25);
INSERT INTO entrada VALUES (36, 24, 0, 2, 25);
INSERT INTO entrada VALUES (36, 25, 0, 2, 25);

INSERT INTO funcion VALUES (1, 4, 20, '2022-11-03', '21:05');
INSERT INTO entrada VALUES (37, 1, 1, 4, 20);
INSERT INTO entrada VALUES (37, 2, 0, 4, 20);
INSERT INTO entrada VALUES (37, 3, 0, 4, 20);
INSERT INTO entrada VALUES (37, 4, 0, 4, 20);
INSERT INTO entrada VALUES (37, 5, 0, 4, 20);
INSERT INTO entrada VALUES (37, 6, 0, 4, 20);
INSERT INTO entrada VALUES (37, 7, 0, 4, 20);
INSERT INTO entrada VALUES (37, 8, 0, 4, 20);
INSERT INTO entrada VALUES (37, 9, 0, 4, 20);
INSERT INTO entrada VALUES (37, 10, 1, 4, 20);
INSERT INTO entrada VALUES (37, 11, 0, 4, 20);
INSERT INTO entrada VALUES (37, 12, 0, 4, 20);
INSERT INTO entrada VALUES (37, 13, 0, 4, 20);
INSERT INTO entrada VALUES (37, 14, 0, 4, 20);
INSERT INTO entrada VALUES (37, 15, 1, 4, 20);
INSERT INTO entrada VALUES (37, 16, 0, 4, 20);
INSERT INTO entrada VALUES (37, 17, 0, 4, 20);
INSERT INTO entrada VALUES (37, 18, 0, 4, 20);
INSERT INTO entrada VALUES (37, 19, 0, 4, 20);
INSERT INTO entrada VALUES (37, 20, 1, 4, 20);

-- 4) Escriba consultas SQL que aporten la informacion para responder las siguientes preguntas.
-- Tenga en cuenta que puede ser util agregar nuevas filas a las tablas, a modo de facilitar el
-- testeo de las consultas.

-- a. ¿Cuantas funciones hay en la sucursal La Plata (no importa si la funcion ya ocurrio o no)?

SELECT suc.ciudad, count(suc.ciudad) AS 'Cantidad de funciones en sucursal La Palta'
FROM funcion AS fun, sala AS sal, sucursal AS suc 
-- Primeros dos renglones del WHERE traen lo que nos interesa del producto cartesiano (igualan FK y PK)
WHERE fun.id_sala = sal.id AND fun.cantidad_butacas = sal.cantidad_butacas 
	AND suc.id = sal.id_sucursal 
-- Condicion del enunciado:
	AND suc.ciudad = 'La Plata' 
GROUP BY suc.ciudad;

-- b. ¿Cuales son las peliculas en cartelera en una fecha determinada (fije la fecha que prefiera)
-- en la sucursal Cordoba?

SELECT DISTINCT pel.nombre AS 'Peliculas en cartelera en sucursal Cordoba en la fecha 28/10'
FROM funcion AS fun, pelicula AS pel, sala AS sal, sucursal AS suc
-- Primeros dos renglones del WHERE traen lo que nos interesa del producto cartesiano (igualan FK y PK)
WHERE fun.id_sala = sal.id AND fun.cantidad_butacas = sal.cantidad_butacas 
	AND pel.id = fun.id_pelicula AND suc.id = sal.id_sucursal 
-- Condiciones del enunciado:
	AND suc.ciudad = 'Cordoba' AND fun.dia = '2022-10-28'; 

-- c. ¿Cuales son los horarios disponibles para ver la pelicula Argentina, 1985 en una fecha determinada 
-- (fije la fecha) en la sucursal Rosario?

SELECT DISTINCT fun.horario AS 'Horarios disponibles para ver "Argentina, 1985" en sucursal Rosario en la fecha 24/10'
FROM funcion AS fun, pelicula AS pel, sala AS sal, sucursal AS suc
-- Primeros dos renglones del WHERE traen lo que nos interesa del producto cartesiano (igualan FK y PK)
WHERE fun.id_sala = sal.id AND fun.cantidad_butacas = sal.cantidad_butacas 
	AND	pel.id = fun.id_pelicula AND suc.id = sal.id_sucursal 
-- Condiciones del enunciado:
	AND suc.ciudad = 'Rosario' AND fun.dia = '2022-10-24' AND pel.nombre = 'Argentina, 1985'; 

-- d. ¿Cuales son los horarios disponibles para ver la pelicula 'Argentina, 1985' en una fecha determinada 
-- (fije la fecha) para cada sucursal? Muestre estos resultados ordenados cronologicamente de forma 
-- creciente.

-- Sucursal Rosario: 

SELECT DISTINCT horario as 'Horarios disponibles de "Argentina, 1985" el 24/10/2022 en Rosario'
FROM funcion AS fun, pelicula AS pel, sala AS sal, sucursal AS suc
-- Primeros dos renglones del WHERE traen lo que nos interesa del producto cartesiano (igualan FK y PK)
WHERE fun.id_pelicula = pel.id AND fun.id_sala = sal.id AND fun.cantidad_butacas = sal.cantidad_butacas 
	AND sal.id_sucursal = suc.id
-- Condiciones del enunciado:
	AND pel.nombre = 'Argentina, 1985' AND dia = '2022-10-24' AND suc.ciudad = 'Rosario'
ORDER BY horario ASC;

-- Sucursal Cordoba: 

SELECT DISTINCT horario as 'Horarios disponibles de "Argentina, 1985" el 24/10/2022 en Cordoba'
FROM funcion AS fun, pelicula AS pel, sala AS sal, sucursal AS suc
-- Primeros dos renglones del WHERE traen lo que nos interesa del producto cartesiano (igualan FK y PK)
WHERE fun.id_pelicula = pel.id AND fun.id_sala = sal.id AND fun.cantidad_butacas = sal.cantidad_butacas 
	AND sal.id_sucursal = suc.id
-- Condiciones del enunciado:
	AND pel.nombre = 'Argentina, 1985' AND dia = '2022-10-24' AND suc.ciudad = 'Cordoba'
ORDER BY horario ASC;

-- Sucursal La Plata: 

SELECT DISTINCT horario as 'Horarios disponibles de "Argentina, 1985" el 24/10/2022 en La Plata'
FROM funcion AS fun, pelicula AS pel, sala AS sal, sucursal AS suc
-- Primeros dos renglones del WHERE traen lo que nos interesa del producto cartesiano (igualan FK y PK)
WHERE fun.id_pelicula = pel.id AND fun.id_sala = sal.id AND fun.cantidad_butacas = sal.cantidad_butacas 
	AND sal.id_sucursal = suc.id
-- Condiciones del enunciado:
	AND pel.nombre = 'Argentina, 1985' AND dia = '2022-10-24' AND suc.ciudad = 'La Plata'
ORDER BY horario ASC;

-- e. ¿Cuales peliculas de ciencia ficcion hay en cartelera la semana del 24 de octubre de 2022
-- en la sucursal Rosario?

SELECT DISTINCT pel.nombre AS 'Peliculas de CF en la semana del 24/10/2022-30/10/2022- en Suc. Rosario' 
FROM pelicula AS pel, funcion AS fun, sala as sal, sucursal as suc 
-- Primeros dos renglones del WHERE traen lo que nos interesa del producto cartesiano (igualan FK y PK)
WHERE pel.id = fun.id_pelicula AND fun.id_sala = sal.id AND fun.cantidad_butacas = sal.cantidad_butacas
	AND sal.id_sucursal = suc.id 
-- Condiciones del enunciado: 
	AND suc.ciudad = 'Rosario' AND pel.genero = 'Ciencia Ficcion' 
	AND fun.dia BETWEEN '2022-10-24' AND '2022-10-30';

-- f. ¿Cuales son las butacas vendidas para ver Argentina, 1985 en Cordoba en una funcion determinada 
-- (fije la funcion)?

-- De la siguiente consulta obtenemos el id de las funciones donde se proyectan "Argentina, 1985" 
-- en la sucursal de Cordoba. 

SELECT fun.id
FROM funcion AS fun, pelicula AS pel, sala AS sal, sucursal AS suc
-- Primeros dos renglones del WHERE traen lo que nos interesa del producto cartesiano (igualan FK y PK)
WHERE fun.id_pelicula = pel.id AND fun.id_sala = sal.id AND fun.cantidad_butacas = sal.cantidad_butacas
	AND sal.id_sucursal = suc.id
-- Condiciones del enunciado:
	AND pel.nombre = 'Argentina, 1985' AND suc.ciudad = 'Cordoba';

-- Elegimos la que tiene id=37 y respondemos el ejercicio:

SELECT nro_butaca AS 'Butacas vendidas' 
FROM entrada
WHERE vendida = 1 AND id_funcion = 37;

-- g. ¿Cuales son las butacas libres para ver Argentina, 1985 en Cordoba en una funcion determinada 
-- (fije la funcion)?

-- Tomamos del punto anterior la id=37 y respondemos:

SELECT nro_butaca AS 'Butacas vendidas' 
FROM entrada
WHERE vendida = 0 AND id_funcion = 37;

-- h. ¿Cuantas peliculas por genero estan o estuvieron en cartelera en el Cine Paraıso?

SELECT genero, COUNT(*) AS 'Cantidad de peliculas'
FROM pelicula
GROUP BY genero;

-- 5. Suponga que, una vez creada la base de datos, se pide hacer una pequena modificacion para
-- poder guardar informacion respecto al precio de las entradas. Determine que alteraciones seria
-- conveniente realizar en las tablas en los siguientes casos, justificando la respuesta:

-- a. El precio de la entrada depende unicamente de la sucursal.
-- En este caso, habría que modificar la entidad "sucursal" ya que esta tiene, entre sus atributos, el id de la sucursal y su ciudad, es decir, la información
-- al respecto de la misma. Por lo tanto, para añadir el precio de la entrada dependiente de dónde está la sucursal, sería necesario añadir un nuevo atributo
-- a dicha entidad llamado "precio". Con esto, a la hora de añadir datos, además de la ciudad se determinaría también el precio de la entrada según
-- la persona que ingrese los datos quiera.

-- b. El precio de la entrada depende unicamente de la película.
-- En este caso, habría que modificar la entidad "película". Esta entidad tiene, en sus atributos, toda la información con respecto a la película. Su nombre, ATP,
-- subtitulos y género. Esto significa que si hay que determinar el precio de la entrada según la pelicula que se encuentre en el cine, habría que añadir un nuevo atributo
-- "precio" a la entidad "película". Entonces, cuando se añadan datos y se especifíque la pelicula, se determinará de igual manera el precio de la entrada.

-- c. El precio de la entrada depende unicamente de la ubicación de la butaca.
-- En este caso, habría que modificar la entidad "entrada". Esta, a pesar de su nombre, representa la entidad "butaca". Tiene en sus atributos todos los datos necesarios
-- para esta entidad. Su número, si esta se encuentra o no vendida (ocupada), la sala a la que pertenece y el máximo de butacas aceptados en dicha sala. Con esto en mente,
-- para poder determinar el precio de la entrada según la ubicación, habría que añadir un nuevo atributo llamada "precio" a esta entidad. De esta forma, a la hora de crear
-- un nuevo objeto "entrada" se especificaría el precio según la ubicación que se quiera.


-- 6. Suponga ahora que el Cine Paraiso finalmente decide fijar el precio de las entradas unicamente en 
-- funcion de la pelicula. Realice las modificaciones necesarias para que el modelo se corresponda a este 
-- nuevo requerimiento, y escriba consultas SQL que cumplan los siguientes requisitos:

-- Seleccionar los siguientes 11 renglones y presionar F5 para ingresar las modificaciones relacionadas
-- a que las entradas esten fijas en funcion de la pelicula:

ALTER TABLE pelicula ADD precio_entrada money;
GO
UPDATE pelicula SET precio_entrada = 200 WHERE id = 1;
UPDATE pelicula SET precio_entrada = 500 WHERE id = 2;
UPDATE pelicula SET precio_entrada = 300 WHERE id = 3;
UPDATE pelicula SET precio_entrada = 250 WHERE id = 4;
UPDATE pelicula SET precio_entrada = 400 WHERE id = 5;
UPDATE pelicula SET precio_entrada = 425 WHERE id = 6;
UPDATE pelicula SET precio_entrada = 550 WHERE id = 7;
UPDATE pelicula SET precio_entrada = 285 WHERE id = 8;
UPDATE pelicula SET precio_entrada = 350 WHERE id = 9;
UPDATE pelicula SET precio_entrada = 520 WHERE id = 10;

-- a. Determine el total recaudado por funcion.

SELECT fun.id AS 'Funcion', ( pel.precio_entrada * COUNT(*) ) AS 'Total recaudado en la funcion'
FROM funcion AS fun, entrada AS ent, pelicula AS pel
-- Primer renglon del WHERE trae lo que nos interesa del producto cartesiano (igualan FK y PK)
WHERE ent.id_funcion = fun.id AND fun.id_pelicula = pel.id
-- Condicion del enunciado (entradas vendidas para multiplicar por el precio):
	AND ent.vendida = 1
GROUP BY fun.id, pel.precio_entrada;

-- b. Determine el promedio recaudado por funcion para cada pelıcula. Es decir, si la pelıcula
-- Argentina, 1985 tuvo dos funciones, y en una recaudo 1000 pesos, y en la otra recaudo
-- 3000 pesos, el promedio recaudado por funcion para esta pelıcula es 2000 pesos.

SELECT  p.nombre, p.precio_entrada, COUNT(*) as 'Entradas vendidas', 
	 COUNT(DISTINCT f.id) as 'cant funciones', 
	(COUNT(*)*p.precio_entrada/COUNT(DISTINCT f.id)) AS 'prom recaudado por funcion'
FROM funcion AS f, entrada as e, pelicula as p
-- Primer renglon del WHERE trae lo que nos interesa del producto cartesiano (igualan FK y PK)
WHERE f.id_pelicula=p.id and f.id=e.id_funcion 
-- Condicion del enunciado (entradas vendidas para calcular promedio):
	and e.vendida=1
GROUP BY P.nombre, P.precio_entrada

-- c. Determine el porcentaje de entradas vendidas por funcion, y muestre pelıcula, sucursal,
-- hora y dıa, solo para aquellas en las que se vendio menos del 50%.

SELECT fun.id AS 'Funcion', pel.nombre AS 'Pelicula', suc.ciudad AS 'Sucursal', fun.dia AS 'Dia', 
	fun.horario AS 'Hora', ( (COUNT(*) * 100) / sal.cantidad_butacas ) AS 'Porcentaje de entradas vendidas'
FROM funcion AS fun, entrada AS ent, pelicula AS pel, sala AS sal, sucursal AS suc
-- Primeros tres renglones del WHERE trae lo que nos interesa del producto cartesiano (igualan FK y PK)
WHERE ent.id_sala = sal.id AND ent.maximo_butacas = sal.cantidad_butacas 
	AND ent.id_funcion = fun.id AND fun.id_sala = sal.id AND fun.cantidad_butacas = sal.cantidad_butacas
	AND fun.id_pelicula = pel.id AND sal.id_sucursal = suc.id
-- Condicion del enunciado (entradas vendidas para sacar el porcentaje sobre el total):
	AND ent.vendida = 1
GROUP BY fun.id, sal.cantidad_butacas, pel.nombre, suc.ciudad, fun.dia, fun.horario
HAVING ( (COUNT(*) * 100) / sal.cantidad_butacas ) < 50;

-- d. Determine, para cada pelıcula, cual fue la funcion que mas recaudo.

-- Explicacion debajo de la consulta

SELECT sub1.nombre AS 'Pelicula', sub2.id AS 'Funcion que mas recaudo'			-- comienza *4
FROM ( 
		SELECT sub.nombre, MAX(recaudacion) AS 'recaudacion'					-- comienza *2
		FROM ( SELECT fun.id, pel.nombre, (COUNT(*) * pel.precio_entrada ) AS 'recaudacion' -- comienza *1  
			   FROM funcion AS fun, pelicula AS pel, entrada AS ent
			   WHERE fun.id_pelicula = pel.id AND ent.id_funcion = fun.id 
				AND ent.vendida = 1
			   GROUP BY fun.id, pel.nombre, pel.precio_entrada								-- termina *1  
		      ) AS sub
		GROUP BY sub.nombre														-- termina *2
	 ) AS sub1
	 ,
	 (
		SELECT fun.id, (COUNT(*) * pel.precio_entrada ) AS 'recaudacion'		-- comienza *3
		FROM funcion AS fun, pelicula AS pel, entrada AS ent
		WHERE fun.id_pelicula = pel.id AND ent.id_funcion = fun.id 
		AND ent.vendida = 1
		GROUP BY fun.id, pel.precio_entrada										-- termina *3
	 ) AS sub2
WHERE sub1.recaudacion = sub2.recaudacion;										-- termina *4

-- De la subconsulta *1 obtenemos id funcion, nombre y recaudacion de cada una de las 
-- funciones
-- De la subconsulta *2 obtenemos por nombre la que mas recaudo. 

-- *1 y *2 juntas tienen el objetivo de obtener el nombre de la pelicula y el monton de la funcion
-- que mas recaudo

-- *1 y *2 no forman juntas una unica subconsulta por la imposibilidad 
-- de hacer: MAX( (COUNT(*) * pel.precio_entrada ) ), ya que no se puede utilizar una funcion
-- de agregado adentro de otra.

-- De *3 obtenemos los id de las funciones junto a los montos que recaudaron cada una de 
-- ella

-- Asi, *4 lo unico que hace es unir por medio del monto de la recaudacion 
-- el nombre de la pelicula junto con el id de la funcion que mas recaudo

-- La siguiente consulta sirve para controlar los resultados, devuelve las funciones, con nombre 
-- de pelicula y total recaudado:

SELECT fun.id AS 'Funcion', pel.nombre, ( pel.precio_entrada * COUNT(*) ) AS 'Total recaudado en la funcion'
FROM funcion AS fun, entrada AS ent, pelicula AS pel
WHERE ent.id_funcion = fun.id AND fun.id_pelicula = pel.id
	AND ent.vendida = 1
GROUP BY fun.id, pel.nombre, pel.precio_entrada;