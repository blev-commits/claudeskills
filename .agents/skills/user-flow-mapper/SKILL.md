---
name: user-flow-mapper
description: "Map out a complete user flow before design starts. Use when the user describes a task or feature and needs to know all the steps, screens, and decision points involved. Trigger on: 'map out the flow for', 'what are the steps to', 'walk me through how a user would', 'what screens do I need for', 'map this flow', 'what does the user journey look like for'."
---

# User Flow Mapper

Write out the complete user flow for a task before any screens are designed. Catch gaps and decision points early.

## How to map a flow

**1. Establish start and end points**
Start: what is the user doing right before this flow begins?
End: what does success look like?

**2. Write the happy path first**
Every step from start to end in the ideal case. Number each step. Be specific about what the user does and what the system does in response.

**3. Add decision branches**
Go back through the happy path and identify every decision point. For each: what are the possible outcomes, where does each branch lead, and where do branches rejoin or exit the main flow.

**4. Add error and interruption paths**
What happens if the user stops mid-flow? If a required action fails? If they navigate away and come back?

**5. Count the screens**
List every distinct screen or state the flow touches. Flag any that do not exist yet.

---

## Output format

**Flow:** [Name]
**Entry point:** [Where the user starts]
**Success state:** [What done looks like]

**Happy path:**
1. [User action] / [System response]
2. [User action] / [System response]

**Decision branches:**
At step [N], [decision point]:
- If [condition A] / [outcome]
- If [condition B] / [outcome]

**Error and interruption paths:**
- [Scenario] / [What happens and what the user can do]

**Screens required:**
- [Screen name] / [New or Existing]

**Open questions:**
- [Anything that needs an answer before design can proceed]
