---
name: interactive-skill-creator
description: "Create interactive skills — skills where agent and human collaborate through structured checkpoints rather than one-shot pipelines. Use this skill whenever the user wants to create any kind of interactive, collaborative, or multi-stage skill — not just analysis skills. This includes writing coaches, code reviewers, research assistants, teaching tools, brainstorming partners, design collaborators, project planners, or anything where the human directs or reviews at intermediate steps. Make sure to use this skill whenever the user mentions checkpoints, human-in-the-loop, back-and-forth workflows, staged workflows, collaborative skills, multi-turn skills, or describes wanting the agent to propose/produce work and then pause for their review — even if they don't use the word 'interactive'."
---

# Interactive Skill Creator

A skill for creating interactive skills — skills where the agent and human collaborate through structured checkpoints, not skills where the agent runs a one-shot pipeline.

At a high level, the process goes like this:

- Understand what kind of collaboration the user wants (domain, roles, back-and-forth)
- Select which of the 7 universal interactive patterns apply to this skill
- Design the stage architecture — how many stages, what happens in each, where checkpoints go
- Write any supporting materials the skill needs (schemas, templates, reference docs)
- Compose the actual SKILL.md
- Test it — both automated checks and an interactive walkthrough with the user
- Package and install

Your job is to figure out where the user is in this process and jump in. They might come in knowing exactly what they want. They might have a vague idea. They might already have a draft and want to iterate. Meet them where they are.

The fundamental difference between static and interactive skills: static skills produce artifacts, interactive skills produce experiences. You're designing those experiences.

## Communicating with the user

People building interactive skills range from experienced developers to domain experts who've never written a skill before. A writing coach building a skill for their workflow, a teacher capturing their tutoring approach, a manager wanting a planning collaborator — they know their domain but may not know skill terminology.

Pay attention to context cues. Terms like "checkpoint," "schema," and "pattern" are fine if the user seems technical, but if they say "I want the AI to show me what it's thinking and let me steer it," translate: "That's a checkpoint — the agent stops, shows its work, and waits for your input before continuing."

## Flexibility

The 7 stages below describe the full workflow, but you don't always need all of them. If the user comes in with a clear vision, skip the exploration and go straight to drafting. If they say "I just want to vibe on this," do that. If they already have a SKILL.md, jump to evaluation. The stages are a menu, not a mandatory sequence.

---

## Stage 1: Understand the Collaboration

**Goal:** Understand what kind of interactive skill the user wants to build.

Ask about the domain, the human's role, the agent's role, how back-and-forth works, and what "done" looks like. Ask conversationally — not as a questionnaire. If the user already described their vision, extract what you can from the conversation and ask only what's unclear.

One question that's especially valuable: **is there an existing workflow** the user already follows manually? Understanding their current process is usually more productive than designing from scratch.

**Checkpoint:** Present the collaboration model as you understand it — domain, human's role, agent's role, back-and-forth pattern, and outcome. Ask the user to confirm or correct before moving on. Every checkpoint in this skill exists for the same reason checkpoints exist in the skills you're building: the user's reaction is the quality signal that prevents you from going in the wrong direction.

---

## Stage 2: Select Patterns

**Goal:** Pick which of the 7 universal interactive patterns this skill needs.

Read `references/interactive-patterns.md` for full descriptions of each pattern.

The 7 patterns:

1. **Checkpoint** (mandatory) — Agent stops, presents work, waits for human
2. **Role** (mandatory) — Agent takes on a specific collaborative posture
3. **Negotiation** — Agent proposes a framework, human modifies, agent confirms
4. **Batching** — Agent works in chunks (3-5 items) with check-ins between
5. **Branching** — Human's response at a checkpoint changes what happens next
6. **Progressive Refinement** — Agent learns from feedback, improves across iterations
7. **Resumability** — State saved to disk, new session picks up where old one left off

Two are mandatory for every interactive skill (Checkpoint and Role). The rest depend on the workflow. When recommending which to include, consider: multiple items to process → Batching. Human shapes the approach upfront → Negotiation. Multiple possible responses at checkpoints → Branching. Feedback on early work should inform later work → Progressive Refinement. Sessions may get interrupted → Resumability.

