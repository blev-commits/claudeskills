---
name: copy-writer
description: "Write, fix, or improve UI copy. Use when the user needs button labels, error messages, empty states, tooltips, placeholder text, onboarding copy, confirmation dialogs, loading states, or any words that appear inside a UI. Trigger on: 'write copy for', 'fix this label', 'what should this button say', 'write an error message', 'empty state copy', 'help me word this'."
---

# UI Copy Writer

Write UI copy that is clear, specific, and human. No filler. No corporate tone.

## Core rules

**Be specific.** "Save changes" beats "Submit". "12 items in cart" beats "Items added".

**Match the moment.** Error messages should be calm and helpful. Success messages confirm without over-celebrating. Destructive actions name the consequence.

**Active voice.** "We couldn't find your account" not "Your account could not be found."

**Avoid:**
- Exclamation marks except on genuine wins
- "Please" on every error message
- Tech jargon in user-facing strings ("502 Bad Gateway", "null response")
- Vague labels ("Click here", "Submit", "OK")

---

## Copy by type

**Button labels**
Use a verb that describes the outcome. Primary CTA should be as specific as possible: "Create account" not "Continue". Destructive actions name the action: "Delete" not "Yes". Cancel is always "Cancel".

**Error messages**
Format: what happened + what to do next.
"That email is already in use. Try signing in instead."
"This file is too large. Maximum size is 10MB."
Never: "An error occurred", "Something went wrong", "Invalid input".

**Empty states**
Format: what's empty + why it matters + how to fill it.
"No projects yet. Create your first project to get started."
Two sentences max.

**Loading states**
Tell users what's happening: "Loading your projects..." not just "Loading..."
For waits over 5 seconds: "This might take a moment..."

**Confirmation dialogs (destructive)**
Title: name the action. "Delete this project?"
Body: state the consequence. "This will permanently delete all files and cannot be undone."
CTA: match the title. "Delete project" not "Yes" or "Confirm".
Cancel is always "Cancel".

**Tooltips**
One sentence. Start with a verb if explaining functionality. No period needed if it's a label.

**Onboarding**
Lead with value, not instructions. "Connect your tools to see everything in one place." not "To get started, please connect your tools by clicking the button below."

---

## Placeholder text reference

| Field type | Placeholder |
|------------|-------------|
| Name | Alex Johnson |
| Email | alex@example.com |
| Search | Search... |
| Text area | Add a note... |
| Date | MM/DD/YYYY |

Avoid "Enter your [field]" as placeholder text. Use a realistic example or a short prompt.

---

## Tone by situation

| Situation | Tone |
|-----------|------|
| Success | Warm, brief |
| Error | Calm, specific, helpful |
| Destructive action | Clear, neutral |
| Empty state | Encouraging, concise |
| Loading | Informative |
| Onboarding | Direct, benefit-led |

---

## Output format

Provide copy directly with no preamble. If offering multiple versions, label them Option A and Option B. If recommending one, say which and why in one sentence.
