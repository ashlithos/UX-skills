# Designer → Builder

A Claude Code skill for product/UX designers who want to **ship real frontend code with AI and understand what they ship**.

It acts as a senior frontend engineer sitting beside you, a code-review guardrail, a translator between design intent and software structure, and a coach who gradually steps back as you grow. It is not a coding course, an engineer replacement, or an autonomous vibe-coder.

> **North star:** you can open an unfamiliar frontend repo, make a small product change with AI, run and debug it, read the diff, and open a PR you can explain to an engineer.

## Install

**Option A: Claude Code plugin (recommended; gets updates)**

```
/plugin marketplace add ashlithos/UX-skills
/plugin install designer-to-builder@ux-skills
```

If the repo is private, Claude Code uses your existing GitHub/git credentials.

**Option B: copy the skill (no plugin system)**

```bash
git clone https://github.com/ashlithos/UX-skills
mkdir -p ~/.claude/skills
cp -r UX-skills/plugins/designer-to-builder/skills/builder ~/.claude/skills/builder
```

**Option C: claude.ai (web, desktop, cloud sessions)**

Upload `builder.skill` (or a zip of the `skills/builder` folder) in claude.ai → Settings → Capabilities → Skills.

**Make it engage automatically** by adding one line to `~/.claude/CLAUDE.md`:

```
I'm a product designer learning to build. For coding work, use the builder skill (Designer → Builder).
```

## First run

Type `/builder` (or `/designer-to-builder:builder` if another command is already called `builder`). It offers a 5-minute, scenario-based calibration. You can skip it and start with beginner defaults.

## Visual lessons

Explanations come as a **step-by-step lesson page**, with a sidebar outline, a progress bar, and Back/Next buttons. The chat stays to about 5 lines.

Every lesson follows the same 7 steps:

1. **Overview:** how your change went, how it fits the codebase, the structure of your change (CL), and the one small thing to learn next, and why
2. **Goal:** what you'll be able to explain, a warm-up from last time, and a quick guess
3. **Key words:** 2–3 terms in plain language
4. **How it works:** a simple step diagram
5. **The code:** before/after, explained line by line
6. **Check yourself:** one question, with an explanation for every answer
7. **Wrap up:** what you can do now, what's left before shipping, your progress

The structure follows learning research: short self-paced steps, guessing before learning, worked examples, quizzes that explain each answer, and spaced review. See `references/teaching.md` §8. Sample content: `skills/builder/templates/lesson-content.sample.html` (built into a page by `scripts/build-lesson.sh`). Prefer text? Set `Teaching format: chat` in your profile.

Pages go to `.builder/lessons/` in the project. In personal projects with claude.ai, they're also published as private Artifacts. Pages from work repos stay on your machine.

## Controls

Type `/builder <mode>`, or just say it in plain words.

| Say | It does |
|---|---|
| `/builder onboard` | Calibrate or reset your profile |
| `/builder map` | Build/update a BUILD_MAP for the current change |
| `/builder teach` | Go deeper on the concept in play |
| `/builder why` | Why does the implementation work this way? |
| `/builder diff` | Walk through the current diff |
| `/builder review` | Pre-PR gauntlet: architecture, simplification, QA, accessibility, validation |
| `/builder quiz` | A few quick recall questions |
| `/builder concepts` | Show your concept tracker |
| `/builder comfortable props` | Graduate a concept (after confirmation) |
| `/builder retro` | What did building this teach us about the design? |
| `/builder ship` | Minimal teaching, focus on finishing |
| `/builder learn` | Deeper teaching for a while |
| `/builder wrap` | Log today's session |
| "tell me" / "skip" / "not now" | Answer now; no quiz |

## Where your files live

| File | Location | Purpose |
|---|---|---|
| `LEARNER_PROFILE.md` | `~/.claude/designer-to-builder/` | Your level, ship/learn ratio, preferences. You own it. |
| `CONCEPTS.md` | same | ~60 concepts, each `[ ]` not learned, `[~]` learning, or `[x]` comfortable. You graduate them. |
| `LEARNING_LOG.md` | same | 5 lines per session, plus a "next time, explain" warm-up question |
| `BUILD_MAP.md` | `.builder/` in the project | Temporary map for a meaningful change; never committed |
| Lesson pages | `.builder/lessons/` in the project | Visual lesson for each task. `.builder/` ignores itself in git |

Set `BUILDER_HOME` to store state somewhere else, for example a synced folder.

**Cloud sessions** (claude.ai/code) start each session in a fresh container, so the home folder resets. For personal projects, keep the state files in the project's `.builder/` folder and commit them. In work repos, keep them local only.

## How it decides how much to teach

- **Your profile, not guesswork.** It reads your explicit level and concept statuses. It won't silently decide you're "advanced" after one good task.
- **Scaled ceremony.** A copy tweak gets one line. A new feature gets recon, a map, a diff walkthrough, and a review gauntlet.
- **A teaching budget.** By default, at most two teaching moments and one question per task, anchored in your real code.
- **Progressive autonomy.** Stage 1: it explains. Stage 2: it asks you to predict and explain parts. Stage 3: it's your reviewer and sounding board.
- **Retrieval practice.** Each session ends with a short log entry, and the next one can open with a one-line "explain this from memory" warm-up. That's how 20 sessions add up to real skill rather than 20 nice explanations.

## What's inside

```
skills/builder/
├── SKILL.md                     always-on core rules (loaded when the skill triggers)
├── references/                  loaded only when needed
│   ├── onboarding.md            calibration flow + scenarios
│   ├── teaching.md              explanation shape, analogy bank, quizzes, autonomy stages, learning science
│   ├── review.md                diff walkthrough, gauntlet, validation report, explainability, retro
│   ├── recon-risk-scope.md      recon checklist, GREEN/YELLOW/RED, scope alarm, engineer questions
│   └── examples.md              beginner, intermediate, and production-repo examples
├── templates/
│   ├── LEARNER_PROFILE.md
│   ├── CONCEPTS.md
│   ├── LEARNING_LOG.md
│   ├── BUILD_MAP.md
│   ├── lesson-shell.html        lesson layout: styles, navigation, progress, quiz behavior
│   └── lesson-content.sample.html  sample 7-step lesson content
└── scripts/
    └── build-lesson.sh          wraps lesson content in the shell → a finished page
```

## Using it with other coding agents

`SKILL.md` follows the open Agent Skills format (a folder with a `SKILL.md`, YAML frontmatter, and markdown), so agents that support skills can load it as is. For agents without skill support, paste the body of `SKILL.md` into their instructions file (for example `AGENTS.md` or `.cursor/rules`) and keep `references/` and `templates/` alongside it. The only Claude Code–specific pieces are the `/builder` slash command and `$ARGUMENTS`. Elsewhere, use the plain-language controls.
