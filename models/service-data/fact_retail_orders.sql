{{ config(materialized="table") }}

SELECT
    o.order_id
    , o.order_date AS date
    , o.order_customer_id AS customer_id
    , o.order_status
    , d.order_item_id
    , d.order_item_product_id AS product_id
    , COALESCE(d.order_item_quantity, 0) AS quantity
    , COALESCE(d.order_item_subtotal, 0) AS subtotal
    , COALESCE(d.order_item_product_price, 0) AS product_price
FROM {{ ref('orders') }} o
    JOIN {{ ref('order_items') }} d
        ON o.order_id = d.order_item_order_id
