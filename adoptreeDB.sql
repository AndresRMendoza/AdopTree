CREATE DATABASE adoptree;
USE adoptree;

CREATE TABLE tipos_servicios ( -- Entidad catálogo 
	servicio_id INT UNSIGNED AUTO_INCREMENT,
	servicio VARCHAR(50),
	PRIMARY KEY (servicio_id)
);

CREATE TABLE estados( -- Entidad catálogo
	estado_id INT UNSIGNED AUTO_INCREMENT,
	estado VARCHAR(50),
	PRIMARY KEY (estado_id)
);

CREATE TABLE direcciones( -- Entidad de datos
	direccion_id INT UNSIGNED AUTO_INCREMENT,
	codigo_postal INT NOT NULL,
	numero INT NOT NULL,
	calle VARCHAR(50) NOT NULL,
	colonia VARCHAR(50) NOT NULL,
	ciudad VARCHAR(50) NOT NULL,
	estado INT,
	PRIMARY KEY (direccion_id),
	FOREIGN KEY (estado) REFERENCES estados(estado_id) ON DELETE RESTRICT ON UPDATE CASCADE
);

CREATE TABLE direcciones_arboles ( -- Entidad de datos
	direccion_arbol_id INT UNSIGNED AUTO_INCREMENT,
	codigo_postal INT NOT NULL,
	calle VARCHAR(50) NOT NULL,
	colonia VARCHAR(50) NOT NULL,
	ciudad VARCHAR(50),
	estado INT,
	PRIMARY KEY (direccion_arbol_id),
	FOREIGN KEY (estado) REFERENCES estados(estado_id) ON DELETE RESTRICT ON UPDATE CASCADE
); 

CREATE TABLE especies ( -- Entidad de datos
	especie_id INT UNSIGNED AUTO_INCREMENT,
	nombre VARCHAR(50) NOT NULL,
	nombre_cientifico VARCHAR(100) NOT NULL,
	oxigeno FLOAT NOT NULL,
	dioxido_carbono FLOAT NOT NULL,
	especie_endemica BOOLEAN NOT NULL,
	frecuencia_riego FLOAT NOT NULL,
	PRIMARY KEY (especie_id)
);

CREATE TABLE escuelas ( -- Entidad de datos
	escuela_id INT UNSIGNED AUTO_INCREMENT,
	nombre VARCHAR(100) NOT NULL,
	direccion INT,
	PRIMARY KEY (escuela_id),
	FOREIGN KEY (direccion) REFERENCES direcciones(direccion_id) ON DELETE RESTRICT ON UPDATE CASCADE
);

CREATE TABLE personas ( -- Entidad de datos
	persona_id INT UNSIGNED AUTO_INCREMENT,
	nombre VARCHAR(50) NOT NULL,
	apellido_paterno VARCHAR(50) NOT NULL,
	apellido_materno VARCHAR(50) NOT NULL,
	fecha_nacimiento DATE,
	curp VARCHAR(18) UNIQUE,
	email VARCHAR(100) UNIQUE,
	clave VARCHAR(100) NOT NULL,
	direccion INT,
	escuela INT,
	PRIMARY KEY (persona_id),
	FOREIGN KEY (direccion) REFERENCES direcciones(direccion_id) ON DELETE RESTRICT ON UPDATE CASCADE,
	FOREIGN KEY (escuela) REFERENCES escuelas(escuela_id) ON DELETE RESTRICT ON UPDATE CASCADE
);

CREATE TABLE arboles ( -- Entidad de datos
	arbol_id INT UNSIGNED AUTO_INCREMENT,
	altura VARCHAR(50) NOT NULL,
	inclinacion VARCHAR(50) NOT NULL,
	perimetro VARCHAR(50) NOT NULL,
	indice_supervivencia FLOAT NOT NULL,
	disponible BOOLEAN,
	direccion INT,
	especie INT,
	PRIMARY KEY (arbol_id),
	FOREIGN KEY (direccion) REFERENCES direcciones_arboles(direccion_arbol_id) ON DELETE RESTRICT ON UPDATE CASCADE,
	FOREIGN KEY (especie) REFERENCES especies(especie_id) ON DELETE RESTRICT ON UPDATE CASCADE
);

