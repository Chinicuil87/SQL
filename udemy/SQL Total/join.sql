-- JOINS
/*
Los Joins se utilizan para unir tablas y convinar inforacion de diferentes tablas en una sola consulta
 */
-- Mostrar la inforacion de la tabla series
SELECT
    *
FROM
    series;

/*
serie_id
titulo
descripcion
año_lanzamiento
genero
 */
-- Mostrar la informacion de la tabla actuaciones
SELECT
    *
FROM
    actuaciones;

/*
actor_id
serie_id
personaje
 */
-- Unir la tabla series con la tabla actuaciones 
SELECT
    *
FROM
    series
    INNER JOIN actuaciones ON series.serie_id = actuaciones.serie_id;

-- Mostrar titulo de la serie y el personaje
SELECT
    titulo,
    personaje
FROM
    series
    INNER JOIN actuaciones ON series.serie_id = actuaciones.serie_id;

-- Referenciado
SELECT
    series.titulo,
    actuaciones.personaje
FROM
    series
    INNER JOIN actuaciones ON series.serie_id = actuaciones.serie_id;

-- Referencia alias
SELECT
    s.titulo,
    a.personaje
FROM
    series AS s
    INNER JOIN actuaciones AS a ON s.serie_id = a.serie_id;

-- Se puede usar solo el join 
SELECT
    s.titulo,
    a.personaje
FROM
    series AS s
    JOIN actuaciones AS a ON s.serie_id = a.serie_id;

-- Uso de WHERE en INNER JOIN
SELECT
    s.titulo,
    a.personaje
FROM
    series AS s
    JOIN actuaciones AS a ON s.serie_id = a.serie_id
WHERE
    s.titulo = "The Crown";

/*
Escribe una consulta SQL que seleccione todos los campos de las tablas 
Series y Episodios donde el serie_id coincida entre ambas tablas, 
utiliza un INNER JOIN para realizar el join entre ambas tablas.
 */
SELECT
    *
FROM
    series
    INNER JOIN episodios ON series.serie_id = episodios.serie_id
LIMIT
    10;

/*Escribe una consulta SQL que te permita obtener el título de la serie, 
el título de cada episodio y su dura<ción de la serie 'Stranger Things'.

El resultado final debe contar con los siguientes nombres de columnas:
titulo_serie, titulo_episodio, duracion.*/
SELECT
    series.titulo AS titulo_serie,
    episodios.titulo AS titulo_episodio,
    episodios.duracion
FROM
    series
    INNER JOIN episodios ON series.serie_id = episodios.serie_id
WHERE
    series.titulo = "Stranger Things";

-- LEFT JOIN
/*Devuelve todos los valores de la tabla de la izquierda y solo los registros de la tabla de la derecha que coinciden*/
SELECT
    series.titulo AS "Titulo de la serie",
    episodios.titulo AS "Titulo de episodio"
FROM
    series
    LEFT JOIN episodios ON series.serie_id = episodios.serie_id
ORDER BY
    series.titulo;

/*Escribe una consulta SQL que devuelva, para cada serie, su título, 
el título de cada episodio asociado (si hay alguno), y el rating de IMDb.

Los alias exactos que debes aplicar son: Título de la Serie, Título 
del Episodio, Rating IMDB

Ordena los resultados por el título de la serie de forma ascendente */
SELECT
    series.titulo AS "Título de la Serie",
    episodios.titulo AS "Título del Episodio",
    episodios.rating_imdb AS "Rating IMDB"
FROM
    series
    LEFT JOIN episodios ON series.serie_id = episodios.serie_id
ORDER BY
    series.titulo;

/*Escribe una consulta SQL que muestre el título de la serie, el título 
de cada episodio, y el rating de IMDb para todos los episodios de la 
serie 'Stranger Things'

Ordena los resultados por Episodios.rating_imdb de forma descendente 
(de mayor a menor) según rating de imdb

Los alias exactos que debes aplicar sobre las columnas son: Título de la 
Serie, Título del Episodio, Rating IMDB*/
SELECT
    series.titulo AS "Título de la Serie",
    episodios.titulo AS "Título del Episodio",
    episodios.rating_imdb AS "Rating IMDB"
FROM
    series
    LEFT JOIN episodios ON series.serie_id = episodios.serie_id
WHERE
    series.titulo = "Stranger Things"
