WITH source AS (

    SELECT *
    FROM {{ source('olist_raw', 'PRODUCT_CATEGORY_NAME_TRANSLATION') }}

),

renamed AS (

    SELECT
        product_category_name,
        product_category_name_english

    FROM source

)

SELECT *
FROM renamed