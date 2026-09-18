---
name: error-state-generator
description: "Generate a complete set of error and edge-case states for a screen or user flow. Use when the user shares a design, describes a flow, or asks what states they might be missing. Trigger on: 'what error states am I missing', 'generate error states', 'what edge cases should I design', 'what states does this need', 'I only have the happy path'."
---

# Error State Generator

Given a screen or flow, produce every state that needs to be designed beyond the happy path.

## State categories

**Loading**
- Initial page load
- Loading more (pagination, infinite scroll)
- Saving or submitting
- Slow connection (what shows after 3 seconds, after 10?)

**Empty**
- Zero items, first use (never added anything)
- Zero results (search or filter returned nothing)
- Zero items after deletion
- No permission to view content

**Error**
- Network error or offline
- Server error (500-level)
- Not found (404)
- Session expired or unauthenticated
- Inline validation errors (on blur, not just on submit)
- Permission denied
- Rate limited or quota exceeded

**Success**
- Action completed (save, send, delete, upload)
- Long-running action completed
- Onboarding completion

**Destructive actions**
- Confirmation before delete
- Confirmation before irreversible send
- Undo window if the action is reversible

**Degraded**
- Some content loaded, some failed
- Offline with cached data
- Feature unavailable on current plan
- Feature in beta or behind a flag

**Boundary and edge cases**
- Character or file size limits reached
- Minimum requirements not met
- Duplicate content
- Conflicting edits (someone else changed this while you were editing)

---

## Output format

For each applicable state:

**[State name]**
- **Trigger:** What causes this state
- **What the user sees:** What appears, disappears, or changes
- **Copy:** Heading, body, CTA label
- **Actions available:** What the user can do from here

---

## After generating

Flag any states that are commonly skipped:
- Slow connection or timeout
- Conflicting edits in collaborative tools
- Undo window after destructive actions

If the user has only designed the happy path, say so and give a count of how many additional states are needed.
