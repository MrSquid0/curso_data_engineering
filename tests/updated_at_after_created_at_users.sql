-- tests/updated_at_after_created_at_users.sql

SELECT *
FROM {{ ref('stg_sql_server_dbo__users') }}
WHERE created_at_utc > updated_at_utc