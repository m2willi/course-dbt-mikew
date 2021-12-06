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
  p.promo_id,
  p.discount,
  o.order_cost
FROM {{ ref('stg_orders') }} o
LEFT JOIN {{ ref('stg_promos') }} p
  ON o.promo_id = p.promo_id