---
name: react-lint
description: Lint React files for hardcoded design values (colors, spacing, radii, type sizes, shadows, borders) and swap them for the project's own tokens, then trim dead imports and empty fragments. Use when the user says "react-lint", "lint the tokens", "find hardcoded colors", or "clean up this component".
---

# react-lint

Two passes over React files: **tokens** (hardcoded values to the project's design tokens) and **trim** (dead code a component carries). Report first, then fix. Change only what a pass names.

## Before you start

1. **Find the project's real tokens.** Read the stylesheet that defines them (`:root { --… }`, a tokens file, a theme object, a Tailwind config). Build the map from what's there. Never invent token names, and never use another project's names (`--space-md`, `--color-bg-primary`) unless this project defines them.
2. **Scope.** The files or folder the user named, otherwise the files changed on this branch (`git diff --name-only main...`). Skip generated, vendored and test-fixture files.

## Pass 1: tokens

Look in inline `style={{…}}` objects, style and variant maps (`const variants = { hover: { background: "#fff" } }`), styled or CSS-in-JS strings, and class-adjacent CSS the component owns.

| Value | Swap for | Only when |
| --- | --- | --- |
| Colors (`#fff`, `white`, `rgb(…)`, `rgba(…)`) | the color token with that exact value or role | the value matches a token, or its role is clear (text, surface, line) |
| Spacing (`margin`, `padding`, `gap`, `inset`) | the spacing token with that value | the project has spacing tokens |
| Radii | the radius token | the value matches |
| Font sizes and line heights | the type token | the value matches |
| Shadows and borders | the shadow or border token | the whole value matches, not part of it |

Rules:
- **Exact matches swap.** A near miss (15px when the scale has 14 and 16) is a finding to report, not a silent snap. Ask before moving it.
- **No match, no token.** List values with no token; don't create tokens unless asked.
- **Leave alone:** values inside SVG paths and viewBoxes, data and copy strings that happen to look like a value (`"12px"` in text), computed values, one-off positioning (`top: -1px` optical nudges), and anything with a comment explaining it.
- **Keep the element.** Never rename tags or wrap them (no `div` to `Box` or `Surface`) unless the project already has that component and the user asks.

## Pass 2: trim

- Remove unused imports and unused local variables, types and props.
- Collapse a fragment with one child; remove empty fragments.
- Remove commented-out code blocks (not explanatory comments).
- Remove `React` imports the JSX transform doesn't need, only if the project uses the automatic runtime.
- Don't reformat, reorder or restyle anything else.

## Check

1. Run the project's typecheck and build (or lint script if it has one). Both must pass.
2. Look at one changed screen if a dev server or preview is available: a swapped token must render the same color and size as before.
3. Run ponytail-audit on the diff if the project uses it.

## Report

One line per change, grouped by file: `path:line  old -> new`. Then the findings left for the user: near misses, values with no token, anything skipped and why. End with what was checked (typecheck, build, which screen) and what wasn't.
