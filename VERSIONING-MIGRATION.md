# Specification Versioning and Publishing Migration

## Purpose

This document records a proposed approach for resolving the version ambiguity raised in [issue #88](https://github.com/shapeshifter/shapeshifter-specification/issues/88) and for guiding the longer-term migration of specification sources and published documentation.

The migration concerns repository organization and publication of the specification. It does not, by itself, require protocol users to migrate XML messages or change their implementations.

## Current Situation

- The repository contains versioned XSD snapshots through 3.1.0 and the 3.1.0 PDF; the changelog's latest recorded release is 3.0.0.
- Issue #88 describes a browsable development site that displays 3.0.0, making its release status unclear.
- [PR #67](https://github.com/shapeshifter/shapeshifter-specification/pull/67) introduced the Markdown specification, MkDocs, Mike, and GitHub Actions publishing. This migration replaces Mike's versioned branch management with a static build of the versioned documentation folders and publishes the complete site to `gh-pages`.
- The `docs-publish` workflow runs on pushes to `main` and published releases. It builds `3.0.0`, `3.1.0`, and `development` under distinct directories, redirects the site root to `/development/`, and provides a version selector on each documentation site. The migration branch may also trigger a fork preview; remove that temporary trigger before merging upstream.
- The previous `/development/` deployment was reported as broken. The new static build keeps that canonical path for the draft and adds stable numbered paths for released documentation.
- The OpenChain License Compliance Specification is a useful organizational reference: it keeps specification releases in distinct versioned directories and separates official material from translations. This repository can adopt the versioned-release pattern without adding language directories until they are needed.

For this proposal, v3.0.0 and v3.1.0 are defined by their Git tags. Treat v3.1.0 as the latest numbered release and the subsequent `development` state as the draft of the next release. The v1 schema set is version 1.0.0. These are working assumptions supplied by the maintainers and should drive the initial archive.

## Historical Version Provenance

The specification has versioned artifacts and document milestones that predate the current Markdown site. These should be considered when building the archive; the migration must not begin its history at v3.0.0. The v3 Git tags predate or do not contain the Markdown conversion, so the v3 Markdown snapshots use the nearest reviewed documentation commits and record that provenance separately from the XSD tag provenance.

| Milestone | Evidence | Migration implication |
| --- | --- | --- |
| v1.0.0 XSDs | [Commit e12a4f9](https://github.com/shapeshifter/shapeshifter-specification/commit/e12a4f9293075ee369b62c7bb0e3cf08ea57b450); README added in a subsequent commit | Preserve the XSD set and README as the v1.0.0 historical snapshot. |
| v2.0.0 XSDs | [Commit cc7a362](https://github.com/shapeshifter/shapeshifter-specification/commit/cc7a362d86ac693e130091a5c9376bf2d848ee2c) | Preserve the XSD state from this commit as its own snapshot. |
| v3.0.0 XSDs | Defined by the `V3.0.0` Git tag | Preserve the tagged XSD state as its own snapshot. |
| v3.1.0 XSDs | Defined by the `V3.1.0` Git tag | Preserve the tagged XSD state as its own snapshot and treat it as the latest numbered release. |
| v3.0.0 PDF and Word document | [Commit 7068732](https://github.com/shapeshifter/shapeshifter-specification/commit/7068732d31d059e13e8dafd1cc5d5e89866d9e8b) | Keep these artifacts with the v3.0.0 snapshot, after confirming they correspond to the same XSD revision. |
| v3.0.0 Markdown and images | [Commit 24da5e2](https://github.com/shapeshifter/shapeshifter-specification/commit/24da5e2d8443108a23aaceca8a8215330fb0c65b), 2023-02-20 | Preserve the first complete, reviewed Markdown conversion and its image assets as the v3.0.0 documentation snapshot. |
| v3.1.0 Markdown and images | [Commit 92ef001](https://github.com/shapeshifter/shapeshifter-specification/commit/92ef001b79c6312403e4e463bcbc827c14f5a389), 2025-04-30 | Preserve the documentation state immediately preceding the `V3.1.0` tag as the v3.1.0 documentation snapshot. |
| Development after v3.1.0 | Draft specification state following the v3.1.0 tag | Publish as `development`, clearly marked as a draft and not as a numbered release. |
| Markdown specification and publishing | [PR #67](https://github.com/shapeshifter/shapeshifter-specification/pull/67), later refined | Preserve the Markdown source history. PR #67 records MkDocs, `mike`, and GitHub Actions publishing as existing infrastructure, not a future assumption. |

The case-sensitive `V3.0.0` and `V3.1.0` Git tags are the authorities for their XSD and release-document contents. The Markdown trees are historical snapshots from the commits listed above because the tags do not contain the converted documentation. Public documentation paths may use normalized lowercase version numbers. For earlier historical states, retain commit provenance even if they were not published as GitHub Releases.

### Version Folder Source Commits

The following references identify the source tree used for each version folder. Where the source commit predates the folder move, the files were copied from that commit without changing their specification content. The migration-added README files and shared `docs/versions.md` indexes are metadata, not part of the historical source snapshots.

| Folder | Source commit or tag | Content taken from the reference |
| --- | --- | --- |
| `specifications/1.0.0/xsd/` | [Commit `e12a4f9`](https://github.com/shapeshifter/shapeshifter-specification/commit/e12a4f9293075ee369b62c7bb0e3cf08ea57b450) | Complete v1.0.0 XSD set. |
| `specifications/2.0.0/xsd/` | [Commit `cc7a362`](https://github.com/shapeshifter/shapeshifter-specification/commit/cc7a362d86ac693e130091a5c9376bf2d848ee2c) | Complete v2.0.0 XSD set. |
| `specifications/3.0.0/xsd/` and release artifacts | [`V3.0.0`, commit `2b2f8f3`](https://github.com/shapeshifter/shapeshifter-specification/tree/2b2f8f394eeab7a47f14e31593bd6634f37621bc) | Tagged XSD, PDF, and Word document. The v3.0.0 PDF and Word files were introduced in [commit `7068732`](https://github.com/shapeshifter/shapeshifter-specification/commit/7068732d31d059e13e8dafd1cc5d5e89866d9e8b). |
| `specifications/3.0.0/docs/` | [Commit `24da5e2`](https://github.com/shapeshifter/shapeshifter-specification/commit/24da5e2d8443108a23aaceca8a8215330fb0c65b) | Reviewed Markdown and its image assets. |
| `specifications/3.1.0/xsd/` and release artifacts | [`V3.1.0`, commit `3078c25`](https://github.com/shapeshifter/shapeshifter-specification/tree/3078c25a067c641dacd38ae8bde1ba4b4fe48413) | Tagged XSD, PDF, and Word document. |
| `specifications/3.1.0/docs/` | [Commit `92ef001`](https://github.com/shapeshifter/shapeshifter-specification/commit/92ef001b79c6312403e4e463bcbc827c14f5a389) | Markdown and image assets immediately preceding the v3.1.0 release. |
| `specifications/development/docs/` | [Commit `38b40f3`](https://github.com/shapeshifter/shapeshifter-specification/commit/38b40f36316395d169b446cd156a567dd117ae36) | Mutable Markdown and image tree immediately before it was moved under `specifications/development/`. |
| `specifications/development/xsd/` | [Commit `f799cac`](https://github.com/shapeshifter/shapeshifter-specification/commit/f799cac9867c473fc4a4d18a0db046d577bada0c) | Mutable XSD tree immediately before it was moved under `specifications/development/`. |

## Branch Strategy

Use `main` as the integration base for the versioning and publishing migration. It is the default branch and contains the current Markdown documentation, MkDocs configuration, and release workflow. The [branch comparison](https://github.com/shapeshifter/shapeshifter-specification/compare/main...V3.x) currently reports `main` as 171 commits ahead of `V3.x` and 7 commits behind it.

Do not ignore the seven `V3.x`-only commits: they include XSD fixes and backports, and the branch contains the v3.1.0 PDF and Word artifacts. Review these changes before finalizing the archive and decide whether they belong in an unreleased development state or a future patch release. Do not apply them to the v3.0.0 or v3.1.0 snapshots, which must remain exactly as defined by their Git tags. Avoid merging `V3.x` wholesale into `main` just for the site migration; bring over changes only through an explicit release/content decision.

## Goals

- Make the status and version of every published specification obvious.
- Keep each released XSD set available as a complete, immutable snapshot.
- Provide browsable documentation for released and development versions at distinct, stable URLs.
- Offer a PDF download for each numbered release where the source artifact is available or can be generated.
- Keep the publication process reproducible and low-maintenance.
- Keep each newly established numbered URL stable; compatibility with the current broken URL is not required.

## Proposed Repository Layout

Store the specification artifacts together by version. Each v3 directory contains that version's complete Markdown and image tree, all XSD files required for the release, and the corresponding published document. Keep relative Markdown image references and XSD `schemaLocation` includes within the same version directory.

```text
/
  README.md
  CHANGELOG.md
  VERSIONING-MIGRATION.md
  specifications/
    <version>/
      README.md
      docs/
        index.md
        assets/
          images/
        ...
      xsd/
        UFTP-common.xsd
        ...
      specification.pdf       # when available for that version
      specification.docx      # when available for that version
    development/
      README.md
      docs/
        index.md
        assets/
          images/
        ...
      xsd/
        UFTP-common.xsd
        ...
  .github/
    workflows/
      publish.yml
```

Version directories should cover `1.0.0`, `2.0.0`, `3.0.0`, and `3.1.0`, plus `development`. The v3.0.0 and v3.1.0 snapshots must be made from their Git tags. Reconstruct older snapshots from the cited historical commits and preserve those commit references in their README files. Numbered release directories are immutable after publication. `development/` is the mutable draft after v3.1.0 and must be visibly labeled as unreleased. The version identifier should appear in both the directory and its README.

Use stable public paths such as `/1.0.0/`, `/2.0.0/`, `/3.0.0/`, `/3.1.0/`, and `/development/`. Once published, a numbered path must continue to serve the same version and must never be repointed to a later release. The `latest` alias may move to a newer numbered release; it is a convenience link, not a stable version identifier. The development path may update as drafts change, but its URL and unreleased status remain stable.

The old broken `/development/` deployment does not need to be retained during the switch.

All specification Markdown and image files live only under their corresponding version's `docs/` directory. The current mutable source is `specifications/development/docs/`; do not recreate a separately editable root `docs/` copy. MkDocs defaults to this source through `DOCS_DIR`, while the release workflow selects `specifications/<tag-version>/docs/`. The mutable draft XSDs live only in `specifications/development/xsd/`; schema includes remain relative within each version directory.

If translations or multiple official variants are introduced later, add a language or edition level, following the distinction used by OpenChain. Do not add that hierarchy before it represents real content.

## Publishing Tool

### Near-term recommendation: Keep MkDocs Material with static version folders

Keep MkDocs Material and WeasyPrint, but publish each versioned documentation folder as a separate static directory. The shared build script creates `/3.0.0/`, `/3.1.0/`, and `/development/` in one site tree, redirects the site root to `/development/`, and publishes the result directly to the `gh-pages` branch. The version selector on each documentation site links to the other versions. Folder snapshots provide the version history; Mike is not needed to manage a separate versioned branch or aliases.

The `docs-publish` workflow deploys the complete static site on main pushes and published releases. A temporary fork-branch trigger may be used for previewing this migration and must be removed before merging upstream. Keep the existing PDF tooling and verify release artifacts against their tags.

Manage dependency updates independently for now: keep the Poetry lock file and GitHub Actions tool versions reproducible, and review updates in manageable batches. Revisit the framework decision after the versioned publication is working and its maintenance burden can be assessed separately.

### Later option: Hugo with Docsy

Docsy remains a credible future option if the current toolchain's maintenance burden justifies migration or its UI no longer fits. Its [version selector](https://www.docsy.dev/docs/content/versioning/) uses configured `params.versions` labels and URLs; it does not automatically discover Git tags or scan directories. Hugo can render content under stable version paths and copy static XSD/PDF assets. Docsy supports [static deployment including GitHub Pages](https://www.docsy.dev/docs/deployment/).

Docsy does not generate downloadable PDFs in its standard build. If the site later moves to Docsy, keep PDF generation as a separate concern: first test whether the current WeasyPrint-based path can be isolated, then compare alternatives such as Pandoc for content fidelity and operational cost. Do not introduce a second PDF toolchain during the versioning migration unless the existing exporter blocks it.

**Assessment:** Docsy can meet the site requirements, but switching now is not necessary to fix version ambiguity. Defer that decision until the repository has a verified version archive and the existing stack's actual maintenance costs are clear.

### Alternatives

- **Docusaurus:** Has a convenient built-in workflow for versioning documentation. Prefer it if automatic documentation snapshots and a React-based site are priorities; its Node/React dependencies may not address the current concern about frequent dependency updates. Store XSD and PDF release artifacts in the versioned repository directories regardless.
- **Minimal static index:** Not suitable as the primary site because browsable documentation is required. A small static index may still be useful as a fallback landing page.

### Repository Boundary

Keep the canonical XSDs, release snapshots, and site source in this repository initially. Publish the generated static site with CI to GitHub Pages or the current hosting service. A separate publishing repository would duplicate configuration and introduce synchronization work; revisit that boundary only if publication permissions, ownership, or hosting requirements demand it.

## Migration Plan

1. **Reconstruct the history.** Create the v1.0.0 and v2.0.0 XSD snapshots from the cited commits. Create v3.0.0 and v3.1.0 XSDs and release documents from their Git tags; use the documented Markdown/image commits for their respective docs snapshots. Review the `V3.x`-only commits and decide where their changes belong without altering tagged XSD snapshots. Preserve the current Markdown and image tree as `development`. Verify relative XSD includes and Markdown image references within every version.
2. **Review current publishing.** Replace the existing Mike-based workflows with one static multi-version build and GitHub Pages deployment. Use `/3.0.0/`, `/3.1.0/`, and `/development/` as canonical paths, redirect the site root to `/development/`, and retain the in-site version selector; compatibility with the old deployment is not required.
3. **Create versioned snapshots.** Keep each v3 Markdown tree, all its images, its complete XSD set, and available PDF or Word artifacts together under `specifications/<version>/`. Keep one mutable working tree under `specifications/development/`; do not retain duplicate editable root `docs/` or `xsd/` directories.
4. **Finish version publishing in the current stack.** Build each supported version by selecting its `specifications/<version>/docs/` source with `DOCS_DIR`, then place the output under the matching site directory. Publish the complete site to `gh-pages` on main pushes and published releases. Clearly label the draft as `development`; do not move or overwrite numbered version paths.
5. **Keep the current PDF export.** Identify how `ENABLE_PDF_EXPORT` and WeasyPrint are used, then verify the release PDF is versioned correctly and matches the tagged content. Do not add Pandoc or a separate PDF toolchain unless the current exporter cannot meet the requirements.
6. **Build and verify each source tree.** Run `scripts/build-docs.sh` to build development, 3.0.0, and 3.1.0. Verify navigation, image rendering, version links, stable URLs, and PDF/XSD downloads.
7. **Switch to the new canonical paths.** Publish the site at its new canonical root and version paths. Existing URL compatibility is not required. Clearly label `/development/` as unreleased, and never redirect a numbered version path to a newer release.
8. **Use the release process going forward.** Before tagging a release, copy the approved development Markdown, image, and XSD sources into `specifications/<version>/`, add the release artifacts and provenance, and commit the snapshot. The release workflow rebuilds all version directories from that tagged tree and publishes them. Verify the site and PDF against the tag.

## Publication and Validation Requirements

- Each released site path and artifact path identifies exactly one specification version.
- A release page and its PDF state the same version and release status.
- The XSDs published for a release are a complete, immutable set; all relative includes resolve within that version.
- The development site and XSDs are explicitly marked as unreleased and are not presented as the current released version.
- The version selector links to development and all supported releases, including the latest release.
- Publishing a new release does not change the content at older version paths.
- The build can be reproduced from pinned tool versions and the repository contents.
- Historical snapshots retain provenance to the commits or PR from which their content was reconstructed.
- New canonical numbered URLs remain mapped to the same version across future deployments.

## Decisions to Make

- After the version migration, does the current dependency maintenance still justify evaluating Docsy?
