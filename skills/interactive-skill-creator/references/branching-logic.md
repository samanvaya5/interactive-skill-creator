# Branching Logic

Branching is how the agent responds differently to different human inputs at checkpoints. Without branching, every checkpoint is a simple "continue or stop." With it, the agent adapts its behavior based on what the human actually says. This reference covers how to design effective branching.

---

## Why Branching Matters

Interactive skills fail in two ways: the agent runs unchecked (no checkpoints) or it treats every checkpoint the same (no branching). The second failure is subtler — the agent stops and asks "does this look good?" but then does the same thing regardless of the answer.

Branching turns checkpoints from rubber stamps into genuine decision points. The human can redirect, refine, expand, narrow, or redo, and the agent responds appropriately for each.

---

## Branch Types

### Type 1: Direction branches

The human changes WHERE the agent is going.

| Human signal | Agent response |
|---|---|
| "Focus on X instead" | Shift primary focus to X, reduce attention to other dimensions |
| "Wrong direction entirely" | Stop, ask clarifying questions, propose a new approach |
| "This is good but also look at Y" | Add Y to the scope without removing current focus |
| "Skip this part" | Mark as skipped, move to next item/stage |

### Type 2: Depth branches

The human changes HOW DEEP the agent goes.

| Human signal | Agent response |
|---|---|
| "Too surface-level" | Increase depth, add more sub-analysis, longer outputs |
| "Too detailed" | Decrease depth, more concise outputs, focus on top signals only |
| "This specific part needs more" | Go deeper on that part only, keep rest the same |
| "Just the highlights" | Switch to summary mode for remaining items |

### Type 3: Quality branches

The human changes the QUALITY BAR.

| Human signal | Agent response |
|---|---|
| "These are nitpicks" | Raise the severity threshold, only flag significant issues |
| "You missed something important" | Lower the threshold, broaden the search, re-examine |
| "Too many false positives" | Tighten criteria, be more conservative in flagging |
| "Too many false negatives" | Loosen criteria, cast a wider net |

### Type 4: Scope branches

The human changes WHAT'S IN SCOPE.

| Human signal | Agent response |
|---|---|
| "Add more items" | Return to discovery, find additional items |
| "Remove these items" | Remove from the corpus, continue with remaining |
| "Change the scope entirely" | Revisit goals, potentially restart discovery |
| "This is enough, wrap up" | Skip remaining items, go straight to synthesis |

### Type 5: Redo branches

The human wants the agent to try again.

| Human signal | Agent response |
|---|---|
| "Redo this one" | Ask what was wrong, re-process with the correction |
| "Start over" | Reset, begin the current stage again |
| "Try a different approach" | Switch to an alternative method, re-process |

---

## Designing Branch Logic

When designing branches for a skill, follow this process:

### 1. List realistic human responses

For each checkpoint, ask: "What might a reasonable human say here?" Don't just list "proceed" and "stop." Think about the frustration points, the quality concerns, the scope changes.

A good way to discover realistic responses: imagine using the skill yourself. What would YOU say at each checkpoint?

### 2. Map each response to agent behavior

For each realistic response, specify exactly what the agent does. Be concrete:

**Vague:** "Adjust based on feedback"
**Specific:** "If the human says 'too surface-level,' increase analysis depth by adding sub-dimensions to each schema section. If they say 'too detailed,' switch to a 3-bullet summary per item."

The more specific the mapping, the more reliably the agent follows through.

### 3. Handle the unexpected

Not every human response fits a predefined branch. Include a catch-all:

```
If the human says something that doesn't fit the branches above:
1. Don't guess what they mean
2. Briefly confirm your understanding: "It sounds like you want X — is that right?"
3. Once confirmed, adapt accordingly
```

This prevents the agent from making wrong assumptions about vague feedback.

### 4. Don't over-engineer

Not every checkpoint needs 8 branches. A checkpoint where the human just confirms "looks good" or "make a small tweak" only needs 2-3 branches. Reserve complex branching for checkpoints where the human is most likely to redirect — typically after the first batch in processing, and during schema negotiation.

---

## Branching Across Domains

### Writing coach

| At checkpoint | Branches |
|---|---|
| After section draft | "Keep going" → next section. "Wrong tone" → adjust voice. "Cut this" → remove section, suggest alternative. "Expand" → add depth. |
| After style proposal | "Perfect" → lock style. "Too formal" → lighten. "Too casual" → formalize. "I want something different" → propose 3 alternatives. |

### Code reviewer

| At checkpoint | Branches |
|---|---|
| After file batch | "Proceed" → next batch. "These are nitpicks" → raise severity threshold. "Missed something" → lower threshold, re-scan. "Focus on security" → shift to security lens. |
| After severity classification | "Too harsh" → downgrade. "Too lenient" → upgrade. "Wrong category" → reclassify. |

### Research analyst

| At checkpoint | Branches |
|---|---|
| After first analysis batch | "Good depth" → continue. "Go deeper" → add sub-dimensions. "Surface level" → increase depth + recalibrate. "Wrong focus" → ask what focus they expected. |
| After synthesis | "Agree" → proceed to application. "Missing X" → go back and add X to synthesis. "Challenge finding Y" → re-examine the evidence for Y. |

### Tutor

| At checkpoint | Branches |
|---|---|
| After concept explanation | "Got it" → next concept. "Still confused" → break into smaller steps. "Too slow" → speed up, combine concepts. "Already know this" → skip ahead. |
| After practice exercise | "Correct" → increase difficulty. "Wrong" → identify misconception, re-explain. "Partially right" → refine the gap area. |

---

## Branching Anti-Patterns

### The binary branch

Every checkpoint has only "proceed" or "stop." This wastes the checkpoint — if the human can only say yes or no, the checkpoint is a rubber stamp.

### The branch that isn't

The skill defines branches ("if the human says X, do Y") but the agent ignores them and always does the same thing regardless. Branch definitions only matter if the agent actually follows them.

### The branch explosion

15 branches for a single checkpoint. The agent can't distinguish between all of them, and the human's actual responses won't map cleanly to any of them. Keep it to 4-6 branches max per checkpoint, with a catch-all for everything else.

### The mind-reading branch

"If the human seems unsatisfied, adjust accordingly." The agent can't read minds. Use concrete triggers: "if the human says 'too shallow'" not "if the human seems unsatisfied."

### The no-op branch

"If the human says 'change focus,' update the focus and continue." But what does "update the focus" actually mean? Without specifics, the branch is a no-op — the agent acknowledges the request but doesn't actually change behavior. Define the behavioral change, not just the acknowledgment.
