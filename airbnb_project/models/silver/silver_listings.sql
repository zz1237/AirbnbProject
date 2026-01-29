{{
  config(
    materialized = 'incremental',
    unique_key = 'listing_id',
    on_schema_change='append_new_columns'
    )
}}

select
    *
    , {{tag('price_per_night')}} as price_category
from {{ ref('bronze_listings') }}