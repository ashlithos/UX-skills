# The Git path: learn Git one real moment at a time

Git is where non-engineers feel most lost. It's invisible, the vocabulary is strange, and mistakes feel scary. Don't teach it as a course. Teach **one level when its moment first happens** in real work, as that session's lesson (or as a second concept card when the session's main lesson is about something else).

Track progress in `CONCEPTS.md`, under Engineering workflow and Git & GitHub. A level is done when its concepts are `[x]`, which the learner confirms.

## How each level works: watch → predict → do → own

Git commands are operations, not code, so typing them yourself builds real confidence. Move each level through four stages across sessions:
1. **Watch.** You run the command, and the lesson page shows what happened and why.
2. **Predict.** Before running it: "What do you think `git status` will show now?"
3. **Do.** The learner types the command, and you check the result.
4. **Own.** They do it unprompted, and you only review.

Never let them type destructive commands (`reset --hard`, `push --force`, `clean -fd`, `rebase` on shared branches) as a learning exercise. Explain what those commands are for, and keep them RED.

## The levels

| Level | Moment that triggers it | Concepts | Everyday picture | They can now |
|---|---|---|---|---|
| 1 | First change in a repo | **repository, commit, git status** | A project folder with an unlimited version history. Each commit is a named save point you can return to. | Read `git status`, explain what a commit is, and check commits are signed with their own name and email (`git config user.email`) so they count on their GitHub profile |
| 2 | First time code goes to GitHub | **remote, origin, push, pull, clone** | Your laptop copy vs the cloud copy (like a local file vs the shared Figma file). Push uploads your save points; pull downloads others'. | Say where their work lives, push a branch |
| 3 | First feature that isn't a one-liner | **branch, main** | Duplicating a page to explore without touching the original. `main` is the version everyone trusts. | Create a branch and say why work doesn't happen on main |
| 4 | First pull request | **diff, pull request, review, merge** | A design review for code: here's what changed and why; reviewers comment; approved work is merged into main. | Read a diff, write a PR description (github-craft.md §3) |
| 5 | First public repo | **README, .gitignore, license, deploy / demo** | The README is the repo's case-study page. `.gitignore` is the list of things never to upload (secrets, build junk). | Launch a repo with the checklist (github-craft.md §4) |
| 6 | First merge conflict | **merge conflict, resolving** | Two people edited the same text layer. Git can't pick, so a human chooses. | Read conflict markers and pick, with help |
| 7 | First contribution to someone else's project | **fork, upstream, contributing etiquette** | Fork = your own copy of their repo. A PR from your fork asks them to take your change. | Run the contribution flow (github-craft.md §5) |
| 8 | Messy history, or a secret nearly committed | **commit hygiene, undoing safely** (`git restore`, `git revert`, `git commit --amend` before pushing) | Undo that leaves a trail (revert) vs rewriting history (risky once shared). | Write good commit messages and undo a local mistake safely |
| 9 | A PR shows red or green checks | **CI, checks, deploy previews** | Robots run a pre-flight checklist on every PR, and many hosts deploy a preview link per PR. | Read a failing check and find the error |

## Teaching rules

- **One level per session at most.** Don't stack levels 1–4 because they all happened today. Teach the most important one, then name the next ("Next Git level: branches, when we start your next feature").
- **Use their real repo.** Show their actual `git status`, branch name and diff, never invented ones.
- **Draw it.** Git is a graph, so put it on the lesson page as a flow, e.g. `laptop (commits) → push → GitHub (origin) → PR → main`.
- **Name the fear.** Most Git anxiety is "will I break something?" Say what's reversible (almost everything before a push) and what isn't (force-pushing shared history, leaked secrets).
- **Connect to the portfolio.** Each level ties to a github-craft practice: commits → sustained activity, PRs → merged contributions, README → five-second test.
