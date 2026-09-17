---
name: builder-work
description: >
  Frame, guide, and close an EXISTING builder backlog item for a chosen
  workstream. Pass workstream=ai-gateway (default) or workstream=personal. AI
  Gateway operates on a GitHub issue / Project #196 card: move to In progress,
  guide implementation in an allowlisted repo, record PR links, draft a
  draft_only Slack announce for #project-ai-gateway (never send), then mark
  Done. Use when picking up Gateway (or a filled personal) work through the
  shared builder entry point.
compatibility: "Requires GitHub (gh or GitHub MCP) with project+repo scopes for ai-gateway."
---

# Builder — Work

**Version:** 0.1.0 | **Owner:** Brian Walsh

Thin entry point over the workstream config layer. Resolves `workstream=`, loads
the matching YAML + socialize template, then follows that workstream's adapter
to operate on an existing item.

## Announce your version on invocation

> Running **builder-work** v0.1.0

Once per conversation. Take the number from the header above.

## Resolve the workstream

1. Read `workstream=` from the invoke args or the user's first message.
2. Default: **`ai-gateway`** if omitted.
3. Allowed today: `ai-gateway` | `personal`.
4. Load `workstreams/<id>.yaml`, its `adapter`, and its `socialize_template`.
5. If the YAML has `status: stub` or null project field IDs, **stop**. Do not
   invent IDs and do not write.

## AI Gateway (`workstream=ai-gateway`)

Follow `references/adapters/github-project.md` with
`workstreams/ai-gateway.yaml`:

1. Identify the issue / project card (URL, number, or title on project 196).
2. Offer rename+pin of the conversation to the issue title.
3. Frame by type (BUG / FEATURE / TODO / PAIN / DECISION / EXPERIMENT).
4. Offer Status → **In progress** (confirm). Never move *to* Ready.
5. Guide work only in `repos_allowlist` repos; honour that repo's
   `AGENTS.md` / `CLAUDE.md`. Keep `👉 NEXT KEY ACTION` current. Open PRs as drafts.
6. Wrap up, in order, each write on confirm:
   - Record outcome + PR links on the issue.
   - **Socialize** — load `references/socialize/ai-gateway-announce.md`.
     Parent + thread beats: what was wrong / why it surfaced / verified live /
     found along the way. **`slack.mode: draft_only` — never send**; paste-ready
     markdown for Brian, destination `#project-ai-gateway`.
   - Set Status=**Done** (and close the issue if appropriate).
7. Offer to prefix the conversation `DONE:` and unpin.

## Personal (`workstream=personal`)

Same adapter shape once `personal.yaml` is filled. If `socialize_template` is
null, skip socialize and say so. Keep `draft_only` until Brian changes the YAML.

## Summaries

On request only ("summarize session" / "explain that simply"):

- Session-level: ticket table with state, PR table with state, two or three
  sentences of narrative, then "Open, needing you" in dependency order.
- Item-level: one plain-English paragraph on what it does, why it matters, and
  what it deliberately does not do.

State is checked on the issue / PR, not recalled from memory.

## Mandatory

- Read freely; write only on confirmation.
- One item at a time.
- Filing new items → `builder-add`.
- Never send Slack from this skill while `slack.mode` is `draft_only`.
- This package does **not** write to Liatrio Lens Asana.
