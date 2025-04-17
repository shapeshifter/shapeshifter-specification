<!--
SPDX-FileCopyrightText: 2020-2023 Contributors to the Shapeshifter project

SPDX-License-Identifier: Apache-2.0
-->

# Contributing guidelines

## Markdown setup and best-practices

This specification is written in the Markdown syntax.
It can be viewed on GitHub directly, but it is also used to generate a website.

The website is leading in the features that can be used.
For more information see the projects used to render and upload the documentation:

- [MkDocs](https://www.mkdocs.org/) the rendering engine
- [Material for MkDocs](https://squidfunk.github.io/mkdocs-material/) the theme
- [PlantUML for MkDocs](https://pypi.org/project/mkdocs-plantuml/) plugin to render PlantUML diagrams
- [Mike](https://github.com/jimporter/mike) to publish multiple versions

Besides the technical features, here are some brief recommendations on using Markdown:

- One sentence per line, this makes it easier to handle frequent changes and check differences.
- Name files using 'kebab-case' like `my-important-file.md`
- Use HTML only if necessary, like:
  - comments within the Markdown source code
  - complicated layout not achievable otherwise
  - lists in tables
- Check the more [advanced features of Material for MkDocs](https://squidfunk.github.io/mkdocs-material/reference/) to see what is available and what the syntax is.

## Local preview

The Python MkDocs tools in this project are managed using [Poetry](https://python-poetry.org/).
Using Poetry you can set up a local development environment:

```
$ poetry install
```

For Windows users: you need to install WeasyPrint as described [here](https://doc.courtbouillon.org/weasyprint/stable/first_steps.html#windows).

Then you can run a process that continuously monitors the source and serves it online:

```
$ poetry run mkdocs serve
```

Or build it once so you end up with the generated HTML in the `site/` folder:

```
$ poetry run mkdocs build
```
