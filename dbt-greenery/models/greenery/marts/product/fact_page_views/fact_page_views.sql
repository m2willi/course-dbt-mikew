{{
  config(
    materialized='table'
  )
}}

Select 
o.Page_Type,
  o.Product_id,
  o.Delete_from_cart,
  o.Checkout,
  o.Page_View,
  o.Add_to_cart,
  o.Package_Shipped,
  o.Account_Created
FROM {{ ref('int_page_views') }} o
where o.product_id is not null
