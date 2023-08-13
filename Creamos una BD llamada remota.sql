/*Creamos una BD llamada remota
Donde tenga una tabla llamada vip(id, fecha)*/

--Creamos la extension dblink
CREATE EXTENSION dblink;

--Lo que haremos es acceder a esa BD atraves de la BD transporte
SELECT * FROM 
dblink ('dbname=remota 
        port=5432 
        host=127.0.0.1 
        user=usuario_consulta 
        password=123456',
        'SELECT * FROM vip')
        AS datos_remotos(id integer, fecha date);

--Uniremos la tabla pasajero con la tabla vip de la BD remota
SELECT * FROM pasajero
JOIN 
dblink ('dbname=remota 
        port=5432 
        host=127.0.0.1 
        user=usuario_consulta 
        password=123456',
        'SELECT * FROM vip')
        AS datos_remotos(id integer, fecha date)
HAVING (id);