WITH src_users AS (
    SELECT * 
    FROM {{ source('sql_server_dbo', 'users') }}
),

renamed_casted AS (
    SELECT
        CONVERT_TIMEZONE('UTC', created_at) AS created_at_utc
        , LOWER(email) AS email
        , INITCAP(first_name) AS first_name
        , INITCAP(last_name) AS last_name
        , phone_number
        , CONVERT_TIMEZONE('UTC', updated_at) AS updated_at_utc
        , user_id
        , address_id
        , CASE 
            WHEN _fivetran_deleted IS NULL THEN FALSE 
            ELSE TRUE 
        END AS data_deleted
        , CONVERT_TIMEZONE('UTC', _fivetran_synced) AS date_load_utc
    FROM src_users
)

SELECT * FROM renamed_casted