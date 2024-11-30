WITH src_products AS (
    SELECT * 
    FROM {{ source('sql_server_dbo', 'products') }}
    ),

renamed_casted AS (
    SELECT
          CAST(inventory AS INTEGER) AS inventory
        , INITCAP(name) AS product_name
        , CAST(price AS DECIMAL(10,2)) AS price
        , product_id
        , CASE 
            WHEN _fivetran_deleted IS NULL THEN FALSE 
            ELSE TRUE 
        END AS data_deleted
        , CONVERT_TIMEZONE('UTC', _fivetran_synced) AS date_load_utc
    FROM src_products
    )

SELECT * FROM renamed_casted