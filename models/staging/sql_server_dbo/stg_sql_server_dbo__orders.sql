WITH src_orders AS (
    SELECT * 
    FROM {{ source('sql_server_dbo', 'orders') }}
    ),

renamed_casted AS (
    SELECT
          CONVERT_TIMEZONE('UTC', created_at) AS created_at_utc
          , order_id
          , CAST(order_cost AS DECIMAL(10,2)) AS order_cost
          , CAST(order_total AS DECIMAL(10,2)) AS order_total
          , CAST(shipping_cost AS DECIMAL(10,2)) AS shipping_cost
          , CASE
              WHEN shipping_service = ''
              THEN null
              ELSE LOWER(shipping_service)
          END AS shipping_service
          , CONVERT_TIMEZONE('UTC', delivered_at) AS delivered_at_utc
          , CONVERT_TIMEZONE('UTC', estimated_delivery_at) AS estimated_delivery_at_utc
          , LOWER(status) AS shipping_status
          , CASE
              WHEN tracking_id = ''
              THEN null
              ELSE tracking_id
          END AS tracking_id
          , CASE
              WHEN promo_id = ''
              THEN null
              ELSE {{ dbt_utils.generate_surrogate_key(['promo_id']) }}
          END AS promo_id
          , user_id
          , address_id
          , CASE 
              WHEN _fivetran_deleted IS NULL THEN FALSE 
              ELSE TRUE
          END AS data_deleted
        , CONVERT_TIMEZONE('UTC', _fivetran_synced) AS date_load_utc
    FROM src_orders
    )

SELECT * FROM renamed_casted