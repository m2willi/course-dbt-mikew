{{
  config(
    materialized='table'
  )
}}

Select 
  case when page_url like '%checkout%' then 'Checkout'
    when page_url like '%product%' then 'Product'
    when page_url like '%signup%' then 'Signup'
    when page_url like '%help%' then 'Help'
    when page_url like '%shipping%' then 'Shipping'
    when page_url like '%browse%' then 'Browse'
  End page_type,
  case when page_url like '%product%' then substr(page_url,30,39) end product_id,
  sum(
    case when event_type = 'delete_from_cart' then 1 else 0
    end) 
  delete_from_cart,
  sum(
    case when event_type = 'checkout' then 1 else 0
    end) 
  checkout,
  sum(
    case when event_type = 'page_view' then 1 else 0
    end) 
  page_view,
  sum(
    case when event_type = 'add_to_cart' then 1 else 0
    end) 
  add_to_cart,
  sum(
    case when event_type = 'package_shipped' then 1 else 0
    end) 
  package_shipped,
  sum(
    case when event_type = 'account_created' then 1 else 0
    end) 
  account_created
FROM {{ ref('stg_events') }} o
Group by 1,2

