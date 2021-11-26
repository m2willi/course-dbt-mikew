{{
  config(
    materialized='table'
  )
}}

SELECT
  u.product_id,
  u.name,
  u.price
FROM {{ ref('stg_products') }} u
