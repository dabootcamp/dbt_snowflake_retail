{{ config(materialized="table") }}

SELECT
    department_id
    , TRIM(department_name) AS department_name
FROM {{ source('retail_raw', 'departments') }} 
WHERE department_id IS NOT NULL