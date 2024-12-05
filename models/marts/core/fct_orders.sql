WITH stg_orders AS (
    SELECT * 
    FROM {{ ref('stg_sql_server_dbo__orders') }}
),

stg_promos AS (
    SELECT * 
    FROM {{ ref('stg_sql_server_dbo__promos') }}
),

fct_orders AS (
    SELECT
        o.order_id
        , o.user_id
        , o.promo_id
        , o.address_id
        , o.created_at_utc
        , o.order_cost
        , o.shipping_cost
        , p.promo_discount AS promo_discount
        , CASE 
            WHEN o.promo_id IS NULL THEN NULL
            ELSE o.order_cost + shipping_cost
        END AS price_without_discount
        , o.order_total
        , o.tracking_id
        , o.shipping_service
        , o.estimated_delivery_at_utc
        , o.delivered_at_utc
        , DATEDIFF(day, o.created_at_utc, o.delivered_at_utc) AS days_to_deliver
        , o.shipping_status
        , o.data_deleted
        , o.date_load_utc
    FROM stg_orders o
    LEFT JOIN stg_promos p
        ON o.promo_id = p.promo_id
)

SELECT * 
FROM fct_orders