# Workstreams

Config layer for ADD / WORK / socialize. Each YAML file is one backlog target.

| File | SoT | Used by |
|---|---|---|
| [`ai-gateway.yaml`](ai-gateway.yaml) | GitHub org project **#196** (`AI-Gateway`) | `builder-add` / `builder-work` with `workstream=ai-gateway` (**default**) |
| [`personal.yaml`](personal.yaml) | Stub — fill before use | `workstream=personal` |

## Rules

1. **Default workstream is `ai-gateway`.** Omit `workstream=` and you get Project #196.
2. **Do not invent board IDs.** If a project field ID is missing, leave a TODO and
   run `scripts/discover-ai-gateway-project.sh`. Never guess.
3. **No Lens Asana defaults in this package.** The production Lens plugin stays
   at `liatrio-labs/liatrio-lens-builder-plugin`. Do not paste Lens Asana GIDs
   here as live write targets.
4. **Gateway Slack is `draft_only`.** Skills produce paste-ready markdown for
   `#project-ai-gateway`; they never send.

## Try

```
/work-builder:builder-add workstream=ai-gateway file a bug: …
/work-builder:builder-work workstream=ai-gateway <issue-url-or-title>
```

Omit `workstream=` for the same Gateway path (default).
