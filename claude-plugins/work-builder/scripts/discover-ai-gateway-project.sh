#!/usr/bin/env bash
#
# Discover GitHub project field IDs for workstream YAML files.
#
# Naming history (from the Lens PR #13 port): a design brief said "org project
# number 3". Live discovery against org `liatrio` shows:
#   #3   = "Liatrio Open Source Support"  (not AI Gateway)
#   #196 = "AI-Gateway"                   (confirmed by project-ai-gateway AGENTS.md)
#
# Default target is AI-Gateway (#196). Override OWNER / PROJECT_NUMBER for a
# personal board (e.g. OWNER=BriWalsh PROJECT_NUMBER=3 OWNER_TYPE=user).
#
# Required token scopes:
#   - read:project   (or project)  — list projects + fields
#   - repo           — only needed if you also create issues
#
# Usage:
#   bash scripts/discover-ai-gateway-project.sh
#   PROJECT_NUMBER=196 bash scripts/discover-ai-gateway-project.sh
#   OWNER=BriWalsh OWNER_TYPE=user PROJECT_NUMBER=3 bash scripts/discover-ai-gateway-project.sh
#
set -euo pipefail

OWNER="${OWNER:-liatrio}"
OWNER_TYPE="${OWNER_TYPE:-org}"   # org | user
PROJECT_NUMBER="${PROJECT_NUMBER:-196}"

need() {
  if ! command -v "$1" >/dev/null 2>&1; then
    echo "FAIL: '$1' not found on PATH" >&2
    exit 1
  fi
}
need gh
need python3

echo "==> Auth / scopes"
if ! gh auth status 2>&1 | tee /tmp/gh-auth-discover.txt; then
  echo "FAIL: gh auth status failed — run: gh auth login" >&2
  exit 1
fi
if ! grep -qE "project|read:project" /tmp/gh-auth-discover.txt; then
  echo
  echo "WARN: token may be missing 'project' / 'read:project'."
  echo "      Refresh with:  gh auth refresh -h github.com -s project,repo,read:org"
  echo "      Continuing anyway — the GraphQL call will fail clearly if scope is absent."
fi

if [[ "$OWNER_TYPE" == "org" ]]; then
  ROOT_FIELD="organization"
  ROOT_ARGS="login: \"${OWNER}\""
else
  ROOT_FIELD="user"
  ROOT_ARGS="login: \"${OWNER}\""
fi

echo
echo "==> Projects named like Gateway / project #3 check (org listing only when OWNER_TYPE=org)"
if [[ "$OWNER_TYPE" == "org" ]]; then
  gh api graphql -f query="
  query {
    organization(login: \"${OWNER}\") {
      p3: projectV2(number: 3) { number title url }
      gateway: projectsV2(first: 10, query: \"gateway\") {
        nodes { number title url }
      }
    }
  }" | python3 -m json.tool
else
  echo "(skipped — OWNER_TYPE=user)"
fi

echo
echo "==> Fields for ${OWNER_TYPE} ${OWNER} project #${PROJECT_NUMBER}"
gh api graphql -f query="
query {
  ${ROOT_FIELD}(${ROOT_ARGS}) {
    projectV2(number: ${PROJECT_NUMBER}) {
      id
      title
      number
      url
      fields(first: 50) {
        nodes {
          __typename
          ... on ProjectV2Field { id name dataType }
          ... on ProjectV2SingleSelectField {
            id name dataType
            options { id name }
          }
          ... on ProjectV2IterationField { id name dataType }
        }
      }
    }
  }
}" | python3 -m json.tool

echo
echo "Done. Copy Status / Size option IDs into the matching workstreams/*.yaml."
echo "If GraphQL returned errors about insufficient scopes, grant 'project' (or"
echo "'read:project') and re-run — do not invent field IDs."
