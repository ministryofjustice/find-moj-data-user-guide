# Adding tables to Find MoJ data from Create a Derived Table (CaDeT)

- Find MoJ data is integrated with the [Create a Derived Table](https://github.com/moj-analytical-services/create-a-derived-table) service (CaDeT).
- DBT models created from CaDeT are represented by tables in Find MoJ data.
- To add a model created in CaDeT to Find MoJ data, add the tag `dc_display_in_catalogue` to that model. [Config of CaDeT models is described in their documentation here.](https://user-guidance.analytical-platform.service.justice.gov.uk/tools/create-a-derived-table/models/#where-can-i-define-configs)
- To add an owner to a table in Find MoJ data, add the `dc_owner` metadata item to the CaDeT model. This represents the data owner of the data held within the model. The owner should correspond to an existing @justice.gov.uk email address. For example, `john.smith@justice.gov.uk` would use `john.smith` as the entry for `dc_owner`.
- Other metadata fields which can be added to CaDeT models to be displayed in Find MoJ data are:
  - `dc_slack_channel_name`: slack channel name to contact about the data
  - `dc_slack_channel_url`: slack channel url to contact about the data
  - `dc_where_to_access_dataset`
- Domain and database for a DBT model in Find MoJ data are inferred from the CaDeT file structure.

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
