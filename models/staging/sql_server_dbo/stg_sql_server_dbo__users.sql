WITH src_users AS (
    SELECT * 
    FROM {{ source('sql_server_dbo', 'users') }}
),

renamed_casted AS (
    SELECT
        created_at,
        LOWER(email) AS email,
        INITCAP(first_name) AS first_name,
        INITCAP(last_name) AS last_name,
        phone_number,
        updated_at,
        user_id,
        _fivetran_deleted,
        _fivetran_synced AS date_load
    FROM src_users
)

SELECT * FROM renamed_casted