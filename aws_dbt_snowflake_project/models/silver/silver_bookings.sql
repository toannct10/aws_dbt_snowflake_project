{{
    config(
        materialized='incremental',
        unique_key='BOOKING_ID'
    )
}}

SELECT
    BOOKING_ID,
    LISTING_ID,
    BOOKING_DATE,
    {{ multiply('NIGHTS_BOOKED', 'BOOKING_AMOUNT', 2)}} AS AMOUNT_TOTAL,
    SERVICE_FEE,
    CLEANING_FEE,
    BOOKING_STATUS,
    CREATED_AT

FROM {{ ref('bronze_bookings')}}