WITH src_budget AS (
    SELECT * 
    FROM {{ source('google_sheets', 'budget') }}
    ),

renamed_casted AS (
    SELECT
        {{ dbt_utils.generate_surrogate_key(['product_id', 'month']) }} AS budget_id
        , product_id
        , CAST(quantity AS INTEGER) AS quantity
        , EXTRACT(MONTH FROM month) AS month -- Extrae el número del mes
        , CONVERT_TIMEZONE('UTC', _fivetran_synced) AS date_load_utc
    FROM src_budget
    )

SELECT * FROM renamed_casted