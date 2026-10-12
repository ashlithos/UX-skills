# GitHub craft for designers

> **Adds to the normal workflow.** After the GitHub/Git work, still finish with the lesson page and the short chat (SKILL.md "Finish line"). For a first commit, push or PR, the Git level is the lesson.

Distilled from how well-known designers present themselves on GitHub. A designer's GitHub is read as a **taste and credibility signal**, not a volume metric. Hiring managers spend seconds on it, and in 2026 they assume AI could have written anything, so honesty and specificity are the signal.

Apply this **proactively** whenever you create a repo, write a README, commit, open a PR, push something public, or the learner asks about their GitHub. Don't wait to be asked: generate the README sections, PR description and commit messages in this shape, and say in one line what you added and why.

## Contents
0. What hiring managers actually look for (the why)
1. The ten practices
2. Don'ts (flag these)
3. Templates: profile README · project README · PR description · commit messages
4. New public repo: launch checklist
5. Contributing to other people's projects
6. Quarterly signal review (`/builder portfolio`)
7. Decision ledger and walkthrough rehearsal

## 0. What hiring managers actually look for (the why)

| Principle | Evidence from hiring leads | What it means for the skill |
|---|---|---|
| **A repo you can walk through beats green squares.** The hardest test is opening your real Figma file or repo and walking it end to end. A repo with a README, a demo and a decision record beats a wall of contribution squares. | "Be ready to open the actual Figma or repo and walk it end to end." (Dylan Widick, Block) | Before a repo is pinned or shared, run the walkthrough rehearsal (§7). |
| **Original > contribution > fork. Taste is the scarce signal.** Forks and padded graphs don't count. Paco's cmdk, Oscar's 9.5k★ tool and Rogie's figui3 all follow the same arc: wanted it, built it, people use it. | "A personal project that shows unconstrained taste, and visual craft as the differentiator now that product thinking is baseline." (Chris Andrews, Notion) | Push for visual polish in demos and READMEs (GIF, screenshots, a considered UI). Steer toward original projects that come from real pain. |
| **Code isn't the gate, but working in an IDE is the new baseline.** Nobody expects a designer to be a full-time engineer, but you have to show you can turn ideas into reality at the code level, the way Gavin's primer/octicons PRs or Katie's CSS tokens do. | "Code is not a screening bar everywhere." (Conor Muirhead, Linear). "Comfort with IDEs and AI tools" (Chris Andrews) | The Git path and the do/own stages: the learner runs real commands and reads real diffs themselves. |
| **Attribution beats code volume.** In AI-assisted work, a README that says why it's designed this way, what you traded off and what AI generated is more persuasive than lots of code. Otherwise the hiring manager credits the AI by default. | "Be ready to say which decisions were yours versus an agent's or a stakeholder's." (Lauren LoPrete, Mercury). "Attributable decisions in AI-assisted work." (Oscar Lozano, Lovable) | Keep the decision ledger (§7) and draft "Design decisions" and "How this was built" from it, never from memory. |
| **Judgment and leverage: what you rejected.** Whether the repo is really used (stars, forks), whether others build on it, and which obvious approaches you rejected are all evidence of judgment. | | Log rejected options as they happen. Surface real usage in the quarterly review. |

## 1. The ten practices

