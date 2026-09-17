# claudeskills

Personal collection of Claude Code skills. Anything under `.claude/skills/` is
picked up automatically by sessions started in this repository.

## Installed skills

| Skill | Directory | Source |
| --- | --- | --- |
| `design-taste-frontend` | `.claude/skills/design-taste-frontend/` | [leonxlnx/taste-skill](https://github.com/leonxlnx/taste-skill) (v2, commit `e79ca9e`) |

### design-taste-frontend

Anti-slop frontend skill for landing pages, portfolios, and redesigns: reads the
brief, infers the design direction, and ships interfaces that don't look
templated. Audit-first on redesigns, strict pre-flight check.

Upstream ships eleven more skills in the same repo (`gpt-taste`,
`image-to-code`, `redesign-existing-projects`, `high-end-visual-design`,
`full-output-enforcement`, `minimalist-ui`, `industrial-brutalist-ui`,
`stitch-design-taste`, `design-taste-frontend-v1`, `imagegen-frontend-web`,
`imagegen-frontend-mobile`). Add any of them with:

```bash
npx skills add https://github.com/Leonxlnx/taste-skill --skill "<install-name>"
```

## Updating

Re-copy `skills/taste-skill/SKILL.md` from upstream over
`.claude/skills/design-taste-frontend/SKILL.md`.
