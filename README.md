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

### Infografía de Postgres

![infografia de Postgres](/assets/untitled.png "Infografia_Postgres")

Más características y ventajas de PostgreSQL:

![infografia de Postgres](/assets/Caracteristicas_y_Ventajas.png "Carcateristicas y ventajas de PostgreSQL")

ACID:

![infografia de Postgres](/assets/ACID.png "Carcateristicas y ventajas de PostgreSQL")

- **A**: **Atomicity** -> Separar las funciones desarrolladas en la BD como pequeñas tareas y ejecutarlas como un todo. Si alguna tarea falla se hace un rollback (Se deshacen los cambios)
- **C**: **Consistency** -> Todo lo que se desarrolló en base al objeto relacional. Los datos tienen congruencia. Esto ocurre gracias a las relaciones entre las tablas, como llaves foráneas, primarias, etc.
- **I**: **Isolation** -> Varias tareas ejecutándose al mismo tiempo dentro de la BD. (Ej: Insertar datos al mismo tiempo que haces queries y modificas otros)
- **D** : **Durability** -> Puedes tener seguridad que la información no se perderá por un fallo catastrófico. PostgreSQL guarda la información en una Bitácora. Esto es muy bueno ya qué es un resguardo, porque ante un posible desastre, no se perderan esos datos.

![PostgreSQL](/assets/PostgreSQL.png "PostgreSQL")


### Configurar Postgres

---

- ### Comandos PostgreSQL en la consola:
    
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

 ---
    
- ### 99% de los problemas se  dan por estar mal configurados acá:
    
    
    ![Archivos Configuración](/assets/Archivos%20Confi.png)

    Se accede mediante —> SHOW config_file;
    
    En WSL: /etc/postgresql/12/main/    (postgresql.conf)
    
    En Windows: C:/Program Files/PostgreSQL/12/data/postgresql.conf
    
    - `postgresql.conf` —> Configuración general de postgres, múltiples opciones referentes a direcciones de conexión de entrada, memoria, cantidad de hilos de procesamiento, replica, etc.
    - `pg_hba.conf` —> Muestra los roles así como los tipos de acceso a la base de datos.
    - `pg_ident.conf` —> Permite realizar el mapeo de usuarios. Permite definir roles a usuarios del sistema operativo donde se ejecuta postgres.
    
- ### Tipos de datos principales
    
![Principales](/assets/Principales.png "Principales")
    
    Propios de Postgres

    ![infografia de]
    
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

