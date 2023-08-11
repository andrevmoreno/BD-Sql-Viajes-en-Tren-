--Estamos especificando que debemos hacer en caso de un conflicto.
INSERT INTO public.estacion(
    id, nombre, direccion),
    VALUES (1, 'Nombre', 'Street')
    ON CONFLICT (id) DO UPDATE SET nombre = 'Nombre', direccion = 'Direccion';

--Queremos agragar que un campo especifico
INSERT INTO public.estacion(
    id, nombre, direccion),
    VALUES (1, 'Estcion 2', 'Retiro')
    RETURING *;    

--Usamos palabras 
SELECT nombre 
    FROM public.pasajero
    WHERE nombre LIKE 'o%';

SELECT nombre 
    FROM public.TREN
    WHERE modelo IS NOT NULL;

