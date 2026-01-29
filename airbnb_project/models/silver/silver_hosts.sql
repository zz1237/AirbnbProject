{{
  config(
    materialized = 'incremental',
    unique_key='host_id'
    )
}}

select
    *
    , replace(host_name, ' ', '_') as new_host_name
    , case
        when response_rate > 95 then 'Very Good'
        when response_rate > 80 then 'Good'
        when response_rate > 60 then 'Fair'
        else 'Poor'
    end as response_category
from {{ ref('bronze_hosts') }}