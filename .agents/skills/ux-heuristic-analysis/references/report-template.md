# Report template

Follow this structure and these block formats. Text in [brackets] is a placeholder. Example lines come from a real evaluation and show the expected level of detail.

## Contents

1. Title block and Summary
2. Findings
3. Forensic breakdown (Phase 1)
4. Recommendations
5. Findability wins
6. Wireframes (Phase 3)
7. User flows (Phase 2)
8. Method

---

## 1. Title block and Summary

```
# Heuristic Evaluation: [product]

[Month D, YYYY] · [Evaluator name]

## Summary

[One paragraph, 3 to 5 sentences. What the product does well, then the main
themes of the problems, then what kind of work most fixes need.]
The review found [N] issues across [N] of the ten heuristics. [N] rate 3 (major)
and [N] rate 4.

## Major issues

> * [One line per severity 3 or 4 issue, in plain words.] ([#N](#N))

## Strengths

> * [Bold-free lead phrase]: [one sentence on what works and why it matters.]

## In this document

[One short paragraph naming each section and what it holds.]
```

Example Summary paragraph:

> The myprize.us lobby is content-rich and promotes well, but it interrupts browsing with pop-ups the user didn't ask for, leans on unexplained currency and feature terms, and checks age and state eligibility only after sign-up. Help and responsible-play pages exist, but they sit only in the footer, below several carousels. Most of the fixes are changes to when pop-ups appear, short in-place copy, and moving existing links higher.

Example Strength:

> * Forms use visible labels: the profile form labels every field instead of relying on placeholders.

---

## 2. Findings

```
# Findings

[One or two sentences: count, sort order, pointer to the severity scale in
Method, and what "verify" means.]

| # | Heuristic | Issue | Evidence | Severity |
| :---- | :---- | :---- | :---- | :---- |
| [N] | H[N] [Heuristic name] | [The problem, one or two sentences, add "(verify)" if unconfirmed.] | [Where it was seen: pages, states, quoted UI text, measured values.] | **[0-4]** |
```

Rules:
- Sort by heuristic (H1 first), then by page order within a heuristic.
- Number issues sequentially across the whole table. When extending a report, continue from the last number.
- Issue column says what's wrong and the effect on the user. Evidence column says where, with quoted UI strings in double quotes.

Example row:

| 3 | H2 Match with the real world | Gold Coins (GC) and Sweeps Coins (SC), which the site also calls "Sweeps Cash", appear on every prize and price with no plain-language explanation of what they are, how they differ, or whether they relate to real money. | Leaderboard prize pools, Prize Hunts ("1,360,000 GC + 1,360 SC"), pack prices, "65 Free Sweeps Cash" on Rewards. | **3** |

---

## 3. Forensic breakdown (Phase 1)

Every issue in the Findings table gets one dense block here, in the same order. This is where the technical depth lives: name the theory, explain the mechanism.

```
# Forensic breakdown

[One sentence: one block per finding, same numbering, severity labels mapped
from the 0 to 4 scale.]

### [#N] • [Precise Component/State Location]
* **Sub-Engine Triggered:** [Pattern Finder | UX Copy | Innovative Designer | Pro Max | HMI Core, or a combination]
* **HMI/UX Principle Violated:** [Exact framework, e.g. Miller's Law (7±2 chunking), Semantic Mapping Incongruence, Inadequate Telemetry Feedback]
* **Severity Rating:** [Low | Medium | High | Critical] ([1-4])
* **Current State Failure Vector:** [Exhaustive breakdown of how the visual, linguistic or interactive mechanics break the human-machine loop: what the user perceives, what they expect, what the system actually does, and what goes wrong as a result. Tie it to the personas and constraints.]
* **Figma Component Target:** [Specific layer, frame or component. Use real layer names, or a visible location marked "unverified".]

## Severity tally

| Severity | Count |
| :---- | :---- |
| Critical (4) | [N] |
| High (3) | [N] |
| Medium (2) | [N] |
| Low (1) | [N] |
```

Example block:

### [#2] • Home, "Claim your free spin" modal and header balance
* **Sub-Engine Triggered:** HMI Core, UX Copy
* **HMI/UX Principle Violated:** Inadequate Telemetry Feedback (Nielsen H1)
* **Severity Rating:** Medium (2)
* **Current State Failure Vector:** The wheel shows only "SPINNING..." with no duration cue, so the player can't tell a slow spin from a stalled one. Behind the modal the header balance changes from 1.00 SC to 0.00 SC with no message. A player who sees the change assumes the free spin cost them coins, which undermines the word "free" and invites a support ticket. (verify)
* **Figma Component Target:** [to add] Home / Free spin modal; Header / Balance

---

## 4. Recommendations

```
# Recommendations

[One or two sentences: fix the majors first, and what kind of work most fixes are.
Note that numbers in parentheses refer to Findings.]

1. **[Imperative fix title]:** [What to change, concretely, one to three sentences.] ([#N](#N))
2. ...

## Recommended patterns

[One sentence introducing the patterns.]

### [Topic] ([#N](#N))

**Pattern:** [The established UX pattern and how it applies here, specific to
this product's pages and terms.]

**Why it matters:** [The user and business effect: drop-off, trust, support
load, compliance. Two to four sentences.]

**Would change if:** [The condition that would make a different pattern better,
and what that alternative is.]

**Requirement:** [Optional. Legal, platform or policy constraints, with the
source named, e.g. App Store Review Guidelines 3.1.1.]

**Figma:** [Link name](url) · [Link name](url)

## Next steps

* [Verify items, follow-up scope, audits that should come next.]
```

