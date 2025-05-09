# Find MoJ data 

Find MoJ data is a searchable catalogue service to help users find and understand data, supporting the [Ministry of Justice's 2025 data strategy](https://www.gov.uk/government/publications/ministry-of-justice-digital-strategy-2025). 
You can [read an update on the MoJ’s data strategy](https://mojdigital.blog.gov.uk/2023/12/19/mojs-data-strategy-one-year-on/) to learn more about Find MoJ data’s role in improving the department’s approach to data. 

Find MoJ data unites many different MoJ sources in one place, describing datasets with metadata but without including actual data. This is because data owners are responsible for controlling access to potentially sensitive data.  

You can use Find MoJ data to:

* discover datasets from [MoJ data sources](#moj-data-sources)
* evaluate datasets for relevance without needing access to the data they contain 
* locate data owners, so you can request access or report a problem

##  Using Find MoJ data for your work

Anyone with an @justice.gov.uk (Microsoft) account can sign in to Find MoJ data and start using it. Use the service’s search bar to discover datasets through keywords, or select a category to see all datasets in one area. You can filter results to focus on relevant datasets.  

Each entry lists metadata to describe the data asset, so you can understand its scope and the type of information it contains. For example, Find MoJ data can show you database descriptions for versions of NOMIS (`nomis_dbt` or `nomis_sensitive`).

You can see other information about a data asset, including:

* format type	
* table descriptions
* field descriptions
* database descriptions
* table schemas	
* security classification 
* how regularly the data owner intends to update the data

## How Find MoJ data works

<img src="/images/how-find-moj-data-works.svg" alt="A flowchart illustrating the steps in the Find MoJ Data process, starting with data owners providing datasets and ending with Find MoJ Data users accessing the information" width="400" height="250">

1. Data owners store and maintain their datasets on the Analytical Platform (AP) and other sources.
1. Find MoJ data ingests the metadata of datasets from the AP and other sources every day. 
1. Find MoJ data adds the ingested metadata to DataHub so it can be accessed from the DataHub API. 
1. Information about ingested datasets is displayed in Find MoJ data’s user interface.
1. Users can find and evaluate dataset entries on Find MoJ data. 
1. Users can contact data owners to request access or report a problem. 


## MoJ data sources

The MoJ owns a large number of data sources which are stored and maintained differently, making the data landscape complex and difficult to join up. While the service is in private beta, the catalogue includes a limited range of datasets. 

Find MoJ data includes information about the following:

* statistical publications from GOV.UK
* charts from [Justice Data](https://data.justice.gov.uk/) 
* digital prisons reporting (DPR) data from the [Create a Derived Table (CaDeT) service](https://github.com/moj-analytical-services/create-a-derived-table)
* electronic monitoring (EM) data from the [Create a Derived Table (CaDeT) service](https://github.com/moj-analytical-services/create-a-derived-table)
* models from the [Create a Derived Table (CaDeT) service](https://github.com/moj-analytical-services/create-a-derived-table)
* AWS Glue databases, including from legacy pipelines

## Adding datasets to Find MoJ data's catalogue

You can add an entry about your data to Find MoJ data's catalogue yourself if it's derived using the Analytical Platform's Create a Derived Table (CaDeT) service. Follow guidance on [Adding metadata from Create a Derived Table to Find MoJ data](./cadet-registration.md).

If your data is somewhere else, such as Glue, Amazon RDS or an API, [contact us](#contact-us) to discuss. 

## Dataset lineage

For datasets created using CaDeT, table lineage information is displayed using DataHub's interactive graph. Note that glue/athena tables created using airflow and not using CaDeT will not have coverage for lineage.

##  Contact us

Tell us about your experience, data you’d like to see or any suggestions by using the [Find MoJ data feedback form](https://find-moj-data.service.justice.gov.uk/feedback/). 

You can also contact the team on [our Slack channel](https://moj.enterprise.slack.com/archives/C06NPM2200N) or [our MS Teams channel](https://teams.microsoft.com/l/channel/19%3Abb91d2a728a54472a41629ee6f2908ea%40thread.tacv2/Ask%20Data%20Catalogue?groupId=f6c3cb3b-591c-4e47-9997-25b6dc9bf5b6&tenantId=c6874728-71e6-41fe-a9e1-2e8c36776ad8").

If you have an issue with a dataset, select **Report an issue** on the catalogue entry to contact the data owner.
