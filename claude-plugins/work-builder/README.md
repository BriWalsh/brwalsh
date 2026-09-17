# Work builder (personal)

Claude Code plugin for Brian's builder ADD / WORK / socialize path. First
workstream is **AI Gateway** (Liatrio org GitHub Project **#196**). Ported from
the parked Lens PR
([liatrio-labs/liatrio-lens-builder-plugin#13](https://github.com/liatrio-labs/liatrio-lens-builder-plugin/pull/13))
into this personal monorepo so the production Lens plugin stays untouched.

## What's inside

| Skill | Version | Command | What it does |
|---|---|---|---|
| **builder-add** | 0.1.0 | `/work-builder:builder-add` | Files typed items (`BUG:`, `FEATURE:`, `TODO:`, `PAIN:`, `DECISION:`) onto the chosen workstream. Default `workstream=ai-gateway` → draft GitHub issue + Project **#196** at Status=Backlog. |
| **builder-work** | 0.1.0 | `/work-builder:builder-work` | Picks up an existing card: In progress → guide work → record PRs → **draft_only** Slack announce for `#project-ai-gateway` (never send) → Done. |

| Workstream | Config | SoT |
|---|---|---|
| `ai-gateway` (default) | [`workstreams/ai-gateway.yaml`](workstreams/ai-gateway.yaml) | GitHub Project #196 |
| `personal` (stub) | [`workstreams/personal.yaml`](workstreams/personal.yaml) | Fill before use |

This package does **not** ship Lens Asana GIDs as live write targets. Use
`liatrio-labs/liatrio-lens-builder-plugin` for Lens.

## Install

### From GitHub (marketplace)

```bash
/plugin marketplace add BriWalsh/brwalsh
/plugin install work-builder
```

Repo-root [`.claude-plugin/marketplace.json`](../../.claude-plugin/marketplace.json)
points at `./claude-plugins/work-builder`.

### From a local checkout

```bash
cd /path/to/brwalsh
/plugin marketplace add .
/plugin install work-builder
```

Or add the plugins folder if your Claude Code build prefers that path:

```bash
/plugin marketplace add ./claude-plugins
```

(If that form fails, use the repo-root marketplace file above.)

### Updates

```bash
/plugin marketplace update briwalsh-plugins
```

Then reinstall/update `work-builder` from the marketplace after a version bump
on `main`.

## Try commands

AI Gateway ADD:

```
/work-builder:builder-add workstream=ai-gateway file a bug: matrix cell for Kong PII redaction marked yes without lab evidence
```

AI Gateway WORK:

```
/work-builder:builder-work workstream=ai-gateway <issue-url-or-title>
```

Default workstream is `ai-gateway`, so you can omit `workstream=`:

```
/work-builder:builder-add file a bug: …
/work-builder:builder-work <issue-url-or-title>
```

## Draft-only Slack socialize

`workstreams/ai-gateway.yaml` sets `slack.mode: draft_only` for
`#project-ai-gateway` (`C0BT5J2EX32`).

`builder-work` loads
[`references/socialize/ai-gateway-announce.md`](references/socialize/ai-gateway-announce.md)
and produces paste-ready markdown:

1. What was wrong
2. Why it surfaced
3. Verified live
4. Found along the way

**Never send** from the skill. Brian pastes.

## Requirements

- GitHub (`gh` or GitHub MCP) with `project` + `repo` scopes
- Access to allowlisted Gateway repos (`liatrio/project-ai-gateway`, …)
- To refresh Project #196 field IDs:

```bash
bash claude-plugins/work-builder/scripts/discover-ai-gateway-project.sh
```

## Versioning

- Plugin version: `.claude-plugin/plugin.json` and `.claude/version` (keep in sync)
- Skill versions: header in each `skills/*/SKILL.md`
- Record every bump in [`CHANGELOG.md`](CHANGELOG.md)

## Layout

```
claude-plugins/work-builder/
  .claude-plugin/plugin.json
  skills/builder-add|builder-work/
  workstreams/ai-gateway.yaml|personal.yaml
  references/adapters/github-project.md
  references/socialize/ai-gateway-announce.md
  references/templates.md
  scripts/discover-ai-gateway-project.sh
```

Also see [`../README.md`](../README.md) for the marketplace index.
