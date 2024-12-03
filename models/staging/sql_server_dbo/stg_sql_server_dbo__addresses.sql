WITH src_addresses AS (
    SELECT * 
    FROM {{ source('sql_server_dbo', 'addresses') }}
    ),

renamed_casted AS (
    SELECT
          address_id
        , INITCAP(address) AS address -- Pone la primera letra del campo en mayúscula
        , INITCAP(country) AS country
        , INITCAP(state) AS state
        , CAST(zipcode AS INTEGER) AS zipcode
        , CASE 
            WHEN _fivetran_deleted IS NULL THEN FALSE 
            ELSE TRUE 
        END AS data_deleted
        , CONVERT_TIMEZONE('UTC', _fivetran_synced) AS date_load_utc
    FROM src_addresses
    )

SELECT * FROM renamed_casted