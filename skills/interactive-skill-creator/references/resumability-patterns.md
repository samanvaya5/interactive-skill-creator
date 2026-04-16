# Resumability Patterns

Resumability means a new session can pick up where the old one left off. Interactive sessions are long — they get interrupted by context limits, laptop closures, or the human needing to step away. This reference covers how to design resumability into interactive skills.

---

## When You Need Resumability

Resumability is needed when:
- The workflow processes more than ~10 items
- The workflow takes more than ~15 minutes
- The workflow saves intermediate results to disk
- Context window exhaustion is likely

Resumability is overkill when:
- The task completes in a single short session
- No intermediate files are saved
- The human provides all input upfront and waits for output

---

## State Storage Strategies

### Strategy 1: File existence

The simplest approach. If a file exists, that item is done. If it doesn't, it needs processing.

```
output/
├── item-001.md    ← exists = done
├── item-002.md    ← exists = done
├── item-003.md    ← missing = needs processing
└── item-004.md    ← missing = needs processing
```

**When resuming:** "I see items 1-2 are complete. Resuming from item 3."

**Pros:** No state file to maintain, works with any file system, naturally robust.
**Cons:** Can't track partial progress within an item. Can't store metadata (when it was processed, what parameters were used).

### Strategy 2: Manifest file

A JSON or YAML file that tracks what's been completed, with metadata.

```json
{
  "last_completed_stage": 4,
  "last_completed_item": "item-002",
  "schema_version": "v3",
  "parameters": {
    "depth": "deep",
    "focus": ["security", "performance"]
  },
  "completed": ["item-001", "item-002"],
  "skipped": ["item-000-duplicate"]
}
```

**When resuming:** "I see the manifest shows Stage 4, item 2 complete with deep analysis focusing on security and performance. Resuming from item 3."

**Pros:** Rich state tracking, supports parameter changes, tracks skips and failures.
**Cons:** Manifest can get out of sync with actual files (corrupted state). More complex to maintain.

### Strategy 3: Directory structure

Use the directory structure itself as state. Different directories represent different stages.

```
workspace/
├── 01-raw/           ← Stage 1 output
├── 02-processed/     ← Stage 2 output
├── 03-analyses/      ← Stage 3 output
└── 04-synthesis/     ← Stage 4 output
```

**When resuming:** "I see directories 01-03 are populated but 04 is empty. It looks like processing completed but synthesis hasn't started. Resuming at synthesis."

**Pros:** Easy to understand visually. Naturally ordered.
**Cons:** Less flexible for non-linear workflows. Can't track partial stage completion.

### Strategy 4: Hybrid (recommended)

Combine file existence for items within a stage with a lightweight manifest for stage-level state.

```
workspace/
├── state.json              ← stage-level state
├── transcripts/            ← Stage 2 output
│   ├── video-001.txt
│   └── video-002.txt
├── analyses/               ← Stage 4 output
│   ├── video-001.md
│   └── video-002.md
└── synthesis/              ← Stage 5 output
```

`state.json`:
```json
{
  "current_stage": 4,
  "agreed_schema": { "..." : "..." },
  "total_items": 12,
  "completed_stages": [1, 2, 3]
}
```

**When resuming:** Read `state.json` for stage-level context, then check individual directories for item-level progress.

**Pros:** Best of both worlds. Stage state is explicit. Item state is file-based and robust.
**Cons:** Slightly more setup needed.

---

## Resume Instructions in SKILL.md

Every skill using Resumability needs a "Resuming" section in its SKILL.md. This section tells the agent what to do when it starts a new session and finds existing work.

A good resume section:

1. **Tells the agent to check for existing work first.** "Before starting, check [workspace directory] for existing output."
2. **Specifies what to look for.** "If files exist in [directory], read [manifest] for context."
3. **Defines the resume behavior.** "Resume from the first missing file in [directory]."
4. **Confirms with the human.** "When resuming, always tell the human where you're picking up and confirm they want to continue."
5. **Handles stale state.** "If the manifest is corrupted or files are missing that the manifest says exist, start fresh from the beginning of that stage."

Example:

```markdown
## Resuming

This skill supports resuming. If a session is interrupted:

1. Check `workspace/` for existing output
2. Read `workspace/state.json` if it exists
3. Check each stage's output directory for completed work
4. Resume from the first gap — the first missing file in the expected sequence
5. Tell the human: "I found [X] items completed from a previous session. Resuming from [item Y]."
6. If state.json is missing or corrupted, infer state from files and ask the human to confirm
```

---

## Handling Edge Cases

### Partial writes

An item was being processed when the session died. The file exists but is incomplete. Solution: check file completeness before counting it as done. A file with less than 100 characters, or one that doesn't match the expected structure, is likely a partial write.

### Parameter changes between sessions

The human wants to use different parameters in the resumed session. Solution: new parameters apply to new work only. Already-completed items keep their original parameters. If the human wants to re-do items with new parameters, that's an explicit request, not automatic.

### Schema changes between sessions

The agreed schema changed between sessions (the human updated it manually). Solution: the manifest stores the schema. On resume, check if the schema in the manifest matches current expectations. If not, ask the human whether to re-process or continue with the original schema.

### Corrupted state

The manifest file is empty or malformed. Solution: fall back to file-existence checking. Don't crash — degrade gracefully. Ask the human to confirm what's done.

### Multiple incomplete sessions

Two sessions were started, each did partial work, and the output is interleaved. Solution: use timestamps. The most recent file for each item is the canonical one. If timestamps conflict, ask the human.

---

## Resumability Anti-Patterns

### No resume instructions

The skill saves files to disk but the SKILL.md has no "Resuming" section. A new session has no idea what to do with existing files. It either starts from scratch (wasting work) or ignores the files (losing context).

### Over-verbose state tracking

A 500-line manifest tracking every token spent, every intermediate thought, every tool call. The manifest becomes a burden to maintain and read. Track what you need: stage, items completed, agreed schema, current parameters.

### Assumed continuity

"I'll continue from where I left off." The agent assumes it knows the state without checking. Always verify by reading the filesystem or manifest.

### The restart-everything resume

On finding any existing work, the agent starts over from scratch "to be safe." This wastes work. Resume means resume — pick up from the gap, don't redo what's done.

### Silent resume

The agent detects existing work and resumes without telling the human. The human doesn't know they're in a resumed session. Always announce: "I found previous work. Resuming from [point]."
