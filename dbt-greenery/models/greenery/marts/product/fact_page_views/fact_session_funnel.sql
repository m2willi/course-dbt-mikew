{{
  config(
    materialized='table'
  )
}}

with funnel_count as(
Select 
  session_id,
  sum(case when page_views > 0 then 1 else 0 end) pv,
  sum(case when add_to_carts > 0 then 1 else 0 end) atc,
  sum(case when checkouts > 0 then 1 else 0 end) co
FROM {{ ref('int_page_views') }}
group by session_id 
) 
select 
    session_id,
    sum(case when pv > 0 or atc > 0 or co > 0 then 1 else 0 end) as funnel_level1,
    sum(case when pv > 0 or atc > 0  then 1 else 0 end) as funnel_level2,
    sum(case when co > 0 then 1 else 0 end) as funnel_level3
from funnel_count
group by 1