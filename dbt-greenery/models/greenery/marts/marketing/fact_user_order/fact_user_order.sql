{{
  config(
    materialized='table'
  )
}}

SELECT
  o.order_id,
  o.user_id,
  o.email,
  o.first_name,
  o.state,
  o.zipcode,
  o.country,
  o.status,
  o.tracking_id,
  o.shipping_service,
  o.order_cost
FROM {{ ref('int_user_order') }} o