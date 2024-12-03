WITH stg_promos AS (
    SELECT * 
    FROM {{ ref('stg_sql_server_dbo__promos') }}
    ),

dim_promos AS (
    SELECT
        promo_id
        , promo_code
        , promo_discount
        , promo_status
        , data_deleted
        , date_load_utc
    FROM stg_promos
    )

SELECT * FROM dim_promos