-- Creamos la vista
CREATE OR REPLACE VIEW public.rango_view
AS
    SELECT *,
        CASE
        WHEN fecha_nacimiento > '2015-01-01' THEN
            'Mayor'
        ELSE
            'Menor'
        END AS tipo
    FROM pasajero ORDER BY tipo;
ALTER TABLE public.rango_view OWNER TO postgres;

-- mostramos la vista
SELECT * FROM public.rango_view;

-- Vistas Materializada, no se cambia a menos que queramos que se cambie
SELECT * FROM viaje WHERE inicio > '22:00:00';

CREATE MATERIALIZED VIEW public.despues_noche_mview
AS
    SELECT * FROM viaje WHERE inicio > '22:00:00';
WITH NO DATA;
ALTER TABLE public.despues_noche_mview OWNER TO postgres;

-- observamos la vista
SELECT * FROM despues_noche_mview;

-- Damos refresh
REFRESH MATERIALIZED VIEW despues_noche_mview;

-- Borramos una tupla de viaje cuando el id = 2, para observar que no se borro
DELETE FROM viaje WHERE id = 2;