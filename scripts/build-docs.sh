#!/usr/bin/env bash
# Copyright Contributors to the Shapeshifter project
# SPDX-License-Identifier: Apache-2.0

set -euo pipefail

site_dir="${1:-site}"
site_base_url="${SITE_BASE_URL:-http://localhost:8000/}"
tmp_dir="$(mktemp -d)"
trap 'rm -rf "$tmp_dir"' EXIT
versions=(development)

versioned_dirs=()
for docs_dir in specifications/[0-9]*/docs; do
  [[ -d "$docs_dir" ]] || continue
  versioned_dirs+=("$(basename "$(dirname "$docs_dir")")")
done

while IFS= read -r version; do
  [[ -n "$version" ]] && versions+=("$version")
done < <(printf '%s\n' "${versioned_dirs[@]}" | python3 -c 'import sys; versions = [line.strip() for line in sys.stdin if line.strip()]; versions.sort(key=lambda version: tuple(int(part) for part in version.split(".")), reverse=True); print("\n".join(versions))')

mkdir -p "$site_dir"

for version in "${versions[@]}"; do
  docs_dir="specifications/$version/docs"
  test -d "$docs_dir"
  build_docs_dir="$docs_dir"
  config_file="mkdocs.yml"
  if [[ "$version" == "1.0.0" || "$version" == "2.0.0" ]]; then
    config_file="mkdocs-archive.yml"
    build_docs_dir="$tmp_dir/$version/docs"
    mkdir -p "$build_docs_dir/xsd"
    cp -R "$docs_dir/." "$build_docs_dir/"
    cp -R "specifications/$version/xsd/." "$build_docs_dir/xsd/"
  fi
  SITE_URL="${site_base_url}${version}/" \
    DOCS_DIR="$build_docs_dir" \
    poetry run mkdocs build --strict --config-file "$config_file" --site-dir "$site_dir/$version"
done

printf '%s\n' "${versions[@]}" | python3 -c '
import json
import sys

versions = [line.strip() for line in sys.stdin if line.strip()]
json.dump(
  [
    {
      "version": version,
      "title": "Development (unreleased)" if version == "development" else version,
      "aliases": [],
    }
    for version in versions
  ],
  sys.stdout,
  indent=2,
)
sys.stdout.write("\n")
' > "$site_dir/versions.json"

{
cat <<'HTML'
<!doctype html>
<html lang="en">
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <meta http-equiv="refresh" content="0; url=./development/">
  <title>Redirecting to the development specification</title>
</head>
<body>
  <main>
    <h1>Shapeshifter specification</h1>
    <p>Redirecting to the development specification.</p>
    <p>If you are not redirected, continue to
      <a href="./development/">Development (unreleased)</a>.
    </p>
  </main>
</body>
</html>
HTML
} > "$site_dir/index.html"
touch "$site_dir/.nojekyll"
