{{ config(materialized="table") }}

SELECT
  category_id
  , category_department_id
  , TRIM(category_name) AS category_name
FROM {{ source('retail_raw', 'categories') }}
WHERE category_id IS NOT NULL
