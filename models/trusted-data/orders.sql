
{{ config(materialized="table") }}

SELECT
    order_id
    , order_date
    , order_customer_id
    , TRIM(UPPER(order_status)) AS order_status
FROM {{ source('retail_raw', 'orders') }} 
WHERE order_id IS NOT NULL
    AND order_customer_id IS NOT NULL