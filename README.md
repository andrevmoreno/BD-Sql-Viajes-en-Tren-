# PostgreSQL

- *Entrar en consola:*
- Comando:
    
    ``````
    psql -h <host> -d <db_name> -U <user> -p <port>
    
 - En WSL versión 12:
    ``````
    psql -h localhost -d postgres -U postgres  -p 5432
    
- Ayuda con lo del puerto en caso de conflicto:
    
    [Getting error: Peer authentication failed for user "postgres", when trying to get pgsql working with rails](https://stackoverflow.com/questions/18664074/getting-error-peer-authentication-failed-for-user-postgres-when-trying-to-ge)
    
## Jerarquías BD´s:
    
    Toda jerarquía de base de datos se basa en los siguientes elementos:
    
    - **Servidor de base de datos:** Computador que tiene un motor de base de datos instalado y en ejecución.
    - **Motor de base de datos:** Software que provee un conjunto de servicios encargados de administrar una base de datos.
    - **Base de datos:** Grupo de datos que pertenecen a un mismo contexto.
    - **Esquemas de base de datos en PostgreSQL:** Grupo de objetos de base de datos que guarda relación entre sí (tablas, funciones, relaciones, secuencias).
    - **Tablas de base de datos:** Estructura que organiza los datos en filas y columnas formando una matriz.
    
    **PostgreSQL es un motor de base de datos.**
    
- IOPS
    
    IOPS es una unidad de benchmark usada para medir el rendimiento de dispositivos informáticos de almacenamiento, como unidades de disco duro, unidades de estado sólido y acceso a almacenamiento en red.
    
    Mayores limitantes en cuánto a BD´s y software en general.
    

---
## Diferencias entre PostgreSQL y otros manejadores de bases de datos




1. Código libre y orientado a la comunidad.
2. Base de datos adaptable: soporta documentos JSON y orientadas a estadísticas.
3. Base de datos adaptable: soporta documentos JSON y orientadas a estadísticas.
4. PL/pgSQL (procedural language).
5. Manejador de objetos: objetos clave/valor.
6. Particiones: permite ejercer una estrategia de particionado para Big Data.
7. Common table expressions: usa tablas virtuales y dinámicas en tiempo de ejecución. Las hace que sean más fáciles de computar para el procesador.
8. Window functions: encontrar la relación entre un row particular y su relación con toda la tabla.

Infografía de Postgres

<img herf="./assets/untitled.png">

Más características y ventajas de PostgreSQL:

ACID:

- **A**: **Atomicity** -> Separar las funciones desarrolladas en la BD como pequeñas tareas y ejecutarlas como un todo. Si alguna tarea falla se hace un rollback (Se deshacen los cambios)
- **C**: **Consistency** -> Todo lo que se desarrolló en base al objeto relacional. Los datos tienen congruencia. Esto ocurre gracias a las relaciones entre las tablas, como llaves foráneas, primarias, etc.
- **I**: **Isolation** -> Varias tareas ejecutándose al mismo tiempo dentro de la BD. (Ej: Insertar datos al mismo tiempo que haces queries y modificas otros)
- **D** : **Durability** -> Puedes tener seguridad que la información no se perderá por un fallo catastrófico. PostgreSQL guarda la información en una Bitácora. Esto es muy bueno ya qué es un resguardo, porque ante un posible desastre, no se perderan esos datos.

### Configurar Postgres

---

- Comandos PostgreSQL en la consola:
    
    ```sql
    SELECT VERSION();
        
    \h -- ayuda
    
    \h <comando> -- ayuda del comando especifico
    
    \l -- Listar las bases
    
    \c <db_name> --moverse a una base de datos especifica
    
    \d <db_name> --Describir la base en cuestión
    
    \dt -- listar las tablas de la base actual
    
    \dn -- listar los esquemas de la base actual
    
    \dv -- listar las vistas
    
    \df -- listar las funciones
    
    \du -- listar los usuarios
    
    \g -- ejecutar ultimo comando 
    
    \s -- historial de comandos
    
    \l nombrearchivo --guardar lista de comandos
    
    \i nombre archivo -- ejecuta comandos guardados
    
    \e -- abrir editor (como VScode) para realizar los query´s.
    -- Al guardar y cerrar, estos se ejecutarán
    
    \ef -- Igual que \e, pero acá se integran funciones propias de
    -- psql en el editor de texto también.
    
    \timing -- activar el tiempo de respuesta de las consultas
    
    \q -- cerrar consola
    
    ---------------------------------------------------------------
    --DDL:
    
    CREATE DATABASE base; -- crea base
    
    CREATE TABLE tabla (columnas); crea tabla
    
    INSERT INTO tabla(columna) VALUES('dato');
    
    SELECT * FROM tabla;
    
    UPDATE tabla SET cammpo = dato WHERE condicion;
    
    DELETE FROM tabla WHERE condicion;
    ```
    
    Ejemplos  de comandos DDL (y otros) en esta clase:
    
    [](https://platzi.com/clases/1480-postgresql/24849-comandos-mas-utilizados-en-postgresql/)
    
- 99% de los problemas se  dan por estar mal configurados acá:
    
    !https://s3-us-west-2.amazonaws.com/secure.notion-static.com/60f7bb0f-3f02-4776-b08c-b334edb7ba43/Untitled.png
    
    Se accede mediante —> SHOW config_file;
    
    En WSL: /etc/postgresql/12/main/    (postgresql.conf)
    
    En Windows: C:/Program Files/PostgreSQL/12/data/postgresql.conf
    
    - `postgresql.conf` —> Configuración general de postgres, múltiples opciones referentes a direcciones de conexión de entrada, memoria, cantidad de hilos de procesamiento, replica, etc.
    - `pg_hba.conf` —> Muestra los roles así como los tipos de acceso a la base de datos.
    - `pg_ident.conf` —> Permite realizar el mapeo de usuarios. Permite definir roles a usuarios del sistema operativo donde se ejecuta postgres.
    
- Tipos de datos principales
    
    !https://s3-us-west-2.amazonaws.com/secure.notion-static.com/0740cf9f-5a3c-4a51-9e68-41f332f7f30d/Untitled.png
    
    Propios de Postgres
    
    !https://s3-us-west-2.amazonaws.com/secure.notion-static.com/bdb0fb5d-c5dd-40f8-95b1-b3bda963e59c/Untitled.png
    
    Podemos crear nuestro propio data type muy sencillo, tan solo con un comando (CREATE TYPE).
    
    ---
    
    - Numéricos(Números enteros, Números Decimales, Seriales).
    - Monetarios(cantidad de moneda).
    - Texto(almacenar cadenas y texto, existen tres VARCHAR, CHAR, TEXT).
    - Binario(1 Y 0).
    - Fecha/Hora(Para almacenar Fechas y/o Horas, DATE TYPE, TIME TYPE, TIMESTAMP, INTERVAL).
    - Boolean(Verdadero o Falso).
    - Especiales propios de postgres.
    - Geométricos: Permiten calcular distancias y áreas usando dos valores X y Y.
    - Direcciones de Red: Cálculos de máscara de red.
    - Texto tipo bit: Cálculos en otros sistemas (ej: hexadecimal, binario).
    - XML, JSON: Postgres no permite guardar en estos formatos.
    - Arreglos: Vectores y Matrices.
    - BLOB: Son elementos utilizados en las bases de datos para almacenar datos de gran tamaño que cambian de forma dinámica. (No todos los Sistemas Gestores de Bases de Datos son compatibles con los BLOB).
    
    !https://s3-us-west-2.amazonaws.com/secure.notion-static.com/39dda398-75c8-4631-a03b-187660d8d74c/Untitled.png

### Gestión de la información en Postgres (DDL)

---

- Crear, alterar y eliminar tablas
    
    serial = id con  Auto Incremental
    
    !https://s3-us-west-2.amazonaws.com/secure.notion-static.com/011cc5bf-a00a-4e30-b312-617983fa0e2f/Untitled.png
    
    Hacerlo con pgadmin:
    
    [](https://platzi.com/clases/1480-postgresql/24184-creacion-de-tablas/)
    
- Particiones
    
    Las particiones se usan para optimizar las búsquedas de la información.
    
    Deben ser creadas al momento de crear toda la infraestructura y diseño del schema.
    
    !https://s3-us-west-2.amazonaws.com/secure.notion-static.com/b62957e9-16af-42d6-9d10-1e54e895fd9f/Untitled.png
    
    Divide una tabla con la misma estructura lógica en diferentes tablas más pequeñas ubicadas físicamente en diferentes espacios del disco (o incluso, de otros discos).
    
    Acelera mucho todo. Porque divide la tabla en diferentes tablas más pequeñas con el mismo nombre, dividas según su rango. Entonces al momento de hacer el select, el motor lo va a ir a buscar directamente en el rango dicho, y no tendrá que recorrer toda la tabla para encontrarla.
    
    Muy útil, sobre todo cuando se manejan datos muy grandes.
    
    Las tablas particionadas NO DEBEN TENER ID PK.
    
    No es posible particionar una tabla ya creada, deberás crear una tabla particionada y mover los datos de la tabla anterior a la nueva. El copiado, si no son muchos datos, se puede hacer con un simple INSERT … FROM … SELECT, si hay muchos datos (millones) se deberá hacer por partes, para no ir a sobrecargar la tabla, usando Limits o Cursores etc.
    
    - Sentencia SQL en consola:
        
        ```sql
        Particiones
        - Separación fisica de datos
        - Estructura logica
        
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
        ```
        
    
    Clase particiones:
    
    [](https://platzi.com/clases/1480-postgresql/24171-particiones/)