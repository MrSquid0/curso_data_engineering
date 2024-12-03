WITH stg_order_items AS (
    SELECT * 
    FROM {{ ref('stg_sql_server_dbo__order_items') }}
),

fct_order_items AS (
    SELECT
        order_items_id    
        , order_id
        , product_id
        , quantity
        , data_deleted
        , date_load_utc
    FROM stg_order_items
    )

SELECT * FROM fct_order_items