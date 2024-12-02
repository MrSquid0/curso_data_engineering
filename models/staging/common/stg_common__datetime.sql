WITH dim_datetime AS (
    SELECT * FROM (
        {{ dbt_utils.date_spine(
            datepart="day",
            start_date="'2021-01-01'",
            end_date="'2024-12-31'"
        ) }}
    )
),

datetime_info AS (
    SELECT 
        DATE_DAY AS datetime_id
        , DAY(DATE_DAY) AS day_number
        , MONTH(DATE_DAY) AS month_number
        , YEAR(DATE_DAY) AS year
        , DAYNAME(DATE_DAY) AS day_name
        , MONTHNAME(DATE_DAY) AS month_name
        , CASE
            WHEN dayofweek(DATE_DAY) = 0 THEN 7
            ELSE dayofweek(DATE_DAY)
        END AS day_of_week
        , CASE
            WHEN day_of_week BETWEEN 1 AND 5 THEN 'Weekday'
            ELSE 'Weekend'
        END AS day_type    
        , QUARTER(DATE_DAY) AS quarter
        , CASE
            WHEN MONTH(DATE_DAY) BETWEEN 1 AND 6 THEN 1
            ELSE 2
        END AS semester
    FROM dim_datetime
)

SELECT * FROM datetime_info