{{
  config(
    materialized='table'
  )
}}

select  
cast(coalesce(cnt_orders,0)/cnt_events as decimal(10,4))  from
(select cast(count(event_id) as decimal(10,4)) cnt_events from {{ ref('stg_events') }}) events,            
(select  cast(count(order_id) as decimal(10,4)) cnt_orders from {{ ref('stg_orders') }}) orders


