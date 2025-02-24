{{ config(materialized = 'table',)}}

select 
officeid as id,
officeAddress as address,
officePostalCode as postalcode,
officeCity as city,
officeStateProvince as stateprovince,
officePhone as phone,
officeFax as fax,
officeCountry as country
from
{{source('raw_qwt','raw_empoffice')}}