{{
  config(
    materialized = 'ephemeral',
    )
}}

with bookings as (
    select
        distinct booking_id
        , booking_date
        , booking_status
        , booking_created_at
    from {{ ref('obt') }}
)
select * from bookings