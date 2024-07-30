# Adding tables to Find MoJ Data from Create a Derived Table (CaDeT)

[Config of CaDeT models is described in their documentation here](https://user-guidance.analytical-platform.service.justice.gov.uk/tools/create-a-derived-table/models/#where-can-i-define-configs)

- Find MoJ Data is integrated with the Create a Derived Table service (CaDeT).
- DBT models are represented by tables in Find MoJ Data.
- To add a model created in CaDeT to Find MoJ Data, add the tag `dc_display_in_catalog` to that model.
- To add an owner to a model in Find MoJ Data, add the `dc_owner` metadata item to that model.
- Domain and database for a DBT model will be inferred from CaDeT file structure.

For example, in the `dbt_project.yml` file:

```
models:
  mojap_derived_tables:
    +materialized: table
    +group: default
    +meta:
      # Metadata to send the Data Catalogue. Can be overriden
      # per domain/model/source
      dc_slack_channel_name: "#ask-data-modelling"
      dc_slack_channel_url: https://moj.enterprise.slack.com/archives/C03J21VFHQ9
      dc_where_to_access_dataset: AnalyticalPlatform
    bold:
      +meta:
        dc_owner: jane.doe
      +group: bold
      bold_rr_pnc_ids:
      +tags:
        - bold_daily
        - dc_display_in_catalogue
```
