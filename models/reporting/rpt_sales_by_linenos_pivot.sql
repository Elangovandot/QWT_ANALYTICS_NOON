{{config(materialized = 'view', schema = 'reporting_dev')}}
 
select
 
orderid,
{% for linenumber in [1,2,3]%}
sum(case when lineno = {{linenumber}} then linesalesamount else 0 end) as lineno{{linenumber}}_sales,

{% endfor%}

sum(linesalesamount) as total_sales
 
from {{ref('fct_orders')}}
 
group by orderid