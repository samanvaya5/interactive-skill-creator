# Stage Templates

Interactive skills are built from stages. Each stage has a clear goal, produces specific output, and ends with a checkpoint. This document describes reusable stage archetypes — common patterns that appear across domains.

Not every skill uses every archetype. Mix and match based on what the skill needs.

---

## Archetype 1: Discovery

**Goal:** Find or collect the raw material the skill will work with.

**What the agent does:**
- Searches, queries, or accepts user-provided items
- Filters and organizes what it finds
- Presents a curated list for human review

**Checkpoint presents:**
- List of items found (with metadata — dates, sources, relevance signals)
- Agent's observations about the collection (gaps, biases, notable patterns)
- Options: proceed with all, remove some, add more, change scope

**When to use:** When the skill needs to gather input before processing it. Almost every interactive skill starts with some form of discovery.

**Cross-domain examples:**
- *Research:* Find videos/papers/articles on a topic
- *Code review:* Identify which files to review
- *Writing:* Gather source material or reference documents
- *Teaching:* Assess what the learner already knows
- *Planning:* Collect requirements and constraints
- *Brainstorming:* Define the problem space

**Stage instructions template:**
```markdown
### Stage [N]: Discovery

**Goal:** Find the right [items/content/material] to work with.

Ask the user what they want to [search for/explore/work with]. They might provide:
- [Specific items/URLs/references]
- [A topic to search for]
- [A source to pull from]

Based on their input, use [available tools/methods] to discover content.

**CHECKPOINT — Present findings:**
- [Table/list of items found with relevant metadata]
- [Agent's observations about the collection]
- [Options: proceed, remove, add more, change scope]
```

---

## Archetype 2: Ingest

**Goal:** Process raw material into a clean, usable form.

**What the agent does:**
- Fetches, reads, or transforms raw input
- Verifies quality and completeness
- Saves processed material for later stages

**Checkpoint presents:**
- How many items processed successfully vs. failed
- Any quality issues (incomplete data, wrong format, missing information)
- Options: proceed with good items, skip specific ones, try alternatives for failures

**When to use:** When raw input needs processing before the core work can begin. Not needed if input is already in usable form.

**Cross-domain examples:**
- *Research:* Fetch transcripts, extract text from PDFs
- *Code review:* Parse code, identify change sets
- *Writing:* Read source documents, extract key quotes
- *Teaching:* Convert curriculum into lesson-sized chunks
- *Planning:* Normalize requirements into a consistent format

**Stage instructions template:**
```markdown
### Stage [N]: Ingest

**Goal:** Get clean, complete [data/material] for confirmed items.

Process items in batches. For each batch:
- Verify completeness and quality
- Flag any issues

**CHECKPOINT — Present ingest results:**
- [N] successful, [M] failed/incomplete
- [Details on failures with reasons]
- [Options: proceed with good items, skip some, try alternatives]
```

---

## Archetype 3: Framework Agreement

**Goal:** Agree on the approach, structure, or rules the agent will follow for the rest of the workflow.

**What the agent does:**
- Proposes a default framework/approach
- Presents alternatives or a menu of options
- Incorporates human modifications
- Re-presents the final agreed framework for explicit confirmation

**Checkpoint presents:**
- The proposed framework (with clear section headings)
- A menu of alternatives if applicable
- Options: use as-is, modify specific parts, choose a different approach, define custom

**When to use:** When the skill involves structured output (analysis, reviews, plans, curricula) where the human should shape the structure before work begins. This is where the Negotiation pattern lives.

**Cross-domain examples:**
- *Research:* Agree on analysis schema (what dimensions to analyze)
- *Code review:* Agree on review rubric (what to check, severity thresholds)
- *Writing:* Agree on style guide (tone, structure, length)
- *Teaching:* Agree on curriculum and teaching method
- *Planning:* Agree on plan structure and priorities
- *Brainstorming:* Agree on evaluation criteria for ideas

**Stage instructions template:**
```markdown
### Stage [N]: Framework Agreement

**Goal:** Agree on the [framework/approach/schema] for the rest of the workflow.

Present the default [framework]:
[Show the default structure with explanations]

Also present alternatives:
[Menu of different approaches if applicable]

**CHECKPOINT — Present framework for approval:**
Wait for the user to respond. They might:
- Say "looks good" → proceed with this framework
- Say "modify X, add Y" → update and re-present for confirmation
- Choose a different approach from the menu → show that approach, confirm
- Describe something custom → interpret into a framework, propose, confirm

You must show the FINAL agreed framework and get an explicit "yes" before proceeding.
```

---

## Archetype 4: Processing

**Goal:** Apply the agreed framework to each item. This is where the core work happens.

**What the agent does:**
- Works through items in batches (3-5 at a time)
- Applies the agreed framework consistently
- Saves each processed item to disk
- Presents a summary after each batch

**Checkpoint presents:**
- 1-line insight or summary per item in the batch
- Agent's assessment of quality and direction
- Options: continue, adjust approach, redo specific items

**When to use:** When the skill needs to process multiple items through a consistent framework. This is where Batching and Progressive Refinement patterns live.

