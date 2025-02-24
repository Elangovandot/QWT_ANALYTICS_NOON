def model(dbt, session):

    product_df = dbt.source("raw_qwt","raw_products")

    return product_df