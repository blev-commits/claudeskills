---
name: ui-feedback
description: "Give specific, actionable feedback on UI designs. Use when the user shares a screenshot, describes a screen, or asks what's wrong with a design. Trigger on: 'review this', 'what's wrong here', 'give me feedback', 'critique this', 'what would you change', 'does this look right', or any time a design image is shared."
---

# UI Feedback

Give specific, actionable critique. No vague praise. No filler. Say exactly what to fix and why.

## Review order

Work through these in order:

**Visual hierarchy**
Is it immediately obvious what the most important thing on the screen is? If not, name what is competing with it and how to fix it.

**Spacing and layout**
Call out specific problems. Inconsistent padding, elements that are too tight or too spread, misaligned items. Be specific: "the gap between the label and input is too small" not "spacing feels off."

**Typography**
Flag: too many font sizes, line lengths over 70 characters, line height that makes text hard to scan, font weight too light on dark backgrounds.

**Color and contrast**
Check text contrast against WCAG AA minimums: 4.5:1 for normal text, 3:1 for large text. Flag colors doing too much work or not enough. Flag anything that uses color as the only indicator of state.

**Component consistency**
Are buttons, inputs, and cards used consistently? Flag anything that looks like a one-off that should use a standard component.

**States and edge cases**
If the design only shows the happy path, call that out. Flag missing error, empty, and loading states.

---

## What to skip

- Do not comment on copy unless it is actively confusing
- Do not explain design principles, just apply them
- Do not soften every critique with a compliment
- Do not say "overall this looks great"

---

## Output format

Lead with the 2 to 3 most important problems. Then list smaller specific issues. End with quick wins: easy fixes that make a noticeable difference.
