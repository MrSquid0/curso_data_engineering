WITH stg_products AS (
    SELECT * 
    FROM {{ ref('stg_sql_server_dbo__products') }}
    ),

dim_products AS (
    SELECT 
        stock
        , product_name
        , price
        , product_id
        , data_deleted
        , date_load_utc
    FROM stg_products
    )

SELECT * FROM dim_products