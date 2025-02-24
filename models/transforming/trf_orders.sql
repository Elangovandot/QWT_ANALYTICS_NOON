{{config(materialized = 'table', schema = env_var('DBT_TRANSFORMSCHEMA','transforming_dev'))}}

select
    o.orderid,
    od.lineno,
    o.customerid,
    o.employeeid,
    o.shipperid,
    od.productid,
    o.freight,
    od.quantity,
    od.unitprice,
    od.discount,
    o.orderdate,
    to_decimal((od.unitprice * od.quantity) * (1-od.discount), 9, 2) as linesalesamount,
    to_decimal((p.unitcost * od.quantity), 9, 2) as costofgoodssold,
    to_decimal(((od.unitprice * od.quantity) * (1-od.discount)) - (p.unitcost * od.quantity), 9, 2) as margin
from
    {{ref('stg_orders')}} as o
left join
    {{ref('stg_orderdetils')}} as od on o.orderid = od.orderid
left join
    {{ref('stg_products')}} as p on p.productid = od.productid