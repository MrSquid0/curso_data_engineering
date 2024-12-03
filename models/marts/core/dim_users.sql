WITH stg_users AS (
    SELECT * 
    FROM {{ ref('stg_sql_server_dbo__users') }}
    ),

dim_users AS (
    SELECT
        user_id
        , first_name
        , last_name
        , email
        , phone_number
        , created_at_utc
        , updated_at_utc
        , address_id
        , data_deleted
        , date_load_utc
    FROM stg_users
    )

SELECT * FROM dim_users