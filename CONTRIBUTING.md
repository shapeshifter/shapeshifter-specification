# Contributing guidelines

## Markdown setup and best-practices

This specification is written in the Markdown syntax.
It can be viewed on GitHub directly, but it is also used to generate a website and pdf document.

The website is leading in the features that can be used.
For more information see the projects used to render and upload the documentation:

- [MkDocs](https://www.mkdocs.org/) the rendering engine
- [Material for MkDocs](https://squidfunk.github.io/mkdocs-material/) the theme
- [MkDocs PDF Generate Plugin](https://isolveit.github.io/mkdocs-pdf-generate/) to render pdf document of sections
- [Mike](https://github.com/jimporter/mike) to publish multiple versions

Besides the technical features, here are some brief recommendations on using Markdown:

- One scentence per line, this makes it easier to handle frequent changes and check differences.
- Name files using 'kebab-case' like `my-important-file.md`
- Use HTML only if necessary, like:
  - comments within the Markdown source code
  - complicated layout not achievable otherwise
  - lists in tables
- Check the more [advanced features of Material for MkDocs](https://squidfunk.github.io/mkdocs-material/reference/) to see what is available and what the syntax is.

## Local preview

The Python MkDocs tools in this project are managed using [Poetry](https://python-poetry.org/).
Using Poetry you can setup a local development environment environment:

```
$ poetry install --no-root
```

Then you can run a process that continously monitors the source and serves it online:

```
$ poetry run mkdocs serve
```

Or build it once so you end up with the generated HTML in the `site/` folder:

```
$ poetry run mkdocs build
```

An environment variable is necessary to enable local generation of pdf files because this take a while.
You need to set the environmental variable `ENABLE_PDF_EXPORT` to `1`:

```
$ export ENABLE_PDF_EXPORT=1
$ poetry run mkdocs serve
```
