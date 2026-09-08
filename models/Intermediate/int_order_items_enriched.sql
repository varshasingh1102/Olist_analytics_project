{{ config(materialized='table') }}
WITH order_items AS (
    SELECT *
    FROM {{ ref('stg_order_items') }}
),

products AS (
    SELECT *
    FROM {{ ref('stg_products') }}
),

sellers AS (
    SELECT *
    FROM {{ ref('stg_sellers') }}
),

categories AS (
    SELECT *
    FROM {{ ref('stg_category_translation') }}
),

enriched AS (
    SELECT
        oi.order_id,
        oi.order_item_id,
        oi.product_id,
        oi.seller_id,
        oi.shipping_limit_date,
        oi.price,
        oi.freight_value,
        p.product_category_name,
        c.product_category_name_english,
        p.product_weight_g,
        p.product_length_cm,
        p.product_height_cm,
        p.product_width_cm,
        s.seller_city,
        s.seller_state

    FROM order_items oi

    LEFT JOIN products p
        ON oi.product_id = p.product_id

    LEFT JOIN categories c
        ON p.product_category_name = c.product_category_name

    LEFT JOIN sellers s
        ON oi.seller_id = s.seller_id
)

SELECT *
FROM enriched