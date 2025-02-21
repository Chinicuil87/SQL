-- Consultas SQL realizadas a la DBase de Datos de NetflixDB
-- SELECT
/*
SELECT (campos) FROM (tabla);
 */
-- Todos los registros de la Tabla de episodios
SELECT
    *
FROM
    episodios;

-- Mostrar solo episodio_id y titulo del episodio
SELECT
    episodio_id,
    titulo
FROM
    episodios;

-- DISTINCT
/*
SELECT DISTINCT (campo) FROM (tabla);

DISTINCT -> Valores unicos
 */
-- Mostrar solo los valores unicos del campo genro de la tabla de series
SELECT DISTINCT
    genero
FROM
    series;

-- Mostrar valores unicos de los años de lanzamiento de la tabla se series
SELECT DISTINCT
    año_lanzamiento
FROM
    series;

-- ORDER BY
/*
SELECT (campos) FROM tabla ORDER BY (campo);
ORDER BY -> Ordena los valores de foma asendente

SELECT (campos) FROM tabla ORDER BY (campo) DESC;
DESC ->
 */
-- Ordenar los datos de forma asendente por la duracion de tabla de episodios
SELECT
    titulo,
    duracion
FROM
    episodios
ORDER BY
    duracion;

-- Ordenar los datos de forma desendente por la duracion de tabla de episodios
SELECT
    titulo,
    duracion
FROM
    episodios
ORDER BY
    duracion DESC;

-- LIMIT
/*
SELECT (campos) FROM episodios LIMIT (cantidad);
LIMIT -> Limita la cantidad de registros que se van a visualizar en la consulta.
 */
-- Muestra los primeros 10 registros de la tabla de episodios
SELECT
    *
FROM
    episodios
LIMIT
    10;

/*
- Muestra titulo y dutacion de la tabla de episodios 
- Ordena de mayor a menor respecto al campo de duracion
- Muetsra los primeros 5 capitulos con mayor duracion de la tabla de episodios
 */
SELECT
    titulo,
    duracion
FROM
    episodios
ORDER BY
    duracion DESC
LIMIT
    5;

-- WHERE
/*
SELECT (campo) FROM (tabla) WHERE (condicion);
WHERE -> selimita la consulta y solo trae los datos que complen con la condicion 
 */
-- Mostrar datos de la tabla de series donde el genero es igual a drama
SELECT
    *
FROM
    series
WHERE
    genero = "Drama";

-- Muestra los datos de la tabla de series donde el genero es iguala comedia
SELECT
    *
FROM
    series
WHERE
    genero = "Comedia";

-- Muestra los datos de la tabla series donde el año de lanzamiento es mayor al 2015
SELECT
    *
FROM
    series
WHERE
    año_lanzamiento > 2015;

-- Muestra los datos de la tabla series donde el año de lanzamiento es menor al 2015
SELECT
    *
FROM
    series
WHERE
    año_lanzamiento < 2015;

-- Muestra titulo y año de lanzamiento de la tabla de series donde el año de lanzamiento es mayor a 2020;
SELECT
    titulo,
    año_lanzamiento
FROM
    series
WHERE
    año_lanzamiento > 2020;

-- Operadores logicos
-- Muestra los datos de titulos, duracion y rating_imdb de la tabla de episodios donde la duraciones mayor a 45 minutos
SELECT
    titulo,
    duracion,
    rating_imdb
FROM
    episodios
WHERE
    duracion > 45;

-- Muestra los datos de titulos, duracion y rating_imdb de la tabla de episodios donde la duraciones mayor a 45 minutos y rating mayor o igual a 9
SELECT
    titulo,
    duracion,
    rating_imdb
FROM
    episodios
WHERE
    duracion > 45
    AND rating_imdb >= 9;

-- Muestra los datos de la tabla de series donde el genero es iguala comedia o animacion
SELECT
    *
FROM
    series
WHERE
    (
        genero = "Comedia"
        OR genero = "Animacion"
    );

-- Muestra los datos de la tabla de series donde el genero es iguala comedia o fantasia
SELECT
    *
FROM
    series
WHERE
    genero IN ("comedia", "fantasia");