ORDER BY
    episodios.rating_imdb DESC;

-- RIGHT JOIN
/*Devuelve todos los valores de la tabla de la derecha y solo los registros 
de la tabla de la izquierda que coinciden*/
SELECT
    series.titulo AS "Titulo de la serie",
    episodios.titulo AS "Titulo del episodio"
FROM
    episodios
    RIGHT JOIN series ON episodios.serie_id = series.serie_id
ORDER BY
    series.titulo;

/*Escribe una consulta SQL que genere una lista que muestre el título 
de cada serie junto con el título y duración de sus episodios.

Sin embargo, solo incluirás en tu resultado aquellos episodios que 
tengan una duración mayor a 30 minutos.

Ordena los resultados alfabéticamente por el título de la serie.

Los alias exactos que debes aplicar sobre las columnas son:

Título de la Serie

Título del Episodio

Duración*/
SELECT
    series.titulo AS "Título de la Serie",
    episodios.titulo AS "Título del Episodio",
    episodios.duracion AS "Duración"
FROM
    episodios
    RIGHT JOIN series ON episodios.serie_id = series.serie_id
WHERE
    episodios.duracion > 30
ORDER BY
    series.titulo;

-- UNION ALL
/*
Convina dos o mas conultas de la consulta SELECT, sin importar que aya valores duplicados.
 */
/*Escribe una consulta SQL que obtenga todas las filas y columnas de la tabla 
Series que pertenezcan a los géneros 'Ciencia ficción' y 'Drama'

Idealmente querrás correr esta consulta utilizando UNION ALL para ponerlo 
en práctica*/
SELECT
    *
FROM
    series
WHERE
    genero = "Ciencia ficción"
UNION ALL
SELECT
    *
FROM
    series
WHERE
    genero = "Drama";

-- UNION
/*
Convina dos o mas conultas de la consulta SELECT, pero no permite datos duplicados de la consultas
 */
/*Escribe una consulta SQL que genere una lista unificada de títulos de episodios que cumplan al menos 
una de las siguientes condiciones:

Tener una duración > 20 minutos o un rating en IMDb > 9

Te recomiendo utilizar la cláusula UNION para combinar los resultados de dos consultas separadas basadas 
en estas condiciones. Una consulta puede contener la primera condición, y la segunda consulta contener l
a segunda condición.

Recuerda solo debes seleccionar el campo titulo en ambos SELECT bajo las condiciones establecidas.
 */
SELECT
    titulo
FROM
    episodios
WHERE
    duracion > 20
UNION
SELECT
    titulo
FROM
    episodios
WHERE
    rating_imdb > 9;

-- ¿Qué géneros son más prevalentes en la base de datos NetflixDB? 
-- Genera una lista de los distintos géneros y la cantidad de series por cada uno.
SELECT
    genero,
    COUNT(*) AS cantidad_de_series
FROM
    Series
GROUP BY
    genero
ORDER BY
    cantidad_de_series DESC;

-- Esta consulta SQL nos permite ver cuántas series hay en cada género dentro de la base de datos NetflixDB. 
-- Agrupando las series por su género y contándolas, podemos identificar cuáles géneros son más prevalentes.
-- ¿Cuáles son las tres series con mayor rating IMDB y cuántos episodios tienen? 
-- Considera usar un JOIN para combinar la información de las tablas de series y episodios.
SELECT
    Series.titulo,
    COUNT(Episodios.episodio_id) AS numero_de_episodios,
    AVG(episodios.rating_imdb) AS promedio_imdb
FROM
    Series
    INNER JOIN Episodios ON Series.serie_id = Episodios.serie_id
GROUP BY
    Series.serie_id
ORDER BY
    promedio_imdb DESC
LIMIT
    3;

-- Con esta consulta, identificamos las tres series con el mayor rating IMDB 
-- en la base de datos y contamos cuántos episodios tiene cada una de ellas, combinando información de las tablas Series y Episodios.
-- ¿Cuál es la duración total de todos los episodios para la serie "Stranger Things"? 
-- Este análisis te permitirá entender el compromiso temporal necesario para ver una serie completa.
SELECT
    SUM(Episodios.duracion) AS duracion_total
FROM
    Series
    INNER JOIN Episodios ON Series.serie_id = Episodios.serie_id
WHERE
    Series.titulo = 'Stranger Things';