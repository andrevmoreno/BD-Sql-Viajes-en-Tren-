
--Inserción y consulta de datos


SELECT * FROMpublic.estacion;
SELECT * FROMpublic.pasajero;
SELECT * FROMpublic.trayecto;-
SELECT * FROMpublic.tren;
SELECT * FROMpublic.viaje;




--insert "estacion"
INSERTINTOpublic.estacion (nombre,direccion)
VALUES 
    ('Estación Centro','St 1# 12'),
    ('Estación Norte','St 100# 112')
;

--insert "tren"
INSERTINTOpublic.tren (capacidad,modelo)
VALUES 
    (100,'Modelo 1'),
    (100,'Modelo 2')
;

--insert "trayecto"
INSERTINTOpublic.trayecto (tren,estacion,nombre)
VALUES
    (1,1,'Ruta 1');
    (2,2,'Ruta 2');
;

-- RETO
INSERTINTOpublic.pasajero (nombre,fecha_nacimiento,direccion_residencia)
VALUES
    ('José Ordoñez','1987-1-3','St 100# 12'),
    ('Ángel Quintero','1987-1-12','St 101# 12'),
    ('Rafel Castillo','1977-1-12','St 102# 12'),
;
INSERTINTOpublic.viaje (id_pasajero,id_trayecto,inicio,fin)
 VALUES
    (1,1,'2019-01-02','2019-01-02'),
    (2,1,'2019-01-03','2019-01-03'),
    (2,2,'2019-01-04','2019-01-04'),
    (3,2,'2019-01-04','2019-01-04')

;
-- Delete sin limit
DELETEFROMpublic.estacion WHERE estacion.id  =4;
--delete limit
DELETEFROMpublic.estacion WHERE estacion.idIN
     (
		SELECTidFROMpublic.estacion 
	  		WHERE estacion.idIN(3,4)
			ORDERBY  estacion.id  
		 	LIMIT2
	 )
;

-- update sin limit
UPDATEpublic.estacion
SETid=4, nombre='Estación SUR-OESTE', direccion='St 4# 1'
WHERE estacion.id = 4;

-- update utilizando limit
UPDATEpublic.estacion
	SET 
		id=4, 
		nombre='Estación SUR-OESTE', 
		direccion='St 4# 1'
	WHEREidIN (
		SELECT estacion.idFROMpublic.estacion
			WHERE estacion.idin(4)
			ORDERBY estacion.id
			LIMIT1
	)
;