---
title: Adding Database metadata to Find MoJ data from Create a Derived Table (CaDeT)
owner_slack: "#data-catalogue"
last_reviewed_on: 2024-10-28
review_in: 2 months
---

# Adding Database metadata to Find MoJ data from Create a Derived Table (CaDeT)

If your model has been tagged with `dc_display_in_catalogue` then by default it will have its parent database created in Find MoJ data, see guidance for [registering a model/table](../../data/cadet-registration/index.html)

However, this database will have no associated metadata available to make it more useful to someone browsing Find MoJ data. But don't worry you can create this metadata and this section will explain how.

## Creating a metadata file for your CaDeT database

Create a branch off of latest main in the [CaDeT github repoistory](https://github.com/moj-analytical-services/create-a-derived-table).

Add a new yaml file with filename as the name of your database in the folder [`mojap_derived_tables/database_metadata`](https://github.com/moj-analytical-services/create-a-derived-table/tree/main/mojap_derived_tables/database_metadata)

Add your metadata to the file. The content of that file should be like the example below but with metadata relating to your specific database:

```yaml
database_metadata:
  # The name of the database as it appears in prod
  name: example_derived
  # A description of the database that will aid people to understand what
  # it contains and whether it might be of use
  description: This is just an example, serves no other purpose
  # The data custodian (technical contact)
  # This should be the name as it appears before the @justice.gov.uk
  # If a functional mailbox or team email it can be given as full email
  # address
  dc_data_custodian: some.body12
  # Slack channel name for where people should direct any questions they
  # have about the data
  dc_slack_channel_name: "#ask-channel-example"
  # The url for the named channel above
  dc_slack_channel_url: "https://moj.enterprise.slack.com/archives/12"
  # A readable user friendly name for the database that can be used to
  # display in find-moj-data
  dc_readable_name: Example derived
  # A link to where a user of find-moj-data can find information on how to
  # access the data
  dc_access_requirements: "https://example-data-access.gov.uk"
```

Raise a pull request, when your file is complete, to have your metadata reviewed and merged to main.

When merged to main your new database metadata will be available in Find MoJ data the following day.
