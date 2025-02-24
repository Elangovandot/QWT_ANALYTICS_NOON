{{config(materialized = 'table', schema = env_var('DBT_TRANSFORMSCHEMA','transforming_dev'))}}

select 
get(xmlget(SUPPLIERINFO, 'SupplierID'),'$') as supplierid,
get(xmlget(SUPPLIERINFO, 'CompanyName'),'$'):: varchar as companyname,
get(xmlget(SUPPLIERINFO, 'ContactName'),'$'):: varchar as contactname,
get(xmlget(SUPPLIERINFO, 'Address'),'$'):: varchar as address,
get(xmlget(SUPPLIERINFO, 'City'),'$'):: varchar as city,
get(xmlget(SUPPLIERINFO, 'PostalCode'),'$'):: varchar as postalcode,
get(xmlget(SUPPLIERINFO, 'Country'),'$'):: varchar as country,
get(xmlget(SUPPLIERINFO, 'Phone'),'$'):: varchar as phone,
get(xmlget(SUPPLIERINFO, 'Fax'),'$'):: varchar as fax
from 
{{ref('stg_suppliers')}}