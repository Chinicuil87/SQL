-- Subconsultas
-- Mostras los episodios de la serei "The Office"
SELECT
    *
FROM
    episodios
WHERE
    series_id = (
        SELECT
            serie_id
        FROM
            series
        WHERE
            titulo = "The Office"
    );