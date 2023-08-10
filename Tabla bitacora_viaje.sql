-- Tabla bitacora_viaje
CREATE TABLE public.bitacora_viaje(
    id serial,
    id_viaje integer,
    fecha date
) PARTITION BY RANGE (fecha) WITH (OIDS = FALSE);
ALTER TABLE public.bitacora_viaje OWNER to postgres;

-- Vamos a crear la particion
CREATE TABLE bitacora_viaje201001 PARTITION OF public.bitacora_viaje
FOR VALUES FROM ('2010-01-01') TO  ('2020-04-24');

-- Insertamos un dato --> ERROR antes de crear la particions
INSERT INTO public.bitacora_viaje(id_viaje, fecha)
VALUES(1, '2010-01-01');

-- Mostramos los valores de la tabla bitacora_viaje
SELECT * FROM bitacora_viaje;

-- eliminamos la tabla bitacora_viaje y se eliminara la particion igualmente
DROP TABLE bitacora_viaje;```
