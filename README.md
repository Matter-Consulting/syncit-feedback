# SYNCIT feedback

Tell the SYNCIT team about a **bug**, a **feature you want**, a **question**, or a **concern,
comment or suggestion**. Everything here is read by the people who build the app.

> **This repository is public: anyone on the internet can read it.** Leave out client and
> project names, drawings, PDFs and screenshots of a client's drawing, model files (`.edb`,
> `.cpt`, `.rvt`), file paths under your user folder, and email addresses. Describe the
> problem in the app's words instead: the page, the button, the message.

## The easiest way

Ask the chat in SYNCIT: "report this as a bug", "I'd like the app to ...", "send this as a
question". It writes the report for you from what you were doing, adds the app's version,
takes out paths and the project's name, and **shows you the exact text** before anything is
sent. Nothing goes until you say yes.

It sends with your own GitHub account if GitHub's `gh` is set up on your PC; otherwise it
opens a filled-in page in your browser and you press **Submit**. Either way you need a free
[GitHub account](https://github.com/signup). No account? Ask the Operations Manager to send it
for you.

## Or here, by hand

**Issues > New issue**, then pick one:

| form | for |
|---|---|
| Bug | something does not work as it should |
| Feature request | something the app should do, or do differently |
| Question | how do I ..., what does this do, where is ... |
| Concern or suggestion | anything else you want the team to know |

Each form asks for the same few things, so it can be acted on: the part of the app, the page
you were on (its name, not the project's), what you did, what you expected, what happened, the
app's own message word for word, and the app's version (it is in the exe's name:
`SYNCIT_v1.1.0.18_production`).

## What happens next

A new item is marked **needs-triage** until a maintainer reads it. Then it gets one answer,
written as a comment you are notified of:

- **fixed**: the comment says so, and the fix reaches you in the next SYNCIT build;
- **planned**: accepted and on the team's list, with what brings it forward; it stays open
  until it ships;
- **a question back to you** (**waiting-for-reporter**): reply in a comment;
- **answered**: for a question;
- **closed with the reason**: the same as an earlier item (linked), or something the app
  cannot change, with where it belongs instead.

Each item that has been looked at is also kept as a file in this repository, one per item:
[`issues/`](issues/) (bugs), [`requests/`](requests/), [`questions/`](questions/) and
[`concerns/`](concerns/). The history reads as files as well as on GitHub. How maintainers do
it: [`TRIAGE.md`](TRIAGE.md).

## Sent something confidential by mistake?

Edit it out straight away (the `...` menu on your text > **Edit**), then tell a maintainer or
the Operations Manager: GitHub keeps the old text in the item's edit history until a
maintainer deletes that version.
