WITH stg_budget AS (
    SELECT * 
    FROM {{ ref('stg_google_sheets__budget') }}
    ),

fct_budget as(
    select 
        budget_id
        , product_id
        , quantity
        , month
        , date_load_utc
    from stg_budget
)

select * from fct_budget