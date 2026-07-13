#!/usr/bin/env bash
# Sync the Narrow Corridor gallery into this site and deploy.
# Assumes the narrow-corridor-llm repo sits next to this one:
#   repos/website/            <- this repo
#   repos/narrow-corridor-llm/ <- gallery source (its docs/ is the built site)
# Rebuild the gallery there first (uv run python scripts/build_site.py ...) if the runs changed.
set -euo pipefail

cd "$(dirname "$0")/.."                        # website repo root
SRC="../narrow-corridor-llm/docs"
DEST="narrow-corridor-llm/gallery"

[ -d "$SRC" ] || { echo "gallery source not found: $SRC — is narrow-corridor-llm checked out next to this repo?" >&2; exit 1; }

rsync -a --delete "$SRC/" "$DEST/"             # mirror; --delete drops files removed at the source

if [ -z "$(git status --porcelain "$DEST")" ]; then
  echo "gallery already up to date; nothing to deploy."
  exit 0
fi

git add "$DEST"
git commit -m "Sync Narrow Corridor gallery from source repo"
git push
echo "deployed: https://esonghori.com/narrow-corridor-llm/gallery/"
