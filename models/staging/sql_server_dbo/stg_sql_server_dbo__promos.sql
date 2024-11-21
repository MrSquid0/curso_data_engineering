WITH src_promos AS (
    SELECT * 
    FROM {{ source('sql_server_dbo', 'promos') }}
),

renamed_casted AS (
    SELECT
        CAST(discount AS INTEGER) AS discount,
        SHA2(promo_id, 256) AS promo_id_hashed,
        LOWER(status) AS status,
        _fivetran_deleted,
        _fivetran_synced AS date_load
    FROM src_promos
)

SELECT * FROM renamed_casted