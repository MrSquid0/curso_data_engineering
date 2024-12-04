-- tests/shipping_service_is_null_and_also_deliveries.sql

SELECT *
FROM {{ ref('stg_sql_server_dbo__orders') }}
WHERE shipping_service IS NULL AND (delivered_at_utc IS NOT NULL OR estimated_delivery_at_utc IS NOT NULL)