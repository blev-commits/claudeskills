---
name: stakeholder-explainer
description: "Explain a design decision or concept to a non-designer: a PM, engineer, executive, or client. Use when the user needs to translate design thinking into language that lands with someone who doesn't have a design background. Trigger on: 'explain this to a non-designer', 'write this up for the PM', 'how do I explain this to engineering', 'my stakeholder doesn't get why', 'help me justify this decision', 'translate this for the client'."
---

# Stakeholder Explainer

Translate design reasoning into language that lands with people who don't think in design terms.

## Audience reference

**PM**
Cares about user outcomes, scope, and trade-offs. Frame decisions as what problem this solves and why this approach works better than alternatives.

**Engineer**
Cares about implementation complexity, edge cases, and what is actually being asked of them. Frame decisions as specific requirements with clear reasoning so they can make good trade-off calls during build.

**Executive**
Cares about business impact, risk, and customer satisfaction. Lead with outcome. Skip implementation details entirely.

**Client**
Cares about whether it solves their problem and looks right. Plain language only. No UX theory.

---

## How to translate design decisions

**Lead with the user problem, not the solution.**
Wrong: "I used a bottom sheet because it's a common mobile pattern."
Right: "Users need to see the results while adjusting filters. The bottom sheet keeps results visible while the panel is open."

**Connect to outcomes they care about.**
Wrong: "The modal interrupts the user's workflow."
Right: "This adds an unnecessary step every time someone does X, which they do multiple times per session. This approach removes that friction."

**Name the trade-off.**
Wrong: "We went with option A."
Right: "We went with option A. Option B was faster to build but creates a dead end users cannot recover from without restarting."

**Replace design jargon.**

| Design term | Plain language |
|-------------|----------------|
| Visual hierarchy | Which information is most important and visible first |
| Information architecture | How content is organized and where things live |
| Progressive disclosure | Showing only what is needed, revealing more when relevant |
| Affordance | What tells the user they can interact with something |
| Micro-interaction | Small feedback that confirms an action worked |
| Onboarding flow | The steps a new user goes through to get set up |

---

## Output format

A short plain-language writeup the user can paste into an email, Slack, or Notion comment. Maximum one short paragraph or 5 bullet points.

Include at the top: **Audience:** [PM / Eng / Exec / Client]