- #### Crear, alterar y eliminar tablas
    
    serial = id con  Auto Incremental
    
    !https://s3-us-west-2.amazonaws.com/secure.notion-static.com/011cc5bf-a00a-4e30-b312-617983fa0e2f/Untitled.png
    
    Hacerlo con pgadmin:
    
    [](https://platzi.com/clases/1480-postgresql/24184-creacion-de-tablas/)
    
- #### Particiones
    
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


- #### Roles
    
    !https://s3-us-west-2.amazonaws.com/secure.notion-static.com/dece6a6d-d1f0-49e0-bcb1-7283ee4db66c/Untitled.png
    
    Entrar a Postgres seleccionando usuario desde Linux:
    
    ```sql
    psql -h <host> -d <base de datos> -U <usuario> -p <port>
    psql -h -d  -U  -p
    ```
    
    Y abajo, pedirá la contraseña si tiene.
    
    Crear, alterar y borrar usuarios en consola:
    
    ```sql
    create role usuario_consulta;
    
    \dg --> Listar usuarios
    
    alter role usuario_consulta with login;
    
    alter role usuario_consulta with superuser;
    
    drop role usuario_consulta;
    ```
    
    Crear, alterar y borrar usuarios en PgAdmin:
    
    Vamos a Login y creamos un usuario, dándole sus parámetros.
    
    !https://s3-us-west-2.amazonaws.com/secure.notion-static.com/db298c15-341e-48f1-9d7a-e7d829b3dbb0/Untitled.png
    
    Luego vamos a tables, Grant Wizard y asignamos los permisos:
    
    !https://s3-us-west-2.amazonaws.com/secure.notion-static.com/e74fe2fa-dd86-4363-9f8b-f7f9b1dd740d/Untitled.png
    
    Clase de creación de roles: 
    
    [](https://platzi.com/clases/1480-postgresql/24172-creacion-de-roles/)
    
- #### LLaves foráneas
    
    Para hacerlo desde la consola: 
    
    !https://s3-us-west-2.amazonaws.com/secure.notion-static.com/6d595df9-2fa7-4161-9172-18bd77707f17/Untitled.png
    
    En PGAdmin hay que ir acá:
    
    !https://s3-us-west-2.amazonaws.com/secure.notion-static.com/bc624af9-2699-428c-ac3d-d9fc92b49ff1/Untitled.png
    
    ---
    
    IMPORTANTE:
    
    Hay que tener bastante cuidado con el borrado y la actualización en cascada, esto podría generar cuellos de botella en el rendimiento del aplicativo cuando se modifica la llave y borrar información puede ser una opción devastadora para la integridad de la información.
    
    Generalmente en la práctica esto no se permite, la supresión de un registro es lógico no físico esto es para garantizar la consistencia y entre otras reglas la auditoria.
    
    Hay una situación importante sobre las claves foráneas (FK) que se explica en esta clase y me gustaría resaltarla un poco mas:
    
    Primeramente recordar del curso de Fundamentos de BD que a las tablas se les llama “independientes” cuando no tienen FK’s. Del mismo modo una tabla es “dependiente” cuando tiene al menos una FK, es decir, son tablas que dependen de tablas independientes.
    
    Es importante **al momento de crear tablas e insertar datos en ellas**, empezar siempre por las tablas independientes y una vez terminadas seguir con las dependientes.
    
    Hay que tener mucho cuidado con las llaves foráneas cuando se deja la opción de CASCADA cuando se borra o se actualiza. Ayuda a ahorrar tiempo, pero esto puede afectar la transaccionalidad en bases grandes.
    

1.- Los datos se respaldan

2.- las bases de datos se versionan

3.- Los datos no se borran nunca (como buena practica)

Lo mas conveniente es habilitar un flag o una columna tipo usuario_activo y darle un valor binario, un delete no debe ser usado salvo en casos muy explícitos (inherentes a la empresa) y/o especiales (como un documento legal) con un Trigger.

- #### Software para hacer diagramas de bases de datos y sus entidades:
    
    [Flowchart Maker & Online Diagram Software](https://app.diagrams.net/)

- ## Consultas avanzadas (DML):

- #### Actualizar datos
    
   https://s3-us-west-2.amazonaws.com/secure.notion-static.com/2ca2596c-bb70-48ec-b227-0895610adf87/Untitled.png
    
    *ON CONFLICT DO:* 
    
    !https://s3-us-west-2.amazonaws.com/secure.notion-static.com/55b361f1-aecf-47b9-afa8-35c56f64f1ba/Untitled.png
    
    Target:
    
    - The name of a specific column or columns: **`(column1)`**
    - The name of a unique constraint: **`ON CONSTRAINT <constraint_name>`**
    
    Action:
    
    - **`DO NOTHING`**: Tells PostgreSQL to leave the conflicting record as-is. In essence, this action makes no changes, but suppresses the error that would normally occur if you tried to insert a row that violates a condition.
    - **`DO UPDATE`**: This tells PostgreSQL that you want to update the row that is already in the table. The syntax for the update mirrors that of the normal **`UPDATE`** command.
    
    Más abajol, en funciones especiales está ejemplificado junto a otras funciones útiles.

- Joins
    
    !https://s3-us-west-2.amazonaws.com/secure.notion-static.com/a7cbe778-b175-4a3e-89fd-b79b1c3c8d29/Untitled.png
    
    !https://s3-us-west-2.amazonaws.com/secure.notion-static.com/6eddaf86-80ba-49f8-ab2e-a105020a0e4e/Untitled.png
    
    !https://s3-us-west-2.amazonaws.com/secure.notion-static.com/ffbf80d4-3c0b-46d0-b150-7f160ae19ae7/Untitled.png
    
    USING (ID) —> Es lo mismo que la sentencia arriba de esta. Se usa cuando la llave que enlaza ambos campos es la misma.
    
    !https://s3-us-west-2.amazonaws.com/secure.notion-static.com/0176e382-e7e2-48c4-a8f5-3c95af41d851/Untitled.png
    
    !https://s3-us-west-2.amazonaws.com/secure.notion-static.com/0176e382-e7e2-48c4-a8f5-3c95af41d851/Untitled.png
    
- Funciones especiales PSQL (eJ On conflict do)
    
    ---
    
    - **ON CONFLICT DO:** Le dcimos que hacer en caso de un conflicto.
        
        Ayuda a insertar datos de manera correcta cuando no se puede hacer. Por ejemplo, si queremos insertar un dato en un mismo ID ya creado, podemos decirle que en ese caso de conflicto funcione como un UPDATE sobre ese ID en los campos determinados.
        
        ```sql
        INSERT INTO pasajero (id, nombre, direccion_residencia,
        fecha_nacimiento)
        	values (1, '', '','2010-01-01')
        	ON CONFLICT (id) DO 
        	UPDATE SET --Le decimos que actualice en caso de conflicto
        	nombre = '', direccion_residencia='',
        	fecha_nacimiento='2010-01-01';
        ```
        
        ---
        
    - RETURNING: Muestra en pantalla el último cambio hecho. Ahorra tener que hacer un select luego del insert.
    
    ```sql
    INSERT INTO tren (modelo, capacidad)
    	 VALUES('modelo x', 100)
    	 RETURNING id, capacidad;
    ```
    
    ---
    
    - **LIKE / ILIKE**: Busqueda por similitudes añl estilo expresiones regulares. La diferencia entre ambas es que LIKE busca solo en minusculas y ILIKE busca en mayúsculas y minúsculas.
    
    ```sql
    SELECT * FROM PASAJERO
    WHERE pasajero.nombre LIKE '%O'
    ```
    
    ---
    
    - **IS / IS NOT**: comparacion para atributos especiales, no estándar. Como NULL, o tipo objeto.
    
    ```sql
    SELECT * FROM PASAJERO
    WHERE pasajero.nombre IS null;
    ```
    
    ---
    
    !https://s3-us-west-2.amazonaws.com/secure.notion-static.com/aab13e9f-6550-4f5d-a018-b7c05d9e5504/Untitled.png
    
- Funciones especiales AVANZADAS PSQL
    
    !https://s3-us-west-2.amazonaws.com/secure.notion-static.com/8be16640-d5ee-4beb-a51a-ea7c1900d91b/Untitled.png
    
    ---
    
    - COALESCE: compara dos valores y retorna el que es nulo.
        
        ```sql
        NULL WHERE id = 5
        SELECT COALESCE(nombre, 'No existe') AS nombre,
        -- Le decimos que en caso de que el nombre exista,
        -- devuelva en nombre. En caso de que no devolverá 
        -- 'No existe'
        * FROM pasajero WHERE id = 5; 
        ```
        
    
    ---
    
    - NULLIF: Retorna null si son iguales. Sirve para hacer comparaciones numéricas previo a hacer una operación. Por ejemplo, una división por 0.
        
        ```sql
        SELECT NULLIF(0,0);
        -- Output: Null
        ```
        
    
    ---
    
    - GREATEST: Compara un arreglo y retorna el mayor
        
        ```sql
         SELECT GREATEST(5,5,8,95,75,4225,8,6,9,212,6);
        -- Output: 4225
        ```
        
        ---
        
    - LEAST: Compara un arreglo de valores y retorna el menor
        
        ```sql
        SELECT LEAST(5,5,8,95,75,4225,8,6,9,212,6);
        -- Output: 5
        ```
        
    
    ---
    
    - BLOQUES ANONIMOS: Ingresa condicionales dentro de una consulta de BD. Usa un lenguaje muy similar al de Python
        
        SELECT - CASE - THEN - (ELSE) - END
        
        ```sql
        select id_pasajero, nombre, fecha_nacimiento,
        (case 
        when fecha_nacimiento < '2003-06-15'
        then
        'Es mayor de edad'
         else
         'Es menor de edad'
        end) as rango_edad
        from pasajero
        limit 10; --No es necesario el limit, solo lo usé acá
        ```
        
        Output:
        
        !https://s3-us-west-2.amazonaws.com/secure.notion-static.com/52c77d2d-4ee1-44b4-ba86-eedc6fa3901f/Untitled.png
        
        ---
        
- Vistas
    
    Las vistas son muy útiles porque nos ayudan a centralizar los esfuerzos en un solo lugar.
    
    Es decir, guardamos los queries frecuentes para no repetirlos todo el tiempo. Solo debemos hacer un select del nombre de la vista donde se guardo.
    
    Se dividen en 2: Volátiles y materializadas (persistentes)
    
    - Vistas volátiles: Guardan solo el query y no la información que esta query contiene. Sirve mucho para datos que extraemos dónde sabemos que pueden ser modificados.
    - Vistas materializadas: Guarda el query con el output que el último query hecho obtuvo. Para que se actualice el output de la vista hay que hacer un refresh (actualización). Sirven mucho para querys sobre datos que sabemos que no se van a modificar. Con esto se le quita mucho peso a la base de datos.
    
    ---
    
    - Crear vista volátil:
        - En PgAdmin:
        
    ![](https://s3-us-west-2.amazonaws.com/secure.notion-static.com/5577146a-e7f6-436b-8452-1d504dcad46d/Untitled.png)
        
        Y en *code* copiamos el query a guardar:
        
        !https://s3-us-west-2.amazonaws.com/secure.notion-static.com/ccb91d10-ef6a-4bd7-8efb-1f0c47094960/Untitled.png
        
        Apretamos *save*  y nuestra vista volátil quedará asentada.
        
        - En consola:
        
        ```sql
        CREATE OR REPLACE VIEW public.vista_volatil_uno
         AS
        select id_pasajero, nombre, fecha_nacimiento,
        (case 
        when fecha_nacimiento < '2003-06-15'
        then
        'Es mayor de edad'
         else
         'Es menor de edad'
        end) as rango_edad
        from pasajero
        ;
        ;
        
        ALTER TABLE public.vista_volatil_uno
            OWNER TO postgres;
        ```
        
    - Traer vista volátil:
        
        rango_view es el nombre de la vista anteriormente creada por el profesor
        
        !https://s3-us-west-2.amazonaws.com/secure.notion-static.com/83763f92-2fd2-480d-949e-30e0266a1d05/Untitled.png
        
    - Crear vista materializada:
        - En PgAdmin:
        
        !https://s3-us-west-2.amazonaws.com/secure.notion-static.com/5a148074-620e-45bc-8c4e-4aa283af186f/Untitled.png
        
        En *definition* copiamos el query:
        
        !https://s3-us-west-2.amazonaws.com/secure.notion-static.com/e39cfeec-a830-48cb-ac0c-308179987d50/Untitled.png
        
        Decidimos si se va a crear y guardarse con el output automáticamente al crearla, o si se van a guardar los datos al momento que se ejecuta:
        
        !https://s3-us-west-2.amazonaws.com/secure.notion-static.com/3726b69a-4e64-4783-a608-a79201a1eebe/Untitled.png
        
        !https://s3-us-west-2.amazonaws.com/secure.notion-static.com/ceb27141-a0ea-4db4-891a-27bb5ae1d7fc/Untitled.png
        
        Y luego se guarda en *save*.
        
        - En consola:
        
        ```sql
        CREATE MATERIALIZED VIEW public.vista_materializada_uno
        AS
        select id_pasajero, nombre, fecha_nacimiento,
        (case 
        when fecha_nacimiento < '2003-06-15'
        then
        'Es mayor de edad'
         else
         'Es menor de edad'
        end) as rango_edad
        from pasajero
        
        WITH NO DATA;
        
        ALTER TABLE public.vista_materializada_uno
            OWNER TO postgres;
        ```
        
    - Traer y actualizar vista materializada:
        
        despues_noche_mview es la vista permanente previamente creada por el profesor.
        
        !https://s3-us-west-2.amazonaws.com/secure.notion-static.com/eb753ef8-f9f3-41dd-8579-2e0cf90f747f/Untitled.png
        
        !https://s3-us-west-2.amazonaws.com/secure.notion-static.com/ecd09be9-132a-4a80-9db3-0ba92940d4e7/Untitled.png
        
        Le borramos un dato y actualizamos para ver como actúa:
        
        !https://s3-us-west-2.amazonaws.com/secure.notion-static.com/2cd281ae-a80b-49e4-a7ad-558b3999a912/Untitled.png
        
        Si no actualizo, seguirá igual que la de arriba la vista permanente.
        
        Pero si actualizo se verán las ult modificaciones. Se actualiza con:
        
        !https://s3-us-west-2.amazonaws.com/secure.notion-static.com/1709af0e-755a-42d4-85ed-30f3937237a0/Untitled.png
        
        Donde el output es: (Hay 6 rows pq´se borró la qué tenía *id = 2*)
        
        !https://s3-us-west-2.amazonaws.com/secure.notion-static.com/1e6f59cc-c28f-492d-a8f8-7881943d67a0/Untitled.png
        
- PL/PgSQL (Procedural Language / PostgreSQL)
    
    Nos permite crear bloques de códigos directamente sobre la BD.
    
    !https://s3-us-west-2.amazonaws.com/secure.notion-static.com/40b3dd0d-9ce3-4500-91cc-785e886c3ab4/Untitled.png
    
    Es una función como la de cualquier lenguaje:
    
    - Tiene un nombre, una declaración, uso de variables, código y un fin.
    - Retorna valores, o no retorna valores.
    - Se permite ejecutar DENTRO de la BD
    
    ---
    
    - Armar PL Ejemplos:
        
        Acá se envía una Notificación a mensajes: 
        
        !https://s3-us-west-2.amazonaws.com/secure.notion-static.com/bdb385d8-4470-44bd-9a18-e5953ab99270/Untitled.png
        
        Acá se declara una variable, y se hace un loop por cada persona:
        
        - DECLARE
        - rec —> Nombre variable
        - record —> Tipo de variable (record es q lo guarde)
        - Si se pone record := null; Significa que empieza en nulo. Si no se pone nada, es lo mismo.
        
        !https://s3-us-west-2.amazonaws.com/secure.notion-static.com/e451efc1-0281-457e-86b7-0e482730d8d4/Untitled.png
        
        !https://s3-us-west-2.amazonaws.com/secure.notion-static.com/d7e25cf6-b4d3-4baa-af1a-901dda725450/Untitled.png
        
        - Acá se le agrega un contador:
        - := determina el valor de la variable al iniciar
        
        !https://s3-us-west-2.amazonaws.com/secure.notion-static.com/7580ff86-e538-4f17-98ae-bffc2bf2915c/Untitled.png
        
    - Crear función sobre la PL en consola
        - Estructura
        
        !https://s3-us-west-2.amazonaws.com/secure.notion-static.com/f0f3e86b-4258-4306-b98f-cca0a3dfbc9b/Untitled.png
        
        - Ejemplo con función:
        
        !https://s3-us-west-2.amazonaws.com/secure.notion-static.com/ee5dff67-7f39-4ba6-9f39-b12a69051f18/Untitled.png
        
        - LLamar la función:
        
        !https://s3-us-west-2.amazonaws.com/secure.notion-static.com/9871f831-427f-4d6f-84bd-322417a8e29f/Untitled.png
        
        - Si queremos actualizar el tipo de dato que retorna la función, no se puede. Esta debe ser borrada y creada nuevamente con el  nuevo tipo de dato:
        - Ahora le cambiamos el *void* y le decimos que nos regrese un dato tipo integer en el output*:*
        
        !https://s3-us-west-2.amazonaws.com/secure.notion-static.com/0cde4d84-1fa5-4e64-a871-76d5a842d338/Untitled.png
        
        !https://s3-us-west-2.amazonaws.com/secure.notion-static.com/8c3bace5-4047-4d62-ae1d-04643204ba9c/Untitled.png
        
        Resultado de llamar a la nueva función:
        
        !https://s3-us-west-2.amazonaws.com/secure.notion-static.com/9caeb816-4cae-4b81-8c9b-c5f0f4046a47/Untitled.png
        
    - Si queremos actualizar otra cosa, simplemente lo modificamos y lo guardamos sin más.
    - Crear función sobre la PL en PgAdmin
        
        Copiamos la función hecha en la consola acá:
        
        !https://s3-us-west-2.amazonaws.com/secure.notion-static.com/0be52761-5208-4026-86ed-622813ce394f/Untitled.png
        
        !https://s3-us-west-2.amazonaws.com/secure.notion-static.com/1c543089-912d-4233-81ba-2e4e0005fc64/Untitled.png
        
        Para llamarla:
        
        !https://s3-us-west-2.amazonaws.com/secure.notion-static.com/ee0adf80-66e1-40bb-8a6f-aaa81a8bb107/Untitled.png
        
- #### Triggers (o disparadores)   
Son herramientas que nos permiten ejecutar funciones, dependiendo de acciones que se ejecuten sobre una tabla.

Son herramientas que nos permiten ejecutar funciones, dependiendo de acciones que se ejecuten sobre una tabla.

Los disparadores se 'lanzan' cuando se ejecuta alguna de estas:

- INSERT
- UPDATE
- DELETE
- TRUNCATE (Eliminar filas sin borrar las tablas. resetea conteo de los Auto-incremento).

- Concatenar PL a una función: (Crear Trigger)
    - Empezamos creando una tabla dónde se va a almacenar la función de nuestro trigger (podemos usar una ya existente también):
        - Nombre tabla = cont_pasajeros
            
            !https://s3-us-west-2.amazonaws.com/secure.notion-static.com/4e17344f-121c-4fc0-97f7-d1b64196f89a/Untitled.png
            
    - Creamos la función con RETURN TRIGGER:
        
        !https://s3-us-west-2.amazonaws.com/secure.notion-static.com/9e14f1ac-eef5-49e1-a017-7a5d9bced3ac/Untitled.png
        
        Le estamos diciendo que devuelva como tipo Trigger el contador de los row´s y el momento en que se hizo (con *now()* )
        
    - Crear trigger:
    - Creamos y nombramos Trigger
    - Asignamos una función a 'escuchar' (INSERT) y una proposición (AFTER)
    - ON tabla (pasajero)
    - For each row (opcional creo) —> Para cada fila creada, ejecutar la función. Acá sirve pq en este caso nuestra función es un contador.
    - EXECUTE PROCEDURE funcion(); ( impl() )
    - Ignorar *inserts o deletes* con un Trigger:
        
        Agregar al Trigger: AFTER INSERT OR DELETE
        
        Y agregar *rollback*  en la PL para qué no se ejecuten más inserts o deletes en una tabla que queremos que no se modifique.

### Integrar BD con servicios externos:

---

- Conectarse a servers remotos (*dblink*) y hacer JOINS
    
    !https://s3-us-west-2.amazonaws.com/secure.notion-static.com/daa87a2e-ba68-4081-a153-b7ed8ed127a2/Untitled.png
    
    Puede que sea necesario otorgar permisos a usuarios al hacer esta conexión remota.
    
    - JOIN con BD remota:
        - Transacciones
    
        A diferencia de los Triggers que son disparadores sobre acciones, estas se crean para hacer acciones conjuntas para garantizar la atomicidad si una falla.
        
        Como sabemos, Postgres cumple con la *atomicidad*. Es decir que puede ejecutar una serie de tareas como un 'todo' y si alguna falla, volver todos los cambios de estas hacia atrás (*rollback*).
        
        Estructura:
        
        !https://s3-us-west-2.amazonaws.com/secure.notion-static.com/e22f8882-97d2-4ace-8429-8cff44ee0477/Untitled.png
        
        - **Begin**: Inicia al motor de base de datos diciéndole que hagamos lo siguiente en una sola transacción.
        - Se escribe el **query** que vamos a usar.
        - **Commit**: Es que si llega al final de la transacción exitosamente, guarde todos los cambios
        - **Rollback**: Si algo falló, devuelva todo lo qué hicimos.
        
        Primero que nada, hay que desactivar esto:
        
        Solo se desajusta para la *query tool* en que estamos trabajando.
        
        !https://s3-us-west-2.amazonaws.com/secure.notion-static.com/f83b9399-f78d-40f7-912f-9e4bf871b3f3/Untitled.png
        
        !https://s3-us-west-2.amazonaws.com/secure.notion-static.com/7038d98c-e43f-42da-850f-2ccc7bb5e1e9/Untitled.png
        
        Ahora sí:
        Ahora sí:

- Crear transacción:
    
    !https://s3-us-west-2.amazonaws.com/secure.notion-static.com/d78aa682-e69b-400c-8d81-a1792a127568/Untitled.png
    
    !https://s3-us-west-2.amazonaws.com/secure.notion-static.com/531b43f4-5854-41e8-9a05-f197dd7da348/Untitled.png
    
    Por ejemplo, queremos garantizar que siempre que se inserte un tren nuevo, debe haber una nueva estación:
    
    Con BEGIN le decimos que inicie la transacción. El output no se va a trasladar a la tabla, sino que va a permanecer en memoria hasta que se le dé commit o rollback.
    
    !https://s3-us-west-2.amazonaws.com/secure.notion-static.com/aa0ee969-534b-4afc-a1cc-7ca83077e853/Untitled.png
    
    - Y al darle COMMIT se concretan dichos cambios:
    
    !https://s3-us-west-2.amazonaws.com/secure.notion-static.com/0b047792-7751-4197-8a2d-9ec6542526ca/Untitled.png
    
    !https://s3-us-west-2.amazonaws.com/secure.notion-static.com/438d109d-7435-4e41-8907-986702c9501b/Untitled.png
    
    En caso de que algo falle, el ROLLBACK es automático, no hay que aclaralo.

    - Extensiones
    
    Acá está el nombre de las funciones que hay que escribir para crearlas en postgres. También tiene la documentación de las funciones contenidas, sus nombres y parámetros.  (Seleccionar documentación en la versión que está en uso).
    
    [Appendix F. Additional Supplied Modules](https://www.postgresql.org/docs/current/contrib.html)
    
    Para crear una extension, el comando es:
    
    ```sql
    CREATE EXTENSION <extensioin_name>;
    ```
    
    Una extensión puede contener varias funciones. Para invocar alguna, debemos hacerlo con el siguiente comando:
    
    ```sql
    SELECT <function_name> (parameters)
    ```
    
    Ejemplo:
    
    - *levenshtein*  cuenta los caracteres diferentes que tienen los parámetros.
    - *difference* estima de 0 a 4, que tan parecido suenan ambas palabras pronunciadas en inglés. (0 nada que ver, 4 prácticamente igual).

- Otros aportes de extensiones:
    - Una extensión que me pareció muy interesante es passwordcheck la cual verifica el nivel de fortaleza de un password cuando un usuario/rol es creado en la base de datos. Esto, brinda una capa de seguridad adicional protegiéndonos de ataques de fuerza bruta ya que garantiza que tenemos una contraseña segura.
    - Para el tema de seguridad, agregaría el uso de la extensión pgcrypto, que permite implementar funciones de criptografía al PostgreSQL.

## Buenas prácticas

- Backups
    
    El comando es *pg_dump.* Pero pg_admin lo utiliza y ofrece una interfaz mucho más amigable para hacerla. Primero vamos a:
    
    ### Crear BD. Ajustes generales.
    
    !https://s3-us-west-2.amazonaws.com/secure.notion-static.com/156911dd-9154-4f36-9b29-8269b2bd73a2/Untitled.png
    
    (En los 3 puntos al lado del nombre de la DB podemos ver y elegir donde quedará guardada. Predeterminado: Documentos del user)
    
    - **Custom:** Formato único que usa postgres para guardar la BD. Para restaurarla, solo se puede hacer desde pg_admin para custom. Es muy potente, ofrece muchas opciones y parámetros.
    - Plain: Archivo de texto plano con lenguaje SQL sobre toda la BD.
    - **Tar: Archivo comprimido que contiene la BD.**
    - **Directory:** Tiene la estructura de la BD pero sin comprimir.    

- 

---

### Segunda parte de ajustes: Dump options

!https://s3-us-west-2.amazonaws.com/secure.notion-static.com/9da7ddd2-4ee6-4fad-b54b-0178871cfb9b/Untitled.png

En *sections pre-data* significa si quiere traer la BD antes de hacer el insert, o después. O directamente decirle que traiga los datos activando ***data.***

Type of objects le podemos indicar si solo datos, solo schema (excluyentes entre sí) y *bloobs.*

**bloobs** indica si quieren o no que se guarden los archivos binarios, como los multimedia. No se recomienda, ya qué si hay un vídeo pesado, el backup tendrá que cargar con ese peso también.  

### (La opción ?  nos brinda ayuda sobre todas las funciones de los backups)

Esto nos puede ayudar si necesitamos saber más sobre estos y otras opciones que hay más abajo.

- Restore
    
    !https://s3-us-west-2.amazonaws.com/secure.notion-static.com/2674ee7a-96cf-43dc-9e58-bca7ada4256e/Untitled.png
    
    Queda poner ubicación y nombre del archivo y configuramos restore options según las configuraciones del backup

- Mantenimiento
    
    Esto lo hace automático PostgreSQL. Pero en casos especiales como por ejemplo que los querys estén tardando mucho o la BD presente conflictos quizás es necesario un mantenimiento manual. Tener cuidado al hacerlo.
    
    !https://s3-us-west-2.amazonaws.com/secure.notion-static.com/5c51c395-83d3-4c5d-968e-ed3e7c981b89/Untitled.png
    
    Las opciones significan:
    
    - Vacuum: La más importante, con tres opciones, Full, Freeze y Analyze.
    - Full: la tabla quedará limpia en su totalidad.
    - Freeze: durante el proceso la tabla se congela y no permite modificaciones hasta que no termina la limpieza.
    - Analyze: No hace cambios en la tabla. Solo hace una revisión y la muestra.
    - Reindex: Aplica para tablas con numerosos registros con índices, como por ejemplo las llaves primarias.
    - Cluster: Especificamos al motor de base de datos que reorganice la información en el disco.

- Réplicas
    
    !https://s3-us-west-2.amazonaws.com/secure.notion-static.com/3c3ea3a7-e8da-4b07-82a1-1d3a2be68986/Untitled.png
    
    No se puede hacer una escritura (modificación) y una lectura al mismo tiempo. Por las limitaciones computacionales. Entonces Postgres lo qué hace es qué bloquea la tabla que estás modificando para dejar la qué estás leyendo O bloquea la tabla que estas leyendo para dejarte la tabla que estás modificando.
    
    **Las réplicas son muy poderosas para mejorar el rendimiento.**
    
    **Son mecánismos que permiten evitar problemas de entrada y salida en los SO.**
    
    Para evitar esto lo que se hace es hacer una tabla ***master*** dónde se pueda modificar, y hacer otra tabla ***slave*** donde SOLO SE PUEDA LEER.
    
    Entonces la tabla esclavo recibe las modificaciones de la tabla maestra, y se puede estar leyendo *slave y* modificando *master* al mismo tiempo sin que ninguna se bloqueé.
    
    Funcionan usando archivos *ALV*.
    
    ### Crear réplica:
    
    - Para hacerlo, debemos crear 2 severs separados.
    - Luego de hacerlo, a la instancia o server maestra debemos decirle la IP con la cuál vamos a replicar, y qué en esa confíe.
        
        !https://s3-us-west-2.amazonaws.com/secure.notion-static.com/3f47b63c-f0c7-4c65-9af6-ba535a58b127/Untitled.png
        
    - La reiniciamos para que se guarden los cambios.
    
    ---
    
    - Para hacer el Backup:
        - En master:
        - Cambiar archivo *postgresql.conf* en los campos:
        
        !https://s3-us-west-2.amazonaws.com/secure.notion-static.com/5bd1ea2a-10d3-4a35-bd98-81b6cc2bb082/Untitled.png
        
        Lo convertimos en:
        
        !https://s3-us-west-2.amazonaws.com/secure.notion-static.com/c41d1860-fffc-4ce8-ab05-ef5488211cb8/Untitled.png
        
        Es decir, una BD que mantiene sus archivos hasta qué su replica se las lleve y las ejecute.
        
        - Luego la línea: *walsenders*  se refiere a cuántas réplicas le van a mandar la data.
        
        !https://s3-us-west-2.amazonaws.com/secure.notion-static.com/09447565-8cc4-46a9-be0e-2970749ab0a2/Untitled.png
        
        Lo dejamos en 2 por si queremos meter 2 replicas:
        
        !https://s3-us-west-2.amazonaws.com/secure.notion-static.com/908c923d-62bf-44ff-b64d-8b03a17833a4/Untitled.png
        
        - Después cambiamos la línea:
        
        !https://s3-us-west-2.amazonaws.com/secure.notion-static.com/e12e19b7-1160-4a58-bd9e-96d8d2725823/Untitled.png
        
        Por esta, diciéndole que no elimine los archivos, sino que
        
        los archive para que la réplica los pueda leer. 
        
        !https://s3-us-west-2.amazonaws.com/secure.notion-static.com/aecd4dd1-b4ba-4408-9b0b-96c2eda3ba29/Untitled.png
        
        - Por último cambiamos:
        
        !https://s3-us-west-2.amazonaws.com/secure.notion-static.com/978bc578-efb0-4119-b851-f397f1b9a82d/Untitled.png
        
        Le indicamos un comando de Linux que es para copiar archivos y dejarlos en una carpeta temporal: 
        
        Comando de Linux: cp %p /tmp/%f 
        
        !https://s3-us-west-2.amazonaws.com/secure.notion-static.com/58191d05-bead-401a-886a-da2e0aeb224b/Untitled.png
        
        - Ahora en *pg_hba.conf:*
        - Agregamos lo que dice en la línea 5. Básicamente le pasamos la IP del server de la réplica interna, y le decimos que confíe en él. Tiene que ser solo su IP para evitar hackers.
        
        !https://s3-us-west-2.amazonaws.com/secure.notion-static.com/58cb2840-887e-42cf-ad22-dff700ebcfc8/Untitled.png
        
        Guardamos las modificaciones en los archivos, y reiniciamos el server para que se efectúen los mismos.
        
        Ahora sí, pasamos a *slave. (*Puede ser mientras se reinicia o no*).*
        
        ---
        
        - En *slave:*
        - Frenamos la base de datos *slave*. No se puede hacer el copiado de master a réplica si *slave* está en ejecución.
        - Borramos toda la data
        - Copiamos con *pg_basebackup*
        
        !https://s3-us-west-2.amazonaws.com/secure.notion-static.com/d5220286-14b0-47f0-a64e-2ec06c299449/Untitled.png
        
        En el archivo *postgresql.conf*  del server *slave*, le indicamos que se comporte como esclava de la master (que ya le dimos el host como parámetro) de la siguiente forma: (*hot_standby = on)* 
        
        !https://s3-us-west-2.amazonaws.com/secure.notion-static.com/90dfaa80-4bc5-4c1a-a143-5e7aa6c1876d/Untitled.png
        
        !https://s3-us-west-2.amazonaws.com/secure.notion-static.com/588c261a-d19f-46b0-bd73-4de42b82ed8a/Untitled.png
        
        Por último se reinicia para que se guarden las modificaciones.
        
        Ahora ya se comportan como maestra-esclava. Al hacer cambios en master, se verán automáticamente en réplica. Al intentar hacer cambios en réplica, no nos lo permitirá ya qué solo es de lectura.
        
        (La contraseña de replica será = a la de master luego de estos cambios)


- RENOMBRAR TABLAS: Evitar bloqueos por inserciones y borrados en una misma tabla
    
    La solución final y escalable es usar particiones, toma más tiempo en implementar, pero es definitiva.
    
    Puede que te pidan que consolides todos los datos de todas las tablas en una sola tabla. Una opción es llevarte la información de cada tabla a la tabla consolidada, y una vez se encuentre allí, borrar la tabla de la que salieron los datos para no repetir información. Pero esto es una mala idea, porqué el borrado elimina filas y reindexa la tabla. O qué el borrado tarda más que las modificaciones o inserts. Sobre todo estos conflictos se ven más cuando hay miles o millones de datos moviéndose por segundo, y la tabla consolidada se bloquea.
    
    ### Solución: Renombrar tablas (como una cola)
    
    Básicamente es una partición que divide los querys en diferentes tablas y luego consolida todo en una bajando mucho el costo computacional.
    
    Importante: Ver este vídeo:
    
    [](https://platzi.com/clases/1480-postgresql/24199-otras-buenas-practicas/)
    
    Se trata del algoritmo de cambio de nombres por tabla cada una determinada cantidad de tiempo para obtener mayor rapidez y eficiencia en una tabla cuando recibe miles de querys por segundo.
    
    Acá explicado en pdf con un ejemplo: