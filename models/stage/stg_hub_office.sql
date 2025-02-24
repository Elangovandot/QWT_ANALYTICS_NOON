{{config(materialized = 'table')}}
 
select
 
officehashkey,
loaddatetime,
recordsrc ,
officeid
 
from
 
{{source('raw_qwt', 'raw_offices')}}