# Task templates (GitHub markdown)

Used by `builder-add` when filing issues. GitHub issues use markdown, not Asana
`html_notes`.

Every template opens with a `👉 NEXT KEY ACTION` line. That line is the single
source of truth for "what happens next" — keep it current before you put the
ticket down or hand it off.

The *italic* bracket after each heading is standing guidance — keep it verbatim
so the ticket stays self-documenting for whoever picks it up.

## BUG:

Fill NEXT KEY ACTION, SUMMARY, STEPS TO REPRODUCE, EXPECTED and ACTUAL from the
source; leave ROOT CAUSE and RESOLUTION as placeholders until triage/close.

```markdown
**👉 NEXT KEY ACTION** *[the single next thing to do — keep current]*: Triage: reproduce and prioritise.  (owner: unassigned)

---

**SUMMARY** *[one sentence: what's broken and who/what it affects — include component/version]*

<one sentence>

**STEPS TO REPRODUCE** *[numbered actions from a clean start; say so if not reliably reproducible]*

1. …

**EXPECTED** *[what should happen]*

…

**ACTUAL** *[what actually happens, with evidence]*

…. Reported by <name> in Slack: <permalink>

**ROOT CAUSE** *[filled once diagnosed]*

_TBD_

**RESOLUTION** *[filled at close]*

_TBD_
```

## FEATURE:

Capture the outcome, not the mechanism.

```markdown
**👉 NEXT KEY ACTION** *[the single next thing to do — keep current]*: Shape and size, then prioritise.  (owner: unassigned)

---

**WHAT'S ASKED FOR** *[one sentence: the capability, in the requester's terms]*

…

**WHY IT MATTERS** *[who is blocked or what becomes possible]*

…

**OUT OF SCOPE** *[what this deliberately does not include]*

…

**ACCEPTANCE** *[how we will know it is done]*

…
```

## TODO:

Deliberately thin. If it needs a long description, reclassify as FEATURE or PAIN.

```markdown
**👉 NEXT KEY ACTION** *[the single next thing to do — keep current]*: <the first concrete step>  (owner: you)

---

**WHAT NEEDS DOING** *[concrete enough to pick up cold]*

…

**WHY NOW** *[what's waiting on this — delete if housekeeping]*

…
```

## PAIN:

Record the problem without inventing a solution.

```markdown
**👉 NEXT KEY ACTION** *[the single next thing to do — keep current]*: Research: understand the problem well enough to name options.  (owner: unassigned)

---

**THE PROBLEM** *[what hurts, for whom, in their words where possible]*

…

**WHAT WE DON'T KNOW** *[the useful part — turns into research or an experiment]*

…

**WORKAROUNDS TODAY** *[if any]*

…
```

## DECISION:

Capture the options honestly, including the one the asker proposed.

```markdown
**👉 NEXT KEY ACTION** *[the single next thing to do — keep current]*: Decide and reply to <name>.  (owner: backlog owner)

---

**THE QUESTION** *[what needs deciding, in one sentence]*

…

**WHO'S WAITING** *[who is blocked, and on what]*

…

**OPTIONS**

1. …
2. …

**RECOMMENDATION** *[optional — labelled as such]*

…
```

## EXPERIMENT:

```markdown
**👉 NEXT KEY ACTION** *[the single next thing to do — keep current]*: Define hypothesis + success signal, then run.  (owner: unassigned)

---

**HYPOTHESIS**

…

**SUCCESS SIGNAL** *[observable, not vibes]*

…

**TIME BOX**

…

**RESULT** *[filled at close]*

_TBD_
```
