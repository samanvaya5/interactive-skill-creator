# AGENTS.md — Interactive Skill Creator

Guidance for agentic coding agents operating in this repository.

## Project Overview

**Interactive Skill Creator** — A meta-skill for creating interactive skills. Interactive skills are agent skills where the agent and human collaborate through structured checkpoints, rather than the agent running a one-shot pipeline.

This skill teaches agents how to design and build interactive skills using 7 universal patterns: Checkpoint, Negotiation, Batching, Branching, Progressive Refinement, Resumability, and Role.

## Build & Run Commands

This project has no build step. It's a pure skill — a collection of markdown files, Python scripts, and HTML templates.

```bash
# Install the skill
npx skills add samanvaya5/interactive-skill-creator

# Or install locally
./install.sh

# Validate a skill
python -m scripts.quick_validate <path/to/skill>

# Package a skill
python -m scripts.package_skill <path/to/skill>

# Aggregate benchmark results
python -m scripts.aggregate_benchmark <workspace>/iteration-N --skill-name <name>

# Launch eval viewer
python eval-viewer/generate_review.py <workspace> --skill-name <name>
```

There is no test framework, no linter, and no formatter configured.

## Project Structure

```
skills/interactive-skill-creator/
├── SKILL.md                    # The meta-skill — 7-stage interactive workflow
├── references/                 # Pattern library and design references
│   ├── interactive-patterns.md # The 7 universal patterns
│   ├── checkpoint-design.md    # How to design effective checkpoints
│   ├── stage-templates.md      # Reusable stage archetypes
│   ├── subtext-annotated.md    # Pattern mapping example (Subtext)
│   ├── schema-negotiation.md   # Designing framework negotiation stages
│   ├── branching-logic.md      # Branching design at checkpoints
│   ├── resumability-patterns.md# State management for session resumption
│   ├── role-design.md          # Designing agent roles
│   └── output-templates.md     # File organization and naming conventions
├── agents/                     # Subagent instructions
│   ├── grader.md               # How to grade interactive skill evals
│   └── interactive-eval.md     # Evaluate interactive quality dimensions
├── scripts/                    # Standalone Python scripts (copied from skill-creator)
│   ├── package_skill.py        # Package skill into .skill file
│   ├── quick_validate.py       # Validate skill structure
│   ├── aggregate_benchmark.py  # Aggregate eval results into benchmark
│   ├── run_eval.py             # Run trigger eval for descriptions
│   ├── run_loop.py             # Eval + improve loop
│   ├── improve_description.py  # Optimize skill descriptions
│   ├── generate_report.py      # Generate HTML reports
│   └── utils.py                # Shared utilities
├── eval-viewer/                # Eval result viewer (copied from skill-creator)
│   ├── generate_review.py      # Generate and serve review HTML
│   └── viewer.html             # Viewer template
└── assets/                     # Static assets
```

## Code Style Guidelines

### Python Scripts

- Standard library only (no external dependencies)
- Use `pathlib.Path` for file operations
- Type hints on function signatures
- argparse for CLI interfaces

### Markdown Files

- Use imperative form in instructions ("Present findings", not "Findings are presented")
- Include cross-domain examples, not domain-specific ones
- Keep files focused — one concept per file
- Reference other files with relative paths

## Key Design Principles

1. **Domain-agnostic.** The interactive patterns must work for ANY domain — writing, code, research, teaching, design, planning, brainstorming, etc. Never anchor on a specific domain.

2. **Subtext is an example, not a template.** The annotated Subtext reference shows patterns in action but must not steer new skills toward Subtext's specific structure.

3. **Standalone.** This skill has no dependency on the skill-creator. All scripts and eval infrastructure are duplicated within this skill's directory.

4. **The 7 patterns are universal.** They were extracted from Subtext but apply to any interactive skill. New patterns should only be added if they're truly domain-agnostic.

## Dependencies

- Python 3.8+ (for scripts)
- No npm, no node, no external packages
