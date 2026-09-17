# Claude plugins

Personal Claude Code marketplace packages hosted in this repo.

| Plugin | Path | Purpose |
|---|---|---|
| **work-builder** | [`work-builder/`](work-builder/) | ADD / WORK / draft-only Slack socialize for builder workstreams (AI Gateway → GitHub Project **#196**) |

## Install (marketplace)

From Claude Code:

```bash
/plugin marketplace add BriWalsh/brwalsh
/plugin install work-builder
```

## Install (local checkout)

```bash
/plugin marketplace add ./claude-plugins
/plugin install work-builder
```

If your Claude Code build expects the marketplace file at the repo root instead,
`BriWalsh/brwalsh` already has `.claude-plugin/marketplace.json` pointing at
`./claude-plugins/work-builder`.

Details and try commands: [`work-builder/README.md`](work-builder/README.md).
