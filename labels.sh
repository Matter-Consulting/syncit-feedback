#!/bin/sh
# Creates this repository's labels (labels.yml says what each one means). Run it once after
# the repository is made, with gh signed in as one of its maintainers:
#     sh labels.sh
# Running it again is safe: --force updates a label that is already there.
REPO="${REPO:-Matter-Consulting/syncit-feedback}"
set -e

gh label create "kind:bug"             --repo "$REPO" --force --color d73a4a --description "Something in the app does not work as it should"
gh label create "kind:request"         --repo "$REPO" --force --color a2eeef --description "Something the app should do, or do differently"
gh label create "kind:question"        --repo "$REPO" --force --color d876e3 --description "How do I ... / what does this do?"
gh label create "kind:concern"         --repo "$REPO" --force --color fbca04 --description "A concern, a comment or a suggestion"
gh label create "area:syncit"          --repo "$REPO" --force --color 0e8a16 --description "The app's pages, tasks and exports (the syncit repository)"
gh label create "area:matter-toolbox"  --repo "$REPO" --force --color 1d76db --description "The window, navbar, settings and project list (the matter-toolbox repository)"
gh label create "area:chat"            --repo "$REPO" --force --color 5319e7 --description "The chat panel and what it can do (both repositories)"
gh label create "area:calculations"    --repo "$REPO" --force --color c5def5 --description "Columns, strut and tie, pile caps (the calculation repositories, through syncit)"
gh label create "needs-triage"         --repo "$REPO" --force --color ededed --description "New, nobody has read it yet"
gh label create "planned"              --repo "$REPO" --force --color 0052cc --description "Accepted and written into a repository's TODO list"
gh label create "waiting-for-reporter" --repo "$REPO" --force --color fef2c0 --description "We asked the reporter a question"
gh label create "duplicate"            --repo "$REPO" --force --color cfd3d7 --description "Already reported in another item"
gh label create "out-of-scope"         --repo "$REPO" --force --color e4e669 --description "Not something this app can change"

# GitHub's starter labels this repository does not use ("duplicate" is kept, updated above).
# A label that is already gone is fine.
set +e
for name in bug documentation enhancement "good first issue" "help wanted" invalid question wontfix; do
  gh label delete "$name" --repo "$REPO" --yes >/dev/null 2>&1
done
exit 0
