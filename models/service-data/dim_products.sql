{{ config(materialized="table") }}

SELECT
    p.product_id
    , p.product_name
    , p.product_description
    , p.product_price
    , p.product_image
    , COALESCE(c.category_id, 0) AS category_id
    , COALESCE(c.category_name, 'N/A') AS category_name
    , COALESCE(d.department_id, 0) AS department_id
    , COALESCE(d.department_name, 'N/A') AS department_name
FROM {{ ref('products') }} p
    LEFT JOIN {{ ref('categories') }} c
        ON p.product_category_id = c.category_id
    LEFT JOIN {{ ref('departments') }} d
        ON c.category_department_id = d.department_id