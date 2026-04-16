# Subtext: Pattern Annotation

This document maps the 7 universal interactive patterns to Subtext, a YouTube research-to-intelligence skill. Subtext uses all 7 patterns, making it a useful reference for seeing how patterns compose in practice.

**Important:** Subtext is ONE example of how these patterns can compose. It is not a template. A writing coach, code reviewer, tutor, or brainstorming partner would compose these patterns differently. Use this as a reference for understanding patterns in action, not as a blueprint to copy.

---

## What Subtext Does

Subtext turns YouTube talks into strategic intelligence. The user picks videos, the agent analyzes them for hidden signals and strategic subtext, and together they produce research artifacts. The domain is specific (YouTube video analysis), but the interactive patterns are universal.

---

## Pattern Mapping

### Pattern 1: Checkpoint

Subtext has **6 checkpoints**, one at the end of each stage:

| Stage | Checkpoint presents | Human decides |
|-------|--------------------|----|
| Discovery | 14 videos found, with titles/dates/views | Remove some, add more, proceed |
| Ingest | 9 transcripts fetched, 2 failed | Skip failures, proceed with good ones |
| Schema Negotiation | Proposed analysis framework | Modify, accept, choose different type |
| Batched Analysis | 1-line insight per analyzed video | Adjust depth, redo, continue |
| Synthesis | Cross-talk patterns, blind spots | Validate, challenge, accept |
| Application | Menu of possible actions | Choose what to do next |

