WITH base_date AS (
    SELECT * FROM (
        {{ dbt_utils.date_spine(
            datepart="day",
            start_date="'2021-01-01'",
            end_date="'2024-12-31'"
        ) }} -- Genero todas las fechas desde 2021 hasta 2024 gracias
             -- a la función date_spine de dbt_utils
    )
),

date_info AS (
    SELECT 
        DATE(DATE_DAY) AS date_id -- Uso la fecha como el ID
        , DAY(DATE_DAY) AS day_number --Obtiene el día numérico del mes
        , MONTH(DATE_DAY) AS month_number -- Obtiene el mes numérico del año
        , YEAR(DATE_DAY) AS year -- Obtiene el año numérico de la fecha
        , DAYNAME(DATE_DAY) AS day_name -- Obtiene el nombre del día del mes
        , MONTHNAME(DATE_DAY) AS month_name -- Obtiene el nombre del mes del mes
        , CASE
            WHEN dayofweek(DATE_DAY) = 0 THEN 7
            ELSE dayofweek(DATE_DAY)
        END AS day_of_week
        , CASE
            WHEN day_of_week BETWEEN 1 AND 5 THEN 'Weekday'
            ELSE 'Weekend'
        END AS day_type    
        , QUARTER(DATE_DAY) AS quarter -- Obtiene el trimestre numérico del año
        , CASE
            WHEN MONTH(DATE_DAY) BETWEEN 1 AND 6 THEN 1
            ELSE 2
        END AS semester
    FROM base_date
)

SELECT * FROM date_info