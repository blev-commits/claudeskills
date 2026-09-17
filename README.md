# claudeskills

Personal collection of Claude Code skills. Anything under `.claude/skills/` is
picked up automatically by sessions started in this repository.

## Installed skills

Twelve skills from [leonxlnx/taste-skill](https://github.com/leonxlnx/taste-skill)
(commit `e79ca9e`) — everything except `taste-skill-v1`, which duplicates the v2
default and was deliberately left out. Directory names match each skill's install name — the `name:`
field in its frontmatter, not the upstream folder name.

### Implementation skills (output code)

| Skill | Upstream folder | What it does |
| --- | --- | --- |
| `design-taste-frontend` | `taste-skill` | v2 default. Reads the brief, infers the design direction, ships landing pages / portfolios / redesigns that don't look templated. Audit-first on redesigns, strict pre-flight check. |
| `gpt-taste` | `gpt-tasteskill` | Stricter GPT/Codex variant: true randomized layout variance, AIDA structure, wide editorial type, strict GSAP ScrollTriggers. |
| `image-to-code` | `image-to-code-skill` | Image-first pipeline: generate section references, analyze them, then build the frontend to match. |
| `redesign-existing-projects` | `redesign-skill` | Audits an existing UI for generic AI patterns, then fixes layout, spacing, hierarchy, and styling without breaking it. |
| `high-end-visual-design` | `soft-skill` | Polished, calm, expensive UI: softer contrast, whitespace, premium fonts, spring motion. |
| `minimalist-ui` | `minimalist-skill` | Editorial product UI. Warm monochrome, typographic contrast, flat bento grids, no gradients or heavy shadows. |
| `industrial-brutalist-ui` | `brutalist-skill` | Swiss print meets military terminal: rigid grids, extreme type scale contrast, analog degradation. |
| `stitch-design-taste` | `stitch-skill` | Google Stitch-compatible rules; exports a `DESIGN.md` design system (template included). |
| `full-output-enforcement` | `output-skill` | Anti-truncation. Bans placeholder comments, enforces complete code, handles token-limit splits cleanly. |

### Image-generation skills (output reference images only, no code)

| Skill | Upstream folder | What it does |
| --- | --- | --- |
| `imagegen-frontend-web` | `imagegen-frontend-web` | Website comps — one horizontal image per section, consistent palette across the set. |
| `imagegen-frontend-mobile` | `imagegen-frontend-mobile` | iOS / Android / cross-platform screens and flows in phone mockups. |
| `brandkit` | `brandkit` | Brand-guideline boards, logo systems, identity decks, visual-world presentations. |

### Notes

- The aesthetic skills are alternatives, not layers — `minimalist-ui`,
  `industrial-brutalist-ui`, and `high-end-visual-design` pull in opposite
  directions. Name the one you want for a given job.
- `design-taste-frontend` is large (~87 KB, ~1,200 lines); the rest range from
  8 KB to 44 KB.

## Updating

Re-copy each `skills/<folder>/` from upstream into
`.claude/skills/<install-name>/`, or use the upstream CLI:

```bash
npx skills add https://github.com/Leonxlnx/taste-skill --skill "<install-name>"
```
