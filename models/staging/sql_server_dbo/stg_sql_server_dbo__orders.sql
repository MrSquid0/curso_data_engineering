WITH src_orders AS (
    SELECT * 
    FROM {{ source('sql_server_dbo', 'orders') }}
    ),

renamed_casted AS (
    SELECT
          CONVERT_TIMEZONE('UTC', created_at) AS created_at_utc
          , CONVERT_TIMEZONE('UTC', delivered_at) AS delivered_at_utc
          , CONVERT_TIMEZONE('UTC', estimated_delivery_at) AS estimated_delivery_at_utc
          , CAST(order_cost AS DECIMAL(10,2)) AS order_cost
          , CAST(order_total AS DECIMAL(10,2)) AS order_total
          , order_id
          , address_id
          , CASE
              WHEN promo_id = ''
              THEN ''
              ELSE {{ dbt_utils.generate_surrogate_key(['promo_id']) }}
          END AS promo_id
          , CAST(shipping_cost AS DECIMAL(10,2)) AS shipping_cost
          , LOWER(shipping_service) AS shipping_service
          , CASE
              WHEN status = ''
              THEN 'NOT SENT YET'
              ELSE LOWER(status)
          END AS shipping_status
          , CASE
              WHEN tracking_id = ''
              THEN 'NOT SENT YET'
              ELSE tracking_id
          END AS tracking_id
          , user_id
          , CASE 
              WHEN _fivetran_deleted IS NULL THEN FALSE 
              ELSE TRUE
          END AS data_deleted
        , CONVERT_TIMEZONE('UTC', _fivetran_synced) AS date_load_utc
    FROM src_orders
    )

SELECT * FROM renamed_casted