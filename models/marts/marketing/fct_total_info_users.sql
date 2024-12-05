WITH stg_users AS (
    SELECT * 
    FROM {{ ref('stg_sql_server_dbo__users') }}
),

stg_addresses AS (
    SELECT * 
    FROM {{ ref('stg_sql_server_dbo__addresses') }}
),

stg_orders AS (
    SELECT * 
    FROM {{ ref('stg_sql_server_dbo__orders') }}
),

stg_promos AS (
    SELECT * 
    FROM {{ ref('stg_sql_server_dbo__promos') }}
),

stg_order_items AS (
    SELECT * 
    FROM {{ ref('stg_sql_server_dbo__order_items') }}
),

order_item_totals AS (
    -- Calculamos la cantidad total de productos por usuario a través de order_items
    SELECT
        o.user_id,
        SUM(oi.quantity) AS total_quantity_product -- Suma de todas las cantidades de productos
    FROM stg_order_items oi
    LEFT JOIN stg_orders o
        ON oi.order_id = o.order_id -- Relacionamos order_items con orders
    GROUP BY o.user_id
),

fct_total_info_users AS (
    -- Unimos todas las tablas para crear la tabla de hechos
    SELECT 
        u.user_id,
        u.first_name,
        u.last_name,
        u.email,
        u.phone_number,
        u.created_at_utc,
        u.updated_at_utc,
        a.address,
        a.zipcode,
        a.state,
        a.country,
        COALESCE(u.total_orders, 0) AS total_number_orders,
        COALESCE(o.order_cost, 0) AS total_order_cost,
        COALESCE(o.shipping_cost, 0) AS total_shipping_cost,
        p.promo_discount AS total_discount,
        COALESCE(oi.total_quantity_product, 0) AS total_quantity_product,
        --COALESCE(o.total_distinct_promos, 0) AS total_distinct_promos
    FROM stg_users u
    LEFT JOIN stg_addresses a ON u.address_id = a.address_id
    LEFT JOIN stg_orders o ON u.user_id = o.user_id
    LEFT JOIN order_item_totals oi ON u.user_id = oi.user_id
    LEFT JOIN stg_promos p ON o.promo_id = p.promo_id
)

SELECT * 
FROM fct_total_info_users