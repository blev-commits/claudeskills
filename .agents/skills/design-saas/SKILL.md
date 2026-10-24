---
name: design-saas
description: "S-tier SaaS analytics dashboards and premium, non-Excel chart styling for sports, entertainment and gaming products, across web and mobile (React and React Native). Use when building or reviewing dashboards, scoreboards, KPI cards, live metrics or Chart.js charts, or when charts look flat, generic or default. Trigger on: 'design a dashboard', 'make these charts better', 'analytics UI', 'live stats', 'scoreboard widget', 'chart styling', 'design SaaS'."
---

# Sports, Entertainment & Gaming Analytics UI System (Cross-Platform)

Enforces S-tier, high-fidelity SaaS dashboard layouts and premium, modern Chart.js visual styles across Web and Mobile.

> If the project already has its own design system or brand tokens, those win over the palette and tokens below. Apply the rest of this skill (layout hierarchy, chart craft, multi-state coverage) inside that brand.

## 👥 The Industry Lens
When writing or reviewing code, apply these synchronized execution strategies:
1. **The Live-Feed Anchor:** Sports and gaming data moves fast. Optimize layout hierarchy so real-time metrics (e.g., active viewers, concurrent players, ticket run-rates) stand out immediately.
2. **The Media Mixologist:** Balance raw numeric charts with rich media assets (team logos, game cover art, creator avatars). If an asset fails to load, always provide an elegant fallback.
3. **The Cross-Platform Architect:** Keep business logic, chart configurations, and data parsers platform-agnostic. Isolate platform-specific layout wrappers clearly (Web components vs. Native views).

## 🧭 Architectural Self-Discovery Protocol
If you (Claude) are missing context about the repository setup, you must run this quick discovery step during your first code generation. Present these 2 specific questions cleanly to the user to calibrate your code style:
1. *"Are we using a Monorepo setup (like Turborepo) where Web and Native share a shared `packages/ui` folder, or are these completely separate repositories?"*
2. *"For the mobile app, are we using Expo or bare React Native CLI?"*
*Once answered, document the response in memory or append it to the bottom of this file as local metadata.*

## 🎨 Premium Chart Aesthetics (Anti-Excel Rules)
You must strictly ban generic, flat, default Chart.js styling. All charts must look like premium dark-mode or hyper-modern SaaS platforms (e.g., Linear, Vercel, or gaming HUDs). Enforce these strict aesthetic tokens:
- **Gradients & Glows:** For Line charts, always implement a clean vertical gradient fill under the line (e.g., 15% opacity neon purple/emerald fading to 0% at the bottom). For Bar charts, use subtle pill-shaped corner rounding (`borderRadius: 4` or higher).
- **Lines & Tension:** Never use rigid, jagged lines. Always apply a smooth tension (`tension: 0.4` or `0.35`) to line paths. Line widths must be crisp but substantial (`borderWidth: 2` or `3`).
- **Minimalist Grid Systems:** Excel layouts fail due to dark, heavy grid lines. Set grid lines to be incredibly faint (`rgba(255,255,255,0.04)` or `#E2E8F0` at low opacity) or hide them entirely on the X-axis (`grid: { display: false }`).
- **Interactive Points:** Hide default data points on lines (`pointRadius: 0`). Only reveal a styled, glowing point on hover (`pointHoverRadius: 6`, `pointHoverBackgroundColor: '#FFF'`, with a thick border color matching the line).
- **The Gaming Color Palette:** Use vibrant, high-energy neon color arrays optimized for entertainment/gaming data:
  - *Primary Metrics:* Electric Violet (`#8B5CF6`) or Cyber Teal (`#06B6D4`)
  - *Growth/Live Feeds:* Neon Emerald (`#10B981`)
  - *High Engagement / Hot Streaks:* Hot Coral / Crimson (`#F43F5E`)

## 🎨 Token & Layout Translation
Maintain a unified visual design language across platforms by translating web systems directly to native equivalents:
- **Web (Tailwind):** Base grid is 4px. Use `p-3` (12px), `p-6` (24px), `rounded-lg` (8px), `rounded-xl` (12px). Text components use `font-mono` or `tabular-nums` for live data.
- **Native (StyleSheet):** Mirror with numeric constants: `padding: 12` or `padding: 24`, `borderRadius: 8` or `borderRadius: 12`. Numeric metrics must use `fontVariant: ['tabular-nums']` to stop font jitter on live updates.
- **Themes:** Use deep slate/neutral bases (e.g., `#0F172A`) rather than stark black. Use crisp high-energy accents cleanly against deep backdrops.

## 🛑 Common Cross-Platform Anti-Patterns (Banned Behavior)
- **NO Native Dom Pollution:** Never inject HTML tags (`div`, `span`, `p`) into React Native code, or React Native components (`View`, `Text`) into Web code. 
- **NO Chart Overcrowding:** On mobile screens (React Native), clamp maximum visible x-axis labels to 4-5 items or enforce horizontal scrolling wrappers. Never let data labels collide or overlap.
- **NO Raw Re-renders:** Prevent full chart canvas rebuilds on every streaming metric tick. Memoize data objects (`useMemo`) and chart options to avoid flickering canvas visual refreshes.

## 🔄 Mandatory Multi-State Coverage
Every data visualizer, scoreboard widget, or analytics layout you output must explicitly accommodate:
1. **Populated State:** Densely arranged data, formatted sparklines, relative timestamps ("2m ago"), and robust string truncation for overflowing team/stream names.
2. **Skeleton State:** Pulsing placeholder layout cards matching the exact layout structure. For charts, render a generic, hardcoded muted line path skeleton while data fetches.
3. **Empty State:** Clean typography explaining why data is absent, combined with a direct setup action button (e.g., "Connect Twitch API", "Sync StubHub Feed").
4. **Error/Disconnect State:** High-visibility error icons, clear text specifying whether display data is cached/stale, and a functional retry trigger.

## 📝 Self-Evaluation Checklist
Before outputting any frontend code block, silently cross-check against these rules:
- [ ] Did I explicitly inject a canvas gradient overlay or rounded border layout to avoid flat, boring "Excel-like" charts?
- [ ] Are Web components using responsive containers with `maintainAspectRatio: false` to stop canvas scaling issues?
- [ ] Are mobile-view datasets using `fontVariant: ['tabular-nums']` to stop text layout jitter during live score/view updates?
- [ ] Is chart logic structurally decoupled from layout components to support quick porting between Web and Native apps?
- [ ] Are Chart.js options memoized to prevent infinite canvas re-render cycles?
