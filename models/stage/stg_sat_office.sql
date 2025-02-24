{{ config(materialized = 'table') }}
 
select
 
officehashkey,
loaddatetime,
officeaddress ,
officepostalcode ,
officecity ,
officestateprovince ,
officephone ,
officefax ,
officecountry
 
from
 
{{source('raw_qwt', 'raw_offices')}}