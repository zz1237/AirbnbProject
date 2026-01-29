select
    {{multiply('nights_booked', 'booking_amount', 2)}} as total_amount
from {{ ref('bronze_bookings') }}