**Cross-domain examples:**
- *Research:* Analyze each transcript/paper using the agreed schema
- *Code review:* Review each file using the agreed rubric
- *Writing:* Draft each section following the agreed style guide
- *Teaching:* Teach each module using the agreed curriculum
- *Planning:* Plan each phase following the agreed structure
- *Brainstorming:* Generate ideas in batches, evaluating against agreed criteria

**Stage instructions template:**
```markdown
### Stage [N]: Processing

**Goal:** [Process/analyze/review] each item using the agreed [framework/rubric/schema].

Work in batches of 3-5 items. For each batch:
1. [Read/process each item]
2. [Apply the agreed framework]
3. [Save each result to disk]
4. Present a summary

**After each batch, CHECKPOINT:**
- [Summary: 1-line insight per item]
- [Agent's assessment of direction and quality]
- [Options: continue, adjust approach, redo specific items]

If the user says something feels off, STOP and adjust. Common adjustments:
- "Too [shallow/detailed]" → [adjust depth]
- "Wrong focus" → [shift emphasis]
- "Missing the point" → ask what they expected, recalibrate

**Resuming after interruption:** Check [output directory] for completed items. Resume from the first missing one.
```

---

## Archetype 5: Synthesis

**Goal:** Find patterns, connections, and insights across all processed items.

**What the agent does:**
- Reads all individual outputs from the processing stage
- Identifies cross-cutting themes, contradictions, and gaps
- Produces a synthesis document

**Checkpoint presents:**
- Key findings (strongest signals, biggest surprises, blind spots)
- Options: accept as-is, adjust focus, dig deeper on specific themes

**When to use:** When the skill processes multiple items and the whole is greater than the sum of parts. Not needed for single-item workflows.

**Cross-domain examples:**
- *Research:* Cross-talk analysis across all analyzed items
- *Code review:* Systemic patterns across all reviewed files
- *Writing:* Narrative coherence check across all sections
- *Teaching:* Learning progress assessment across all modules
- *Planning:* Dependency and risk analysis across all phases
- *Brainstorming:* Theme clustering and opportunity mapping across all ideas

**Stage instructions template:**
```markdown
### Stage [N]: Synthesis

**Goal:** Find patterns and insights across all [processed items].

Read all outputs from the [processing stage]. Then produce a synthesis:

- [Consensus/common patterns]
- [Contradictions/debates]
- [Gaps/blind spots]
- [Agent's strategic assessment]

Save synthesis to [output location].

**CHECKPOINT — Present synthesis findings:**
- [Key findings: strongest signals, biggest surprises]
- [What's missing or unclear]
- [Options: accept, adjust focus, dig deeper]
```

---

## Archetype 6: Application

**Goal:** Help the human DO something with the work produced so far.

**What the agent does:**
- Asks the human what they want to do with the accumulated output
- Executes whatever they ask — this stage has no fixed schema

**Checkpoint presents:**
- Menu of possible next actions
- Or directly executes the human's request

**When to use:** As the final stage, when the skill's output is meant to be acted upon. Not every skill needs this — some end after synthesis.

**Cross-domain examples:**
- *Research:* Evaluate an idea against findings, build an opportunity map, create a report
- *Code review:* Generate a priority-sorted fix list, create a tech debt roadmap
- *Writing:* Final edit pass, generate a summary version, format for publication
- *Teaching:* Assessment, next steps recommendation, learning path extension
- *Planning:* Risk mitigation plan, resource allocation, timeline visualization
- *Brainstorming:* Filter and rank ideas, create an action plan, combine ideas into proposals

**Stage instructions template:**
```markdown
### Stage [N]: Application

**Goal:** Help the user act on what's been produced.

Ask the user:
- What do you want to DO with this?
- [Domain-specific options: evaluate an idea, build a report, create a plan, etc.]

Then execute whatever they ask. This stage is open-ended — the human drives.

Or if they're satisfied, the workflow is done — all artifacts are saved.
```

---

## Composing Stages

A complete interactive skill typically composes 3-6 stages from these archetypes. Common compositions:

**Minimal (3 stages):** Discovery → Framework Agreement → Processing
- Good for: focused tasks where the human directs and the agent executes
- Examples: writing a single document, reviewing a small set of items

**Standard (4-5 stages):** Discovery → Ingest → Framework Agreement → Processing → Synthesis
- Good for: multi-item workflows where the human shapes the approach and reviews results
- Examples: analyzing a batch of content, reviewing a codebase

**Full (5-6 stages):** Discovery → Ingest → Framework Agreement → Processing → Synthesis → Application
- Good for: complex workflows where the output feeds into a decision or action
- Examples: research projects, comprehensive reviews, curriculum design

**Some skills skip Discovery/Ingest** if the human provides pre-processed input directly.

**Some skills skip Synthesis** if items are independent and don't benefit from cross-analysis.

**Some skills skip Framework Agreement** if the approach is simple and doesn't need negotiation.

The composition depends entirely on what the skill does and how the human and agent collaborate.
