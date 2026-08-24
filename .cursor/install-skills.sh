#!/usr/bin/env bash
# Cloud Agent VMs do not sync a laptop's ~/.cursor/skills, and skills are only
# discovered when an agent starts, so they must be on disk before that.
set -euo pipefail

REPO="BriWalsh/cursor-user-skills"
SRC="$(mktemp -d)"
DESTS=("$HOME/.cursor/skills" "$HOME/.agents/skills")
trap 'rm -rf "$SRC"' EXIT

if ! command -v rsync >/dev/null 2>&1; then
  if command -v sudo >/dev/null 2>&1 && command -v apt-get >/dev/null 2>&1; then
    sudo apt-get update -qq && sudo apt-get install -y -qq rsync
  else
    echo "ERROR: rsync is not available and cannot be auto-installed." >&2
    exit 1
  fi
fi

# The token Cursor generates for an agent is scoped to the repository the agent
# runs on, so reaching a separate private repo needs either the GH_TOKEN secret
# or repositoryDependencies to widen that scope.
if [ -n "${GH_TOKEN:-}" ] && git clone --depth 1 --quiet \
    "https://x-access-token:${GH_TOKEN}@github.com/${REPO}.git" "$SRC" 2>/dev/null; then
  git -C "$SRC" remote set-url origin "https://github.com/${REPO}.git"
elif ! git clone --depth 1 --quiet "https://github.com/${REPO}.git" "$SRC" 2>/dev/null; then
  echo "ERROR: cannot read ${REPO}." >&2
  echo "  Add a GH_TOKEN secret with 'repo' scope under Cloud Agents > Secrets," >&2
  echo "  or grant the Cursor GitHub app access to that repository." >&2
  exit 1
fi

for dest in "${DESTS[@]}"; do
  mkdir -p "$dest"
  rsync -a --delete --exclude '.git' --exclude 'README.md' "$SRC"/ "$dest"/
done

echo "Installed $(find "${DESTS[0]}" -mindepth 2 -maxdepth 2 -name SKILL.md | wc -l) skills into ${DESTS[*]}"
