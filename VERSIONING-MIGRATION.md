# Specification Versioning and Publishing Migration

## Purpose

This document records a proposed approach for resolving the version ambiguity raised in [issue #88](https://github.com/shapeshifter/shapeshifter-specification/issues/88) and for guiding the longer-term migration of specification sources and published documentation.

The migration concerns repository organization and publication of the specification. It does not, by itself, require protocol users to migrate XML messages or change their implementations.

## Current Situation

- The repository contains versioned XSD snapshots through 3.1.0 and the 3.1.0 PDF; the changelog's latest recorded release is 3.0.0.
- Issue #88 describes a browsable development site that displays 3.0.0, making its release status unclear.
- [PR #67](https://github.com/shapeshifter/shapeshifter-specification/pull/67) introduced the Markdown specification, MkDocs, `mike` versioning, and a GitHub Actions publishing workflow. The main-branch [docs-release workflow](https://github.com/shapeshifter/shapeshifter-specification/blob/main/.github/workflows/docs-release.yml) runs when a GitHub Release is published, deploys the release tag with `mike`, updates the `latest` alias, sets `latest` as the default, and enables PDF export.
- The [docs-latest workflow](https://github.com/shapeshifter/shapeshifter-specification/blob/main/.github/workflows/docs-latest.yml) runs on pushes to `main` and deploys that content as the `development` version. The current deployment is reported as broken; diagnose this existing workflow rather than adding a second development publisher.
- The existing `/development/` deployment is currently broken. There is no requirement to preserve that URL; the migration can establish a clean set of canonical paths.
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

### Near-term recommendation: Keep MkDocs Material with mike

Keep the current MkDocs Material, `mike`, and WeasyPrint setup while migrating the versioned content and XSDs. The release workflow already deploys published GitHub Release tags as `mike` versions, updates the movable `latest` alias, and enables PDF export. Changing the site framework and PDF generator at the same time would make it harder to isolate regressions in version history, rendering, and PDF output.

Focus first on establishing the canonical version snapshots and stable URLs, making the development and release statuses clear in the browsable site, and ensuring release PDFs match their tags. Keep the existing PDF path for this phase; identify its exact hook and verify the resulting PDF against the release tag. Diagnose and repair the existing `docs-latest.yml` deployment if needed; do not add a competing publisher.

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
2. **Review current publishing.** Confirm the behavior of `.github/workflows/docs-release.yml` against the deployed site, including the version path and mutable `latest` alias. Diagnose why `.github/workflows/docs-latest.yml` does not currently produce a working development site. Record the desired new canonical paths; compatibility with the current broken URL is not required.
3. **Create versioned snapshots.** Keep each v3 Markdown tree, all its images, its complete XSD set, and available PDF or Word artifacts together under `specifications/<version>/`. Keep one mutable working tree under `specifications/development/`; do not retain duplicate editable root `docs/` or `xsd/` directories.
4. **Finish version publishing in the current stack.** Build development from the MkDocs `DOCS_DIR` default, `specifications/development/docs/`. On release, normalize the tag to the lowercase folder name, select `specifications/<version>/docs/`, and publish it with `mike` at a stable numbered path plus the mutable `latest` alias. Clearly label the draft as `development`. Repair the existing main-push workflow if needed; old URL compatibility is not required.
5. **Keep the current PDF export.** Identify how `ENABLE_PDF_EXPORT` and WeasyPrint are used, then verify the release PDF is versioned correctly and matches the tagged content. Do not add Pandoc or a separate PDF toolchain unless the current exporter cannot meet the requirements.
6. **Build and verify each source tree.** Run MkDocs with `DOCS_DIR` set to development, 3.0.0, and 3.1.0. Verify navigation, image rendering, version labels, stable URLs, and PDF/XSD downloads.
7. **Switch to the new canonical paths.** Publish the site at its new canonical root and version paths. Existing URL compatibility is not required. Clearly label `/development/` as unreleased, and never redirect a numbered version path to a newer release.
8. **Use the release process going forward.** Before tagging a release, copy the approved development Markdown, image, and XSD sources into `specifications/<version>/`, add the release artifacts and provenance, and commit the snapshot. The release workflow then selects that version's docs directory from the tag and publishes it. Verify the site and PDF against the tag.

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

- What is causing the existing development deployment to fail?
- After the version migration, does the current dependency maintenance still justify evaluating Docsy?
- Should the site root lead to the latest stable release or to `/development/`?
