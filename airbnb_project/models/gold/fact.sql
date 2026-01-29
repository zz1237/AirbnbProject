{% set configs = [
    {
        'table':'airbnb.gold.obt',
        'columns': 'obt.booking_id, obt.host_id, obt.listing_id, obt.total_amount, obt.cleaning_fee, obt.service_fee, obt.accommodates, obt.bedrooms, obt.bathrooms, obt.price_per_night, obt.response_rate',
        'alias':'gold_obt'
    }
]%}

select
    {{ configs[0]['columns']}}
from 
    {{ configs[0]['table']}}