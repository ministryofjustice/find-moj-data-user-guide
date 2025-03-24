# Find MoJ data user guide
[![Ministry of Justice Repository Compliance Badge](https://github-community.service.justice.gov.uk/repository-standards/api/find-moj-data-runbooks/badge)](https://github-community.service.justice.gov.uk/repository-standards/find-moj-data-runbooks)

This repository holds the website and documentation for the [Find MoJ data
user guide](https://user-guide.find-moj-data.service.justice.gov.uk/).

This repository utilises the Ministry of Justice's [template-documentation-site](https://github.com/ministryofjustice/template-documentation-site).

> Want to give feedback on the documentation? [Open an issue on this repository](https://github.com/ministryofjustice/find-moj-data-user-guide/issues).

## Running locally

You can run this website locally by running:

```sh
make preview
```

You can then browse to http://localhost:4567 to view the website.

## Updating documentation

You can update the documentation by editing any of the `*.html.md.erb` files in
the [source](source) directory.

The syntax used in `*.html.md` is Markdown, although you can insert arbitrary HTML from the GOV.UK design system.

## Publishing changes

Any changes that are merged into the `main` branch will be published
automatically through the [`publish.yml` GitHub action](.github/workflows/publish.yml).

This website is hosted on [GitHub Pages](https://pages.github.com/).

## Configuring the website

The [GOV.UK Tech Docs Template global configuration options](https://github.com/alphagov/tech-docs-template/blob/main/optional/config/tech-docs.yml.tt)
can be used in this repository to configure the Cloud Platform user guide.
