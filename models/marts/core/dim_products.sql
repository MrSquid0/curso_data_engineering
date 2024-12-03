WITH stg_products AS (
    SELECT * 
    FROM {{ ref('stg_sql_server_dbo__products') }}
    ),

dim_products AS (
    SELECT 
        product_id
        , product_name
        , price
        , stock
        , data_deleted
        , date_load_utc
    FROM stg_products
    )

SELECT * FROM dim_products