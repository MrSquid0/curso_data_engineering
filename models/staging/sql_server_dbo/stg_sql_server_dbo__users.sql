WITH src_users AS (
    SELECT * 
    FROM {{ source('sql_server_dbo', 'users') }}
),

src_orders AS (
    SELECT *
    FROM {{ source('sql_server_dbo', 'orders') }}
),

user_order_counts AS (
    SELECT 
        user_id, 
        COUNT(*) AS total_orders_count
    FROM src_orders
    GROUP BY user_id
),

renamed_casted AS (
    SELECT
        CONVERT_TIMEZONE('UTC', u.created_at) AS created_at_utc
        , LOWER(u.email) AS email
        , INITCAP(u.first_name) AS first_name
        , INITCAP(u.last_name) AS last_name
        , u.phone_number
        , CONVERT_TIMEZONE('UTC', u.updated_at) AS updated_at_utc
        , u.user_id
        , u.address_id
        , COALESCE(o.total_orders_count, 0) AS total_orders -- Calculamos los pedidos totales de cada usuario a través de la tabla orders
        , CASE 
            WHEN u._fivetran_deleted IS NULL THEN FALSE 
            ELSE TRUE 
        END AS data_deleted
        , CONVERT_TIMEZONE('UTC', u._fivetran_synced) AS date_load_utc
    FROM src_users u
    LEFT JOIN user_order_counts o
    ON u.user_id = o.user_id
)

SELECT * FROM renamed_casted