# Larchmoor — design-taste-frontend output

A single-file landing page produced by running the `design-taste-frontend`
skill against an invented brief: four off-grid cabins in Glen Feshie, for
design-conscious travellers. It exists to show what the skill's rules look like
when they are actually followed, not as a template to copy.

Open `larchmoor.html` in a browser. Fonts come from Google Fonts, icons from
the Phosphor web font on jsdelivr, and photography from `picsum.photos` seeds,
so it needs a network connection.

## The reads the skill demands

- **Design read:** premium-consumer landing for design-conscious travellers,
  grounded outdoor-editorial language, native CSS and photography-led.
- **Dials:** `DESIGN_VARIANCE: 7`, `MOTION_INTENSITY: 6`, `VISUAL_DENSITY: 3`
  (the skill's Landing / premium consumer preset).

## What the rules changed

- Palette is deep pine, cool bone and marigold, chosen against the skill's ban
  on the beige/brass/oxblood family it says every premium-consumer brief
  defaults to.
- No eyebrow labels, no three-equal-card feature row, no centred hero, no
  marquee, no scroll cues, no decorative status dots.
- Zero em-dashes, which the skill treats as non-negotiable.
- Geist rather than Inter; Phosphor glyphs rather than hand-drawn SVG paths.
- Long content uses grouped clusters instead of a spec table with a rule under
  every row.
- The booking form carries labels above inputs, helper text, inline errors,
  a skeleton loader, and separate success and empty states.

## Known gaps

The images are `picsum.photos` seeds, not real photography. The skill's own
fallback rule says to name the placements when no real images are available:
the glen at first light (3:4), three cabin exteriors, weather crossing the
ridge (wide), and the lit stove interior (11:7).

Fonts load from Google Fonts by `<link>`, which the skill bans in production.
Self-host with `@font-face` before shipping anything like this for real.

Rates, the guest quote and the contact details are invented sample content.

## Published version

A variant is published as an artifact at
<https://claude.ai/artifact/T2KC5bVAV6N5BWP8FSkbgo>. It differs on purpose: the
artifact sandbox blocks external images and non-Google-Fonts stylesheets, so
that copy self-hosts a subset of the icon font and substitutes tonal colour
panels for the photographs.