**Checkpoint:** Present your recommended patterns with brief reasoning. The user can accept, modify, or discuss.

---

## Stage 3: Design Stage Architecture

**Goal:** Break the workflow into stages with checkpoints.

Read `references/stage-templates.md` for reusable stage archetypes: Discovery, Ingest, Framework Agreement, Processing, Synthesis, Application. Mix and match based on what the skill needs.

For each stage, specify:
- **Goal** — what this stage accomplishes
- **Agent produces** — be specific ("a structured analysis with sections X, Y, Z" not just "analyzes")
- **Checkpoint presents** — summary, options, agent's own assessment
- **Branching** — common human responses and what the agent does for each
- **Batch size** — if Batching applies, how many items per batch

**Checkpoint:** Present the full stage breakdown. Total stages, estimated checkpoints, which patterns appear where. The user can approve, add, remove, reorder, or modify any stage.

---

## Stage 4: Write Supporting Materials

**Goal:** Create any schemas, templates, reference docs, or scripts the skill needs.

Not every interactive skill needs these. Some are self-contained in SKILL.md. Common types:

- **Schemas** — structured frameworks (analysis schemas, review rubrics, style guides, curricula)
- **Output templates** — file naming, folder structure, format examples
- **Reference docs** — domain-specific knowledge the agent consults
- **Scripts** — deterministic tools (setup scripts, validation scripts)

If using Negotiation, include a default framework the agent proposes and the human modifies. If using Resumability, include folder structure and naming conventions. If the skill doesn't need supporting materials, skip this stage and say so.

**Checkpoint:** Show the materials. The user can approve, modify, add, or remove.

---

## Stage 5: Compose the SKILL.md

**Goal:** Write the complete interactive skill's SKILL.md.

Using the confirmed stage architecture, patterns, and supporting materials, compose the SKILL.md.

### Structure to follow

The SKILL.md should have:
- **Frontmatter** — name and description (the description is the primary triggering mechanism — include both what the skill does AND specific trigger contexts, and be a bit pushy about when to use it)
- **Role definition** — who the agent is in this collaboration, right at the top (2-3 sentences). This sets the tone for everything that follows.
- **Prerequisites** — if any (environment setup, dependencies)
- **The workflow** — stage-by-stage instructions with checkpoint markers
- **Critical rules** — domain-specific rules and constraints
- **Resuming** — if using Resumability, how to check state and resume
- **File organization** — if applicable, folder structure and naming

### Writing guidelines

**Explain the why.** This matters more than anything else. Instead of "Never skip a checkpoint," write "Every stage has a checkpoint because the human's reactions are the primary quality mechanism — they catch misalignment early." The agent follows instructions better when it understands the reasoning behind them. This is especially important for interactive skills, where the agent needs to make judgment calls about how to present work and when to adapt.

**Be specific about checkpoints.** Each checkpoint should show exactly what the agent presents and what options the human has. Read `references/checkpoint-design.md` for the checkpoint template.

**Be specific about branching.** If using Branching, list the common human responses and what the agent does for each. "Adapt to the user's response" is not specific enough. "'Too detailed' means reduce scope, 'wrong focus' means ask for clarification" is.

**Keep it under 500 lines.** If the draft approaches this limit, move detailed schemas and templates into `references/` files. Progressive disclosure: the SKILL.md body has the workflow and rules, references have the details.

**Read `references/subtext-annotated.md`** for one example of how a complete interactive SKILL.md is structured. Notice how patterns compose, but don't anchor on the specific domain or stage names. A writing coach, a code reviewer, and a research analyst all use the same patterns but compose them differently.

**Checkpoint:** Present the complete SKILL.md. Ask the user to specifically review: the role, the checkpoints, the branching logic, the rules, and anything that feels missing.

---

## Stage 6: Evaluate

**Goal:** Test the skill before finalizing.

Evaluation has two layers — automated checks and an interactive walkthrough.

### Layer 1: Static eval

Test the parts that can be tested without a real human:

