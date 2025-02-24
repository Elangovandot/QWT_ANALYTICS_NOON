{{ config(materialized = 'table')}}

select 
empid,
lastname,
firstname,
title,
hire,
office,
IFF(extension='-', 'NA',extension) as extension,
reportsto,
yearsalary
from
{{source('raw_qwt','raw_employees')}}
