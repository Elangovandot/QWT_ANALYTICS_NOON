{{ config(materialized='table',schema=env_var('DBT_TRANSFORMSCHEMA','transforming_dev'))}}

{% set min_order_date = get_min_orderdate() %}
{% set max_order_date= get_max_orderdate() %}
{{ dbt_date.get_base_dates(min_order_date, max_order_date) }}