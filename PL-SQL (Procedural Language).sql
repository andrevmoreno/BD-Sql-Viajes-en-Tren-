DO $$
DECLARE
--Nombre de la variable
    rec record;
BEGIN
--Vamos a estar recorriendo cada uno de los resultados de la consulta de la variable
    FOR rec IN SELECT * FROM pasajeros LOOP
    rec.nombre
    rec.id
    RAISE NOTICE 'Un pasajero se llama %' , rec.nombre;
    END LOOP;
END
$$

--Vamos contar todos los pasajeros que hay en la tabla
CREATE FUNCTION importantePL() 
    RETURNS void
    AS $$
DECLARE
    rec record;
    contador interger := 0;
BEGIN
 FOR rec IN SELECT * FROM pasajeros LOOP
    contador := contador + 1;
    RAISE NOTICE 'Conteo es %' , contador;
    END LOOP;
END
$$
LANGUAGE PLPGSQL;


--CREATE FUNTION - Declaración de una función SQL

CREATE FUNCTION  consulta_usuarios() 
    RETURNS void
    LANGUAGE 'plpgsql';
AS $BODY$ 
    DECLARE
        rec record;
        contador integer :=0;
    BEGIN 
        --recorre  tabla pasajero y lo guarda en la variable rec
        FOR rec IN SELECT * FROM pasajero LOOP 
            RAISE NOTICE 'id: %     ,Nombre: %      ',
                        rec.id,rec.nombre;
            contador := contador + 1;
        END LOOP;
        RAISE NOTICE 'cantidad de registros:    %', contador;
    END 
$BODY$
