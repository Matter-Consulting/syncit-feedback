# Triage

**Who:** a maintainer's Claude Code session in the app repository an item's area belongs to,
with that repository's `issues` skill (`/issues`: it holds the `gh` commands; this file holds
the rules).

| area | triaged in |
|---|---|
| `area:syncit`, `area:calculations` | syncit |
| `area:matter-toolbox` | matter-toolbox |
| `area:chat` | matter-toolbox for the panel, the engine, settings and sign-in; syncit for what the chat knows and can do in a project |
| none yet | whichever session reads it first, which adds the area |

Claim an item before working on it (assign yourself), so two sessions do not.

## The life of an item

```
new issue (needs-triage) --> read in full --> ONE decision:

  fix now       commit, comment "Fixed in <repo> <sha>", close as completed      file: fixed
  planned       an entry in the repo's TODO list, label planned, stays open      file: planned
  ask           one question in a comment, label waiting-for-reporter            file: waiting
  answer        the answer in a comment, close as completed                      file: answered
  duplicate     link the first item, label duplicate, close as not planned       no file of its own
  out of scope  say where it belongs, label out-of-scope, close as not planned   file: declined
```

Every decision takes `needs-triage` off. An item waiting 30 days with no reply is closed
kindly (the words below) and its file says `declined`. A planned item is closed when its fix
ships. An engineering rule (loads, geometry, a calculation, a company standard) is never
changed because of an item alone: it is planned as the engineer's call.

## From a GitHub issue to a file

When an item is decided, its file is written in the folder of its kind, and updated when its
status changes: `issues/` (bugs), `requests/`, `questions/`, `concerns/`, named
`<issue number, 4 digits>-<slug>.md`. The issue is the conversation; the file is the record.

```markdown
---
id: 0012-push-to-etabs-stops-on-a-new-project
issue: 12
kind: bug              # bug | request | question | concern
area: syncit           # syncit | matter-toolbox | chat | calculations
title: "Push To ETABS stops on a new project"
version: "1.1.0.18 production"   # from the item's Versions
date: 2026-11-20       # reported
status: fixed          # open | planned | waiting | fixed | answered | declined
closed: 2026-11-22     # when it settled; empty while open
resolution: "syncit 1a2b3c4"     # the commit, the TODO heading, "answered", or why it was declined
---

## Report
<the issue's body as sent, less anything confidential>

## Decision
<a few plain lines: what was found, what was done, or why not>

## Links
- https://github.com/Matter-Consulting/syncit-feedback/issues/12
- Also reported as #15
```

**Back-links.** The file names its issue (`issue:` and Links). The decision's comment on the
issue names the file (`https://github.com/Matter-Consulting/syncit-feedback/blob/HEAD/<folder>/<file>`).
A fix's commit in the app's (private) repository ends with the plain trailer
`Feedback: syncit-feedback#12`, and the comment carries the commit's short sha: nothing of the
private history is linked from here. A duplicate gets no file: the first item's file lists it.
One commit per decision, straight to this repository's default branch
(`issues/0012: fixed in syncit 1a2b3c4`).

## Kind words (adapt them, keep them short)

- **fixed**: "Fixed in syncit `1a2b3c4`: <one line, in the engineer's words>. It reaches you
  in the next SYNCIT build (its release notes list it). Thanks for reporting it."
- **planned**: "Thanks, we've accepted this and put it on our list. It moves forward when
  <the trigger, in plain words>. We'll close this when it ships."
- **ask**: "Thanks. To find this we need one more thing: <one question>. Reply here when you can."
- **answer**: "<the answer, naming the page and the button>. Closing as answered; reply here if
  it doesn't work for you."
- **duplicate**: "Thanks, this is the same as #N, which we're already following. Closing this
  one so the answers stay in one place: subscribe to #N to hear when it's done."
- **out of scope**: "Thanks for raising it. This is outside what SYNCIT can change: <why, in
  one line>. <Where it belongs: your project lead, the Operations Manager, the program's own
  support>. Closing it here; reply if we've misread it."
- **no reply in 30 days**: "Closing this for now, as we couldn't take it further without more
  detail. If it happens again, reply here or send a new one from the app's chat."

## Confidential text in an item

First, before anything else: rewrite the body without it (`gh issue edit N --body-file
<clean copy>`, or the web editor), then on GitHub open the item's edit history (the "edited"
mark) and delete the old version. Never copy it into a file, a comment or a commit. Tell the
reporter in one kind line.

## Labels and forms

[`labels.yml`](labels.yml) lists them ([`labels.sh`](labels.sh) makes them). The kind and area
labels are added by [`label-new-items.yml`](.github/workflows/label-new-items.yml) from the
form or the app's text; the rest are a maintainer's. The forms' field ids and labels are the
app's (`lib/feedback.py`, `KINDS`, in matter-toolbox): the app fills a form through the ids and
writes the same `###` headings when it sends with `gh`. Change both together.
