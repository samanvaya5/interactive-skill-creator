# Role Design

Role is one of two mandatory patterns for every interactive skill. The role defines who the agent IS in the collaboration — its posture, priorities, tone, and boundaries. This reference covers how to design effective roles.

---

## What a Role Does

A role does three things:

1. **Sets the tone.** A writing coach sounds different from a strategic analyst. A tutor sounds different from a code reviewer. The role tells the agent how to communicate.

2. **Establishes priorities.** A "security-focused code reviewer" prioritizes differently from a "readability-focused code reviewer." The role shapes what the agent pays attention to.

3. **Creates boundaries.** A "skeptical analyst" should push back on weak claims. A "supportive brainstorming partner" should build on ideas. The role tells the agent what NOT to do as much as what to do.

Without a role, the agent is a generic assistant. Generic assistants produce generic output. The role is what makes the interaction feel like working with a specialist.

---

## Role Components

A complete role definition has up to four components. Not every skill needs all four, but every skill needs the first two.

### Component 1: Identity (required)

Who the agent is. 1-2 sentences that position the agent in the collaboration.

**Good:**
- "You are a strategic research analyst paired with a human curator."
- "You are a supportive writing coach who helps people find their voice."
- "You are an experienced senior engineer doing a practical code review."
- "You are a patient tutor who adapts to the learner's pace."

**Bad:**
- "You are an AI assistant." (Too generic — no posture, no priorities)
- "You are the world's greatest writer." (No collaborative positioning — where's the human?)
- "You are a helpful tool." (Not a role — a role implies a relationship)

### Component 2: Posture (required)

How the agent relates to the human. This shapes the dynamic of the entire interaction.

Common postures:

| Posture | Description | When to use |
|---|---|---|
| **Expert partner** | Agent has deep domain knowledge, human has context and direction | Research, analysis, code review |
| **Supportive guide** | Agent helps the human develop their own skills or work | Writing coaching, teaching, mentoring |
| **Collaborative equal** | Agent and human brainstorm and build together | Brainstorming, design, planning |
| **Direct assessor** | Agent evaluates and reports honestly, even when critical | Code review, quality assessment, editorial review |
| **Responsive builder** | Agent produces drafts and prototypes, human directs | Writing, design, prototyping |

### Component 3: Tone (optional but recommended)

The voice the agent uses. This isn't just style — it affects whether the human trusts and engages with the output.

- **Strategic and direct:** Calls things as they are, no hedging. Good for analysis and assessment.
- **Warm and encouraging:** Celebrates progress, normalizes struggle. Good for coaching and teaching.
- **Neutral and precise:** Factual, measured, avoids superlatives. Good for research and code review.
- **Energetic and creative:** Enthusiastic about possibilities, builds on ideas. Good for brainstorming.

Tone should match the domain AND the human's expectations. A writing coach for fiction needs a different tone than a writing coach for academic papers, even though both are "writing coaches."

### Component 4: Boundaries (optional but powerful)

What the agent should NOT do. Boundaries prevent common failure modes.

- "Never fabricate signals that aren't in the source material"
- "Never rewrite the human's words without explaining why"
- "Never make the learner feel stupid for getting something wrong"
- "Never flag stylistic preferences as bugs"
- "Never proceed past a checkpoint without explicit human input"

Boundaries are especially important when the role could naturally go too far — a "critical reviewer" who becomes harsh, a "creative partner" who overwhelms with ideas, a "patient tutor" who becomes condescending.

---

## Role Definition Template

Use this as a starting point when writing the role section of a SKILL.md:

```markdown
## Your Role

You are a [role identity] working with a [human's role]. You bring [what the agent contributes] while the human provides [what the human contributes].

Your tone is [tone description]. You [what the agent emphasizes] and you [what the agent de-emphasizes or avoids].

[Optional: Boundaries — what you don't do]
```

---

## Role Design Across Domains

### Writing coach

**Identity:** "You are a supportive writing coach who helps writers find clarity and voice."
**Posture:** Supportive guide — the human's writing, your guidance.
**Tone:** Warm but honest. Celebrate what works, be specific about what doesn't.
**Boundaries:** "Don't rewrite the human's prose without explaining why each change helps. Don't impose your own style — help them find theirs."

### Code reviewer

**Identity:** "You are an experienced senior engineer doing a practical code review."
**Posture:** Direct assessor — you've seen the patterns before, share what you know.
**Tone:** Precise and pragmatic. Focus on what matters, skip what doesn't.
**Boundaries:** "Don't flag stylistic preferences as bugs. Don't suggest architectural overhauls for small PRs. Match your review depth to the change's scope."

### Research analyst

**Identity:** "You are a strategic research analyst paired with a human curator."
**Posture:** Expert partner — you do the analytical heavy lifting, the human provides direction.
**Tone:** Strategic and direct. Call out what you see, even when it's uncomfortable.
**Boundaries:** "Never fabricate signals. If the data doesn't support a claim, say so. Your job is to reveal, not to confirm."

### Tutor

**Identity:** "You are a patient tutor who adapts to the learner's pace."
**Posture:** Supportive guide — the learner's understanding is the measure of success.
**Tone:** Encouraging, clear, uses analogies and examples. Never condescending.
**Boundaries:** "Never make the learner feel stupid. If they don't understand, that's a failure of explanation, not of the learner. Try a different approach."

### Brainstorming partner

**Identity:** "You are a creative collaborator who builds on ideas."
**Posture:** Collaborative equal — you and the human generate and refine together.
**Tone:** Energetic, curious, excited about possibilities. "Yes, and..." over "no, but..."
**Boundaries:** "Don't shoot down ideas — build on them or suggest alternatives. Don't dominate — the human's ideas are as important as yours."

---

## Role Consistency

A common failure mode: the agent starts with the right role but drifts during the session. A "direct assessor" becomes a people-pleaser. A "supportive guide" becomes a lecturer. A "collaborative equal" starts making decisions for the human.

Preventing drift:

1. **State the role once at the top of SKILL.md.** The agent reads this every time it triggers. A clear initial statement is the best defense against drift.

2. **Reinforce at checkpoints.** The role should be visible in HOW the agent presents work at each checkpoint — not just what it says about itself. A "strategic and direct" analyst presents findings with clear opinions. A "supportive" coach presents feedback with encouragement.

3. **Don't over-specify.** A role that says "always respond in exactly this tone with exactly these words" is brittle. Give the agent the posture and let it adapt within those boundaries.

---

## Role Anti-Patterns

### The non-role

"You are a helpful AI assistant." This is the absence of a role. It gives the agent no posture, no priorities, no boundaries. Every interactive skill needs something more specific than this.

### The paragraph role

A 200-word role definition that covers every possible situation. The agent can't hold all of that in context. Keep it to 2-4 sentences. The role should be immediately internalizable.

### The conflicting role

"You are a harsh critic who is also warm and supportive." These postures conflict. Pick one. A skill can be honest AND kind, but "harsh" and "supportive" pull in different directions. Be clear about the primary posture.

### The invisible role

The role is defined in SKILL.md but never surfaces in the agent's behavior. The agent says it's a "strategic analyst" but produces the same generic output as a default assistant. The role has to be reinforced through the skill's instructions — every stage should reflect the role in how it asks the agent to present work.

### The overly constrained role

"You always respond with exactly 3 bullet points. You never use words longer than 2 syllables. You always start with 'Great question!'" This isn't a role — it's a formatting script. A role shapes posture and priorities, not output format.
