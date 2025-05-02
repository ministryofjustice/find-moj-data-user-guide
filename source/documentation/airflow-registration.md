# Adding metadata from Airflow to Find MoJ Data

AP Users using Airflow for data workloads will generally register outputs with the AWS Glue catalog, so that they are accessible for analysis via AWS Athena. Find MoJ Data can easily ingest from AWS Glue, [please follow our instructions to do so.](./glue-registration.md)

To define Airflow metadata in code, so that it is not just stored in the Glue catalogue, use [`awswrangler.s3.store_parquet_metadata`](https://aws-sdk-pandas.readthedocs.io/en/stable/stubs/awswrangler.s3.store_parquet_metadata.html) to attach metadata to the parquet file created from your Airflow job. [Here's an example of this being done.](https://github.com/moj-analytical-services/data_linking/blob/473e015227112a39bb71a786fa7ba9ec6550fe4c/06_products/internal/journey/mh-cx/job.py)
