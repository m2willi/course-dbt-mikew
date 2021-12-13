{{
  config(
    materialized='table'
  )
}}

Select 
o.created_date,
  o.Product_id,
  o.delete_from_carts,
  o.Checkouts,
  o.add_to_carts
FROM {{ ref('int_page_views') }} o
where o.product_id is not null
