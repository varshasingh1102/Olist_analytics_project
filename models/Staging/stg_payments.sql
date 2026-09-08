WITH source AS (

    SELECT *
    FROM {{ source('olist_raw', 'OLIST_ORDER_PAYMENTS') }}

),

renamed AS (

    SELECT
        order_id,
        payment_sequential,
        payment_type,
        payment_installments,
        payment_value

    FROM source

)

SELECT *
FROM renamed