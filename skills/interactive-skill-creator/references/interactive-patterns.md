# The 7 Universal Interactive Patterns

Interactive skills differ from static skills in one fundamental way: quality emerges from the back-and-forth between agent and human, not from a single pass. These 7 patterns are the building blocks that compose into any interactive skill, regardless of domain.

Not every skill needs all 7. A skill might use 2 or 3. The patterns that matter depend on what kind of collaboration the skill enables.

---

## Pattern 1: Checkpoint

**What it is:** The agent produces work, presents a summary, and stops. It waits for the human before continuing. This is the atomic unit of all interactive skills.

**Why it matters:** Without checkpoints, the agent runs unchecked. By the time the human sees the output, it may have gone in the wrong direction for 10 minutes. Checkpoints let the human course-correct early and often.

**What it looks like:**
- Agent presents findings and asks "proceed, adjust, or change direction?"
- Agent shows a draft section and asks "does this hit the right tone?"
- Agent presents a list of candidates and asks "which ones should I focus on?"

**Cross-domain examples:**
- *Writing:* Agent drafts a paragraph, pauses for feedback on voice/pace
- *Code review:* Agent reviews 3 files, pauses to ask which issues to prioritize
- *Research:* Agent finds 20 sources, pauses for the human to narrow the list
- *Teaching:* Agent explains a concept, pauses to check understanding
- *Design:* Agent proposes 3 layout options, pauses for selection
- *Planning:* Agent drafts a project timeline, pauses for scope feedback

**When to use:** Always. Every interactive skill needs checkpoints. The question is never "should I use checkpoints?" but "how many and where?"

**When NOT to use:** Never. This is the one mandatory pattern.

---

## Pattern 2: Negotiation

**What it is:** The agent proposes a framework, approach, or set of rules. The human modifies it. The agent re-proposes. The human confirms. This is collaborative design of the *process*, not the output itself.

**Why it matters:** Without negotiation, the agent follows a fixed approach that may not match the human's intent. Negotiation lets the human shape HOW the agent works before it starts producing. It front-loads alignment so later stages run smoothly.

**What it looks like:**
- Agent proposes an analysis framework, human adds a dimension, agent updates
- Agent suggests a writing style guide, human tweaks the tone, agent confirms
- Agent proposes a review rubric, human adjusts the priorities, agent locks it in
- Agent suggests a teaching pace, human narrows the scope, agent adapts

**Cross-domain examples:**
- *Writing:* "I'll write in a conversational technical tone, ~500 words per section, with code examples. Change anything?" → Human: "Make it more formal, drop code examples, add citations"
- *Code review:* "I'll check for security issues, performance, and readability. Priority: security first. Change?" → Human: "Add architectural concerns, deprioritize readability"
- *Research:* "I'll analyze using this framework: positioning, omissions, hidden signals. Adjust?" → Human: "Add competitive dynamics and partnership signals"
- *Teaching:* "I'll teach in 15-min modules with a quiz after each. Sound right?" → Human: "Skip quizzes, add practice exercises instead"
- *Planning:* "I'll structure the plan as: goals, milestones, risks, dependencies. Modify?" → Human: "Add resource allocation and decision points"

**When to use:** When the skill involves any kind of structured output (analysis, review, teaching curriculum, project plan) where the human has opinions about the structure before work begins.

**When NOT to use:** When the approach is simple and obvious enough that proposing it adds no value — e.g., "I'll summarize this document" doesn't need negotiation.

---

## Pattern 3: Batching

**What it is:** The agent works in small chunks (typically 3-5 items) with check-ins between batches. This prevents runaway execution and gives the human frequent quality signals.

**Why it matters:** If the agent processes 50 items at once and the human hates the approach, you wasted all that compute. Batching lets the human catch problems after 3-5 items instead of 50.

**What it looks like:**
- "I analyzed 4 items. Here are the key insights. Does the depth look right before I continue?"
- "I reviewed 3 files. Found 12 issues. Should I keep this level of detail?"
- "I drafted 5 ideas. Do any of these resonate before I generate more?"

**Cross-domain examples:**
- *Writing:* Agent writes one chapter at a time, checks tone with human before next
- *Code review:* Agent reviews files in groups of 3-5, checks if issue categorization is right
- *Research:* Agent analyzes papers 3-5 at a time, checks if the analysis depth is right
- *Teaching:* Agent teaches one concept at a time, checks understanding before next
- *Design:* Agent creates 3 mockups, gets feedback, creates next batch informed by that feedback
- *Planning:* Agent plans one project phase at a time, checks scope before next

