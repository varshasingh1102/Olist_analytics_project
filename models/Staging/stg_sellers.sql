WITH source AS (

    SELECT *
    FROM {{ source('olist_raw', 'OLIST_SELLERS') }}

),

renamed AS (

    SELECT
        seller_id,
        seller_zip_code_prefix,
        seller_city,
        seller_state

    FROM source

)

SELECT *
FROM renamed