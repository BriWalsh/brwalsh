# AI Gateway Slack announce template (socialize)

Loaded by `builder-work` when `workstream=ai-gateway`.

**Mode: `draft_only`.** Produce paste-ready markdown for Brian. **Never send**
to Slack from this skill — not even on an explicit "post it" unless the user
leaves the builder-work path and confirms a separate send action outside this
template. Default deliverable is the draft in chat.

Channel: `#project-ai-gateway` (`C0BT5J2EX32` per `workstreams/ai-gateway.yaml`).

Shape: short parent + detail thread, with four beats in the prose
(Simon's pattern Brian liked on Lens write-ups).

## Parent (main post)

```
:white_check_mark: Fixed: <issue-url|TYPE: exact issue title>
<one sentence a passer-by understands>. Detail in thread.
```

Use `:white_check_mark: Shipped:` instead of `Fixed:` when it is not a bug.
No Lens attribution footer — Gateway drafts are Brian's to paste.

## Thread reply — four beats

Write these in order, as short paragraphs (not a checklist dump):

1. **What was wrong** — the failure or gap in plain language.
2. **Why it surfaced** — how we found it (lab run, matrix cell, customer ask,
   demo dry-run, etc.).
3. **Verified live** — what you ran or clicked that proves it is fixed now
   (lab command, URL, screenshot note, matrix cell flip). Link the PR(s).
4. **Found along the way** — adjacent friction, follow-ups filed, or "nothing
   else" if clean.

Close the thread with `Shipped in <repo> #<pr> / <version if any>.`

## Presenting the draft

- Fenced code block for the parent, then a second fenced block for the thread.
- Always name the destination: paste into `#project-ai-gateway` (or reply in
  the source thread if the issue body recorded one).
- Do not include `<@…|…>` mentions unless the user names who to tag — Gateway
  draft_only leaves tagging to Brian.
