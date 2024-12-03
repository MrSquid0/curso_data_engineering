WITH stg_addresses AS (
    SELECT * 
    FROM {{ ref('stg_sql_server_dbo__addresses') }}
    ),

dim_addresses AS (
    SELECT
          address_id
        , address
        , country
        , state
        , zipcode
        , data_deleted
        , date_load_utc
    FROM stg_addresses
    )

SELECT * FROM dim_addresses