{{ config(materialized="table") }}

SELECT
    customer_id
    , customer_fname AS customer_first_name
    , customer_lname AS customer_last_name
    , customer_street
    , customer_city
    , customer_state
    , customer_zipcode
FROM {{ ref('customers') }}