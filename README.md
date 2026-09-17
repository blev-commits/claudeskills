# claudeskills

Personal collection of agent skills. Sources live in `.agents/skills/` — the
`skills` CLI's universal location, readable by any agent harness — and
`.claude/skills/` holds symlinks to them, so sessions started in this repository
pick them up automatically.

**45 skills from four upstream collections**, plus project hooks, slash commands
and one plugin. Each collection was installed separately; this file is the single
inventory of what ended up here.

| Collection | Skills | Layout |
| --- | --- | --- |
| [leonxlnx/taste-skill](https://github.com/leonxlnx/taste-skill) — design & image generation | 12 | symlinks |
| [emilkowalski/skills](https://github.com/emilkowalski/skills) — animation & design engineering | 13 | symlinks |
| [obra/superpowers](https://github.com/obra/superpowers) — development methodology | 14 | symlinks |
| [DietrichGebert/ponytail](https://github.com/DietrichGebert/ponytail) — anti-over-engineering | 6 | symlinks |

One layout throughout: every skill lives in `.agents/skills/<name>/` with a
symlink from `.claude/skills/<name>`, and `skills-lock.json` pins all 45 to
their source and a content hash. taste-skill was originally copied in as real
directories, visible only to Claude Code; it was reinstalled through the CLI to
match the rest.

Skills marked **opt-in** declare `disable-model-invocation: true` — Claude will
not reach for them on its own, so invoke them by name (`/prototype`).

---

## Design & image generation — taste-skill

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

---

## Animation & design engineering — emilkowalski

Thirteen skills from [emilkowalski/skills](https://github.com/emilkowalski/skills),
installed with `npx skills@latest add emilkowalski/skills`.

| Skill | What it does |
| --- | --- |
| `emil-design-eng` | The umbrella skill: UI polish, component design, animation decisions, and the invisible details that make software feel considered. |
| `animate` | Builds a web animation from scratch, deciding in order: whether to animate at all, purpose, tool, properties, curve, duration, interruption, exit. |
| `animate-expo` | The same bar for React Native / Expo — gestures, sheets, haptics, screen transitions, keeping motion off the JS thread. |
| `review-animations` | **Opt-in.** Reviews existing motion against a strict craft bar. Defaults to flagging; approval is earned. |
| `improve-animations` | Audits all motion in a codebase and emits prioritized, self-contained plans another agent can execute. Read-only. |
| `find-animation-opportunities` | Finds places that should animate but don't — and rejects the ones that shouldn't. Read-only. |
| `animation-vocabulary` | Reverse glossary: turns "the bouncy thing when a popover opens" into the actual term, so you can ask for it precisely. |
| `apple-design` | Apple's interface and motion principles distilled from WWDC talks, translated for the web. |
| `mobile-native` | The small fixes that separate a website from an app: sticky hover, tap highlights, the 100vh bug, inputs that zoom, safe areas. |
| `pick-ui-library` | **Opt-in.** Picks a library from a curated list instead of hand-rolling a toast or installing something abandoned. |
| `prototype` | **Opt-in.** Builds several genuinely different versions of a UI piece behind a picker so you can flip through them live. |
| `ask-sonner` | Working guide to Sonner (the author's toast library): setup, styling, recipes, common fixes. |
| `write-swift` | Modern Swift — value types, Swift 6 concurrency, generics, performance, Swift Testing. |

---

## Development methodology — superpowers

Fourteen skills from [obra/superpowers](https://github.com/obra/superpowers).
These shape *how* work gets done rather than what it looks like, so several are
written to fire automatically at the relevant moment.

| Skill | What it does |
| --- | --- |
| `using-superpowers` | Entry point — establishes how to find and invoke the rest. |
| `brainstorming` | Explores intent and requirements before any creative or implementation work. |
| `writing-plans` | Turns a spec into a multi-step plan before touching code. |
| `executing-plans` | Executes a written plan in a separate session with review checkpoints. |
| `subagent-driven-development` | Executes plans with independent tasks in the current session. |
| `dispatching-parallel-agents` | For 2+ independent tasks with no shared state or ordering. |
| `test-driven-development` | Tests before implementation, for features and bugfixes. |
| `systematic-debugging` | Root-causes a bug or test failure before proposing fixes. |
| `verification-before-completion` | Requires running verification and reading output before claiming done. |
| `requesting-code-review` | Verifies work against requirements before merging. |
| `receiving-code-review` | Handles review feedback with technical rigor rather than reflexive agreement. |
| `finishing-a-development-branch` | Decides how to integrate work once tests pass. |
| `using-git-worktrees` | Ensures an isolated workspace before feature work. |
| `writing-skills` | Creating, editing, and verifying skills themselves. |

---

## Anti-over-engineering — ponytail

Six skills from [DietrichGebert/ponytail](https://github.com/DietrichGebert/ponytail).
A persistent mode plus one-shot tools that push toward the smallest thing that works.

| Skill | What it does |
| --- | --- |
| `ponytail` | The mode. Forces the laziest solution that actually works — questions whether the task needs to exist (YAGNI), reaches for stdlib over dependencies. |
| `ponytail-review` | Reviews a diff exclusively for over-engineering: reinvented stdlib, speculative abstractions, dead flexibility. |
| `ponytail-audit` | Same lens across the whole repo — a ranked list of what to delete or simplify. |
| `ponytail-debt` | Harvests `ponytail:` comments into a debt ledger so deliberate shortcuts get tracked. |
| `ponytail-gain` | One-shot scoreboard of ponytail's measured impact. |
| `ponytail-help` | Quick-reference card for ponytail modes and commands. |

---

## Overlaps worth knowing

Four collections installed independently means some skills compete. Name the one
you want rather than assuming Claude picks correctly:

- **Aesthetic direction is exclusive, not layered.** `minimalist-ui`,
  `industrial-brutalist-ui`, and `high-end-visual-design` pull in opposite
  directions. So do `design-taste-frontend` and `gpt-taste` (same job, different
  strictness).
- **Two design philosophies.** `design-taste-frontend` (taste-skill) and
  `emil-design-eng` (emilkowalski) both claim general frontend design taste.
  The first is brief-driven and layout-focused; the second is polish- and
  motion-focused.
- **Two review lenses.** `ponytail-review` hunts over-engineering,
  `review-animations` hunts motion craft, and the `code-review` plugin hunts
  correctness. They do not overlap in findings, but all three answer "review this".
- **Restraint vs. maximalism.** `ponytail` pushes for the smallest solution;
  the taste and animation skills add polish and motion. Running both at once
  sends mixed signals — pick per task.
- `design-taste-frontend` is large (~87 KB, ~1,200 lines); most others range from
  8 KB to 44 KB.

## Hooks, commands and plugins

`.claude/settings.json` wires up hooks from several collections. They coexist —
each is additive and independently guarded:

| Event | Hook | From |
| --- | --- | --- |
| `SessionStart` | `run-hook.cmd session-start` | superpowers |
| `SessionStart` | `ponytail-activate.js` | ponytail |
| `SubagentStart` | `ponytail-subagent.js` | ponytail |
| `UserPromptSubmit` | `ponytail-mode-tracker.js` | ponytail |
| `PostToolUse`, `Stop` | `impeccable` | Impeccable (user-level) |

**The Impeccable hooks are the exception worth noting.** That skill is *not* in
this repo — it is installed at the user level (`~/.claude/skills/impeccable/`).
The hooks are guarded with a file-existence check, so they silently no-op for
anyone who hasn't installed it separately. Only the shared hook config is
version-controlled here.

Slash commands live in `.claude/commands/` (ponytail).

### The statusline badge, and one local patch to ponytail

The `[PONYTAIL]` / `[PONYTAIL:ULTRA]` badge is wired by
`scripts/install-ponytail-user.sh` at user level, not here — it points at the
copy of the script the installer places in `$CLAUDE_CONFIG_DIR`. A `statusLine`
you set yourself is never overwritten, and an uninstall removes only ponytail's.

**`.claude/hooks/ponytail-activate.js` deliberately differs from upstream.** Every
other vendored ponytail file is byte-identical to `DietrichGebert/ponytail`; this
one carries two changes marked `LOCAL PATCH` in the source. Re-vendoring ponytail
will revert them, so re-apply them.

Upstream, these hooks run from a plugin directory Claude Code owns, so
`__dirname` is stable and offering it as a global `statusLine` command is
harmless. Vendored into this repo, `__dirname` is a branch-switchable git working
tree — and the hook's setup nudge asked for that path to be added to the
**global** `~/.claude/settings.json`, where it would run on every statusline
render in every project. Checking out a branch that changed that script would
change what executes machine-wide.

The patch makes the hook detect that it is running from a working tree and point
at the installer instead of handing out the path, and lets a project-level
`statusLine` count as already-configured. Upstream's documented escape hatch is
not usable: `PONYTAIL_HIDE_STATUS` is read by `getHideStatus()` in
`ponytail-config.js`, which nothing calls.

An installed copy is unaffected — `$CLAUDE_CONFIG_DIR/hooks` is not a working
tree, so the hook behaves exactly as upstream intends there.

### ponytail in every project

The wiring above is project-level: ponytail is active when you work in this repo
and nowhere else. To install it for your user instead — every project on the
machine — run:

```bash
scripts/install-ponytail-user.sh
```

It copies ponytail's skills, hooks and commands into `$CLAUDE_CONFIG_DIR` (or
`~/.claude`) and adds the same three hook entries to that directory's
`settings.json`, leaving your own hooks and preferences untouched. Re-running it
is safe; `--uninstall` reverses it, including the mode flag ponytail writes
outside its own files. It needs `node` on the non-interactive shell's PATH — the
shell that runs hooks, not your interactive one.

### Plugin

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

## Examples

`examples/design-taste-frontend/` holds a landing page built by running
`design-taste-frontend` against an invented brief, with a note on which of the
skill's rules visibly changed the output. One file, opens in a browser.

## Updating

Every collection is tracked in `skills-lock.json`, so the CLI can refresh them
in place:

```bash
npx skills@latest update            # all skills
npx skills@latest update <name>     # one skill
```

To add a skill, install it to both locations so it stays available to every
agent, not just Claude Code. Repeat the flags per value — the CLI does not
accept comma-separated lists:

```bash
npx skills@latest add <owner>/<repo> -s <install-name> -a universal -a claude-code
```

Install names are the `name:` field in a skill's frontmatter, which is not
always its upstream folder name.