**When to use:** When the skill processes multiple items, produces multiple outputs, or runs for more than a few minutes. If the task is "review these 50 files" or "analyze these 20 videos," batching is essential.

**When NOT to use:** When the task is small enough to complete in one pass — e.g., "review this single file" or "write a short email."

---

## Pattern 4: Branching

**What it is:** The human's response at a checkpoint changes what the agent does next. The agent has predefined paths for common responses and adapts its behavior accordingly.

**Why it matters:** Without branching, every checkpoint is a binary "continue or stop." Branching lets the agent adapt — the human can redirect, narrow, expand, change focus, or request a redo, and the agent responds appropriately for each.

**What it looks like:**
- Human says "proceed" → agent continues to next stage/batch
- Human says "go deeper on X" → agent adjusts depth parameters and continues
- Human says "wrong direction, focus on Y instead" → agent pivots approach
- Human says "skip this and move on" → agent marks item as skipped, continues
- Human says "redo this one, you missed the point" → agent asks for clarification, re-processes
- Human says something vague like "something feels off" → agent probes for specifics

**Cross-domain examples:**
- *Writing:* Human: "too formal" → agent lightens tone; Human: "too long" → agent tightens; Human: "missing the point" → agent asks what point they expected
- *Code review:* Human: "these are nitpicks" → agent raises severity threshold; Human: "missed something critical" → agent lowers threshold and re-scans
- *Research:* Human: "too surface level" → agent goes deeper on hidden signals; Human: "too negative" → agent balances with genuine positives
- *Teaching:* Human: "I already know this" → agent skips ahead; Human: "confused" → agent breaks concept into smaller steps
- *Planning:* Human: "scope too big" → agent narrows; Human: "missing dependencies" → agent adds dependency analysis

**When to use:** When the human might reasonably want different things at a checkpoint. If the only responses are "yes" and "no," branching isn't needed.

**When NOT to use:** When checkpoints have a simple approve/reject flow.

---

## Pattern 5: Progressive Refinement

**What it is:** The agent starts broad and narrows based on accumulated human feedback. It learns the human's intent over the course of the interaction, getting more calibrated with each exchange.

**Why it matters:** The human often can't articulate exactly what they want upfront. They know it when they see it. Progressive refinement lets the agent converge on the right approach through repeated exposure to the human's reactions, rather than requiring perfect specification.

**What it looks like:**
- After batch 1, human says "too detailed" → agent adjusts all remaining batches to be more concise
- After first draft, human says "not analytical enough" → agent deepens analysis for all future sections
- After first lesson, human answers all quiz questions wrong → agent slows pace and adds more examples
- After first review, human keeps flagging false positives → agent raises the bar for issue severity

**Cross-domain examples:**
- *Writing:* First draft establishes voice. Human feedback calibrates. All subsequent drafts benefit.
- *Code review:* First batch reveals what the human considers a real issue vs. noise. Remaining batches reflect this.
- *Research:* First analysis reveals what the human considers a signal vs. noise. Remaining analyses are calibrated.
- *Teaching:* First concept reveals the learner's level. All subsequent material is paced accordingly.
- *Design:* First mockup reveals aesthetic preferences. All subsequent work inherits that style.
- *Brainstorming:* First batch of ideas reveals what excites the human. Subsequent ideas are steered toward that territory.

**When to use:** When the task spans multiple items or iterations, and the human's feedback on early work should inform later work. If you're doing the same thing 10 times, the first 2 should teach the agent how to do the remaining 8 better.

**When NOT to use:** When each item is independent and feedback on one doesn't apply to others — e.g., "summarize these 10 unrelated documents."

---

## Pattern 6: Resumability

**What it is:** State is saved to disk so a new session can pick up where the old one left off. The agent checks what already exists and resumes from the first missing piece.

**Why it matters:** Interactive sessions are long. They get interrupted — the human closes their laptop, the context window fills up, the agent hits a turn limit. Without resumability, all progress is lost. With it, the human can start a new session and continue from where they left off.

**What it looks like:**
- Agent checks a folder for completed work: "I see 8 of 12 analyses are done. Resuming from item 9."
- Agent reads a state file: "Last session ended after Stage 3 schema negotiation. The agreed schema was [X]. Picking up at Stage 4."
- Agent checks file timestamps: "The most recent draft is from yesterday. Continue from there?"

