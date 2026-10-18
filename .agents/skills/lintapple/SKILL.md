---
name: lintapple
description: Check a running web UI against explicit design rules with the lintapple CLI (fonts, text sizes, contrast, control size, gaps, insets, alignment, concentric radii, viewport overflow). Use after building or changing any web interface, before saying the UI work is done.
---

# lintapple: lint the rendered UI

lintapple (gholtzap/lintapple, MIT, npm `lintapple`) loads a page in a real browser and checks it against a design policy in `ui-policy.json`. Each finding gives the rule, the element, the measured value and a suggested fix. Exit codes: `0` passed, `1` findings, `2` the check did not finish.

Requires Node.js 22 or later and a Playwright Chromium (the package depends on Playwright).

## Set up once per project

```sh
npm install -D lintapple && npx lintapple init
```

This creates `ui-policy.json` and a `lint:ui` script and keeps existing settings. Then:

- Set `fonts`, `fontSizes` and `typeRules` in `ui-policy.json` to the app's real type scale.
- Set the app URL in the `lint:ui` script (default `http://localhost:3000`).
- Set `viewports` (default phone 390x844 and desktop 1440x900) and `colorSchemes` to what the app ships.

If npm can't reach the registry in this environment, say so and stop. Don't hand-write a replacement checker.

## Run it

Start the app, then:

```sh
npm run lint:ui
npx lintapple http://localhost:3000/some-route --json      # another route, JSON report
npx lintapple http://localhost:3000 --ready '[data-app-ready]'   # wait for async pages
```

In Playwright tests:

```js
import { expectUI } from 'lintapple/playwright';
await expectUI(page, testInfo);   // fails the test on findings and attaches a JSON report
```

## Mark layout so the layout checks can run

Font, contrast, control size and screen-bounds checks need no markup. The rest need attributes:

| Attribute | Put it on |
| --- | --- |
| `data-ui-stack` | A group whose child spacing must be checked |
| `data-ui-actions` | A button group whose gaps must be checked |
| `data-ui-container` | A surface whose button insets must be checked (or list selectors in `controlContainers`) |
| `data-ui-number` | A changing number that needs equal digit widths |
| `data-ui-content` | A container whose text must stay inside its edges |
| `data-ui-align="start"` (or `center`, `end`) | A group whose marked items must align |
| `data-ui-align-item` | Each item compared in an alignment group |
| `data-ui-radius` | An outer surface with equal corner radii and insets |
| `data-ui-radius-inner` | Its direct inner surface; radius must equal outer radius minus the inset |

## Rules while fixing findings

1. Fix the interface. Don't loosen the policy, add `exceptions`, or remove contract attributes to make a check pass. Changing the design policy needs the user's request.
2. Keep elements and text inside the horizontal viewport. Fixed elements and open dialogs must also fit vertically. Let long text wrap or use a local scroll area. Don't hide overflow to cover a layout bug.
3. Normal text contrast at least 4.5:1, large text at least 3:1. Unresolved contrast findings need review; they are not passes. Check placeholders and hover and focus colors too.
4. Sentence-case sans-serif interface text. Monospace only for code, commands, JSON and identifiers. No all-caps labels or decorative status text.
5. Run the checker on every changed route and relevant state (open menus, dialogs, errors, empty states). A nonzero exit code means it has not passed.

## Reporting

The checker can't prove visual quality, wording or coverage. When you finish, say which routes, viewports and states you checked, and what is still unchecked.
