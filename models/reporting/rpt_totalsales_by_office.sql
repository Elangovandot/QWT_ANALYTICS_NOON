{{config(materialized = 'view', schema = 'reporting_dev')}}

select
e.country,
c.companyname,
c.contactname,
count(o.orderid) as total_orders,
sum(o.quantity) as tota_quantity,
sum(o.linesalesamount) as total_sales,
avg(o.margin) as avg_margin

from

{{ref('fct_orders')}} as o inner join
{{ref('dim_customers')}} as c on o.customerid = c.customerid
inner join {{ref('dim_employees')}} as e on o.employeeid=e.employee_id
where e.country ='{{var('v_country','Sweden')}}'
group by e.country,c.companyname,c.contactname
order by total_sales desc