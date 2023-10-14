{{ config(materialized="table") }}

SELECT
    customer_id
    , TRIM(customer_fname) AS customer_fname
    , TRIM(customer_lname) AS customer_lname
    , NULL AS customer_email
    , NULL AS customer_password
    , TRIM(customer_street) AS customer_street
    , TRIM(UPPER(customer_city)) AS customer_city
    , TRIM(UPPER(customer_state)) AS customer_state
    , TRIM(customer_zipcode) AS customer_zipcode
FROM {{ source('retail_raw', 'customers') }}
WHERE customer_id IS NOT NULL