-- Muestra los datos de la tabla de series donde el genero no pertenesca a comedia o fantasia
SELECT
    *
FROM
    series
WHERE
    genero NOT IN ("comedia", "fantasia");

-- LIKE
/*
SELECT (campos) FROM (tablas) WHERE (campo) LIKE (busqueda)
LIKE -> Ayuda a buscar patrones
NOTA: 
"busqueda%" -> comiencen
"%busqueda" -> finalicen
"%busqueda%" -> contenga en algun lugar 
 */
-- Buscar los titulos en la tabla de series que contengan "The"
SELECT
    *
FROM
    series
WHERE
    titulo LIKE "%The%";

-- Buscar los titulos en la tabla de series que no contengan "The"
SELECT
    *
FROM
    series
WHERE
    titulo NOT LIKE "%The%";

-- Funciones agregadas
-- SUM
/*
Sumar todos los datos de una columna
SELECT SUM(campo) FROM (tabla);

NOTA: 
AS -> Asigna un alias a la operacion que estamos realizando
 */
-- Duracion total de contenido que hay en nuestra tabla de episodios
SELECT
    SUM(duracion) AS suma_duracion
FROM
    episodios;

-- Duracion total de contenido que hay en nuestra tabla de episodios de la serie con id 5
SELECT
    SUM(duracion) AS suma_duracion
FROM
    episodios
WHERE
    serie_id = 5;

-- COUNT
/*
SELECT (campos) FROM (tabla);
COUNT -> Cuenta la cantida de registros que aparecen en una tabla
 */
-- Cuenta le toal de filas que hay en la tabla de episodios
SELECT
    COUNT(*)
FROM
    episodios;

-- Cuenta le toal de filas que hay en la tabla de episodios donde serie_id es igual a 2
SELECT
    COUNT(*)
FROM
    episodios
WHERE
    seire_id = 2;

-- MAX
/*
SELECT MAX(campo) FROM (tabla);
MAX -> Busca el valor maximo de una consulta
 */
-- Episodio que mas dura
SELECT
    MAX(duracion)
FROM
    episodios
WHERE
    serie_id = 2;

-- Apisodio que menos dura
SELECT
    MIN(duracion)
FROM
    episodios
WHERE
    serie_id = 2;

-- Promedio de duracion de la series con id 1 y 2
SELECT
    AVG(duracion)
FROM
    episodios
WHERE
    serie_id IN (1, 2);

-- GROUP BY
/*

GROUP BY -> Agrupa los resultados bjo valores unicos
 */
-- Obtener el promedio de duracion de cada Serie con id 1 y 2
SELECT
    serie_id,
    AVG(duracion) AS promedio
FROM
    episodios
WHERE
    serie_id IN (1, 2)
GROUP BY
    serie_id;

-- Obtener el promedio de duracion de las series con id 1 y 2 y la suma de los minutos de cada uno de ellas
SELECT
    serie_id,
    AVG(duracion) AS promedio,
    SUM(duracion) AS suma_duracion
FROM
    episodios
WHERE
    serie_id IN (1, 2)
GROUP BY
    serie_id;

-- Agrupar las series por id
SELECT
    serie_id
FROM
    episodios
GROUP BY
    1;

-- Contar la cantidad de episodios que hay en cada una de las series 
SELECT
    serie_id,
    COUNT(episodio_id) AS count_episodios
FROM
    episodios
GROUP BY
    serie_id;

-- Valor maximo de duracion de cada una de las series.
SELECT
    serie_id,
    MAX(duracion)
FROM
    episodios
GROUP BY
    1;

-- Mostrar el numero de series que salieron por año y ordenarlas en orden asendente 
SELECT
    año_lanzamiento,
    COUNT(serie_id) AS cantidad_de_series
FROM
    series
GROUP BY
    año_lanzamiento
ORDER BY
    año_lanzamiento;

-- HAVING
/*
HAVING -> Permite filtrar datos agrupados en funcion de considencias fisicas
 */
-- Mostrar todas las series que tengan mas de 11 episodios
SELECT
    serie_id,
    COUNT(episodio_id) AS numero_episodios
FROM
    episodios
GROUP BY
    serie_id
HAVING
    COUNT(episodio_id) > 11;