| # | Practice | What you do proactively |
|---|---|---|
| 1 | **Profile README** (`<username>/<username>` repo): 5 lines saying who you are, what you make, what you're exploring, how to reach you, and your 3 best repos. The first sentence names your shape, e.g. "Data visualization × AI products × I write code." | Offer to draft it the first time they touch their GitHub presence. Use the template in §3. |
| 2 | **Pin 3 original repos** around one theme (e.g. data viz × AI). No forks, no tutorial follow-alongs. The best ones are real work pain points turned into tools (cmdk came from Vercel's own need). | When a project starts, ask: "Is this a pin candidate? What real pain does it solve?" |
| 3 | **README written like product docs.** One-line what it is, a GIF or screenshot, a 30-second quickstart, why it exists, and a demo link. It has to pass a 5-second test. | Write every README in this shape (§3). Leave `<!-- TODO: add GIF -->` slots instead of skipping the visual. |
| 4 | **Every repo has a live demo** you can click (Vercel, Netlify, GitHub Pages). A repo you can't click is close to no repo. | Set up deployment, or give the exact steps, before calling a public repo done. |
| 5 | **PRs to 2–3 well-known projects you actually use** (the Gavin Nelson route: primer/octicons, logseq, monkeytype). A fixed accessibility issue, an icon, a docs fix. A merged PR is harder to fake than stars. | When they hit a bug or rough edge in a tool they use, point out that it's a contribution opportunity (§5). |
| 6 | **Low frequency, sustained.** 1–2 meaningful commits a week for 6 months. A 50-commit burst followed by a year of silence reads as a negative. | Make commits meaningful and well-described. Never pad the history or split commits for the graph. |
| 7 | **"Design decisions" in the README:** what you rejected and why, plus an honest note on which parts were AI-assisted. Answer "did you or AI write this?" before anyone asks. | Add both sections to every project README. Draft the AI note truthfully from what actually happened in the session. |
| 8 | **An "AI-era designer" experiment repo**, e.g. a Claude Code data-viz review skill or a Figma MCP + D3 round trip. Turn workflows top designers describe into reproducible experiments. It's shared language with AI-lab hiring teams. | When a session produces a reusable workflow or skill, suggest packaging it as an experiment repo. |
| 9 | **GitHub one click from the portfolio homepage.** Embed the contribution graph (like Oscar Lozano), or make the repo itself the work (like Paco). | Mention it when they publish a pin-worthy repo. |
| 10 | **Review signal strength every 3 months.** Are the pins still your best three? Are the demos alive? Any new merged PRs? Treat GitHub as a product you iterate on, not a one-time makeover. | Run `/builder portfolio` (§6) when asked, or suggest it when a log entry is about 3 months after the last review. |

## 2. Don'ts (flag with 🟡, or 🔴 for confidential code)

- 🟡 Forking popular repos for decoration, buying stars, or joining star-exchange groups.
- 🔴 **Uploading company or confidential code to a public repo.** Stop and say so, even if it's "just a snippet". In professional repos, never suggest making anything public.
- 🟡 A résumé that says "expert" while the repo is only a README.
- 🟡 AI-generated filler: generic names (`my-app`, `test-project`), empty descriptions, no demo. In 2026 the "AI smell" is obvious and it hurts the taste signal. Suggest a specific name and a one-line description instead.
- 🟡 Secrets in history (`.env`, API keys). Add `.gitignore` before the first commit, and check `git status` before every push.

## 3. Templates

### Profile README (`<username>/<username>/README.md`)
```md
# Hi, I'm <Name>. <Shape in one line: e.g. Data visualization × AI products × I write code.>

- 🎨 I design <what> at <where / for whom>.
- 🔭 Exploring <current experiment>.
- 📌 Start here: [<repo 1>](link) · [<repo 2>](link) · [<repo 3>](link)
- 📫 <portfolio link> · <email or social>
```

### Project README
```md
# <name>: <one line: what it is, for whom>

<GIF or screenshot>  <!-- TODO: add a GIF if you don't have one yet -->

**Live demo →** <url>

## Quickstart (30 seconds)
<3–5 commands or steps>

## Why this exists
<the real pain it solves, 2–3 sentences>

## Design decisions
- **Chose X over Y** because <reason>. <What it costs.>
- **Rejected Z** because <reason>.

## How this was built
<Honest split: what you designed and decided, and what AI generated and you reviewed. Example: "I designed the interaction and data model and reviewed every change. Claude Code generated most of the React code from my specs.">
```

### PR description (extends review.md §5)
```md
## What
## Why (user problem)
## How (approach + pattern reused)
## Screenshots (before → after, incl. loading/empty/error)
## Design decisions (what I chose, what I rejected)
## Testing (VERIFIED / NOT VERIFIED)
## AI assistance (what was generated, what I reviewed)
## Risks & questions for reviewers
```
Follow the repo's own PR template when there is one. In professional repos, include the AI-assistance note only if the team's norms allow or ask for it.

### Commit messages
- Imperative and specific: `Add empty state to search results`, not `update` or `fix stuff`.
- One meaningful change per commit. Explain the *why* in the body when it isn't obvious.
- Never commit just to make the contribution graph greener.

## 4. New public repo: launch checklist

Show this as the "Before you ship" list on the lesson page:
- [ ] Specific name and a one-line description (set in the repo's About box)
- [ ] 3–5 topics (e.g. `data-visualization`, `react`, `ai`)
- [ ] README in the §3 shape, including Design decisions and How this was built
- [ ] Live demo deployed, with the link in About and the README
- [ ] Commit author is **you**: `git config user.name` / `user.email` match your GitHub account, or the commits won't count on your contribution graph or read as yours
- [ ] `.gitignore` committed before any code; no secrets in history
- [ ] A license (MIT if unsure, and say what that means in one line)
- [ ] A social preview image (the card people see when the link is shared)
- [ ] Decide: pin it? If yes, which current pin does it replace?
- [ ] Design decisions and How this was built drafted from the decision ledger
- [ ] Walkthrough rehearsed (§7): you can walk it end to end in 2 minutes

## 5. Contributing to other people's projects

The flow, in plain words. Teach it on the lesson page the first time it comes up (see git-path.md level 7):
1. Pick a project you **use**. Look for `good first issue` labels, accessibility bugs, missing icons, or confusing docs.
2. Read `CONTRIBUTING.md` and the code of conduct. Search existing issues and PRs so you don't duplicate one.
3. For anything bigger than a typo, comment on the issue first: "I'd like to take this, and here's my plan."
4. Fork → clone → branch → make the small change → run their checks → open the PR using their template.
5. Keep it small, follow their style, add before/after screenshots for UI, and respond to review kindly and quickly.

Good designer contributions: accessibility fixes (labels, contrast, focus), icons, empty/error states, docs clarity, design-token consistency.

## 6. Quarterly signal review (`/builder portfolio`)

Look at the learner's public GitHub, using what's reachable: their profile, pinned repos and recent activity. Build a lesson-style page whose Overview scores each practice:

| Practice | Strong / OK / Needs work | Evidence |
|---|---|---|
| Profile README states the shape | | |
| 3 original pins, one theme | | |
| READMEs pass the 5-second test | | |
| Every pin has a live demo | | |
| Merged PRs to known projects | | |
| Steady activity, no bursts or long silences | | |
| Design decisions + AI note in READMEs | | |

"Today's lesson" is the one highest-leverage fix for this quarter. The wrap-up has 2–3 concrete next actions, and a log line dated for the next review.

## 7. Decision ledger and walkthrough rehearsal

**Decision ledger.** During work in a personal or portfolio repo, keep `.builder/DECISIONS.md`. Whenever a consequential choice is made, append one line, as it happens:
```
- 2026-10-11 · [you] Chose CSS fade over framer-motion: no new dependency for a simple effect. Rejected: framer-motion (adds ~30 kB).
- 2026-10-11 · [agent] Proposed localStorage for favorites; [you] accepted after the tradeoff (per-browser only).
- 2026-10-11 · [stakeholder] PM asked for max 5 saved filters.
```
Tag each line `[you]`, `[agent]` or `[stakeholder]`, honestly. If the learner just accepted the agent's suggestion, say so. That's still a decision, but a different one. At README or PR time, draft "Design decisions" and "How this was built" from the ledger. Not for professional repos, unless the team wants it.

**Walkthrough rehearsal.** Before a repo is pinned or linked from the portfolio, add a "Walk it end to end" step to the lesson's wrap-up. The learner practices a 2-minute walkthrough in their own words, and you give gentle feedback:
1. What it is, and who it's for (one sentence)
2. Demo: the core interaction
3. One decision that was theirs, and the alternative they rejected
4. What AI did, and what they reviewed or changed
5. What they'd do next

If they can't do part 3 or 4 yet, that gap is next session's lesson.
