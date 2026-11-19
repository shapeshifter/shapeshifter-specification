<!--
SPDX-FileCopyrightText: 2026 Contributors to the Shapeshifter project

SPDX-License-Identifier: Apache-2.0
-->

# Specification Versioning and Publishing

## Version policy

The versioned directory is the source of truth for each specification snapshot:

```text
specifications/
  1.0.1/
  2.0.0/
  3.0.0/
  3.1.0/
  development/
```

Each directory contains its own documentation and XSDs, plus release artifacts when available. Numbered releases are immutable after publication. `development` is the mutable draft following the latest numbered release; its content must not be presented as a numbered release.

The canonical documentation paths are `/1.0.1/`, `/2.0.0/`, `/3.0.0/`, `/3.1.0/`, and `/development/`. The site root redirects to `/development/`. The version selector links between versions.

All editable specification Markdown and images belong under `specifications/<version>/docs/`; the development source is `specifications/development/docs/`. Keep XSD includes and Markdown image references within their version directory. Do not maintain a duplicate root `docs/` or `xsd/` source.

## Publishing

The `docs-publish` workflow builds each versioned documentation tree as a static site and publishes the complete site to the `gh-pages` branch. `scripts/build-docs.sh` writes the sites to their matching version paths and generates the root `versions.json` consumed by Material's native version selector. The root `index.html` redirects to the development site.

The workflow publishes on pushes to `main` and published releases. A fork-only preview trigger for `migration/versioned-publishing` is currently retained; remove that temporary trigger before merging the workflow upstream.

For a release, copy the approved development documentation, images, and XSDs into a new numbered directory, add available release artifacts, and record their provenance. Never change the content behind an already published numbered path. Verify relative references and the rendered site before publishing.

## Historical provenance

The `V3.0.0` and `V3.1.0` tags are authoritative for their XSDs and release artifacts. Those tags predate or do not contain the Markdown conversion, so the Markdown snapshots use the nearest reviewed documentation commits. The v1.0.1 and v2.0.0 XSDs are reconstructed from their historical commits.

| Version or artifact | Source | Preserved content |
| --- | --- | --- |
| v1.0.1 XSDs | [Commit `e12a4f9`](https://github.com/shapeshifter/shapeshifter-specification/commit/e12a4f9293075ee369b62c7bb0e3cf08ea57b450) | Complete v1.0.1 XSD set from the historical `V1.01/` directory; the README was added later. |
| v2.0.0 XSDs | [Commit `cc7a362`](https://github.com/shapeshifter/shapeshifter-specification/commit/cc7a362d86ac693e130091a5c9376bf2d848ee2c) | Complete v2.0.0 XSD set. |
| v3.0.0 XSDs and release artifacts | [`V3.0.0`, commit `2b2f8f3`](https://github.com/shapeshifter/shapeshifter-specification/tree/2b2f8f394eeab7a47f14e31593bd6634f37621bc) | Tagged XSDs and release documents. The PDF and Word files were introduced in [commit `7068732`](https://github.com/shapeshifter/shapeshifter-specification/commit/7068732d31d059e13e8dafd1cc5d5e89866d9e8b). |
| v3.0.0 Markdown and images | [Commit `24da5e2`](https://github.com/shapeshifter/shapeshifter-specification/commit/24da5e2d8443108a23aaceca8a8215330fb0c65b) | First complete, reviewed Markdown conversion and image assets (2023-02-20). |
| v3.1.0 XSDs and release artifacts | [`V3.1.0`, commit `3078c25`](https://github.com/shapeshifter/shapeshifter-specification/tree/3078c25a067c641dacd38ae8bde1ba4b4fe48413) | Tagged XSDs and release documents. |
| v3.1.0 Markdown and images | [Commit `92ef001`](https://github.com/shapeshifter/shapeshifter-specification/commit/92ef001b79c6312403e4e463bcbc827c14f5a389) | Documentation state immediately preceding the v3.1.0 release (2025-04-30). |
| Development Markdown and images | [Commit `38b40f3`](https://github.com/shapeshifter/shapeshifter-specification/commit/38b40f36316395d169b446cd156a567dd117ae36) | Mutable documentation immediately before it was moved under `specifications/development/`. |
| Development XSDs | [Commit `f799cac`](https://github.com/shapeshifter/shapeshifter-specification/commit/f799cac9867c473fc4a4d18a0db046d577bada0c) | Mutable XSDs immediately before they were moved under `specifications/development/`. |
| Markdown specification and publishing | [PR #67](https://github.com/shapeshifter/shapeshifter-specification/pull/67), later refined | MkDocs, Material for MkDocs, and GitHub Actions publishing history. |

Preserve these commit and tag references even for historical versions that were not published as GitHub Releases. Migration-added READMEs and shared `docs/versions.md` indexes are metadata rather than part of the historical source snapshots.
