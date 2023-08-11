--Vamos compara dos valores y retorna el que es nulo
SELECT id, COALESCE(nombre, 'No Aplica') nombre, direccion_residencia, fecha_nacimiento
FROM public.pasajero WHERE id = 1;

-- Si dos campos son iguales ---> 0: False
SELECT NULLIF(0,1);

--Comparamos dos campos que son iguales
SELECT GREATEST (0, 1, 2, 6, 25, 55);

-- Devuelve si es Niño o Mayor
SELECT id, nombre, direccion_residencia, fecha_nacimiento,
    (CASE
    WHEN (fecha_nacimiento) > '2015-01-01' THEN
        'Niño'
    ELSE
        'Mayor'
    END)
FROM public.pasajero;

SELECT id, nombre, direccion_residencia, fecha_nacimiento,
    (CASE
    WHEN (CURRENT_DATE - fecha_nacimiento)/365 >= 18 THEN
        '>Mayor'
    ELSE
        '<Menor'
    END)
FROM public.pasajero;