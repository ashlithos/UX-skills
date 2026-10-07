# Teaching playbook

The test for every explanation: **will this make them more capable in session 20, or does it just make me sound educational?** If it's the second, cut it.

## Contents
1. Explanation shape
2. Choosing what to teach
3. Analogy bank
4. Predict-first prompts and quizzes
5. Progressive autonomy
6. Graduation
7. Anti-patterns
8. The learning science behind the lesson page

## 1. Explanation shape

**What it is → Why it exists → How it's used here → What to remember.** Usually 3–6 lines. Anchor in a real file and line from their repo.

> **Props** are the settings you hand a component, like setting variant properties on an instance.
> They exist so one `Button` can be primary, secondary, or disabled without three copies of the code.
> Here, `SearchPage.tsx:42` passes `selected={filter}` into `<FilterChip>`, so the chip just *displays* what the page tells it.
> Remember: **data flows down through props; the child doesn't own it.**

In visual format, this becomes a concept card on the lesson page (`templates/lesson-content.sample.html`), and a structure becomes a flow or tree section there. In chat format, use a visual when there are three or more moving parts:

```
SearchPage   ← owns `filter` (state)
 ├─ FilterBar     gets filter + setFilter (props)
 │   └─ FilterChip   gets selected (prop), calls onSelect
 └─ ResultsList   gets filter (prop) → shows matching items
```

Before/after excerpts beat prose for changes. Keep excerpts under ~15 lines and trim the irrelevant parts with `// …`.

## 2. Choosing what to teach

**First choice: the root cause of the biggest gap in this change.** If "How it went" shows that loading wasn't handled, teach screen states, not whatever term appeared first. A lesson that fixes what just went wrong is relevant, memorable, and immediately useful. If nothing went wrong, teach the most reusable idea in the change.

Otherwise, teach it if it's at least two of: **architecturally important** · **recurring** across frontend work · **needed to understand this change** · **corrects a wrong mental model** they just revealed.

Skip: syntax trivia, tool config, anything COMFORTABLE (unless subtle), anything irrelevant to this change. One concept explained well beats four mentioned.

`teach` mode: go one level deeper. Cover the alternatives, the tradeoff, a common mistake, and how they'd recognize the concept in another repo.

## 3. Analogy bank

Vary analogies. Everyday ones are often clearer than design ones, so don't force a design reference every time. Always say where an analogy breaks.

| Concept | Analogy | Where it breaks |
|---|---|---|
| Component | A main component; instances everywhere | Components can also hold logic and memory |
| Props | Variant properties set on an instance | Props can be functions too (`onClick`) |
| State | Short-term memory; change it and the screen redraws | Lost on refresh unless saved somewhere |
| State ownership | One source of truth, like one master token, not 5 local overrides | |
| Rendering | Re-exporting a frame whenever its data changes | React only updates what actually changed |
| DOM | The layers panel of the live page | It's live and changes as the user interacts |
| CSS cascade | Several style rules competing; most specific wins | Order and inheritance matter too |
| API | A restaurant menu + waiter: you order from the menu, the kitchen is hidden | |
| JSON | A spec sheet in plain text | |
| Async / promise | A coffee-shop buzzer: you get it now, the coffee comes later | |
| Race condition | Two people editing the same frame at once; last save wins | |
| Git commit | A saved version with a note | |
| Branch | Duplicating the file to explore without touching the original | Branches can be merged back automatically |
| Pull request | A design review for code | |
| Tests | Acceptance criteria that check themselves | Only check what someone thought to write |
| Lint | Spellcheck + style guide | |
| Type checking | Design-system constraints: only allowed values fit | |
| CI | A pre-flight checklist run by robots on every PR | |
| Blast radius | Editing the main component vs. one instance | |
| Hooks | Plug-in behaviors a component can borrow | Rules: call them at the top level, same order |
| Auth vs. permissions | ID badge at the door vs. which rooms the badge opens | |

## 4. Predict-first prompts and quizzes

Prediction before explanation is the highest-leverage move for LEARNING concepts. Getting it wrong is fine. It sets up the correction.

Good prompts are short, concrete, and about this code:
- "Before I wire it up: where should `selectedFilter` live, in the chip, the bar, or the page?"
- "What do you think the user sees between clicking Save and the server answering?"
- "This diff touches `api/client.ts`. Should a styling change need to? Why might it?"

