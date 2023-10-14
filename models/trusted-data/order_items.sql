{{ config(materialized="table") }}

SELECT
    order_item_id
    , order_item_order_id
    , order_item_product_id
    , COALESCE(order_item_quantity, 0) AS order_item_quantity
    , COALESCE(order_item_subtotal, 0) AS order_item_subtotal
    , COALESCE(order_item_product_price, 0) AS order_item_product_price
FROM {{ source('retail_raw', 'order_items') }} 
WHERE order_item_id IS NOT NULL
    AND order_item_order_id IS NOT NULL
    AND order_item_product_id IS NOT NULL