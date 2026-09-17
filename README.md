# claudeskills

Personal collection of agent skills, 39 in total, from three upstream
collections.

Skill sources live in `.agents/skills/` — the `skills` CLI's universal location,
which any agent harness that reads it can pick up. `.claude/skills/` holds
symlinks to them, so Claude Code sessions started in this repository load them
automatically. `skills-lock.json` pins every skill to its source and a content
hash, so `npx skills update` can refresh them.

## Installed skills

### Taste skills

Twelve skills from [leonxlnx/taste-skill](https://github.com/leonxlnx/taste-skill)
(commit `e79ca9e`) — everything except `taste-skill-v1`, which duplicates the v2
default and was deliberately left out. Directory names match each skill's install name — the `name:`
field in its frontmatter, not the upstream folder name.

#### Implementation skills (output code)

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

#### Image-generation skills (output reference images only, no code)

| Skill | Upstream folder | What it does |
| --- | --- | --- |
| `imagegen-frontend-web` | `imagegen-frontend-web` | Website comps — one horizontal image per section, consistent palette across the set. |
| `imagegen-frontend-mobile` | `imagegen-frontend-mobile` | iOS / Android / cross-platform screens and flows in phone mockups. |
| `brandkit` | `brandkit` | Brand-guideline boards, logo systems, identity decks, visual-world presentations. |

#### Notes

- The aesthetic skills are alternatives, not layers — `minimalist-ui`,
  `industrial-brutalist-ui`, and `high-end-visual-design` pull in opposite
  directions. Name the one you want for a given job.
- `design-taste-frontend` is large (~87 KB, ~1,200 lines); the rest range from
  8 KB to 44 KB.

### Superpowers

Fourteen skills from [obra/superpowers](https://github.com/obra/superpowers) — a
development methodology rather than a design one: spec-first brainstorming,
red/green TDD, systematic debugging, plan writing and execution, subagent-driven
development, code review on both ends, git worktrees, and verification before
claiming completion.

`brainstorming`, `dispatching-parallel-agents`, `executing-plans`,
`finishing-a-development-branch`, `receiving-code-review`,
`requesting-code-review`, `subagent-driven-development`, `systematic-debugging`,
`test-driven-development`, `using-git-worktrees`, `using-superpowers`,
`verification-before-completion`, `writing-plans`, `writing-skills`

Installed as plain skills, not as the upstream Claude Code plugin, so invoke
them by bare name (`brainstorming`) — the skill text itself refers to them as
`superpowers:<name>`.

### Animation and frontend craft

Thirteen skills from [emilkowalski/skills](https://github.com/emilkowalski/skills)
— building and reviewing web and React Native motion, Apple-style interaction
design, mobile web polish, Sonner, UI library choice, and modern Swift.

`animate`, `animate-expo`, `animation-vocabulary`, `apple-design`, `ask-sonner`,
`emil-design-eng`, `find-animation-opportunities`, `improve-animations`,
`mobile-native`, `pick-ui-library`, `prototype`, `review-animations`,
`write-swift`

## Hooks

`.claude/hooks/session-start` injects the full `using-superpowers` skill as
session context on startup, clear, and compact, so the methodology loads up
front instead of waiting for a skill description to match. It is wired up in
`.claude/settings.json` and ported from the superpowers plugin's own
SessionStart hook, adapted to read the skill from this repo rather than from a
plugin root. `run-hook.cmd` beside it is upstream's cross-platform wrapper.

Claude Code will not run a project hook until you approve it — review it with
`/hooks`.

## Plugins

[`code-review`](https://github.com/anthropics/claude-code/tree/main/plugins/code-review)
from the `claude-code-plugins` marketplace (`anthropics/claude-code`) is enabled for this
project in `.claude/settings.json`. It adds a `/code-review:code-review` command that runs
parallel review agents over a pull request and filters findings below an 80 confidence score.

Marketplaces declared in project settings are added automatically once you trust the folder,
but a plugin from an external source is not auto-installed. If Claude Code reports it as not
installed, run:

```bash
claude plugin install code-review@claude-code-plugins
```

## Updating

Every skill is tracked in `skills-lock.json`, so the CLI can refresh them:

```bash
npx skills update            # all skills
npx skills update <name>     # one skill
```

To add a skill, install it to both locations so it stays available to every
agent, not just Claude Code — repeat the flags, the CLI does not accept
comma-separated lists:

```bash
npx skills add <owner>/<repo> -s <install-name> -a universal -a claude-code
```

Install names are the `name:` field in a skill's frontmatter, which is not
always its upstream folder name.
