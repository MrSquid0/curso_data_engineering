WITH src_promos AS (
    SELECT * 
    FROM {{ source('sql_server_dbo', 'promos') }}
),

renamed_casted AS (
    SELECT
        {{ dbt_utils.generate_surrogate_key(['promo_id']) }} AS promo_id
        , LOWER(promo_id) AS promo_type
        , CAST(discount AS INTEGER) AS promo_discount
        , LOWER(status) AS promo_status
        , CASE 
            WHEN _fivetran_deleted IS NULL THEN FALSE 
            ELSE TRUE 
        END AS data_deleted
        , CONVERT_TIMEZONE('UTC', _fivetran_synced) AS date_load_utc
    FROM src_promos
)

SELECT * FROM renamed_casted