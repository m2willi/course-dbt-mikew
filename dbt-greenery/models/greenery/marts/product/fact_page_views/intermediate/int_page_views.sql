{{
  config(
    materialized='table'
  )
}}

{%
set event_types = [
  'checkout',
   'delete_from_cart',
   'add_to_cart',
   'signup', 
   'help', 
   'shipping', 
   'browse' ,
   'page_view'
  ]
%}

Select 
  session_id,
  case when page_url like '%product%' then substr(page_url,30,39) end product_id,
  date(created_at) "created_date"
  {% for event_type in event_types %}
  ,sum(case when event_type = '{{event_type}}' then 1 else 0 end) as  {{event_type}}s
  {% endfor %}
FROM {{ ref('stg_events') }} o
{{dbt_utils.group_by (3) }}
