WITH src_orders AS (
    SELECT * 
    FROM {{ source('sql_server_dbo', 'orders') }}
    ),

renamed_casted AS (
    SELECT
          created_at,
          delivered_at,
          estimated_delivery_at,
          CAST(order_cost AS FLOAT) AS order_cost,
          order_id,
          CAST(order_total AS FLOAT) AS order_total,
          SHA2(promo_id, 256) AS promo_id_hashed,
          CAST(shipping_cost AS FLOAT) AS shipping_cost,
          LOWER(shipping_service) AS shipping_service,
          LOWER(status) AS status,
          tracking_id,
          user_id,
          _fivetran_deleted,
          _fivetran_synced AS date_load
    FROM src_orders
    )

SELECT * FROM renamed_casted