{{config(materialized = 'table', schema =env_var('DBT_TRANSFORMSCHEMA','transforming_dev')) }}

select 
p.productid,
p.productname,
c.categoryname,
s.companyname as suppliercompany,
s.contactname as suppliercontact,
s.city as suppliercity,
s.country as suppliercuntry,
p.quantityperunit,
p.unitcost,
p.unitprice,
p.unitinstock,
p.unitsonorder,
p.unitprice - p.unitcost as profit,
IFF(p.unitinstock > p.unitsonorder, 'Available','Not available') as productavailability

from
{{ref('stg_products')}} as p inner join {{ref('trf_suppliers')}} as s 
on p.supplierid = s.supplierid
inner join 
{{ref('lkp_configuration')}} as c on
p.categoryid = c.categoryid