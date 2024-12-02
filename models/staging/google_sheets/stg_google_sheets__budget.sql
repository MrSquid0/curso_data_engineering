WITH src_budget AS (
    SELECT * 
    FROM {{ source('google_sheets', 'budget') }}
    ),

renamed_casted AS (
    SELECT
        {{ dbt_utils.generate_surrogate_key(['product_id', 'month']) }} AS budget_id -- Crea una clave surrogada a través de los campos dados
        , product_id
        , CAST(quantity AS INTEGER) AS quantity -- Castea el valor a un entero
        , EXTRACT(MONTH FROM month) AS month -- Extrae el número del mes
        , CONVERT_TIMEZONE('UTC', _fivetran_synced) AS date_load_utc -- Convierte el campo en la zona horaria UTC
    FROM src_budget
    )

SELECT * FROM renamed_casted