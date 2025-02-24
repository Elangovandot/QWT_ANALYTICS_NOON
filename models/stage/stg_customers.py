def model(dbt, session):

    customers_df = dbt.source("raw_qwt","raw_customer")

    return customers_df