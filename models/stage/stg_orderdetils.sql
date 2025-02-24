/*{{ config(materialized='incremental',unique_key=['orderid','lineno'])}}
 
select od.*,o.orderdate
from
{{source('raw_qwt','raw_orderdetails')}} as od
inner join {{source('raw_qwt','raw_orders')}} as o
on od.orderid=o.orderid
 
{% if is_incremental() %}
 
where o.orderdate > (select max(o.orderdate) from {{this}} as od join {{source('raw_qwt','raw_orders')}} as o on od.orderid=o.orderid)
 
{% endif %}*/

{{ config(materialized='incremental', unique_key=['orderid', 'lineno']) }}

select
    od.*,
    o.orderdate
from
    {{source('raw_qwt', 'raw_orderdetails')}} as od
inner join
    {{source('raw_qwt', 'raw_orders')}} as o
on
    od.orderid = o.orderid

{% if is_incremental() %}

where
    o.orderdate > (
        select
            max(o2.orderdate)
        from
            {{this}} as od2
        inner join
            {{source('raw_qwt', 'raw_orders')}} as o2
        on
            od2.orderid = o2.orderid
    )

{% endif %}