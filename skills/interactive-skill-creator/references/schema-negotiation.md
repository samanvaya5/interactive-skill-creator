# Schema Negotiation

Schema negotiation is where the agent and human agree on HOW the agent will work before it starts producing. This reference covers how to design effective negotiation stages — the place where the Negotiation pattern lives.

---

## What a Schema Is

A "schema" is any structured framework the agent follows during processing. It's not just a data schema — it's a contract between agent and human about what the output will look like, what dimensions matter, and what trade-offs to make.

Examples across domains:

- *Research:* An analysis framework with sections like "positioning," "hidden signals," "omissions"
- *Code review:* A rubric with categories like "security," "performance," "readability" and severity thresholds
- *Writing:* A style guide with tone, structure, length, and audience parameters
- *Teaching:* A curriculum outline with module order, depth per module, and assessment style
- *Planning:* A plan structure with goals, milestones, risks, dependencies
- *Brainstorming:* Evaluation criteria for ideas — novelty, feasibility, impact, alignment

The schema is the single most important thing the agent and human agree on. A bad schema produces bad output regardless of how good the agent is.

---

## The Negotiation Dance

Negotiation follows a consistent pattern, regardless of domain:

### Step 1: Propose a default

The agent doesn't start from a blank page. It proposes a sensible default based on what it learned about the user's goals. This gives the human something concrete to react to — much easier than inventing from scratch.

```
Based on what you've described, I'd suggest analyzing each item using this framework:

1. **Core Claim** — What is the speaker primarily arguing?
2. **Evidence Quality** — How well supported is the claim?
3. **Hidden Assumptions** — What's taken for granted without justification?
4. **Omissions** — What perspectives or data are conspicuously absent?

This is my default recommendation. Change anything you want.
```

### Step 2: Offer alternatives

Not every user wants the default. Present 2-3 alternatives that represent different approaches — different depths, different priorities, different lenses.

```
Other approaches you might prefer:

**Quick Scan:** Core claim + signal strength per item (2-3x faster, less depth)
**Deep Audit:** The default framework + source verification + bias analysis (2x slower, much more thorough)
```

### Step 3: Incorporate modifications

The human modifies the proposal. The agent doesn't just accept — it incorporates and re-presents for confirmation. This prevents miscommunication.

```
Got it. Here's the updated framework:

1. **Core Claim** — What is the speaker primarily arguing?
2. **Evidence Quality** — How well supported is the claim?
3. **Hidden Assumptions** — What's taken for granted without justification?
4. **Omissions** — What perspectives or data are conspicuously absent?
5. **Competitive Dynamics** — Who benefits if this argument is accepted? ← added

Changes from default: Added "Competitive Dynamics" per your request.

Confirm this looks right and I'll proceed.
```

### Step 4: Get explicit confirmation

Before moving to processing, the agent shows the FINAL agreed schema and gets an explicit "yes." This is the lock-in point. After this, the schema guides all processing.

---

## Designing Good Defaults

A good default schema:

- **Matches the user's stated goals.** If they said "I want to understand the competitive landscape," the default should include competitive dynamics — not just generic analysis.
- **Is opinionated but not rigid.** It represents the agent's best guess at what will be useful, with a clear invitation to modify.
- **Has 3-7 dimensions.** Fewer than 3 is too shallow. More than 7 overwhelms both the agent and the human reviewing the output.
- **Prioritizes over including everything.** A good schema makes trade-offs explicit — "I'm deprioritizing X to go deeper on Y."

A bad default schema:

- **Is generic.** "Analyze the content" with no structure. This forces the human to design the schema themselves.
- **Is exhaustive.** 15 dimensions that cover everything but prioritize nothing. The agent produces shallow checkbox-filling instead of deep insight.
- **Ignores the user's context.** A technical extraction schema when the user wants strategic analysis.

---

## Handling Modification Requests

| Human says | What to do |
|---|---|
| "Add [dimension]" | Add it, show updated schema, confirm |
| "Remove [dimension]" | Remove it, explain what's lost, confirm they're OK with that |
| "Replace X with Y" | Make the swap, show updated schema, confirm |
| "Go deeper on [dimension]" | Expand that section of the schema with sub-dimensions |
| "Simplify" | Propose a stripped-down version with fewer dimensions |
| "Make it more [adjective]" | Interpret: what does that mean in schema terms? Propose, confirm |
| "Something custom" | Ask 2-3 clarifying questions, propose a custom schema, confirm |
| "I don't know, what do you think?" | Recommend the default with brief reasoning, ask for confirmation |

---

## When to Skip Negotiation

Not every skill needs a negotiation stage. Skip it when:

- The approach is simple and obvious ("summarize this document")
- The schema is fixed by external constraints (compliance review with a mandated checklist)
- The user explicitly says "just use your judgment"
- The task is small enough that negotiating would take longer than doing

When you skip negotiation, the agent still needs to communicate its approach — just more briefly. "I'll review these files checking for security issues, performance problems, and readability. Sound good?" is a 5-second negotiation, not a full stage.

---

## Living Schemas

A schema agreed at Stage 3 doesn't have to be frozen forever. In skills with Progressive Refinement, the schema can evolve:

- The human can add dimensions mid-workflow ("I keep noticing X — add that as a dimension")
- The agent can propose changes based on patterns it sees ("3 of 5 items so far have [pattern] — should I add a dimension for that?")
- Changes apply forward, not backward — already-completed items are NOT re-done unless the human explicitly asks

This is important: a living schema is not an excuse to skip upfront negotiation. The initial negotiation establishes the baseline. Mid-workflow changes refine it. Both are valuable.

---

## Schema Negotiation Anti-Patterns

### The blank page

"Tell me what framework you'd like." The human now has to do the hardest part — design the schema — with no starting point. Always propose a default.

### The fixed menu

"Choose one of: A, B, or C." The human can't combine or customize. Offer a default AND alternatives AND the option to customize.

### The endless loop

The human modifies, the agent re-proposes, the human modifies again... four rounds later they're still negotiating. Set a soft limit: after 2 rounds, suggest settling and refining during processing instead.

### The pretend negotiation

The agent presents a schema, the human modifies it, and the agent ignores the modifications during processing. The negotiation was theater. If the human modified the schema, FOLLOW the modified schema.

### The kitchen sink

"Here are 20 dimensions we could analyze." This overwhelms the human. Curate. Recommend. Prioritize. The schema should reflect what matters most, not everything that's possible.