Order the numbered list by priority: severity 3 and 4 first, then 2s grouped by theme, then a final "Polish" item that bundles the 1s. Write recommended patterns for the issues with the clearest design fix, usually the majors.

Example recommendation:

> 2. **Show eligibility before sign-up:** Put "18+ · Not available in [states]" next to Sign Up and at the top of the sign-up modal, with a link to the full list. ([#12](#12))

---

## 5. Findability wins

```
# Findability wins

[One paragraph: what this section covers and which pages it draws on. Point to
the Wireframes tab.]

## Quick wins

1. **[Title]:** [Current state on the named page. What changes.] Why it matters: [one sentence.]

## Bigger changes

1. **[Title]:** [Current state. What changes.] Why it matters: [one sentence.]

## How to measure

* [Metric tied to a specific win, with before and after where relevant.]
```

Quick wins are changes to existing elements (moving, relabelling, adding copy). Bigger changes restructure navigation, pages or content. Every win names the page it applies to.

---

## 6. Wireframes (Phase 3)

Translate the fixes into precise layout updates. Each pattern section carries both the readable spec and the structural blueprint.

```
# Wireframes

[Intro: low-fidelity, what markers are, placeholders in brackets, breakpoints
covered (e.g. desktop 1280px, tablet 768px, mobile 390px).]

## [Pattern name] ([#N](#N))

**Layout:** [What the screen contains and how it behaves, in reading order.]

* Marker 1: [what this numbered callout points to and why.]
* Marker 2: ...

**Desktop:** [How the pattern sits at desktop width.]
**Tablet:** [How it adapts.]
**Mobile:** [How it adapts, including thumb reach and keyboard behaviour.]

**Blueprint:**
[ASCII wireframe in a code block, with [1], [2] marker callouts matching the
Marker list.]

**Spatial layout:** [Grid adjustments, alignment anchors, touch target sizes and
spacing, justified against Fitts's Law and the persona's constraints.]

**Component behaviour:** [Dropdown changes, button states (default, hover,
pressed, disabled, loading, success, error), dynamic form parsing, validation
timing.]

**Copy rewrites:**
| Element | Before | After |
| :---- | :---- | :---- |
| [Header / label / helper / error] | "[current string]" | "[new string]" |

**Note:** [Optional. Which values are placeholders.]

**Figma:** [Recommendation page](url) · [Desktop](url) · [Tablet](url) · [Mobile](url)
```

Example blueprint:

```
┌──────────────────────────────────────────────┐
│ Sign up                          Step 1 of 3 │
│ First, check you can play                    │
│                                              │
│ State          [ Select your state      ▾ ]  │ [1]
│ Date of birth  [ MM ] [ DD ] [ YYYY ]        │
│                                              │
│ ⚠ Not available in [state]. You can still    │ [2]
│   play with Gold Coins.                      │
│                                              │
│ [        Continue (full width, 48px)       ] │
│ 18+ only. See where you can play             │ [3]
└──────────────────────────────────────────────┘
```

When in scope, follow the pattern sections with:

- **Full-page wireframes:** which pages were redesigned, the layout variants (e.g. top nav vs left nav), signed in and signed out coverage, and how shared elements like chat behave. Link each page.
- **Wayfinding and navigation:** the nav model across breakpoints, components, and wayfinding aids.

If wireframes aren't built in Figma yet, keep the Blueprint and specs and use "[to add]" for Figma links.

---

## 7. User flows (Phase 2)

Document the step-by-step operational logic for every flow in scope. Do not truncate steps. Each flow has three parts.

```
## [Flow name]

[**Flow name**](url)**:** [main path with arrows, A → B → C]. Branches: [each
branch in a few words: declines, errors, empty states, delays, hand-offs to
other flows].

**Current flow architecture** ([N] steps)
[ASCII map in a code block: every screen, micro-interaction, decision point,
API wait-state and error branch, annotated with issue numbers.]

**Optimized flow architecture** ([N] steps)
[ASCII map of the re-engineered path: non-value-added actions removed, states
merged, predictive defaults applied, recovery branches shown, annotated with the
issue numbers each change resolves.]
```

Example notation:

```
[S1] Cart screen
  │  tap "Checkout"
  ▼
[S2] Login wall  ◄── #3 (forced auth before value shown)
  │  ├─ success ──► [S3]
  │  └─ fail ─────► [E1] Generic "Something went wrong" ◄── #4
  ▼
[S3] Shipping form (API: address validation, ~1.8s, no spinner) ◄── #5
```

Every flow must show its failure and decline branches, not only the happy path.

---

## 8. Method

```
# Method

## Scope
[Pages, sections and states covered, signed in and out. What was out of scope.]

## Approach
[Number of evaluators, heuristics used, severity scale.]

## Evidence
* [Count and type of evidence, with capture date.]
* [Other sources, e.g. server-rendered HTML, and what they were used for.]
* [Any estimated measurements and how they were estimated.]

## Limitations
* [What wasn't tested: live interaction, mobile, keyboard, timing.]
* [Evaluator count, and that 3 to 5 independent evaluators are more reliable.]

## Items to verify
* [Each "verify" finding, what exactly to check.] ([#N](#N))

## Severity scale
Each issue is rated on the standard 0 to 4 scale.
[The 0 to 4 table from SKILL.md, including the forensic label column.]
```
