WITH stg_orders AS (
    SELECT * 
    FROM {{ ref('stg_sql_server_dbo__orders') }}
),

fct_orders AS (
    SELECT
        order_id
        , user_id 
        , promo_id
        , address_id
        , created_at_utc
        , order_cost
        , shipping_cost
        , order_total
        , tracking_id
        , shipping_service
        , estimated_delivery_at_utc
        , delivered_at_utc
		, DATEDIFF(day, created_at_utc, delivered_at_utc) AS days_to_deliver
        , shipping_status
        , date_load_utc
    FROM stg_orders
    )

SELECT * FROM fct_orders