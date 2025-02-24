{{config (materialized ='view',schema ='salesmart_dev')}}

select 

orderid,
lineno,
companyname,
shipmentdate,
status,
dbt_valid_to
from
{{ref("trf_shipments")}}