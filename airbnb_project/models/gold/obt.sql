{% set configs = [
    {
        'table':'airbnb.silver.silver_bookings',
        'columns':'silver_bookings.* rename (created_at as booking_created_at)',
        'alias':'silver_bookings'
    },
    {
        'table':'airbnb.silver.silver_listings',
        'columns':'silver_listings.* exclude (listing_id) rename (created_at as listing_created_at)',
        'alias':'silver_listings',
        'join_condition':'silver_bookings.listing_id = silver_listings.listing_id'  
    },
    {
        'table':'airbnb.silver.silver_hosts',
        'columns':'silver_hosts.* exclude (host_id) rename (created_at as host_created_at)',
        'alias':'silver_hosts',
        'join_condition':'silver_listings.host_id = silver_hosts.host_id'  
    }
]%}

select
    {% for config in configs %}
        {{config['columns']}} {% if not loop.last%},{% endif %}
    {% endfor %}
from 
    {% for config in configs %}
        {% if loop.first %}
            {{config['table']}} as {{config['alias']}}
        {% else %}
            left join {{config['table']}} as {{config['alias']}}
                on {{config['join_condition']}}
        {% endif %}
    {% endfor %}