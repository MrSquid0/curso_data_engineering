-- tests/delivered_at_after_created_at.sql

SELECT *
FROM {{ ref('stg_sql_server_dbo__orders') }}
WHERE created_at_utc > delivered_at_utc