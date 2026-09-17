# Changelog

Plugin-level version history for **work-builder** (personal package in
`BriWalsh/brwalsh`). Bump `.claude-plugin/plugin.json` and `.claude/version`
together on every change, and add an entry here.

## v0.1.0 — 2026-09-17

- **Initial personal port** of the AI Gateway builder workstreams slice from
  parked Lens PR
  [liatrio-labs/liatrio-lens-builder-plugin#13](https://github.com/liatrio-labs/liatrio-lens-builder-plugin/pull/13)
  (`cursor/workstreams-ai-gateway-1029`). Lens production plugin untouched.
- **`workstreams/ai-gateway.yaml`** — Liatrio org GitHub Project **#196**
  (`AI-Gateway`), repos allowlist, `#project-ai-gateway` (`C0BT5J2EX32`),
  `slack.mode: draft_only`.
- **`workstreams/personal.yaml`** — stub for a later personal board (no live
  writes until field IDs are filled).
- **`builder-add` / `builder-work` v0.1.0** — thin skills; default
  `workstream=ai-gateway`.
- **GitHub Project adapter** + Gateway socialize template (wrong / surfaced /
  verified / found along the way).
- **Markdown item templates** for GitHub issues (no Asana `html_notes`).
- **Discover script** `scripts/discover-ai-gateway-project.sh` (supports
  `OWNER_TYPE=user` for personal boards).
- Marketplace entry via repo-root `.claude-plugin/marketplace.json`
  (`briwalsh-plugins` → `work-builder`).
- Explicitly **no** Lens Asana GIDs as required defaults in this package.
