-- Ver las funciones del comando CREATE ROLE (help)
\h CREATE ROLE;

-- Creamos un ROLE (consultas -> lectura, insertar, actualizar)
CREATE ROLE usuario_consulta;

-- Mostrar todos los usuarios junto a sus atributos
\dg

-- Agregamos atributos al usuario o role
ALTER ROLE  usuario_consulta WITH LOGIN;
ALTER ROLE  usuario_consulta WITH SUPERUSER;
ALTER ROLE  usuario_consulta WITH PASSWORD'1234';

-- Elimanos el usuario o role
DROP ROLE usuario_consulta;

-- La mejor forma de crear un usuario o role por pgadmin
CREATE ROLE usuario_consulta WITH
  LOGIN
  NOSUPERUSER
  NOCREATEDB
  NOCREATEROLE
  INHERIT
  NOREPLICATION
  CONNECTION LIMIT -1
  PASSWORD'1234';

--Para obtorgar privilegios a nuestro usuario_consulta
GRANT INSERT, SELECT, UPDATE ON TABLE public.estacion TO usuario_consulta;
GRANT INSERT, SELECT, UPDATE ON TABLE public.pasajero TO usuario_consulta;
GRANT INSERT, SELECT, UPDATE ON TABLE public.trayecto TO usuario_consulta;
GRANT INSERT, SELECT, UPDATE ON TABLE public.tren TO usuario_consulta;
GRANT INSERT, SELECT, UPDATE ON TABLE public.viaje TO usuario_consulta;