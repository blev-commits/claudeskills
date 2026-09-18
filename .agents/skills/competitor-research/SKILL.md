---
name: competitor-research
description: "Analyze competitor or reference product screenshots to extract UI patterns, design decisions, and trade-offs. Trigger when the user uploads screenshots of other products, shares reference images, says 'analyze these', 'what patterns do you see', 'how do they handle this', 'tear this down', or 'what can I learn from these'. Also trigger when a UI is about to be built and the user has reference products in mind — ask them to grab screenshots first."
---

# Competitor Research

Analyze what's in front of you. Extract patterns, decisions, and trade-offs from real product screenshots. Don't describe what you see, synthesize what it means.

---

## Stored research

Research lives as bundled files inside this skill under `research/[project]/analysis.md`. It is permanently part of the installed skill — readable every session without any uploads or setup.

The skill is installed at `~/.claude/skills/competitor-research/`, so a project's files are at `~/.claude/skills/competitor-research/research/[project]/`.

**Current projects:**
- `notion` — 4 marketing site screenshots (hero/AI agents, feature grid, social proof, download suite)

**Before producing any UI output:**
1. Read the relevant `analysis.md` using the `Read` tool
2. Apply the patterns, decisions, and visual quality bar as hard constraints
3. Reference explicitly: "Pulling from stored [project] research — applying [specific pattern]."

---

## When the user says "show my research" or "open the research folder"

Read all files listed in the research index above, then render an interactive browser widget showing:
- All project folders as cards (name, screenshot count, date)
- Click into a project to see the analysis summary
- `+ new project` button → `sendPrompt("I want to add competitor research screenshots")`
- `+ add screenshots` button per project → `sendPrompt("I want to add screenshots to the [project] research folder")`

---

## When screenshots are uploaded

### Step 1 — Identify project name
From context, user mention, or filename. Lowercase (e.g. `notion`, `linear`).

### Step 2 — Analyze

**Per screenshot:**
- Product and screen identified
- What problem this screen solves for the user
- Layout: hierarchy, density, information grouping
- Interaction patterns: what's clickable, how actions are revealed, what's hidden
- Visual decisions: spacing, type, color, empty state handling
- What's notably absent

**Across all screenshots:**
- What do they share? That's the pattern.
- Where do they diverge? That's the interesting part.
- What's the strongest decision in the set and why?

### Step 3 — Write analysis file

Write the analysis with the `Write` tool to:
`~/.claude/skills/competitor-research/research/[project]/analysis.md`

Also copy the screenshots themselves into `~/.claude/skills/competitor-research/research/[project]/screenshots/`, named `01-[what-it-shows].png`, `02-...`, so later sessions can look at them. List those filenames at the top of `analysis.md`.

Then add the project to the **Current projects** list in this file so future sessions know it exists.

### Step 4 — Confirm
> "Research saved. This analysis is now part of your installed skill and will be available every session."

---

## Output format

**Screenshots reviewed:** [products/screens identified]

**The pattern:**
2–3 sentences. Name the pattern, don't just describe it.

**Where they diverge:**
Meaningful differences and the trade-off each one is making.

**Strongest decision in the set:**
The single most intentional design choice. Why it works.

**What to take into your design:**
Specific direction, not general inspiration.

**What to avoid:**
Anything common in the set worth questioning.

**Visual quality bar:**
- [background treatment]
- [color approach]
- [typography pattern]
- [layout style]
- [interaction patterns]

---

## If no screenshots are uploaded

> "Drop in screenshots of the products you want to analyze and I'll pull the patterns out. Focus on the specific screen or interaction you're designing for, not the homepage."

Do not attempt to research from memory alone.

---

## Reference tiers

If the user needs guidance on which products to screenshot:

1. What products do you consider best-in-class for this type of screen?
2. Who are your direct competitors in this space?
3. Any products outside your category with interactions worth studying?
