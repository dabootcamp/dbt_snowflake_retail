{{ config(materialized="table") }}

SELECT
    product_id
    , product_category_id
    , TRIM(product_name) AS product_name
    , NULLIF(TRIM(product_description), '') AS product_description
    , COALESCE(product_price, 0) AS product_price
    , TRIM(LOWER(product_image)) AS product_image
FROM {{ source('retail_raw', 'products') }} 
WHERE product_id IS NOT NULL