**Why it works:** Each checkpoint gives the human a manageable chunk to review. The agent summarizes (doesn't dump raw output), includes its own assessment, and offers concrete options.

### Pattern 2: Negotiation

Subtext's Stage 3 is entirely dedicated to negotiation. The agent:

1. Proposes a default analysis schema (structured framework for analyzing each video)
2. Presents a menu of 6 analysis types (Strategic Deep Dive, Technical Extraction, Market Intelligence, etc.)
3. The human can: accept default, modify it, pick a different type, or define custom
4. The agent shows the final agreed schema and gets explicit "yes" before proceeding

**Why it works:** The analysis schema determines what the agent looks for in every video. Getting this right before analysis begins prevents 50 videos of wasted work. The negotiation is high-leverage — a small investment of time upfront that pays off across the entire workflow.

**Key design choice:** Subtext doesn't just propose one option. It shows the default AND a menu of alternatives. This prevents the human from feeling locked into a single choice while keeping the cognitive load manageable.

### Pattern 3: Batching

Subtext's Stage 4 processes transcripts in batches of 3-5:

```
For each batch:
1. Read the transcripts for that batch
2. Analyze each one using the agreed schema
3. Write each analysis to disk
4. Present a summary of what you produced
```

**Why it works:** Analyzing 50 videos at once would blow up the context window and produce shallow work. Batching keeps each analysis deep and gives the human frequent quality checkpoints. If the first batch is too surface-level, the agent adjusts before doing the remaining 47.

**Batch size rationale:** 3-5 is small enough to maintain depth but large enough to be efficient. The exact number depends on the complexity of each item and the context window available.

### Pattern 4: Branching

At each checkpoint, Subtext handles different human responses:

| Human says | Subtext does |
|---|---|
| "Proceed" | Move to next batch/stage |
| "Too surface-level" | Go deeper on hidden signals, read between the lines more |
| "Too negative" | Balance with what's genuinely good/working |
| "Missing the point" | Ask what they expected, recalibrate |
| "Wrong focus" | Shift emphasis to the sections they care about |
| "Add coalition language" (specific modification) | Update the schema, apply going forward |
| "Skip these 2" | Remove from corpus, continue |

**Why it works:** Subtext doesn't treat all responses the same. A quality complaint ("too surface-level") triggers a depth adjustment. A direction change ("wrong focus") triggers a recalibration conversation. A specific modification ("add X") triggers a schema update. Each branch has its own logic.

**Key design choice:** Subtext explicitly tells the agent to handle vague feedback ("something feels off") by probing, not guessing. This prevents the agent from making wrong assumptions about what the human wants.

### Pattern 5: Progressive Refinement

Subtext refines across batches in Stage 4:

- After batch 1, if the human says "too surface-level", all remaining batches go deeper
- If the human says "wrong focus on competitive dynamics", remaining batches shift emphasis
- The schema itself is described as "a living document" — mid-workflow changes are allowed
- The agent doesn't re-do completed analyses unless the human asks

**Why it works:** The human's feedback on batch 1 is more valuable than any upfront specification. They see actual output and can articulate what's wrong with it in a way they couldn't articulate in advance. Progressive refinement captures this.

**Key design choice:** Completed analyses are NOT re-done when the schema changes. This is important — if the human says "add coalition language" after batch 2, batches 3-10 include it but batches 1-2 don't. This prevents infinite loops and respects the human's time.

### Pattern 6: Resumability

Subtext saves everything to disk and checks what exists on resume:

```
research/
├── transcripts/          # Stage 2 output
├── per-talk/             # Stage 4 output  
└── analysis/             # Stage 5-6 output
```

When resuming: "Check `research/per-talk/` for completed analyses. Resume from the first missing file."

**Why it works:** Research sessions get interrupted. Context windows fill up. The human closes their laptop. Without resumability, all work is lost. With it, a new session reads the filesystem, determines what's done, and continues from the gap.

**Key design choice:** File existence IS the state tracker. No separate state file to maintain. If a file exists in `per-talk/`, that item is done. This is simple, robust, and doesn't require any custom infrastructure.

### Pattern 7: Role

Subtext's role definition:

> "You are a strategic research analyst paired with a human curator. The human has an intuitive sense for direction — they know when something 'feels right' or 'feels off' even if they can't articulate exactly why."

The role also shapes tone:

> "The default analysis voice is strategic and direct — it calls out hidden agendas, notes what speakers DON'T say, and reads between the lines. But never fabricate signals that aren't in the text."

**Why it works:** The role does two things. First, it positions the agent as an analyst (not a summarizer, not a fan, not a critic). Second, it positions the human as a curator with intuition. This creates a clear division of labor: the agent does the analytical heavy lifting, the human provides direction and quality signals.

**Key design choice:** The role includes what NOT to do ("never fabricate signals"). This is as important as what to do — it prevents the agent from hallucinating insights that aren't in the source material.

---

## How Patterns Compose in Subtext

The 7 patterns layer together:

1. **Role** defines WHO the agent is (set once, applies everywhere)
2. **Discovery + Ingest** gather material (checkpoints at each stage)
3. **Negotiation** defines HOW the agent will work (one stage, high leverage)
4. **Batching + Checkpoints + Branching** define the core processing loop (repeated across items)
5. **Progressive Refinement** connects batches (each batch benefits from feedback on previous ones)
6. **Resumability** wraps the whole thing (survives interruptions)

The composition is not random — there's a clear information flow:
```
WHO (Role) → WHAT (Discovery/Ingest) → HOW (Negotiation) → DO (Batching+Checkpoint+Branch) → LEARN (Refinement) → SURVIVE (Resumability)
```

This flow — from identity to material to method to execution to learning to resilience — is a useful mental model for composing patterns in any domain.

---

## How a Different Skill Would Compose Differently

A writing coach might compose like this:

1. **Role:** "Supportive editor who pushes for clarity without being harsh"
2. **Discovery:** Read the draft, understand its purpose and audience
3. **Negotiation:** Agree on voice/tone/structure goals
4. **Processing (no batching):** Work through the draft section by section
5. **Progressive Refinement:** Calibrate to the writer's style across sections
6. **No Synthesis:** Single document doesn't need cross-item analysis
7. **No Resumability:** Single session task

A code reviewer might compose like this:

1. **Role:** "Pragmatic senior engineer who values clarity over cleverness"
2. **Discovery:** Identify which files changed and why
3. **No Negotiation:** Review rubric is fixed (security, performance, readability)
4. **Processing + Batching:** Review files in groups of 3-5
5. **Branching:** Human redirects focus based on initial findings
6. **Synthesis:** Identify systemic patterns across the codebase
7. **Resumability:** Check which files already reviewed, continue from next

Neither skill copies Subtext's stage structure, but both use the same pattern vocabulary to design their workflow.

---

## Using This Reference

When building a new interactive skill:

1. Read the pattern descriptions in `interactive-patterns.md`
2. Come here to see all 7 patterns in action within one skill
3. Notice HOW each pattern is implemented, not WHAT the domain is
4. Apply the same pattern logic to your domain with different content
5. Your skill will compose patterns differently — that's expected and correct
