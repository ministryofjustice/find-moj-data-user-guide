# Adding tables to Find MoJ data from Create a Derived Table (CaDeT)

Find MoJ data uses the [Create a Derived Table](https://github.com/moj-analytical-services/create-a-derived-table) service (CaDeT) as a source of metadata about the Analytical Platform. CaDeT uses a python package called [dbt](https://www.getdbt.com/product/what-is-dbt).

By default, all models and sources will be ingested into the Datahub catalogue, but they will not be shown in the Find MoJ data service.

## Make a model visible

To make a model visible in Find MoJ data, add the `dc_display_in_catalogue` tag to that model. [Config of CaDeT models is described in their documentation here.](https://user-guidance.analytical-platform.service.justice.gov.uk/tools/create-a-derived-table/models/#where-can-i-define-configs)

For example, in `dbt_project.yml` you can include

```yaml
models:
  courts:
    some_subdirectory:
      common_platform_derived:
        +tags:
          - dc_display_in_catalogue
```

This tag should be used for tables that users are expected to work with directly. Don't add it to intermediate/staging tables.

### Generated models

Some models are generated from a template. If you intend to include these generated models
in the catalogue, set `tags` to `$TAGS_WITH_DISPLAY_IN_CATALOGUE$` in the YAML template. This makes sure that the `dc_display_in_catalogue` tag is set in the resulting file.

For example, `/model_templates/oasys/templates/models/risk/oasys/oasys__{table_name}.yml` contains the following model definition:

```yaml
- name: $MODEL_NAME$
  config:
    tags: $TAGS_WITH_DISPLAY_IN_CATALOGUE$
```

## Set required metadata

When adding new entities to the catalgoue, we require that you specify some additional metadata in DBT. For example:

```yaml
models:
  courts:
    +meta:
      dc_slack_channel_name: "#ask-data-engineering"
      dc_slack_channel_url: https://moj.enterprise.slack.com/archives/C8X3PP1TN
      dc_owner: Joe.Bloggs
```

This metadata can be set at domain level, so for all tables in that domain, or individually on a per-table level.

The required fields are as follows:

| field name            | description                                                                                                                                                                                                                                                                                                                                                       | example                                               |
| --------------------- | ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | ----------------------------------------------------- |
| dc_slack_channel_name | The name of a slack channel to be used as a contact point for users of the catalogue service, including the leading '#'. Note: this is not the same as the owner channel for notifications.                                                                                                                                                                       | `#data-engineering`                                   |
| dc_slack_channel_url  | The URL to the slack channel                                                                                                                                                                                                                                                                                                                                      | `https://moj.enterprise.slack.com/archives/C8X3PP1TN` |
| dc_owner              | The Datahub user ID for the [data owner](https://www.gov.uk/government/publications/essential-shared-data-assets-and-data-ownership-in-government/data-ownership-in-government-html#data-owner-2), usually in the form FirstName.LastName. This is the senior individual accountable for the data, _not_ a data custodian. This is not the same as the DBT owner. | `Joe.Bloggs`                                          |

## Additional metadata

| field name                 | description                                                                                                                                                              | example            |
| -------------------------- | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------ | ------------------ |
| dc_where_to_access_dataset | An enum representing how the data can be accessed by end users, eg a choice of ["AnalyticalPlatform", "CourtsAPI"]. For DBT, this always defaults to AnalyticalPlatform. | AnalyticalPlatform |

## Full example `dbt_project.yml` file

```yaml
models:
  mojap_derived_tables:
    +materialized: table
    +group: default
    +meta:
      # Metadata to send Find MoJ data. Can be overriden
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

## Ensure the data owner has an account in Datahub

The owner's Datahub account must exist before you set the `dc_owner_id`. This will happen automatically the first time they log into Datahub.

The user ID is visible in the URL of a user page in Datahub, e.g.

`https://datahub-catalogue-dev.apps.live.cloud-platform.service.justice.gov.uk/user/**urn:li:corpuser:Joe.Bloggs**/owner%20of`

[Speak to Find MoJ data team](/index.html#contact-us) if you would like us to manually add a set of users without them logging in.
