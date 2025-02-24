{{config(materialized='view',schema='salesmart_dev', post_hook = 'grant usage on database qwt_analytics_dev to role sysadmin;')}}
 
select *
from
{{ref('trf_orders')}}
 