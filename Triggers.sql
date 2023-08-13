--Nuestra PL
DROP FUNCTION IF EXISTS  count_on_insert_pasajero() CASCADE;

CREATE OR REPLACE FUNCTION count_on_insert_pasajero()
	RETURNS TRIGGER
	LANGUAGE 'plpgsql'
AS $BODY$
	DECLARE 
		contador integer:=0;
		rec record;
	BEGIN
		
		FOR rec IN SELECT * FROM pasajero LOOP 
			contador := contador + 1;
		END LOOP;
		RAISE NOTICE 'cantidad de registros:	%', contador;
		
		--insert record on conteo_pasajero
		INSERT INTO public.conteo_pasajero (total_pasajero,hora_conteo)
		VALUES (contador,now());
		
		RETURN NEW;
		
	END;	
$BODY$

--Creación de triggers
CREATE TRIGGER mytrigger
AFTER INSERT
ON pasajero
FOR EACH ROW
EXECUTE PROCEDURE impl();

--Inserta un valor
INSERT INTO pasajero (nombre,direccion_residencia,fecha_nacimiento)
VALUES ('Nombre Trigger', 'Dir aca', '2000-01-01')