CREATE TABLE servicios_arboles ( -- Entidad de datos
	servicios_arboles_id INT UNSIGNED AUTO_INCREMENT,
	foto VARCHAR(255) NOT NULL,
	fecha DATETIME,
	observacion VARCHAR(255) NOT NULL,
	vivo BOOLEAN NOT NULL,
	servicio INT,
	arbol INT,
	PRIMARY KEY (servicios_arboles_id),
	FOREIGN KEY (servicio) REFERENCES tipos_servicios(servicio_id) ON DELETE RESTRICT ON UPDATE CASCADE,
	FOREIGN KEY (arbol) REFERENCES arboles(arbol_id) ON DELETE RESTRICT ON UPDATE CASCADE
);

CREATE TABLE adopciones ( -- Entidad pivote
	adopcion_id INT UNSIGNED AUTO_INCREMENT,
	fecha DATETIME,
	arbol INT,
	persona INT,
	PRIMARY KEY (adopcion_id),
	FOREIGN KEY (arbol) REFERENCES arboles(arbol_id) ON DELETE RESTRICT ON UPDATE CASCADE,
	FOREIGN KEY (persona) REFERENCES personas(persona_id) ON DELETE RESTRICT ON UPDATE CASCADE
);


-- Inserciones
INSERT INTO tipos_servicios(servicio) VALUES ('riego');
INSERT INTO estados(estado) VALUES ('Tamaulipas');

INSERT INTO direcciones(codigo_postal, numero, calle, colonia, ciudad, estado) 
VALUES (893215, 342, 'Andador 6', 'Revolucion verde', 'Tampico', 1);

INSERT INTO direcciones_arboles (codigo_postal, calle, colonia, ciudad, estado) 
VALUES (89317, 'Josefa Ortiz', 'Acentamientos humanos', 'Tampico', 1);

INSERT INTO especies(nombre, nombre_cientifico, oxigeno, dioxido_carbono, especie_endemica, frecuencia_riego) 
VALUES ('Palo de rosa', 'Tipuana tipu', 89.8, 23.1, TRUE, 2);

INSERT INTO escuelas(nombre, direccion) 
VALUES ('Instituto Tecnologico de Ciudad Madero', '1');

INSERT INTO personas(nombre, apellido_paterno, apellido_materno, fecha_nacimiento, curp, email, clave, direccion, escuela)
VALUES ('Andres', 'Ramirez', 'Mendoza', '12.2.1995', 'PRUEBA', 'ramirezmendoza482@gmail.com', 'prueba', 1, 1);

INSERT INTO arboles(altura, inclinacion, perimetro, indice_supervivencia, disponible, direccion, especie)
VALUES ('2m', '2m', '1.3m', 7.4, TRUE, 1, 1);

INSERT INTO servicios_arboles(foto, fecha, observacion, vivo, servicio, arbol) 
VALUES ('https://adoptree.com/...', '06.09.2022', 'ninguna observacion', TRUE, 1, 1); 

INSERT INTO adopciones(fecha, arbol, persona) VALUES ('06.09.2022', 1, 1);

SELECT * FROM tipos_servicios;
SELECT * FROM estados;
SELECT * FROM direcciones;
SELECT * FROM direcciones_arboles;
SELECT * FROM especies;
SELECT * FROM escuelas;
SELECT * FROM personas;
SELECT * FROM arboles;
SELECT * FROM servicios_arboles;
SELECT * FROM adopciones;

TRUNCATE TABLE arboles; 

SELECT codigo_postal FROM direcciones WHERE codigo_postal = 893215;





