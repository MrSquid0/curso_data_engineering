WITH src_events AS (
    SELECT * 
    FROM {{ source('sql_server_dbo', 'events') }}
    ),

renamed_casted AS (
    SELECT
          CONVERT_TIMEZONE('UTC', created_at) AS created_at_utc
        , event_id
        , LOWER(event_type) AS event_type
        , order_id
        , page_url
        , product_id
        , session_id
        , user_id
        , CASE 
            WHEN _fivetran_deleted IS NULL THEN FALSE 
            ELSE TRUE 
        END AS data_deleted
        , CONVERT_TIMEZONE('UTC', _fivetran_synced) AS date_load_utc
    FROM src_events
    )

SELECT * FROM renamed_casted