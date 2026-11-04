# Writing style

The report is read by people outside design. The style below keeps it fast to scan and easy to quote in tickets.

## Plain words

Say what the user experiences, not the theory behind it. Name the heuristic in the Findings table and let the sentence carry the meaning.

- Write "Pop-ups open without the user asking and block the page until closed."
- Not "Modal interruptions violate user locus of control and impose unsolicited interaction cost."

Use the product's own UI labels, in double quotes, when quoting them ("Almost there!", "Get Coins"). Use plain names for your own recommendations ("Card packs", "Live rooms").

If a term needs explaining, explain it once, the first time it appears.

## Sentences

- Vary sentence length. Mix short, direct sentences with longer ones that carry a reason or a condition.
- No em-dashes. Use a colon, a comma, parentheses or a new sentence.
- No analogies about things being "quiet" or "loud".
- Prefer active voice and present tense: "Chat takes about a fifth of the screen."
- Lead labels with a colon, not a dash: "**Pattern:** ...", "Marker 1: ...".

## Claims and evidence

- State what you saw and where. Give numbers when you have them ("about 15 rows", "about 2.2:1").
- Mark estimates as estimates ("about", "approximate") and say how they were made in Method.
- Mark anything not directly observed as "(verify)".
- Name sources for legal or platform requirements.

## "Why it matters"

Every recommended pattern, quick win and bigger change ends with why it matters. Tie it to an outcome the team cares about: players leaving, trust, support tickets, compliance, discovery of features, conversion. One to four sentences. Avoid restating the fix.

## Formatting

- Bold only for labels and list-item titles.
- Bullets for Major issues, Strengths, Markers, Next steps, Evidence, Limitations, Items to verify, How to measure.
- Numbered lists for Recommendations, Quick wins and Bigger changes, since order means priority.
- Tables only for Findings and the severity scale.
- Placeholders in [square brackets].

## Two registers

The Summary, Findings table, Recommendations, Findability wins and Wireframes stay in plain words. The Forensic breakdown is the one place for dense technical language: name the theory precisely and explain the full mechanism. Even there, keep the style rules above (no em-dashes, varied sentence length, quoted UI strings).
