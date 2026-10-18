# Clean site

Make a personal website, portfolio or landing page look clean and hold up at every screen size.

A clean site is a small system applied without exceptions: few fonts, few colors, one grid, a short
spacing scale, and work shown early. The skill audits a site against that system, helps the owner
choose the system (keep / drop specimen), applies it, and proves the result with before/after
screenshots.

- `skills/clean-site/SKILL.md`: the workflow (audit → choose → apply → prove) and defaults
- `skills/clean-site/references/principles.md`: the rules, each with a test you can run
- `skills/clean-site/scripts/audit.mjs`: screenshots every page at six widths; reports sideways
  scroll, floating footers, where the first work lands, and every font, size and color in use
  (needs Playwright in the audited project: `npm i -D playwright`)
- `skills/clean-site/scripts/camera.py`: a quick ffmpeg zoom camera (for designed motion, use the
  `product-video` plugin)

## Install

```
/plugin marketplace add ashlithos/UX-skills
/plugin install clean-site@ux-skills
```
