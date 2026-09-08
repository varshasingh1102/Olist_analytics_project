{{ config(materialized='table') }}

SELECT
    o.order_id,
    o.customer_id,
    o.order_status,
    o.order_purchase_timestamp,
    o.order_approved_at,
    o.order_delivered_carrier_date,
    o.order_delivered_customer_date,
    o.order_estimated_delivery_date,

    DATEDIFF(
        'day',
        o.order_purchase_timestamp,
        o.order_delivered_customer_date
    ) AS delivery_days,

    DATEDIFF(
        'day',
        o.order_purchase_timestamp,
        o.order_estimated_delivery_date
    ) AS estimated_delivery_days,

    CASE
        WHEN o.order_delivered_customer_date IS NOT NULL
             AND o.order_estimated_delivery_date IS NOT NULL
             AND o.order_delivered_customer_date
                 <= o.order_estimated_delivery_date
        THEN 'On Time'

        WHEN o.order_delivered_customer_date IS NOT NULL
             AND o.order_estimated_delivery_date IS NOT NULL
             AND o.order_delivered_customer_date
                 > o.order_estimated_delivery_date
        THEN 'Late'

        ELSE 'Not Delivered'
    END AS delivery_performance

FROM {{ ref('stg_orders') }} o