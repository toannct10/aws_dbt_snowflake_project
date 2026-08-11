{% set configs= [{
    "table": "AIRBNB.GOLD.OBT",
    "columns": "GOLD_obt.BOOKING_ID, GOLD_obt.LISTING_ID, GOLD_obt.HOST_ID, GOLD_obt.AMOUNT_TOTAL,GOLD_obt.SERVICE_FEE,GOLD_obt.CLEANING_FEE,GOLD_obt.ACCOMMODATES,GOLD_obt.BEDROOMS,GOLD_obt.BATHROOMS,GOLD_obt.RESPONSE_RATE",
    "alias": "GOLD_obt"
},
{
    "table": "AIRBNB.GOLD.DIM_BOOKINGS",
    "columns": "",
    "alias": "DIM_bookings",
    "join_condition": "DIM_bookings.booking_id = GOLD_obt.booking_id"
},
{
    "table": "AIRBNB.GOLD.DIM_LISTINGS",
    "columns": "",
    "alias": "DIM_listings",
    "join_condition": "DIM_listings.listing_id = GOLD_obt.listing_id"
},
{
    "table": "AIRBNB.GOLD.DIM_HOSTS",
    "columns": "",
    "alias": "DIM_hosts",
    "join_condition": "DIM_hosts.host_id = GOLD_obt.host_id"
},
]
%}

SELECT
    {{ configs[0].columns }}

FROM
    {% for config in configs %}
        {% if loop.first %}
            {{ config['table'] }} as {{config['alias']}}
        {% else %}
        LEFT JOIN  {{ config['table']}} as {{config['alias']}}
        ON {{ config['join_condition'] }}
    {% endif %}
    {% endfor %}