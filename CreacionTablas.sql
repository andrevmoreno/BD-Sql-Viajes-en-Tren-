
--Tabla pasajeros
CREATE TABLE pasajero(
	id serial,
	nombre character varying(100),
	direccion_residencia character varying,
	fecha_nacimiento date,
	CONSTRAINT pasajero_pkey PRIMARY KEY (id)
)

--Tabla tren 
CREATE TABLE tren(
	id serial,
	modelo character varying(30),
	capacidad integer,
	CONSTRAINT tren_pkey PRIMARY KEY (id)
)

--Tabla estacion
CREATE TABLE estacion(
	id serial,
	nombre character varying(30),
	direccion character varying(100),
	CONSTRAINT estacion_pkey PRIMARY KEY (id)
)

--Tabla trayecto
CREATE TABLE trayecto(
	id serial,
	id_tren integer,
	id_estacion integer,
	CONSTRAINT trayecto_pkey PRIMARY KEY (id),
	FOREIGN KEY (id_tren) REFERENCES estacion(id),
	FOREIGN KEY (id_estacion) REFERENCES tren(id)
)

--Tabla viaje
CREATE TABLE viaje(
	id serial,
	id_pasajero integer,
	id_trayecto integer,
	inicio date,
	fin date,
	CONSTRAINT viaje_pkey PRIMARY KEY (id),
	FOREIGN KEY (id_pasajero) REFERENCES pasajero (id),
	FOREIGN KEY (id_trayecto) REFERENCES trayecto (id)
)

    