Rules:
- At most **one** unprompted question per task in default mode. More in `learn`. None in `ship`.
- Always skippable. "tell me", "skip", "not now" get the answer immediately, with no nudge.
- After the answer: confirm what was right, correct one thing, move on.

`/builder quiz`: 2–4 questions drawn from this session's concepts and the last log entry. Mix one recall ("What does a stack trace tell you?") with one transfer question ("In another app, how would you find where this state lives?"). Then briefly say how they did, with no score.

## 5. Progressive autonomy

The profile's **autonomy stage** decides default behavior. Don't change it because of one good task. Suggest a stage change only after a pattern across several sessions, and only with their yes.

| Stage | Agent behavior | Learner does |
|---|---|---|
| 1. Explain to me | Proactively explains important concepts; conceptual diff walkthroughs | Reads, asks, approves |
| 2. Ask me to predict | Asks for predictions sometimes; learner explains one file of the diff first | Predicts, explains parts |
| 3. Review partner | Mostly reviews and challenges; teaches only on request or for subtle issues | Leads recon, explains the diff, drafts the PR and engineer questions |

The **independence ladder** per concept: *agent explains → learner predicts → learner explains → learner catches it in review*. Move up the ladder as the concept goes `[ ]` → `[~]` → `[x]`.

## 6. Graduation

Evidence that a concept is ready for COMFORTABLE: they used it correctly unprompted, explained it accurately, predicted right twice, or caught a related problem in review.

Ask, don't assume: "You've reasoned about state ownership correctly in two sessions. Mark it Comfortable so I stop explaining it by default?" Update `CONCEPTS.md` only on yes.

## 7. Anti-patterns (cut these on sight)

- Narrating each line of generated code
- A concept lecture with no anchor in their repo
- Quizzing when they're clearly in flow or under deadline
- Re-teaching COMFORTABLE concepts
- Jargon soup: three new terms in one sentence
- "Great question!" filler and other praise inflation
- Making them type code AI can reasonably write
- Turning every task into a design critique

## 8. The learning science behind the lesson page

Each part of the 7-step lesson applies a research-backed principle. Keep the principle intact when you adapt a lesson.

| Principle (source) | What it says | Where it lives in the lesson |
|---|---|---|
| Feedback on real work | Learning sticks when it's tied to what you just did | Overview: how it went → the lesson fixes the biggest gap |
| Objectives up front + pretesting | Knowing the goal, and guessing before being taught, both improve learning. Feedback on the guess *reduces* the benefit, so delay the answer | Goal: "you'll be able to explain…" + a quick guess, revealed in step 6 |
| Pre-training (Mayer) | Learning the names of key parts first frees attention for how they work | Key words: 2–3 terms before the walkthrough |
| Segmenting (Mayer) | User-paced chunks beat one continuous block | One step at a time, with Back/Next and an outline |
| Signaling + coherence (Mayer) | Highlight the structure, cut everything extra | Same 7 steps every time; one highlighted "new" step; no decoration |
| Spatial contiguity + dual coding | Put words next to the picture they describe | Labels inside the flow diagram; numbered code lines with callouts right below |
| Worked examples, with fading | Beginners learn faster from worked solutions. Remove steps as skill grows | Step 5 explains every line at stage 1; leaves one for them to predict at stage 2; they explain at stage 3 |
| Retrieval practice + explanatory feedback | Recalling beats rereading. Feedback should explain why, not just say right/wrong | Step 6: one question, with an explanation for every option |
| Self-explanation | Saying it in your own words deepens understanding | Optional "say it in your own words" box |
| Spaced practice + interleaving | Reviewing after a gap, mixed with older topics, beats cramming one topic | Warm-up from the last session; every 5th session a mixed review |
| Visible progress + consistency (ADHD-friendly) | Knowing where you are and what's left reduces overwhelm; a predictable layout lowers mental load | Progress bar, "Step 2 of 7", checkmarks in the outline, about 5 minutes per lesson |
| Personalization (Mayer) | A conversational "you" voice works better than formal text | Plain, warm wording throughout |

Sources: Mayer, *Multimedia Learning* (segmenting, signaling, coherence, pre-training, contiguity, personalization); Roediger & Karpicke (retrieval practice); Sweller (worked examples, fading); the pretest and learning-objectives studies in *CBE—Life Sciences Education* (2020); Chi (self-explanation); Dunlosky et al. (spacing, interleaving); Nielsen Norman Group (people scan, so give them visible structure and progress).
