WITH source AS (

    SELECT *
    FROM {{ source('olist_raw', 'OLIST_ORDER_ITEMS') }}

),

renamed AS (

    SELECT
        order_id,
        order_item_id,
        product_id,
        seller_id,
        shipping_limit_date,
        price,
        freight_value

    FROM source

)

SELECT *
FROM renamed