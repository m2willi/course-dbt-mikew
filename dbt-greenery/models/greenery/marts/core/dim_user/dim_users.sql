{{
  config(
    materialized='table'
  )
}}

SELECT
  u.user_id,
  u.email,
  u.first_name,
  u.last_name,
  u.phone_number,
  ad.address,
  ad.state,
  ad.zipcode,
  ad.country
FROM {{ ref('stg_users') }} u
LEFT JOIN {{ ref('stg_addresses') }} ad
  ON u.address_id = ad.address_id

