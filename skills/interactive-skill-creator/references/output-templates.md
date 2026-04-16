# Output Templates

Output templates define how the skill's artifacts are organized on disk. Not every skill needs explicit output templates — some produce only conversational output. But when a skill saves files, templates ensure consistency, support resumability, and make the output usable outside the session.

---

## When You Need Output Templates

Output templates are needed when:
- The skill saves intermediate results (for resumability or progressive refinement)
- The skill produces a final artifact the human will use outside the session
- The output has enough structure that consistency matters

Output templates are overkill when:
- The skill only produces conversational output (no files)
- The output is a single file with no internal structure
- The human will use the output immediately and not return to it

---

## Folder Structure Patterns

### Pattern 1: Flat with naming convention

All files in one directory, with a consistent naming scheme.

```
output/
├── item-001-analysis.md
├── item-002-analysis.md
├── item-003-analysis.md
└── synthesis.md
```

**When to use:** Simple skills with 1-2 output types and fewer than ~30 items.

### Pattern 2: Stage-based directories

Separate directories for each stage's output.

```
workspace/
├── 01-transcripts/
│   ├── video-001.txt
│   └── video-002.txt
├── 02-analyses/
│   ├── video-001.md
│   └── video-002.md
└── 03-synthesis/
    └── final-report.md
```

**When to use:** Multi-stage skills where each stage produces a different type of output.

### Pattern 3: Entity-based directories

A directory per item, containing all outputs for that item.

```
workspace/
├── video-001/
│   ├── transcript.txt
│   ├── analysis.md
│   └── notes.md
├── video-002/
│   ├── transcript.txt
│   └── analysis.md
└── synthesis/
    └── final-report.md
```

**When to use:** Skills where items have multiple output files and the human might want to browse per-item.

### Pattern 4: Timestamped runs

Each run creates a new timestamped directory.

```
workspace/
├── 2024-01-15T103000/
│   ├── analyses/
│   └── synthesis.md
└── 2024-01-16T143000/
    ├── analyses/
    └── synthesis.md
```

**When to use:** Skills that might be run multiple times with different parameters, where the human wants to compare runs.

---

## File Naming Conventions

Consistent naming supports resumability and prevents confusion.

### Good naming conventions

- `item-NNN-type.ext` — zero-padded numbers, descriptive type
- `YYYY-MM-DD-description.ext` — date-prefixed for chronological sorting
- `slug-of-item-title.ext` — human-readable, derived from item name

### Bad naming conventions

- `output.md`, `output2.md`, `output_final.md` — no relationship to content
- `analysis_v3_FINAL_real.md` — version soup, no clear latest
- Random UUIDs — technically unique, completely opaque to humans

---

## Output File Templates

Each output file type should have a consistent internal structure. Define this in the skill's supporting materials so the agent follows it.

### Analysis output template

```markdown
# [Item Title]

**Source:** [URL or reference]
**Date:** [When the item was published/created]
**Processed:** [When the agent analyzed it]

## Summary
[1-2 paragraph summary]

## [Schema Dimension 1]
[Analysis for this dimension]

## [Schema Dimension 2]
[Analysis for this dimension]

---

*Generated with [schema version] schema, [depth] depth*
```

### Review output template

```markdown
# [File/Item Name]

**Overall assessment:** [1-2 sentences]

## Issues

### [Issue 1 Title]
- **Severity:** [Critical/High/Medium/Low]
- **Category:** [Security/Performance/Readability/Architecture]
- **Description:** [What the issue is]
- **Recommendation:** [How to fix it]

---

*Reviewed with [rubric version] rubric*
```

### Synthesis output template

```markdown
# Synthesis: [Topic]

**Items analyzed:** [N]
**Date range:** [When the items span]
**Schema:** [Which framework was used]

## Strongest Signals
[Top 3-5 findings across all items]

## Contradictions
[Where items disagree and what that means]

## Gaps
[What's missing from the corpus as a whole]

## Agent's Strategic Assessment
[The agent's overall read on the topic]

---

*Synthesized from [N] items processed between [dates]*
```

---

## Including Templates in a Skill

Output templates go in one of two places:

### Option 1: In the SKILL.md (for simple templates)

If the templates are short (under 20 lines each), include them directly in the relevant stage's instructions. This keeps everything in one file and the agent always has the template in context.

### Option 2: In a references file (for complex templates)

If templates are detailed or there are many of them, create a `references/output-templates.md` file. The SKILL.md references this file: "See `references/output-templates.md` for file naming and structure conventions."

The SKILL.md should always include the folder structure regardless — the agent needs to know WHERE to save files without reading a separate document.

---

## Output Template Anti-Patterns

### No output structure

The agent saves files wherever it wants with whatever names it chooses. This breaks resumability (the next session can't find the files) and makes the output unusable outside the session.

### Over-specified templates

Every output file must have exactly these 17 sections in exactly this order. The agent spends more time formatting than thinking. Templates should be structural guides, not rigid forms.

### Templates without examples

The template says "include a summary" but doesn't show what a good summary looks like. Include a brief example for each major section so the agent understands the expected depth and style.

### Ignored templates

The SKILL.md references templates but the agent doesn't follow them during execution. If the agent consistently ignores templates, the templates may be too complex or the SKILL.md instructions may not emphasize them enough.

### Templates that don't support resumability

Each file uses a different naming pattern or structure, making it impossible for a resumed session to determine what's complete. Consistency isn't just aesthetic — it's functional.
