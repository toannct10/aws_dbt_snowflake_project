{% set NIGHT_BOOKED = 10 %}

SELECT * FROM   {{ ref('bronze_bookings')}}
WHERE NIGHTS_BOOKED > {{ NIGHT_BOOKED}}