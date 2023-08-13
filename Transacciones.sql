BEGIN;
SELECT true;

SELECT NOW();

--Hacemos un insertar
INSERT INTO public.tren(
    modelo, capicidad)
    VALUES ('Modelo trens', 123);

--ROLLBACK;


INSERT INTO public.estacion(
	 id, nombre, direccion)
	VALUES ( 2,'Begin', 'Tran');
COMMIT;

--SAVEPOINTS

BEGIN;
UPDATE accounts SET balance = balance -100WHERE user_id =1;
SAVEPOINT my_savepoint;
UPDATE accounts SET balance = balance +100WHERE user_id =2;
-- Si esta instrucción falla, podemos volver al SAVEPOINT anterior
ROLLBACKTOSAVEPOINT my_savepoint;
-- Si no hay errores, confirmamos la transacción
COMMIT;