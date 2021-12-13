{{
  config(
    materialized='table'
  )
}}

With conversion_calc as (
select 
count(distinct(session_id))::numeric total_session,
sum(case when funnel_level1 = 1 then 1 else 0 end)::numeric tot_lvl_1, 
sum(case when funnel_level2 = 1 then 1 else 0 end)::numeric tot_lvl_2,  
sum(case when funnel_level3= 1 then 1 else 0 end )::numeric   tot_lvl_3
from 
 {{ ref('fact_session_funnel') }}
)
Select
total_session,
tot_lvl_1,
tot_lvl_2,
tot_lvl_3,
(tot_lvl_1/total_session) *100 "conv_lvl_1",
(tot_lvl_2/total_session) *100 "conv_lvl_2",
(tot_lvl_3/total_session) *100 "conv_lvl_3"
From conversion_calc
