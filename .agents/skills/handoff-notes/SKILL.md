---
name: handoff-notes
description: "Write developer handoff notes for a design. Use when the user is handing off designs to engineering and needs to document behavior, states, edge cases, and anything that isn't obvious from looking at the Figma file. Trigger on: 'write handoff notes', 'what does dev need to know', 'write up the specs', 'document this for engineering', 'write the dev notes for this', 'sprint handoff'."
---

# Handoff Notes

Write the notes that tell engineers what they need to build the design correctly. Not what it looks like. What it does.

Focus on the screen and the user task. Do not catalogue individual UI components. Skip describing standard elements (buttons, inputs, labels) unless something about them is non-obvious or custom.

## What belongs in handoff notes

Engineers can see the Figma file. Do not describe the visual design.

Document:
- What the screen is for and where it lives in the flow
- What the user can do and what happens as a result
- Every state the screen can be in
- Edge cases and data constraints
- Anything that requires a decision during implementation

---

## Structure

**Overview**
2 to 3 sentences. What is this screen for, what task does it serve, where does it sit in the flow.

**User task**
What the user is trying to accomplish on this screen. What inputs or decisions are required from them. What happens when they complete the task or abandon it.

**Interaction behavior**
What happens when the user acts. Cover: what triggers state changes, what persists vs. resets on navigation, any auto-save or debounce behavior, dynamic content (e.g. adding/removing rows, conditional fields).

**Screen states**
Every state this screen can be in. For each: what triggers it, what the user sees, what actions are available.

Minimum to cover: default, loading, error, empty, success. Add others if the design warrants it.

**Edge cases and constraints**
Data constraints, validation rules, API failure behavior, slow connection behavior, anything that could break the expected experience.

**Responsive behavior**
Only include if breakpoints are defined or expected. What reflows, collapses, or hides at smaller sizes.

**Accessibility**
Focus order, screen reader announcements for dynamic content, ARIA labels for ambiguous interactive elements.

**Copy**
Exact strings for anything not visible in the Figma file: error messages, empty states, confirmation dialogs, tooltips.

**Open questions**
Anything that needs an answer from engineering or product before implementation. Write these as actual questions.

---

## Format rules

Plain markdown. Short sentences. Write for scanning, not reading. Reference Figma frame names where useful. Skip any section that does not apply to the design.
