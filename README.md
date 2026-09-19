# Delivery Principal Ops Kit

Personal public craft repo for **Brian Walsh** ([@BriWalsh](https://github.com/BriWalsh)) — Delivery Principal @ [Liatrio](https://liatrio.com).

The useful bits live under **[`bots/`](./bots/)**: opinionated Cursor / cloud-agent skills that close real delivery loops (reading queue, EOD drafting, follow-up radar) with hard guardrails — **draft-only**, human-in-the-loop, fail closed on client/sensitive content.

## Start here

| Link | What |
|------|------|
| [`bots/README.md`](./bots/README.md) | Ops Kit overview, hard rules, roll-out |
| [ai-gateway.liatr.io](https://ai-gateway.liatr.io/) | Public State of AI Gateways comparison library |
| [github.com/BriWalsh](https://github.com/BriWalsh) | Profile + selected public work |

## What’s in `bots/`

| Skill | Wound it closes |
|-------|-----------------|
| [`eyes/`](./bots/eyes/) | Reading-queue (`:eyes:`) debt |
| [`eod-drafter/`](./bots/eod-drafter/) | Daily synthesis / EOD draft |
| [`follow-up-radar/`](./bots/follow-up-radar/) | Dropped internal commitments |

Agents draft; people send. No client auto-post.

## Note on internals

Skill docs and fixtures still contain workspace-specific Slack IDs and client-domain *quarantine test stems* used by the harness. Treat those as operational config, not a public invitation to reuse identifiers. A sanitized skill skeleton lives in [`cursor-skills-public`](https://github.com/BriWalsh/cursor-skills-public).

## Contact

[LinkedIn](https://www.linkedin.com/in/brwalsh) · [@BriWalsh](https://github.com/BriWalsh) · [liatrio.com](https://liatrio.com)
