WITH stg_date AS (
    SELECT * 
    FROM {{ ref('stg_common__date') }}
    ),

dim_date AS (
    SELECT 
        date_id
        , day_number
        , month_number
        , year
        , day_name
        , month_name
        , day_of_week
        , day_type    
        , quarter
        , semester
    FROM stg_date
    )

SELECT * FROM dim_date