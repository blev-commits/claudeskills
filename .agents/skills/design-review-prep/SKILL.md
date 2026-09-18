---
name: design-review-prep
description: "Help a designer prepare for a design review or critique session. Use when the user is about to present work and needs to structure their talking points, anticipate questions, or frame the feedback they need. Trigger on: 'help me prep for this review', 'I have a design review', 'structure my talking points', 'what should I say when I present this', 'prepare me for critique', 'review prep'."
---

# Design Review Prep

Structure talking points so the review stays focused and productive.

## What to establish first

Before building anything, check what the user has already provided. Extract what you can from their message, then ask for only what is missing — in a single message, not one question at a time.

You need:
- What is being presented
- Where it is in the process (exploration, mid-fi, final, post-iteration)
- Who is in the room (designers, PMs, engineers, execs)
- What feedback is needed
- What is already decided and off the table

If the user has given you enough to infer some of these, do so and confirm inline rather than asking. Only ask when something is genuinely ambiguous or missing. Do not generate the review outline until you have enough to work with.

---

## Review structure

**Opening (30 seconds)**
One sentence on what problem this solves and for whom. One sentence on where it is in the process. This sets the frame for everything that follows.

Example: "This is the invite flow for team accounts. We're mid-fidelity, so I'm looking for structural feedback, not polish."

**Walk the flow**
Present the happy path only. Do not apologize for what is missing. If something is not designed yet, say it is out of scope for today.

**Decisions already made**
Call out non-obvious choices and why they were made. This prevents the room from debating something already resolved.

Example: "I used a bottom sheet here instead of a modal. The results need to stay visible behind it."

**What I need from you**
The most important part. Name the open decisions. Frame them as questions so the room knows exactly what to solve.

Good: "I haven't decided whether role selection happens inline or in a separate step. Looking for input on that."
Bad: "Let me know what you think."

**What is off the table**
Name anything already decided that will not change in this round. Saves time.

---

## Anticipating hard questions

If the user shares a screenshot or design file, analyze the actual UI before generating anticipated questions. Look for:
- Patterns or components that deviate from convention (flag why)
- Missing states that reviewers will ask about (empty, error, loading)
- Layout or hierarchy choices that aren't self-explanatory
- Anything that looks unfinished or placeholder

Generate anticipated questions from what you can actually see, not generic placeholders.

If no design is shared, flag the most likely questions based on the feature description:
- "Why didn't you use [alternative]?"
- "What about mobile?"
- "What does the empty state look like?"
- "Has this been tested?"

---

## Output format

**Review: [Feature name]**
**Audience:** [Who is in the room]
**Goal:** [What kind of feedback is needed]

**Opening:**
[1 to 2 sentence context setter]

**Key decisions to flag:**
- [Decision] / [Why you made it]

**Questions to ask the room:**
1. [Specific open question]
2. [Specific open question]

**What is not up for discussion:**
- [Already decided]

**Likely questions to anticipate:**
- [Question] / [Your response]
