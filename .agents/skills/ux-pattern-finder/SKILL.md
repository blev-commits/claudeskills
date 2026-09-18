---
name: ux-pattern-finder
description: "Find established UX patterns for a specific design problem AND render visual mockups for each pattern. Use when the user is stuck on how to solve a UI challenge and wants to know what existing patterns apply. Trigger on: 'how do other apps handle this', 'what's the pattern for', 'what are my options for', 'is there a standard way to', 'what UI pattern should I use for', 'how should I design X', 'show me patterns for', 'what are my UI options for'. Always produces both written analysis AND inline HTML mockups for every pattern identified."
---

# UX Pattern Finder

Identify the established patterns that apply to a design problem, compare trade-offs, recommend a direction, and **render a visual mockup for each pattern**.

## Process

**1. Name the underlying problem**
Restate what the user is trying to solve in one sentence. The problem they name is often a symptom. Getting to the root opens up better solutions.

**2. Identify applicable patterns**
Find 2 to 4 relevant patterns. For each: what it is, when it works, when it fails, real-world examples.

**3. Render a mockup for each pattern**
After each pattern's written breakdown, render an inline HTML mockup using the `show_widget` tool. See the Mockup Standards section below.

**4. Recommend a direction**
Based on platform, user type, and task complexity, recommend the best fit. If two patterns are genuinely close, say so and name the deciding factor.

---

## Pattern library

**Navigation**
Tab bar, sidebar nav, bottom nav, hamburger drawer, breadcrumbs, steppers, hub-and-spoke, progressive disclosure

**Data display**
Table, data grid, card grid, list, timeline, calendar, kanban board, tree view, master-detail

**Filtering and search**
Inline filters, filter panel, filter chips, faceted search, full-text search, saved searches, sort controls

**Forms and input**
Single-column form, multi-step wizard, inline editing, auto-save, progressive form, smart defaults

**Actions and feedback**
Primary and secondary buttons, icon buttons, FAB, contextual actions, bulk actions, undo/redo, toast notifications, inline alerts, modal dialogs, confirmation patterns

**Empty and loading**
Skeleton loaders, progressive loading, optimistic UI, empty states, onboarding flows

**Disclosure and hierarchy**
Accordion, expandable rows, nested lists, popovers, tooltips, drawers, side sheets, split view

**Selection**
Checkbox list, radio group, toggle, segmented control, multi-select dropdown, tag input, combobox

---

## Mockup Standards

Every pattern gets a visual mockup rendered with `show_widget`. Before the first mockup call, load `read_me` with `["mockup"]`.

### Mockup rules

- **Style**: Clean, dark-themed UI. Background `#0f0f0f`, surface cards `#1a1a1a`, borders `#2a2a2a`, primary accent `#6366f1` (indigo), text white/gray hierarchy.
- **Font**: Use `font-family: 'Inter', system-ui, sans-serif` — these are UI mockups, not marketing pages.
- **Size**: Fixed width `680px`, auto height. Render at realistic scale — not tiny, not bloated.
- **Content**: Use realistic placeholder data relevant to the user's context (e.g. if they asked about a CRM table, show CRM-like column names and data). Never use "Lorem ipsum."
- **Interaction hints**: Show hover/active/focus states via CSS `:hover` where appropriate. For chips and toggles, show one in "active" state to communicate the pattern clearly.
- **Label**: Title each mockup clearly in the widget (e.g. "Pattern 1: Filter Chips").
- **Annotation**: Add 2–3 small annotation callouts (using a subtle `#6366f1` dot + label) pointing to the key parts of the pattern — the thing that makes this pattern what it is.
- **No interactivity required**: Mockups are static illustrations of the pattern. They don't need to actually filter data. They just need to look right and communicate the concept clearly.

### Mockup structure template

```html
<div style="background:#0f0f0f; padding:24px; border-radius:12px; font-family:'Inter',system-ui,sans-serif; width:680px; color:#fff; position:relative;">
  <!-- Pattern title -->
  <div style="font-size:11px; font-weight:600; color:#6366f1; letter-spacing:0.08em; text-transform:uppercase; margin-bottom:16px;">
    Pattern: [Name]
  </div>
  
  <!-- The mockup UI -->
  <!-- ... -->
  
  <!-- Annotations -->
  <div style="margin-top:20px; border-top:1px solid #2a2a2a; padding-top:14px; display:flex; gap:20px; flex-wrap:wrap;">
    <div style="display:flex;align-items:center;gap:6px;font-size:11px;color:#888;">
      <span style="width:6px;height:6px;border-radius:50%;background:#6366f1;flex-shrink:0;"></span>
      [Annotation 1]
    </div>
    <!-- repeat for 2-3 annotations -->
  </div>
</div>
```

---

## Output format

**Problem (restated):** [One sentence]

---

For each pattern, interleave written analysis and mockup:

**[Pattern name]**
- How it works: [2–3 sentences]
- Best for: [Use case]
- Watch out for: [When it fails]
- Examples: [Real products]

[→ show_widget mockup immediately after]

---

**Recommendation:**
[Which pattern fits this context and why. Name the runner-up if it is close and what would push toward it instead.]
