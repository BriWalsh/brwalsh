# work-builder — agent notes

Personal Claude Code plugin. Default workstream is **AI Gateway** (GitHub
Project **#196**). Skills: `builder-add`, `builder-work`.

## Hard rules

1. Preview + confirm before every write.
2. Gateway Slack is **draft_only** — never send; paste-ready markdown only.
3. Never set Project #196 Status to **Ready** (human gate).
4. Do not invent project field IDs — run `scripts/discover-ai-gateway-project.sh`.
5. Do not write to Liatrio Lens Asana from this package.
6. `personal.yaml` is a stub until IDs are filled; refuse writes while stubbed.

## Commands

```
/work-builder:builder-add workstream=ai-gateway …
/work-builder:builder-work workstream=ai-gateway …
```

Config: `workstreams/`. Adapter: `references/adapters/github-project.md`.
Socialize: `references/socialize/ai-gateway-announce.md`.