**Cross-domain examples:**
- *Writing:* Check which chapters exist, continue from the first missing one
- *Code review:* Check which files have been reviewed, continue from the next unreviewed file
- *Research:* Check which items have been analyzed, continue from the first unanalyzed one
- *Teaching:* Check which modules were completed, continue from the next
- *Planning:* Check which phases are planned, continue from the first unplanned one

**When to use:** When the skill's workflow spans more than a single session — anything that takes more than ~15 minutes or processes more than a handful of items.

**When NOT to use:** For quick, single-session tasks that complete in a few minutes.

---

## Pattern 7: Role

**What it is:** The agent takes on a specific collaborative posture — a persona that shapes its tone, what it prioritizes, how opinionated it is, and how it presents its work.

**Why it matters:** A writing coach should sound different from a code reviewer. A tutor should be patient while a strategic analyst should be direct. The role tells the agent not just WHAT to do but HOW to be. It's the difference between "analyze this" and "you are a skeptical industry veteran who calls out hidden agendas."

**What it looks like:**
- "You are a strategic research analyst paired with a human curator. You are opinionated, skeptical, and read between the lines."
- "You are a supportive writing coach who pushes for clarity without being harsh."
- "You are an experienced senior engineer reviewing code for a team that values pragmatism over purity."
- "You are a patient tutor who adapts to the learner's pace and never makes them feel stupid."
- "You are a creative partner who builds on ideas rather than shooting them down."

**Cross-domain examples:**
- *Writing:* Supportive editor, harsh critic, style matcher, genre specialist
- *Code review:* Pragmatic senior engineer, security hawk, performance optimizer, architecture reviewer
- *Research:* Skeptical analyst, neutral summarizer, opportunity spotter, contrarian thinker
- *Teaching:* Patient guide, Socratic questioner, hands-on demonstrator
- *Planning:* Conservative planner, ambitious visionary, risk analyst
- *Brainstorming:* Yes-and builder, devil's advocate, pattern connector

**When to use:** Always. Every interactive skill needs a role definition. The agent needs to know its collaborative posture — even "neutral assistant" is a role.

**When NOT to use:** Never. This is the second mandatory pattern alongside Checkpoint.

---

## Pattern Composition

Most interactive skills combine multiple patterns. Here's how they typically compose:

| Pattern | Always needed? | Typical role in a skill |
|---------|---------------|----------------------|
| **Checkpoint** | Yes | The spine of the workflow — every stage ends with one |
| **Role** | Yes | Defined once at the top of SKILL.md, shapes everything |
| **Negotiation** | Often | Usually one stage (early) where the approach is agreed upon |
| **Batching** | When processing multiples | Applied to the heaviest processing stage(s) |
| **Branching** | When responses vary | Applied to every checkpoint where the human might redirect |
| **Progressive Refinement** | When items are related | Applied across batches to improve calibration |
| **Resumability** | For multi-session tasks | Applied to the overall state management |

### Example compositions:

**A writing coach:** Role + Checkpoint + Negotiation + Progressive Refinement
- Role: supportive editor
- Negotiation: agree on voice/tone upfront
- Checkpoint: pause after each section
- Progressive refinement: calibrate to human's style preferences over sections
- No batching (usually one document at a time), no resumability (single session)

**A code reviewer:** Role + Checkpoint + Batching + Branching
- Role: pragmatic senior engineer
- Batching: review 3-5 files at a time
- Checkpoint: pause between batches
- Branching: human can redirect focus (security vs. performance vs. architecture)
- No negotiation (review rubric is usually fixed), no progressive refinement (files may be unrelated)

**A research analyst (Subtext):** All 7 patterns
- Every pattern applies because the workflow is long, complex, and highly collaborative

**A brainstorming partner:** Role + Checkpoint + Batching + Progressive Refinement
- Role: creative yes-and builder
- Batching: generate 5 ideas at a time
- Checkpoint: pause for human reaction
- Progressive refinement: steer toward what excites the human
- No negotiation (no framework to negotiate), no resumability (usually single session)

---

## How to use this document

When designing an interactive skill:

1. Read all 7 patterns
2. For each pattern, ask: "does this skill's workflow need this?"
3. Select the patterns that apply
4. Use the composition guidance above to understand how they fit together
5. The selected patterns become the building blocks for Stage 3 (Design Stage Architecture) of the interactive-skill-creator workflow

Two patterns are mandatory for every interactive skill: **Checkpoint** and **Role**. Everything else is optional.
