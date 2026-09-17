# Adapter: GitHub Project

Used when `workstreams/<id>.yaml` has `ticket_sot: github_project`. First target:
`ai-gateway` → org `liatrio` project **#196** (`AI-Gateway`).

Prefer the **GitHub MCP** if connected; otherwise `gh` CLI (needs `project` +
`repo` scopes). If fields are missing, run
`scripts/discover-ai-gateway-project.sh` and stop with a clear TODO rather than
inventing IDs.

Load every ID from the active workstream YAML. Do not guess Status option IDs.

## Board conventions (AI Gateway / project-ai-gateway `AGENTS.md`)

| Status | Agent may set? |
|---|---|
| Backlog | yes — default for new cards |
| Ready | **no** — human gate only |
| In progress | yes — WIP |
| In review | yes |
| Done | yes — on close |

Repos must be on the `repos_allowlist`. Default create repo for Gateway:
`liatrio/project-ai-gateway`. PRs open as **draft** first.

## Create (ADD)

1. Resolve `workstream=` → load YAML. Refuse if stub / null IDs.
2. Pick the create repo (allowlist; ask if unclear).
3. Draft `TYPE: <title>` + markdown body from `references/templates.md`
   (`👉 NEXT KEY ACTION`, SUMMARY / STEPS / …).
4. Search for duplicates: `gh issue list --repo <repo> --search "<key words>"`
   and/or project item search.
5. Preview the card (title, repo, Status=Backlog, body). Wait for yes.
6. Create the issue, then add it to the project and set Status=Backlog:

```bash
# Create issue (returns URL + number)
gh issue create --repo <owner/repo> --title "BUG: …" --body "$(cat <<'EOF'
**👉 NEXT KEY ACTION**: …

## SUMMARY
…

EOF
)"

# Resolve project + item, set Status=Backlog
# Field/option IDs from workstreams/<id>.yaml
gh project item-add 196 --owner liatrio --url <issue-url>
# Then set Status via GraphQL ProjectV2UpdateItemFieldValue using
# status_field_id + status.backlog (see discover script for a worked query).
```

7. Confirm with the issue URL and project link. Never auto-set Ready.

## Work (WORK)

1. Identify the card — issue URL/number, project item, or title fragment.
   Confirm which one if ambiguous.
2. Offer rename+pin of the conversation to the issue title.
3. Frame by type.
4. Offer move Backlog/Ready → **In progress** (confirm). Do not move *to* Ready.
5. Guide work in an allowlisted repo; honour that repo's `AGENTS.md` /
   `CLAUDE.md`. Keep `👉 NEXT KEY ACTION` current on the issue body.
6. Record PR links on the issue (and link PRs to the issue with `Fixes #N` /
   project Linked pull requests). Open PRs as drafts.
7. Socialize with the workstream's `socialize_template` when set —
   for AI Gateway, **`slack.mode: draft_only`**: produce paste-ready markdown;
   **never send** to Slack from this skill.
8. On confirm: set Status=Done, close the issue if appropriate, record that the
   announce was drafted (paste destination from YAML, e.g. `#project-ai-gateway`).

## GraphQL sketch — set Status

```graphql
mutation($projectId: ID!, $itemId: ID!, $fieldId: ID!, $optionId: String!) {
  updateProjectV2ItemFieldValue(
    input: {
      projectId: $projectId
      itemId: $itemId
      fieldId: $fieldId
      value: { singleSelectOptionId: $optionId }
    }
  ) { projectV2Item { id } }
}
```

IDs: `github_project.node_id`, item id from `item-add` / list, `status_field_id`,
and the option under `status.*`.

## If scopes fail

Token needs `project` (write) or at least `read:project` (discovery). Without
them: leave YAML TODOs, run the discover script, and tell the user which scope
to grant. Do not invent field IDs.

## User-owned projects

For a personal board (`owner` is a user login, not an org), prefer GraphQL
`user(login: …) { projectV2(number: …) }` over `gh project item-add --owner`
when the CLI complains about owner type. Same field-edit mutation once you have
item + field IDs.
