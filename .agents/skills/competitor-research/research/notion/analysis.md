# Notion — Competitor Research
**Date:** 2026-03-20
**Screenshots:** 4 (marketing site)
**Screens:** Hero/AI agents, social proof/testimonials, product feature grid, download/product suite

## Screenshot files
When generating UI that references Notion, load these with the `Read` tool for visual reference (all under `~/.claude/skills/competitor-research/research/notion/screenshots/`):
- `01-hero-ai-agents.png` — hero section, AI agents feature, nav
- `02-feature-grid.png` — two-column feature cards, product previews
- `03-social-proof.png` — testimonials, logo grid, social proof layout
- `04-download-suite.png` — product suite cards, download CTAs

---

## Pattern
Two-column card system pairs claim with UI proof on every scroll section. The page never asks you to believe something without immediately showing it.

## Divergences
The AI agents section breaks the card pattern — full-width interactive with illustrated avatars. Most visually distinct but also the most startup-y section, undercutting the page's overall confidence. The social proof section leans on enterprise logos (OpenAI, Toyota, Figma) rather than product screenshots.

## Strongest decision
Layered product state cards — a document behind a calendar behind a comment thread — communicate depth and capability without a demo or any reading required.

## Take into your design
Lead with the claim in large bold type, then immediately show the interface. Pair benefit statements with actual screenshots of the content, not illustrations or icons. Never separate the pitch from the proof.

## Avoid
Colorful illustrated character/mascot approach. Lean into real UI and real results instead.

## Visual quality bar
- Near-white warm off-white background (#f5f4ef), never pure white
- Black serif headlines, very large (60–80px), sentence case
- UI previews in stacked/layered cards with soft drop shadows
- No decorative gradients — color comes from product UI screenshots only
- Tight nav: text links + one blue CTA button, no secondary nav clutter
