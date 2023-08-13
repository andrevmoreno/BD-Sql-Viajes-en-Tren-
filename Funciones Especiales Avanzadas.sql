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

--Consulatamos la información de los pasajeros agregando una columna adicional quienes comienza su nombre D y también quien tien mas de 18 años
SELECT COALESCE(nombre, 'Nombre en Null') AS nombrenull , *,
CASE WHEN fecha_nacimiento > '2015-01-01' THEN
'Niño' ELSE 'Mayor' END,
CASE WHEN nombre ILIKE 'D%' THEN
'Empieza con D' ELSE 'No empieza con D' END, 
Case WHEN extract(years from age(current_timestamp,fecha_nacimiento::timestamp)) >= 18 THEN
'Mayor de edad.' ELSE 'Menor de edad.' END
FROM pasajero;