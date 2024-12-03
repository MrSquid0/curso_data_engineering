WITH stg_datetime AS (
    SELECT * 
    FROM {{ ref('stg_common__datetime') }}
    ),

dim_datetime AS (
    SELECT 
        datetime_id
        , day_number
        , month_number
        , year
        , day_name
        , month_name
        , day_of_week
        , day_type    
        , quarter
        , semester
    FROM stg_datetime
    )

SELECT * FROM dim_datetime