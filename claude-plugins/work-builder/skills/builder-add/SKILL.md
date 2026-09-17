---
name: "builder-add"
description: "Creates a typed backlog item (BUG:/FEATURE:/TODO:/PAIN:/DECISION:) for a chosen builder workstream. Pass workstream=ai-gateway (default) or workstream=personal. AI Gateway creates a draft GitHub issue on an allowlisted repo and adds it to org project #196 (AI-Gateway) at Status=Backlog. Preview before writing. personal.yaml is a stub until field IDs are filled."
compatibility: "Requires GitHub (gh or GitHub MCP) with project+repo scopes for ai-gateway."
---

# Builder — Add

**Version:** 0.1.0 | **Owner:** Brian Walsh

Thin entry point over the workstream config layer. Resolves `workstream=`, loads
the matching YAML, then follows that workstream's adapter to file a typed item.

## Announce your version on invocation

> Running **builder-add** v0.1.0

Once per conversation. Take the number from the header above.

## Resolve the workstream

1. Read `workstream=` from the invoke args or the user's first message.
2. Default: **`ai-gateway`** if omitted.
3. Allowed today: `ai-gateway` | `personal`. Anything else → stop and list files
   under `workstreams/` (ignore README).
4. Load `workstreams/<id>.yaml` and the adapter path it names
   (`references/adapters/github-project.md`).
5. If the YAML has `status: stub` or null project field IDs, **stop**. Tell the
   user which keys are TODO. Do not invent IDs and do not write.
6. Typed prefixes: `BUG:`, `FEATURE:`, `TODO:`, `PAIN:`, `DECISION:`
   (and `EXPERIMENT:` when filing an experiment). Templates:
   `references/templates.md` (markdown body on GitHub).

## AI Gateway (`workstream=ai-gateway`)

Follow `references/adapters/github-project.md` with
`workstreams/ai-gateway.yaml`:

1. Confirm the create repo is on `repos_allowlist` (default
   `liatrio/project-ai-gateway`).
2. Draft title + markdown body; duplicate-check on that repo / project 196.
3. Preview (title, repo, Status=Backlog, body). Wait for yes.
4. Create the issue; add to project **#196**; set Status=**Backlog**.
   Never set Ready (human gate).
5. Confirm with issue URL + project link.

If project field IDs are missing or GraphQL fails on scope, run
`scripts/discover-ai-gateway-project.sh`, show the TODO, and do not invent IDs.

## Personal (`workstream=personal`)

`workstreams/personal.yaml` ships as a stub. Until `github_project.node_id` and
status option IDs are filled, refuse writes and point at the discover script
(override owner/number for the personal board).

## Mandatory

- Preview + human confirm before every write, on every workstream.
- This package does **not** write to Liatrio Lens Asana. Use the separate Lens
  plugin for that.