1. Create 2-3 test prompts — realistic things a user would actually say
2. For each test, spawn two subagents in the same turn (with-skill and without-skill baseline):
   - With-skill: load the draft skill, execute the test prompt, provide canned responses at checkpoints (approve, redirect, modify)
   - Without-skill: same prompt, no skill — this is the baseline
3. Save outputs to a workspace:
   ```
   <skill-name>-workspace/iteration-1/
   ├── eval-0-descriptive-name/
   │   ├── eval_metadata.json
   │   ├── with_skill/outputs/
   │   └── without_skill/outputs/
   └── eval-1-descriptive-name/
       └── ...
   ```
4. Capture timing data from each subagent completion to `timing.json` (you get `total_tokens` and `duration_ms` in the task notification — save immediately, it's not available later)
5. Grade each run using `agents/grader.md` — check checkpoint compliance, presentation quality, adaptation behavior, batch sizes, state persistence, role consistency
6. Aggregate: `python -m scripts.aggregate_benchmark <workspace>/iteration-1 --skill-name <name>`
7. Launch viewer: `python eval-viewer/generate_review.py <workspace>/iteration-1 --skill-name <name>`

While runs are in progress, draft assertions for the test cases — objectively verifiable statements about what good interactive behavior looks like.

### Layer 2: Interactive walkthrough

The interactive walkthrough cannot be automated. You simulate being the draft skill:

1. Tell the user: "I'm going to walk through this as if I were the agent using your skill. Respond naturally at each checkpoint — this is your chance to feel if the workflow is right."
2. Follow the draft SKILL.md's instructions through each stage
3. At each checkpoint, present work exactly as the skill instructs
4. Let the user respond naturally and note friction: checkpoints that feel unnecessary, options that feel limiting, branches that feel wrong

**Checkpoint:** Present evaluation results — static eval findings and interactive walkthrough observations. The user can fix issues and re-evaluate, accept as-is, or fix specific items.

---

## Stage 7: Package

**Goal:** Finalize and install the skill.

1. Apply any final changes
2. Validate: `python -m scripts.quick_validate <skill-path>`
3. Package: `python -m scripts.package_skill <skill-path>`
4. Install to `~/.agents/skills/<skill-name>/`

If the user wants to optimize the description for better triggering (recommended but optional):
1. Generate 20 trigger eval queries (mix of should-trigger and should-not-trigger)
2. Review with user using the eval review HTML template in `assets/`
3. Run optimization: `python -m scripts.run_loop --eval-set <path> --skill-path <path> --max-iterations 5`
4. Apply the optimized description

**Checkpoint:** Confirm the skill is packaged and installed. Suggest the user test it with a real task and come back if they want to iterate.

---

## Critical Rules

1. **This skill is domain-agnostic.** The user might be building a writing coach, a code reviewer, a research tool, a teaching assistant, or something entirely new. The patterns are universal; the content is domain-specific. Never anchor on a specific domain when giving advice.

2. **Subtext is ONE example, not a template.** `references/subtext-annotated.md` shows how patterns compose in one specific skill. It's useful for understanding patterns in action. It is NOT a blueprint — the next skill you build should not look like Subtext unless the domain naturally calls for it.

3. **The user is the domain expert.** You understand interactive patterns. The user understands their domain. Don't make domain-specific decisions without them.

4. **Explain every design choice.** When you propose a stage, a checkpoint, or a branching rule, explain why. What pattern does it use? What would be lost without it? The user should understand their own skill well enough to modify it later.

5. **Keep the output SKILL.md under 500 lines.** If the draft exceeds this, suggest moving detailed schemas and templates to `references/` files. The 500-line limit exists because the SKILL.md body loads into context every time the skill triggers — keeping it lean means faster, more reliable triggering.

6. **Role and Checkpoint are always mandatory.** Every interactive skill needs the agent to know who it is (Role) and to stop for human input (Checkpoint). The other 5 patterns are optional.

7. **Be flexible on order.** The user might come in with a complete draft, wanting only evaluation. They might want to discuss patterns without committing to a build. Meet them wherever they are in the process.
