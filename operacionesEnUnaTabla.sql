-- PARTE I

-- 1. Crear una base de datos con nombre “Posts"
CREATE DATABASE Posts;

-- 2. Crear una tabla “post”, con los atributos id, nombre de usuario, fecha de creación,
-- contenido y descripción.
CREATE TABLE post(
    id SERIAL, 
    nombre_usuario VARCHAR(25) NOT NULL, 
    fecha_creacion DATE NOT NULL, 
    contenido VARCHAR(250) NOT NULL, 
    descripcion VARCHAR(250),
    PRIMARY KEY(id)
    );

-- 3. Insertar 3 post, 2 para el usuario "Pamela" y uno para "Carlos".
INSERT INTO post 
    (nombre_usuario, fecha_creacion, contenido, descripcion) 
    VALUES ('Pamela', '2022-02-23', 'Nullam molestie porta mauris. Ut feugiat, dolor a vulputate consequat.', 'Nam quis pretium neque.'),
           ('Pamela', '2022-02-24', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aenean et.', 'Proin aliquet rutrum.'),
           ('Carlos', '2022-02-21', 'Morbi et orci lorem. Lorem ipsum dolor sit amet, consectetur.', 'Fusce justo lacus.');

-- 4. Modificar la tabla post, agregando la columna título.
ALTER TABLE post ADD titulo VARCHAR(25);

-- 5. Agregar título a las publicaciones ya ingresadas.
UPDATE post SET titulo='Posts Pamela' WHERE nombre_usuario='Pamela';
UPDATE post SET titulo='Posts Carlos' WHERE nombre_usuario='Carlos';

-- 6. Insertar 2 post para el usuario "Pedro".
INSERT INTO post 
    (nombre_usuario, fecha_creacion, contenido, descripcion) 
    VALUES ('Pedro', '2022-02-24', 'Duis auctor eros eu tincidunt vestibulum. Integer scelerisque augue id.', 'Aliquam sed pulvinar.'),
           ('Pedro', '2022-02-26', 'Fusce dictum consectetur scelerisque. Praesent sit amet venenatis augue. Aenean.', 'Donec luctus, lorem.');


-- 7. Eliminar el post de Carlos.
DELETE FROM post WHERE nombre_usuario='Carlos';

-- 8. Ingresar un nuevo post para el usuario "Carlos".
INSERT INTO post 
    (nombre_usuario, fecha_creacion, contenido, descripcion) 
    VALUES ('Carlos', '2022-02-25', 'Integer a fringilla dui. Nunc sit amet venenatis felis. Donec.', 'Sed faucibus odio at odio.');



-- PARTE II

-- 1. Crear una nueva tabla llamada “comentarios”, con los atributos id, fecha, hora de
-- creación y contenido, que se relacione con la tabla posts.

CREATE TABLE comentarios(
    id SERIAL, 
    fecha DATE NOT NULL,
    hora_creacion TIME NOT NULL,
    contenido VARCHAR(250) NOT NULL, 
    FOREIGN KEY(id) REFERENCES
    post(id)
);

-- 2. Crear 2 comentarios para el post de "Pamela" y 4 para "Carlos".

INSERT INTO comentarios 
    (id, fecha, hora_creacion, contenido) 
    VALUES (1, '2022-02-25', '17:54:22', 'Nunc enim lectus, interdum a euismod ac, iaculis eget augue.'),
           (1, '2022-02-25', '18:23:22', 'Mauris at dictum ipsum, a pulvinar lacus. Class aptent taciti.'),
           (6, '2022-02-25', '18:56:34', 'Mauris ac purus vel lacus tempor dignissim vitae ut felis.'),
           (6, '2022-02-25', '18:56:34', 'Pellentesque habitant morbi tristique senectus et netus et malesuada fames.'),
           (6, '2022-02-25', '18:56:34', 'Mauris ut sodales urna, et fermentum massa. Sed eu nunc.'),
           (6, '2022-02-25', '18:56:34', 'Sed cursus ipsum eu libero vulputate consequat. Nam vulputate massa.');

-- 3. Crear un nuevo post para "Margarita".

INSERT INTO post 
    (nombre_usuario, fecha_creacion, contenido, descripcion) 
    VALUES ('Margarita', '2022-02-26', 'Duis sagittis, eros vitae vehicula venenatis, leo sapien auctor metus.', 'Pellentesque pharetra vitae diam id.');

-- 4. Ingresar 5 comentarios para el post de Margarita

INSERT INTO comentarios 
    (id, fecha, hora_creacion, contenido) 
    VALUES (7, '2022-02-20', '11:30:22', 'Donec egestas malesuada eros sed dictum. Duis interdum, urna suscipit.'),
           (7, '2022-02-21', '11:30:22', 'Proin eget est et lectus auctor pharetra. Etiam nec mattis.'),
           (7, '2022-02-22', '11:30:22', 'Nulla vitae luctus ante. Donec quis velit sed libero convallis.'),
           (7, '2022-02-25', '11:30:22', 'Curabitur blandit purus ac diam imperdiet mattis. Maecenas faucibus lacinia.'),
           (7, '2022-02-26', '11:30:22', 'Nunc enim lectus, interdum a euismod ac, iaculis eget augue.');

SELECT * FROM post;
SELECT * FROM comentarios;