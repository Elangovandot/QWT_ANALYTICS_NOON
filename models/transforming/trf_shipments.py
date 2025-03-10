import snowflake.snowpark.functions as F
def model(dbt, session):

    dbt.config(materialized = 'table')

    shipments_df = dbt.ref('shipments_snapshot')

    shippers_df = dbt.ref('lkp_shipments')

    final_shipments_df = (
        shipments_df
        .join(shippers_df,shipments_df.shipperid == shippers_df.shipperid, 'left')
        .select(shipments_df.orderid.alias('orderid'),
                shipments_df.lineno.alias('lineno'),
                shippers_df.companyname.alias('companyname'),
                shipments_df.shipmentdate.alias('shipmentdate'),
                shipments_df.status.alias('status'),
                shipments_df.dbt_valid_to.alias('dbt_valid_to')
                )
    )

    final_shipments_df = final_shipments_df.filter(F.col('dbt_valid_to').isNull())

    return final_shipments_df