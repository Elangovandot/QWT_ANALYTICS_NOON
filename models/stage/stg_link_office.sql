{{config(materialized = 'table')}}
 
select
MD5(officehashkey || empid) as empofficehashkey,
current_timestamp as loaddatetime,
'raw_offices' as recordsrc,
o.officehashkey,
e.empid
from
 
{{ref('stg_employees')}} as e inner join
 
{{ref('stg_hub_office')}} as o on e.office = o.officeid