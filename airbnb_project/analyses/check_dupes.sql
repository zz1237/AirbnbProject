select
    booking_id
    , count(*) as count
from {{ ref('obt') }}
group by 1
having count(*)>1
