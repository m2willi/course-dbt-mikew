{{
  config(
    materialized='table'
  )
}}

SELECT 
    promo_id,
    discout "discount",
    status
FROM {{ source('tutorial', 'promos') }}
