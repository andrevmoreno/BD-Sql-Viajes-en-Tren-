SELECT * FROM pasajero
JOIN viaje ON (viaje.id_pasajero = pasajero.id);

SELECT * FROM pasajero
LEFT JOIN viaje ON (viaje.id_pasajero = pasajero.id)
WHERE viaje.id IS NULL;