WITH src_addresses AS (
    SELECT * 
    FROM {{ source('sql_server_dbo', 'addresses') }}
    ),

renamed_casted AS (
    SELECT
          address_id
        , INITCAP(address) AS address
        , INITCAP(country) AS country
        , INITCAP(state) AS state
        , CAST(zipcode AS INTEGER) AS zipcode
        , _fivetran_deleted
        , _fivetran_synced AS date_load
    FROM src_addresses
    )

SELECT * FROM renamed_casted