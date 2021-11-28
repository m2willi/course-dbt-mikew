{{
  config(
    materialized='table'
  )
}}

SELECT
  o.order_id,
  o.user_id,
  u.email,
  u.first_name,
  u.state,
  u.zipcode,
  u.country,
  o.status,
  o.tracking_id,
  o.shipping_service,
  o.order_cost
FROM {{ ref('int_user_order') }} o