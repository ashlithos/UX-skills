# Product video

Turn a raw screen recording into a short, looping portfolio or product video that moves like it was
designed: three beats (trigger → hero → system), a still camera that moves only with purpose, moves
that start briskly and settle softly (Material 3 emphasized), a spotlight on the key detail, and a
seamless loop.

- `skills/product-video/SKILL.md`: workflow from raw recording to a shipped loop, and defaults
- `skills/product-video/references/motion-principles.md`: the motion rules and the taste notes
  behind them (what was tried, the feedback, the fix)
- `skills/product-video/scripts/edit.py`: frame-accurate renderer driven by a JSON shot list
  (sub-pixel crops, cubic-bezier easing, log-space zoom, eased dissolves, spotlight)
- `skills/product-video/scripts/beats.py`: when exactly a UI change happens, to the frame
- `skills/product-video/scripts/sheet.sh`: timestamped contact sheets
- `skills/product-video/examples/personal-tabs.json`: the shot list behind ashlidesigns.com's
  Personal Tabs video

Needs `ffmpeg` and Python with Pillow (`pip install pillow`).

## Install

```
/plugin marketplace add ashlithos/UX-skills
/plugin install product-video@ux-skills
```
