WITH stg_events AS (
    SELECT * 
    FROM {{ ref('stg_sql_server_dbo__events') }}
),

fct_events AS (
    SELECT
        created_at_utc
        , event_id
        , event_type
        , order_id
        , page_url
        , product_id
        , session_id
        , user_id
        , data_deleted
        , date_load_utc
    FROM stg_events
    )

SELECT * FROM fct_events