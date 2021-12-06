{{
  config(
    materialized='table'
  )
}}

SELECT
  o.order_id,
  o.status,
  o.tracking_id,
  o.shipping_service,
  o.promo_id,
  o.discount,
  o.order_cost
FROM {{ ref('int_order_promos') }} o
