# claudeskills

Personal collection of agent skills. Sources live in `.agents/skills/` — the
`skills` CLI's universal location, readable by any agent harness — and
`.claude/skills/` holds symlinks to them, so sessions started in this repository
pick them up automatically.

**143 skills: 133 from sixteen upstream collections plus 10 of my own design skills**, plus project hooks, slash commands
and one plugin. Each collection was installed separately; this file is the single
inventory of what ended up here.

| Collection | Skills | Layout |
| --- | --- | --- |
| [leonxlnx/taste-skill](https://github.com/leonxlnx/taste-skill) — design & image generation | 12 | symlinks |
| [emilkowalski/skills](https://github.com/emilkowalski/skills), animation and design engineering | 14 | symlinks |
| [obra/superpowers](https://github.com/obra/superpowers) — development methodology | 14 | symlinks |
| [DietrichGebert/ponytail](https://github.com/DietrichGebert/ponytail) — anti-over-engineering | 6 | symlinks |
| [raphaelsalaja/skill](https://github.com/raphaelsalaja/skill), animation audit | 1 | symlinks |
| [kemiljk/skills](https://github.com/kemiljk/skills), portfolio review | 1 | symlinks |
| [coreyhaines31/marketingskills](https://github.com/coreyhaines31/marketingskills), marketing | 50 | symlinks |
| [anthropics/skills](https://github.com/anthropics/skills), frontend design | 1 | symlinks |
| [vercel-labs/agent-skills](https://github.com/vercel-labs/agent-skills), UI review and React | 5 | symlinks |
| [nextlevelbuilder/ui-ux-pro-max-skill](https://github.com/nextlevelbuilder/ui-ux-pro-max-skill), design database | 1 | symlinks |
| [bencium/bencium-claude-code-design-skill](https://github.com/bencium/bencium-claude-code-design-skill), UX designer | 2 | symlinks |
| [accesslint/claude-marketplace](https://github.com/accesslint/claude-marketplace), accessibility | 5 | symlinks |
| [pbakaus/impeccable](https://github.com/pbakaus/impeccable), design commands and anti-slop rules | 1 | symlinks |
| [google-labs-code/stitch-skills](https://github.com/google-labs-code/stitch-skills), Google Stitch | 16 | symlinks |
| [Jakubantalik/transitions.dev](https://github.com/Jakubantalik/transitions.dev), CSS transitions | 3 | symlinks |
| Own — product design workflow | 10 | symlinks |

One layout throughout: every skill lives in `.agents/skills/<name>/` with a
symlink from `.claude/skills/<name>`, and `skills-lock.json` pins the 132 upstream skills to
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

Fourteen skills from [emilkowalski/skills](https://github.com/emilkowalski/skills),
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
| `break-ui` | Feeds a component worst-case data (long names, unbreakable emails, empty states, emoji, extreme numbers), renders it behind a demo toggle, and reports what broke with the fix for each. |
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

## Animation audit, raphaelsalaja

One skill from [raphaelsalaja/skill](https://github.com/raphaelsalaja/skill).

| Skill | What it does |
| --- | --- |
| `12-principles-of-animation` | Audits animation code against Disney's 12 principles adapted for the web, and reports findings as file:line. |

---

## Portfolio review, kemiljk

One skill from [kemiljk/skills](https://github.com/kemiljk/skills).

| Skill | What it does |
| --- | --- |
| `hiring-manager-bar` | Reviews a job-seeking portfolio the way a hiring manager reads it, then recommends prioritized changes to the site's code and content. Reviews by default; only implements when asked. |

---

## Marketing, coreyhaines31

The whole collection, fifty skills from
[coreyhaines31/marketingskills](https://github.com/coreyhaines31/marketingskills).
They cover acquisition, lifecycle, content, pricing and go to market, and they
are the only non-design, non-engineering skills here.

`ab-testing`, `ad-creative`, `ads`, `ai-seo`, `analytics`, `aso`, `attribution`, `churn-prevention`, `co-marketing`, `cold-email`, `community-marketing`, `competitor-profiling`, `competitors`, `content-strategy`, `copy-editing`, `copywriting`, `cro`, `customer-research`, `directory-submissions`, `emails`, `events`, `free-tools`, `image`, `influencer-marketing`, `launch`, `lead-magnets`, `marketing-council`, `marketing-ideas`, `marketing-loops`, `marketing-plan`, `marketing-psychology`, `offers`, `onboarding`, `paywalls`, `popups`, `pricing`, `product-marketing`, `programmatic-seo`, `prospecting`, `public-relations`, `referrals`, `revops`, `sales-enablement`, `schema`, `seo-audit`, `signup`, `site-architecture`, `sms`, `social`, `video`

`seo-audit` is the one that prompted the install: crawlability, indexation,
Core Web Vitals and content quality, with reference files on hreflang and AI
writing detection. Snyk rates it medium risk, which reflects the skill telling
an agent to fetch external pages and run browser JavaScript; the content itself
is documentation and citations, and it warns that fetched pages are untrusted.

Fifty skills is a large block of descriptions in every session that loads them.
If they start pulling Claude toward marketing framing on unrelated work, the
lock file makes it easy to remove the ones that are not earning their place.

---

## Product design workflow — own

Ten skills written for this collection, not installed from upstream, so they are
not in `skills-lock.json`.

| Skill | What it does |
| --- | --- |
| `design-brief` | Turns a feature idea or ticket into a brief that defines the problem and scope before design starts. |
| `user-flow-mapper` | Maps every step, screen, and decision point of a flow. |
| `ux-pattern-finder` | Finds established UX patterns for a design problem and renders an HTML mockup of each. |
| `competitor-research` | Tears down competitor screenshots into patterns, decisions, and trade-offs. Ships a Notion teardown in `research/`. |
| `error-state-generator` | Lists the error and edge-case states a screen or flow is missing. |
| `copy-writer` | Writes UI copy: labels, errors, empty states, tooltips, confirmations. |
| `ui-feedback` | Specific, actionable critique of a UI design or screenshot. |
| `design-review-prep` | Structures talking points and anticipates questions before a design review. |
| `stakeholder-explainer` | Explains a design decision to a PM, engineer, executive, or client. |
| `handoff-notes` | Developer handoff notes: behavior, states, and edge cases not visible in Figma. |

---

## Landing pages — elayadesign

| Skill | Source (commit) | What it does |
| --- | --- | --- |
| `landing-page-design` | elayadesign/ai-design-skills (`1c1e97c`) | Builds high-converting landing pages: intake questions, page structure, conversion copy and SEO, then strict rules for type, spacing, radius, backgrounds, icons and motion. MIT. |

## UI/UX engineering — five collections

Thirteen skills added together from the picks in Snyk's
[top Claude skills for UI/UX engineers](https://snyk.io/articles/top-claude-skills-ui-ux-engineers/).
Each was copied from its upstream folder at the commit noted and pinned in `skills-lock.json`.

| Skill | Source (commit) | What it does |
| --- | --- | --- |
| `frontend-design` | anthropics/skills (`dbd4588`) | Anthropic's guide to distinctive, non-templated frontend design. |
| `web-design-guidelines` | vercel-labs/agent-skills (`063bee9`) | Reviews UI code against Vercel's Web Interface Guidelines (accessibility, UX, web best practice). Fetches the current rule list when it runs. |
| `vercel-react-best-practices` | vercel-labs/agent-skills (`063bee9`) | React and Next.js performance rules across 8 categories, ordered by impact. |
| `vercel-composition-patterns` | vercel-labs/agent-skills (`063bee9`) | Component architecture: compound components, no boolean-prop sprawl, React 19 changes. |
| `vercel-react-native-skills` | vercel-labs/agent-skills (`063bee9`) | React Native and Expo: list performance, animation, navigation, native modules. |
| `ui-ux-pro-max` | nextlevelbuilder/ui-ux-pro-max-skill (`56ea9cf`) | Searchable local design database (styles, palettes, font pairings, UX rules) through a Python CLI. Its test suite was left out. |
| `bencium-innovative-ux-designer` | bencium/bencium-claude-code-design-skill (`5de46a3`) | Ten isolated type-led directions, a human pick, then production. For work where originality matters. |
| `bencium-controlled-ux-designer` | bencium/bencium-claude-code-design-skill (`5de46a3`) | Broad UX reference that asks before each design decision. |
| `accessibility-scan` | accesslint/claude-marketplace (`2e9d733`) | One page, automated WCAG 2.2 scan over Chrome DevTools. |
| `accessibility-inspect` | accesslint/claude-marketplace (`2e9d733`) | One page, hands-on keyboard, screen-reader, reflow and motion checks. |
| `accessibility-audit` | accesslint/claude-marketplace (`2e9d733`) | Whole-site WCAG-EM audit combining scan and inspect. |
| `accessibility-fix` | accesslint/claude-marketplace (`2e9d733`) | Fixes violations with a baseline, edit, verify loop. |
| `accessibility-diff` | accesslint/claude-marketplace (`2e9d733`) | Regression check against uncommitted changes or a branch. |

The AccessLint skills call the AccessLint MCP server (`npx -y @accesslint/mcp@latest`)
and Chrome DevTools, so they only work in Claude Code with those installed. Upstream
they share `../shared/methodology.md`; here each skill carries its own copy in
`shared/` so it stands alone, and the links were updated to match.

---

## Taste, Stitch and motion — impeccable, stitch-skills, transitions.dev

Added from the "15 tools for designing with Claude" list, plus transitions.dev.

| Skill | Source (commit) | What it does |
| --- | --- | --- |
| `impeccable` | pbakaus/impeccable (`08d5b47`) | One skill, 24 commands (`polish`, `critique`, `audit`, `bolder`, `quieter`, `typeset`, `layout`, `harden` …) with reference files and anti-slop rules. Its helper script downloads a small binary from the project's GitHub releases on first use. |
| `vercel-react-view-transitions` | vercel-labs/agent-skills (`063bee9`) | React's View Transition API: route changes, shared elements, enter/exit, list reorder. |
| `transitions-dev` | Jakubantalik/transitions.dev (`7ec0b0b`) | 18 copy-ready CSS transitions (dropdowns, modals, number pop-in, success check, error shake …) with motion tokens and reduced-motion guards. |
| `transitions-polish` | Jakubantalik/transitions.dev (`7ec0b0b`) | Tunes existing motion against the transitions.dev token scale: duration, distance, scale, blur, easing. |
| `transitions-ui-generation` | Jakubantalik/transitions.dev (`7ec0b0b`) | Makes UI appear as if an agent is generating it: dotted wireframe, then reveal. |

Google's sixteen Stitch skills (`0337446`) are prefixed `stitch-` here. Upstream, nine are
named `stitch::<name>`, which isn't a valid skill name, and the rest have generic names
(`shadcn-ui`, `remotion`, `design-md`). The `name:` field was rewritten to match each
folder and the cross-links between them were updated. Most of them call the Stitch MCP
server, so they need it connected (see below); `stitch-enhance-prompt`, `stitch-site-md`,
`stitch-extract-static-html` and `stitch-extract-design-md` work on their own.

`stitch-react-components`, `stitch-react-native`, `stitch-react-vite-dashboard`,
`stitch-remotion`, `stitch-shadcn-ui`, `stitch-code-to-design`, `stitch-extract-design-md`,
`stitch-extract-static-html`, `stitch-generate-design`, `stitch-manage-design-system`,
`stitch-upload-to-stitch`, `stitch-design-md`, `stitch-enhance-prompt`, `stitch-site-md`,
`stitch-loop`, `stitch-taste-design`.

`stitch-taste-design` overlaps with taste-skill's `stitch-design-taste`; both are kept.

---

## Design MCP servers

Servers that pair with the skills above. These are not vendored; each line is how to
connect it. Keys and tokens go in your shell or the client, never in this repo.

| Server | Where it works | How to connect |
| --- | --- | --- |
| [Excalidraw](https://github.com/excalidraw/excalidraw-mcp) | claude.ai, Claude Code | claude.ai connector directory (no sign-in). Claude Code: `claude mcp add --transport http excalidraw https://mcp.excalidraw.com` |
| [tldraw](https://github.com/tldraw/tldraw) | claude.ai | claude.ai connector directory (no sign-in). The repo itself is the SDK and agent starter kit. |
| [Figma (official)](https://github.com/figma/mcp-server-guide) | claude.ai, Claude Code | claude.ai Figma connector. Claude Code: `claude mcp add --transport http figma https://mcp.figma.com/mcp` |
| [Figma-Context-MCP](https://github.com/GLips/Figma-Context-MCP) | Claude Code | `claude mcp add figma-context -- npx -y figma-developer-mcp --figma-api-key=$FIGMA_API_KEY --stdio` (Figma personal access token) |
| [cursor-talk-to-figma-mcp](https://github.com/grab/cursor-talk-to-figma-mcp) | Claude Code | `claude mcp add TalkToFigma -- bunx cursor-talk-to-figma-mcp@latest`, then run `bun socket` from a clone and open the Talk to Figma plugin in Figma |
| [Penpot](https://github.com/penpot/penpot-mcp) | Claude Code | Clone, `npm install && npm run bootstrap`, load the Penpot MCP plugin in Penpot and connect it to the local server |
| [shadcn/ui](https://ui.shadcn.com/docs/mcp) | Claude Code | In a project: `pnpm dlx shadcn@latest mcp init --client claude` |
| [21st.dev Magic](https://github.com/21st-dev/magic-mcp) | Claude Code | `npx @21st-dev/cli@latest init --client claude` with a key from [21st.dev/mcp](https://21st.dev/mcp) |
| [Storybook](https://github.com/storybookjs/addon-mcp) | Claude Code | Add `@storybook/addon-mcp` to the project's Storybook, then `claude mcp add --transport http storybook http://localhost:6006/mcp` while it runs |
| [Inspo](https://github.com/Nutlope/inspo) | Claude Code, any MCP client | `npx -y inspo-mcp install` (detects installed clients and writes their config; `--dry-run` previews), or `claude mcp add --transport http inspo https://inspomcp.dev/api/mcp`. Free, read-only: searches 800+ real websites for design reference |
| [Google Stitch](https://stitch.withgoogle.com) | Claude Code | Needed by most `stitch-*` skills. Requires a Stitch API key from your Stitch settings. |

[Onlook](https://github.com/onlook-dev/onlook) is a standalone visual editor for Next.js apps, not a skill or MCP.

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
| `SessionStart` | `run-hook.cmd impeccable-bootstrap` | Impeccable (user-level) |
| `PostToolUse`, `Stop` | `impeccable` | Impeccable (user-level) |

**The Impeccable hooks are the exception worth noting.** That skill is *not* in
this repo — it is installed at the user level (`~/.claude/skills/impeccable/`),
and only the shared hook config is version-controlled here. The `PostToolUse`
and `Stop` hooks are guarded with a file-existence check, so they silently
no-op until that install exists.

You do not have to run the install yourself. The `impeccable-bootstrap`
`SessionStart` hook does it on your first session in this repo if the skill is
missing: it runs `npx impeccable install --user` detached, so startup is never
blocked on the ~16MB download, and the detector goes live in your *next*
session rather than that one. Its log is `~/.claude/.impeccable-bootstrap/install.log`.
Set `IMPECCABLE_NO_BOOTSTRAP=1` to opt out, or run `npx impeccable install --user`
yourself to have it active immediately.

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

### Where ponytail keeps its state

The hooks are wired project-level, so they only run in this repo — and their
state is scoped to match. Everything lives in `.claude/.ponytail/`, which is
gitignored because it is per-developer runtime state, not shared configuration:

| File | Holds | Written |
| --- | --- | --- |
| `active` | current mode | every session start, and every `/ponytail <level>` |
| `statusline-nudged` | statusline nudge already shown | first session start |
| `config.json` | this checkout's default mode | `/ponytail default <level>` only |

So `/ponytail default ultra` here sets the default **for this repo**, and leaves
every other project alone. Nothing is written to `~/.claude` or `~/.config`.

This is a `LOCAL PATCH` across `ponytail-config.js`, `ponytail-runtime.js` and
`ponytail-activate.js`. Upstream keeps all three in the user's config directories,
which is right for the user-level install it was built for and wrong for hooks
vendored into one repo — a default set in a single checkout would follow you into
every other project, invisibly, since none of it shows up in `git status`.

The statusline scripts read the repo-local flag too, via the `workspace.project_dir`
Claude Code passes them on stdin, so the badge tracks the mode you set here. They
fall back to the user-level flag when there is no stdin, no `project_dir`, or no
repo-local flag.

**A user-level install is unaffected by any of this.** `getProjectStateDir()`
returns null when the hooks are not running from a checkout, so every path stays
exactly as upstream has it.

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
outside its own files.

Hooks run in a non-interactive shell, whose PATH is narrower than yours under
nvm, Homebrew on Apple Silicon or Nix — `node` being on *your* PATH does not
mean the hooks can reach it. Both installers check
(`env -i /bin/sh -c 'command -v node'`) and write the absolute interpreter path
into the hook commands when they have to, so no symlink into `/usr/local/bin`
is needed. Re-running an installer also repairs an entry that has gone stale,
such as one whose absolute path a Node upgrade moved.

It coexists with `link-skills.sh` in either order: a symlink that script already
placed is left in place rather than replaced with a copy, so the skill keeps
tracking `npx skills update`, and `--uninstall` removes only the copies this
script made. What the per-user ponytail script adds beyond linked skills is the
hooks and the `/ponytail*` commands.

### ponytail for every account on a machine

On a shared machine, to give **every** account the mode rather than each person
installing it themselves:

```bash
sudo scripts/install-ponytail-machine.sh
```

It copies the hooks to `/usr/local/share/ponytail` (root-owned, world-readable)
and registers them in Claude Code's managed settings —
`/etc/claude-code/managed-settings.json` on Linux,
`/Library/Application Support/ClaudeCode/managed-settings.json` on macOS. Other
keys in that file are left alone, and `allowManagedHooksOnly` is deliberately
not set: turning it on would silence every user and project hook on the machine.

Two things to know before running it. **Managed settings are the admin tier** —
accounts cannot remove these hooks from their own `settings.json`. They can still
opt out, since that switch is read by ponytail's own scripts rather than by
settings precedence: `PONYTAIL_DEFAULT_MODE=off`, `{"defaultMode":"off"}` in
`~/.config/ponytail/config.json`, or `/ponytail off` for one session. And
**skills and slash commands stay per-account**: Claude Code reads them from
per-account directories only, with no managed equivalent, so this installs the
hooks — which is what makes the mode persistent, since they inject the ruleset at
session start and into every subagent. An account that also wants the
`/ponytail*` commands runs the per-user script above **with `--no-hooks`**:

```bash
scripts/install-ponytail-user.sh --no-hooks
```

Claude Code runs managed and per-user hooks additively, so without that flag an
account on a machine that already has the machine-wide install runs all three
hooks twice every session — the whole ruleset injected into context twice. The
flag skips only the hook registration; the commands, skills and statusline badge
are per-account and still installed, and `--uninstall --no-hooks` reverses it.

Mode state stays per-account either way: each account's active level lives in its
own `~/.claude/.ponytail-active`. `--uninstall` removes the shared files and
unregisters the hooks, leaving those per-account files alone.

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

## Using them outside this repo

The skills load automatically in sessions started here. There are two ways to
reach every other project. Pick one: with both, Claude Code may list each skill
twice.

**claude.ai account (what I use).** Upload each skill at claude.ai → Customize →
Skills. Account skills load in cloud sessions and Cowork, and sync down to
Claude Code on every machine you sign in on, into `~/.claude/skills/synced/`
(needs Claude Code 2.1.273 or later and a `/login` session). One zip per skill,
with the skill folder at the root of the zip; the upload form takes 20 at a time:

```bash
mkdir -p /tmp/skill-zips
cd .agents/skills && for n in */; do zip -qr "/tmp/skill-zips/${n%/}.zip" "$n" -x '*.DS_Store'; done
```

**Local symlinks.** For a machine that shouldn't use account skills, or for
agents that read `~/.agents/skills` (Cursor, for one), link them into the
user-level directories:

```bash
sh scripts/link-skills.sh
```

Symlinks, so updates in this repo reach the user-level install; re-runnable,
and it leaves anything already installed alone. The links break if the clone
moves.

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

Account copies do not follow this repo. After an update, re-upload the changed
skills' zips on claude.ai, or the account keeps serving the old version.
