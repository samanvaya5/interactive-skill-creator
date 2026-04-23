**👀 Visiting this README?**

If it clicks with you, please **[star the repo ⭐]**.

It’s the simplest way to show it landed and helps track real interest.

# Interactive Skill Creator

A meta-skill for creating interactive agent skills — skills where the agent and human collaborate through structured checkpoints rather than one-shot pipelines.

## What It Does

This skill helps you build interactive skills. Interactive skills differ from static skills in one fundamental way: quality emerges from the back-and-forth between agent and human, not from a single pass. Writing coaches, code reviewers, research analysts, teaching tools, brainstorming partners — any skill where the human directs or reviews at intermediate steps.

The skill walks through a 7-stage workflow:

1. **Understand the Collaboration** — What kind of interactive skill are you building?
2. **Select Patterns** — Which of the 7 universal interactive patterns apply?
3. **Design Stage Architecture** — How many stages, what happens in each, where checkpoints go
4. **Write Supporting Materials** — Schemas, templates, reference docs
5. **Compose the SKILL.md** — The actual skill file
6. **Evaluate** — Static eval + interactive walkthrough
7. **Package** — Validate, package, and install

## The 7 Universal Interactive Patterns

Every interactive skill is built from some combination of these patterns:

1. **Checkpoint** (mandatory) — Agent stops, presents work, waits for human
2. **Role** (mandatory) — Agent takes on a specific collaborative posture
3. **Negotiation** — Agent proposes a framework, human modifies
4. **Batching** — Agent works in chunks with check-ins between
5. **Branching** — Human's response changes what happens next
6. **Progressive Refinement** — Agent learns from feedback across iterations
7. **Resumability** — State saved to disk, sessions can resume

## Installation

```bash
npx skills add samanvaya5/interactive-skill-creator
```

## What's Included

- `SKILL.md` — The 7-stage meta-skill workflow
- `references/` — 9 reference documents covering each pattern in depth
- `agents/` — Grader and interactive eval subagent instructions
- `scripts/` — Validation, packaging, eval, and description optimization tools
- `eval-viewer/` — HTML eval result viewer
- `assets/` — Eval review templates

## Dependencies

- Python 3.8+ (standard library only, no external packages)
