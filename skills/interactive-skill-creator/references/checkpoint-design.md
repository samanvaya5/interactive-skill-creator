# Checkpoint Design

Checkpoints are the defining primitive of interactive skills. A checkpoint is where the agent stops, presents its work, and waits for the human. This document covers what makes checkpoints effective.

---

## What a Checkpoint Is

A checkpoint has three parts:

1. **Work product** — what the agent produced
2. **Summary** — a concise presentation of that work (not the raw output)
3. **Options** — what the human can do next

Every checkpoint must have all three. Missing the summary means the human has to read raw output. Missing the options means the human doesn't know what they can ask for.

---

## Designing Effective Summaries

### Do: Present a curated summary

```
I found 14 videos. Here are the highlights:

| # | Title | Channel | Duration | Views |
|---|-------|---------|----------|-------|
| 1 | Why Agents Will Replace SaaS | @techfounder | 23:41 | 142K |
| ... |

Notable patterns:
- 3 videos are from the same channel (possible bias)
- 2 are product launches, not analysis
- The most-viewed video contradicts the consensus of the others
```

### Don't: Dump raw output

```
Here are all 14 videos I found:
[2000 words of raw data]
```

The human should understand what happened without reading more than a few paragraphs.

### Do: Include the agent's own assessment

```
My analysis suggests 3 of these are high-signal and 2 are noise. 
The product launch videos likely won't contribute to your research question.
I'd recommend dropping them.
```

The agent has context the human doesn't — it just read all the material. Share that context as a recommendation, not just data.

### Don't: Present everything as equally important

```
Here are 14 items. Do something with them.
```

The agent should help the human triage. Not everything matters equally.

---

## Designing Effective Options

### Do: Give concrete choices

```
Do you want to:
- Proceed with all 14 items
- Drop the 2 product launches and 1 low-signal Q&A (my recommendation)
- Remove specific items (tell me which)
- Add more from another source
- Change the scope entirely
```

### Don't: Ask open-ended questions

```
What do you think?
```

Open-ended questions force the human to figure out what's even possible. Give them a menu of reasonable choices, with the option to go off-menu.

### Do: Include the agent's recommendation

Mark one option as recommended when the agent has a clear opinion. The human can ignore it, but it saves time when they agree.

### Don't: Be pushy

```
You MUST drop the product launches. They are irrelevant.
```

Recommend, don't dictate. The human may know something you don't — those product launches might be exactly what they want.

---

## Checkpoint Frequency

### Too few checkpoints

The agent runs for 20 minutes without stopping. By the time the human sees the output, it went in the wrong direction on step 2. Everything after step 2 is wasted.

### Too many checkpoints

The agent stops after every single item. The human gets interrupt fatigue and starts auto-approving without reading. The checkpoints become meaningless.

### The right frequency

- **After completing a stage** — always checkpoint
- **Between batches** — checkpoint if using the Batching pattern
- **After a significant decision point** — checkpoint if the next step depends on a human choice
- **NOT after every individual item** — unless the items are large and complex enough to warrant it

A good rule of thumb: checkpoint every 3-5 minutes of agent work, or after every meaningful unit of output (whichever comes first).

---

## Checkpoint Format Template

Use this structure for every checkpoint:

```markdown
## [Stage Name] — Checkpoint [N]

### What I did
[1-2 sentences summarizing the work completed]

### Key findings / output
[Curated summary — tables, lists, or short paragraphs, NOT raw output]

### My assessment
[The agent's own read on quality, notable patterns, potential issues]

### What's next
[Options for the human, with one marked as recommended if appropriate]
```

---

## Handling Human Responses at Checkpoints

The human's response determines what happens next. Common response types and how to handle them:

| Human response | What the agent does |
|---|---|
| "Proceed" / "Looks good" / "Continue" | Move to next stage or batch |
| "Go deeper on X" | Adjust parameters, re-process or continue with deeper focus |
| "Skip X" / "Drop Y" | Remove items, continue without them |
| "Wrong direction" / "Not what I expected" | Stop and ask for clarification before proceeding |
| "Something feels off" | Probe gently — ask what specifically feels off, don't guess |
| Specific modification ("Add X, remove Y") | Apply the modification, re-present for confirmation if significant |
| "Redo this" | Ask what was wrong before redoing — avoid making the same mistake twice |
| Silence / no response | Wait. Do not proceed. The checkpoint exists for a reason. |

---

## Common Checkpoint Anti-Patterns

### The fake checkpoint

The agent presents work but then continues without waiting. This is not a checkpoint — it's a progress report. Checkpoints require actually stopping and waiting for input.

### The overwhelming checkpoint

The agent dumps 5000 words of output at a checkpoint. The human skims it, misses important details, and approves things they didn't read. Keep checkpoint presentations concise.

### The no-options checkpoint

The agent presents work and says "let me know if you have questions." This forces the human to invent their own next step. Always provide options.

### The one-option checkpoint

The agent presents work and says "shall I continue?" This is effectively not a checkpoint — there's only one path. Either provide real options or don't pretend it's interactive.

### The rubber stamp checkpoint

The same checkpoint format repeated identically 10 times. The human stops reading carefully by checkpoint 3. Vary the presentation based on what's interesting about each batch.

---

## Adapting Checkpoints to Domain

The checkpoint template above is generic. Adapt it to the domain:

- **Writing skills:** Checkpoints show draft text with revision notes
- **Code review:** Checkpoints show issues found with severity ratings
- **Research:** Checkpoints show findings with signal strength assessments
- **Teaching:** Checkpoints show comprehension checks and next topic recommendations
- **Planning:** Checkpoints show proposed plans with trade-off analysis
- **Brainstorming:** Checkpoints show ideas grouped by theme with highlights

The structure (what I did → key findings → my assessment → options) stays constant. The content adapts.
