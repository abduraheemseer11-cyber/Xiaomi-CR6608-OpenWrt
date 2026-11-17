#!/usr/bin/env bash
# Downloads luci-theme-argon + luci-app-argon-config .ipk files (not in the official 23.05 feeds)
# into <imagebuilder>/packages so ImageBuilder can install them.
set -euo pipefail
DEST="${1:?usage: fetch-argon.sh <imagebuilder>/packages}"
mkdir -p "$DEST"
for repo in jerrykuku/luci-theme-argon jerrykuku/luci-app-argon-config; do
  gh release download --repo "$repo" --pattern '*.ipk' --dir "$DEST" --clobber \
    || { echo "::error::No .ipk asset found in latest release of $repo"; exit 1; }
done
ls -l "$DEST"/*argon*.ipk
