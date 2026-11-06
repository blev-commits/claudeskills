---
name: square-one-principles
description: Principles of visual design, typography, Gestalt, and motion, with procedures and checks for applying them. Use when creating, reviewing, critiquing, or refining any visual design, including interfaces, websites, slides, documents, and graphics.
---

# Square One principles

A reference of foundational design principles, including composition, typography, Gestalt, and motion, written so an AI assistant can apply them when reviewing or assisting with design work. Pair it with feedback from human designers. It is a guide for judgment, not a replacement for it.

## Before starting

Always ask these before applying any principle, unless the answers are already clear from the conversation.

1. What is the intended purpose of this page or piece, and who is it for?
2. What are the intended focal points, in order of importance?
3. Where should the viewer's eye go first, where should it move next, and where should it end up (usually an action)?
4. Is this a new design, or a review or refinement of an existing one?
5. Any fixed constraints, like a brand system, platform, accessibility requirements, or content that cannot change?

These answers decide where emphasis, hierarchy, and movement should go. Without them, principles get applied in the wrong places. If the answers are not available, state assumptions plainly before continuing. Throughout this file, "the brief" means these answers.

## When not to use

Skip this skill for purely technical, data, or copy-only tasks unless the visual design of the result is part of the request.

## Inputs

Work from the best source available. Code and design tokens are most precise, since exact values can be measured. Screenshots and images allow estimates. Descriptions alone allow only general advice, so say so.

## Procedure for creating a new design

1. Confirm purpose, focal points, and the intended path of the eye.
2. Define the structure first. Group content with proximity and common region, then set the hierarchy so the reading order matches the intended order.
3. Set up systems before details, including a spacing scale, a type scale, a small color palette, and one set of component styles.
4. Apply contrast and emphasis only to the intended focal points.
5. Set typography, including line length, line height, weight, case, and alignment.
6. Add motion last, and only where it explains change or directs attention.
7. Run the checks below on the result and fix what fails before presenting.

## Procedure for reviewing or refining an existing design

1. Confirm purpose, focal points, and the intended path of the eye.
2. Note a first impression, including where the eye lands first and what the piece seems to be for. Compare it with the intended purpose.
3. Check structure, meaning grouping, hierarchy, and reading order.
4. Check systems, meaning spacing, type, color, and component consistency.
5. Check surface details, meaning contrast, typography, and alignment.
6. Check motion, if any.
7. Report findings in the format below. When refining, change the highest-impact issues first and keep everything else as it is.

## Priorities when principles conflict

1. Accessibility and legibility
2. Clarity of purpose and focal point
3. Hierarchy and reading order
4. Consistency and unity
5. Visual interest and variety

Common tensions include unity against variety, emphasis against repetition, and symmetry against movement. Name the tension and say which side is being favored and why.

## Watch outs

- **Movement does not always mean motion.** In visual design, movement is the path the eye takes through a composition, and it applies to static images, layouts, and print. Motion principles cover things that actually animate. Do not confuse the two.
- **Contrast is not only color.** Size, weight, shape, and value create contrast too.
- **White space does not have to be white.** It is any empty space, whatever its color.
- **Rules of thumb are not laws.** Numbers in this file are starting points. Evidence from real humans using the design wins.
- **Breaking a principle can be intentional.** Asymmetry, broken patterns, and extra contrast are often the point. Ask before "fixing" them.
- **Do not stack fixes.** Changing size, color, and position together to solve one problem usually creates a new one. Change one property at a time.
- **Real size matters.** Judge type and spacing at the size they will actually be seen, on the devices they will be seen on.
- **Respect reduced motion.** When designing or reviewing animation, honor reduced-motion settings with a calmer fallback, like a short fade or no animation, and never hide essential information inside motion.
- **Some tips assume human eyes.** Tips like "squint at the layout" are written for designers. When a principle has a Check line, use that as the equivalent test.

## Quick reference

| Check | Target |
| --- | --- |
| Body text contrast | at least 4.5:1 |
| Large text and UI contrast | at least 3:1 |
| Line length, body text | about 45 to 75 characters |
| Line height, body text | about 1.4 to 1.6 |
| Line height, large headings | about 1.1 to 1.2 |
| Type scale ratio | about 1.2 dense UI, 1.33 or more editorial |
| Distinct text sizes per screen | 3 or 4 |
| Font families | 1 or 2 |
| Font weights | 2 or 3 |
| Touch targets | at least 44 by 44 points |
| Small UI motion | about 150 to 300ms |
| Feedback after input | within about 100ms |
| List stagger | about 20 to 50ms per item |

## Reporting format for reviews

1. **Context.** Restate the purpose, focal points, and intended eye path, or the assumptions made.
2. **Strengths.** What is working and should be kept.
3. **High-impact issues.** Problems with usability, clarity, or accessibility.
4. **Refinements.** Polish and consistency.
5. **Open questions.** Anything that needs more context.

An issue is **high-impact** when it blocks understanding, use, or access, like unreadable text, a missing or wrong focal point, or a confusing reading order. It is a **refinement** when it only affects polish or consistency.

Write every finding as location, then principle, then consequence, then fix. A finding without a consequence for the humans using the design is only a preference, so label it that way.

**Weak finding.** "The typography feels off."

**Strong finding.** "The plan cards (location) use two text sizes that differ by only 1px (principle [proportion]), so the price reads as a typo rather than a choice (consequence). Use one size, or make the difference at least one step on the type scale (fix)."

## 1. Visual Design

The building blocks of all visual composition. Every layout, print or screen, uses some mix of these.

### Contrast

In its simplest form, contrast refers to the difference between visual elements. It helps things stand out from each other.

- Contrast doesn't mean only color. Contrast can come from value, size, weight, and shape as well. Try to pick the one that does the job and let everything else stay calm.
- Contrast can help create emphasis, but requires consistency and unity of other elements to stand out.
- In terms of color contrast, body text needs a contrast ratio of at least 4.5:1 against its background, and large headings need 3:1. Check it with a contrast tool, since monitors vary a lot.
- If everything is high contrast, nothing stands out. Save it for the few things we should see first.

**Watch for.** Several elements competing at the same contrast level, or low-contrast text that only passes on a bright monitor.

**Check.** Compute the contrast ratio of every text and background pair from their hex values. Flag body text under 4.5:1 and large text under 3:1. List which elements carry the highest contrast and confirm they match the intended focal points.

### Balance

Balance is the distribution of the visual weight of objects, colors, texture, and space, to create a sense of stability.

- Symmetrical layouts feel formal and steady. Asymmetrical ones feel more alive, but they need something on the other side to push back.
- Big, high contrast, or saturated things are "heavy". One heavy element can be offset with empty space or a few lighter ones.
- Squint at the layout. If one side pulls our eye and nothing answers it, it's lopsided. This can still work if desired for emphasis, but make sure it's the intended effect you're going for.

**Watch for.** One side of the layout carrying most of the visual weight with nothing answering it, when lopsidedness was not the intent.

**Check.** Divide the layout into halves and quadrants. Estimate the visual weight in each by summing the area, darkness, and saturation of its elements. Flag a large imbalance unless it is intentionally creating emphasis.

### Emphasis

Emphasis occurs any time an element of a design is given complete dominance by the artist. Emphasis causes certain parts of a design to stand out as the center of attention, compared to other elements.

- Give each view one focal point. Two focal points means we have to pick, and we might pick wrong.
- Emphasis can come from size, color, isolation, or placement, and usually only one of those is needed at a time.
- In interfaces the primary action is the most common place to spend emphasis, so don't waste it on something decorative.

**Watch for.** Two or more elements fighting to be the focal point, or emphasis spent on something decorative.

**Check.** Rank elements by size, contrast, color, and isolation. The top-ranked element should be the intended focal point. If the top two are close, flag it.

### Proportion

While scale determines the size of elements in relation to a standard or expected size, proportion describes the relative size and scale of elements in relation to each other.

- Relative size is one of the fastest ways to show hierarchy. The bigger something is next to its neighbors, the more important it reads.
- Stick to a consistent ratio, like a type scale or a spacing scale, so sizes feel related instead of random.
- Two things that are almost the same size look like a mistake. If they're different, make the difference obvious.

**Watch for.** Elements that are almost, but not quite, the same size, which reads as a mistake.

**Check.** List the sizes of comparable elements. Flag pairs that differ by less than about 15%, unless they are meant to be identical.

### Hierarchy

Hierarchy refers to the arrangement of elements to show importance and structural relationships between two or more key visual points.

- Rank the content before styling it. Decide what we should see first, second, and third, then make the design say so.
- Express that order with size, weight, color, and placement; via proportion, contrast, and whitespace.
- Blur the screen a little. The order the shapes pop out in is the order human eyes will read them.

**Watch for.** Many levels that are only slightly different, or a reading order that does not match the intended order.

**Check.** Write out the order elements will likely be read, from largest and highest contrast down. Compare it with the intended order from the brief. Count the distinct text levels and flag more than 3 or 4.

### Repetition

Repetition involves repeating elements to reinforce a concept, pattern, or create a cohesive visual identity.

- Reusing the same button, card, and heading style patterns makes an interface much easier to learn and understand at a glance.
- Repetition is a big part of what makes a design or brand system recognizable.
- Repetition creates unity, but intentional variety creates emphasis, and helps make patterns recognizable in the first place.

**Watch for.** The same kind of element styled several different ways, like three button styles for one type of action.

**Check.** Group elements by role (buttons, cards, headings, links) and list the distinct styles in each group. Flag any role with more than one style that is not intentional.

### Pattern

Patterns are recurring visual arrangements that create a sense of order and predictability. A pattern is the group of elements itself, while repetition helps reinforce the pattern by displaying it repeatedly.

- A pattern is a group of elements repeated together, like a card with an image, a title, and some metadata.
- Predictable patterns let us skim. Once we've figured out one item, we've figured out all of them.
- Break a pattern only to signal that something is actually different.

**Watch for.** A repeated component that changes its internal order or spacing from one instance to the next.

**Check.** Compare repeated components side by side. Confirm the same parts appear in the same order with the same spacing.

### Rhythm

Rhythm is the repetition of elements or patterns at regular or irregular intervals, creating a sense of flow, visual connection, and hierarchy. Unlike pattern, rhythm pertains specifically to the intervals or spaces between elements.

- Consistent spacing creates a steady beat, and a spacing scale (4, 8, 16, 32) keeps that beat honest.
- A bigger gap before a new section tells us a new thought is starting.
- In long reading, rhythm comes from steady line height and paragraph spacing.

**Watch for.** Spacing values that do not follow a scale, so gaps feel random.

**Check.** List every margin, padding, and gap value. Check that they come from a small set or scale, like 4, 8, 16, 24, 32. Flag one-off values.

### White space

Whitespace, also known as negative space, is the empty areas around and between elements in a design. These do not necessarily have to be white, as the name suggests.

- Empty space is part of the design. Thanks to the Gestalt principle of proximity, elements with little space between them read as belonging together, creating a sense of unity. Add more space and they read as separate groups.
- Space can also define a common region or set a figure apart from its ground.
- Generous space around an element makes it feel more premium and more deliberate.
- Cramped layouts are exhausting to read. When it feels crowded, remove something before shrinking the spacing. Less is more.

**Watch for.** Cramped layouts, or space inside a group that is as large as the space between groups.

**Check.** For each group, compare the gap between its items with the gap to the next group. The inner gap should be clearly smaller. Flag sections where content touches or nearly touches its container.

### Unity

Unity refers to the cohesiveness of all the elements in a design, creating a sense of wholeness.

- Unity comes from making a few decisions and sticking to them, forming a pattern, like one grid, one type family, one corner radius, and one accent color.
- Count the styles in use, and make sure they aren't competing for attention. Variety is useful for emphasis, but that variety needs to serve a purpose. Too much variety usually means things are drifting.
- When the system holds together, the content gets to be the interesting part.

**Watch for.** Too many fonts, colors, corner radii, or shadows, so the design feels assembled from different sources.

**Check.** Count the distinct font families, text sizes, colors, corner radii, and shadow styles. Flag counts that seem high for the scope of the design, and any value used only once.

### Variety

Variety refers to the use of different visual elements to prevent monotony and maintain visual interest.

- Variety balances out unity. A full-bleed image, a quote, or a diagram can wake up a long page.
- Variety works through contrast. Change one property at a time, like size, shape, or color, so the variation looks intentional.
- Breaking a pattern on purpose is one of the clearest ways to use variety, but too much variety turns into noise. Use sparingly and intentionally.

**Watch for.** Either total sameness on a long page, or so much variation that nothing reads as a system.

**Check.** Note where the layout pattern changes on a long page. Confirm each change serves a purpose, like signaling a new section or pulling attention to a key point.

### Movement

Movement is the visual flow that guides the human eye through the content. It's about directing attention to different elements in a design, often leading to a single prominent focal point, or emphasis.

- Lines, direction, alignment, and even where the humans in a photo are looking all move our eye.
- Eyes will naturally follow a smooth path through continuity, travel along connecting lines, and track elements that move together through common fate. Use these intentionally.
- Plan the path of vision with purpose. Start with an entry point, make note of any intended stops along the way, and make sure the eye naturally follows through to the end.
- Movement applies to the eye's movement throughout the media, it certainly applies to motion design, but doesn't have to be taken literally. This applies to static images as well.
- Make sure you are using movement for emphasis and in harmony with the hierarchy, don't use it just for decoration.

**Watch for.** A visual path that leads the eye away from the focal point or off the page.

**Check.** Trace the likely path of the eye from the entry point through each stop to the intended action. Use lines, direction, alignment, and gaze in imagery as cues. Compare it with the intended path from the brief.

**Further reading.** [WebAIM: Contrast checker](https://webaim.org/resources/contrastchecker/), [NN/g: Principles of visual design](https://www.nngroup.com/articles/principles-visual-design/), [IxDF: Design principles](https://ixdf.org/literature/topics/design-principles), [NN/g: Visual hierarchy](https://www.nngroup.com/articles/visual-hierarchy-ux-definition/), [IxDF: Visual hierarchy](https://ixdf.org/literature/topics/visual-hierarchy), [IxDF: Repetition, pattern, and rhythm](https://ixdf.org/literature/article/repetition-pattern-and-rhythm), [UI Patterns](https://ui-patterns.com/), [NN/g: White space in form design](https://www.nngroup.com/articles/form-design-white-space/)

## 2. Typography

Most of any interface is text. These are the choices that make text easy to read and scan, as well as beautiful.

### Type scale

A type scale is a set of font sizes built from a single ratio, so every heading and body size relates to the others.

- A type scale is proportion applied to text. Pick a ratio (around 1.2 for dense interfaces, 1.33 or more for editorial work) and stick to its steps.
- A few sizes used consistently create clearer hierarchy. How many you need will depend on the project, but try to stick to no more than 3 or 4.

**Watch for.** Many text sizes that are close together, or sizes with no consistent ratio.

**Check.** List every font size in use. Calculate the ratio between consecutive sizes. Flag more than 3 or 4 sizes for a single screen, or ratios that jump around.

### Weight

Font weight is how thick or thin the strokes of a typeface are, from hairline to black. Weight is one of the simplest ways to create contrast and hierarchy within a single family.

- Two or three weights is usually plenty. Regular for reading, medium or semibold for labels and headings, and bold only where something truly needs to stand out.
- Use weight for emphasis sparingly. When everything is bold, nothing is.
- Very thin weights fall apart at small sizes and on low-contrast backgrounds. Save them for large display type.
- Changing weight can change width and shift a layout. Reserve space for the heavier weight on things like tabs and toggles.

**Watch for.** Bold used everywhere, or very thin weights at small sizes.

**Check.** List the weights in use and where. Flag more than 3 weights, bold on long passages, and weights under 400 below about 16px.

### Typeface classification

Typefaces fall into broad families based on their structure, like serif, sans serif, slab serif, monospace, script, and display. Each family carries its own tone and works best in certain roles.

- Sans serifs feel clean and neutral, which is why most interfaces use them. Serifs feel more traditional and literary.
- Monospace gives every character the same width, which keeps code, data, and tables lined up.
- Save script and display faces for large, short moments like headlines or purely stylistic elements. They can be hard to read.
- Mixing families is a form of pairing, so pick ones with enough differences to establish contrast. Font pairings that are too similar can feel like a mistake.

**Watch for.** Display or script faces used for body text, or two very similar typefaces paired together.

**Check.** Identify each typeface and its classification. Confirm display and script faces only appear in short, large text.

### Case

Case is the style of capitalization used in a piece of text, like sentence case, title case, all caps, or small caps.

- Sentence case is the easiest to read and the most friendly, which is why it works well for most interface text.
- All caps flattens the shape of words, so it slows reading. Save it for short labels, and open up the tracking a little.
- Pick one case style for each role, like buttons or headings, and stick to it so the interface feels consistent.

**Watch for.** All caps on long text, or inconsistent case across the same role.

**Check.** List the case style used for each text role. Flag all caps longer than a few words, and roles that mix case styles.

### Line length

Line length is the number of characters in a single line of text. Too long and the eye loses its place, too short and reading gets choppy.

- Aim for roughly 45 to 75 characters per line for body text.
- Set a max width on text containers instead of letting paragraphs stretch across the whole screen. Play with the arrangement of the layout and use of whitespace to establish balance.

**Watch for.** Body text stretching across the full width of a wide screen.

**Check.** Count characters per line in body text at the widest and narrowest supported widths. Flag lines under about 45 or over about 75 characters.

### Line height

Line height, also called leading, is the vertical space between lines of text.

- Body text usually reads well somewhere between 1.4 and 1.6. Big headings need less, closer to 1.1 or 1.2.
- Longer lines need a bit more line height so the eye can find its way back to the start of the next one.

**Watch for.** Body text with tight line height, or headings with loose line height.

**Check.** Divide line height by font size for each text style. Flag body text under about 1.4 or over about 1.7, and large headings over about 1.3.

### Alignment

Alignment is how lines of text line up along an edge, which affects how easily the eye finds the start of each line.

- Left-align body text in left-to-right languages. A consistent starting edge is the easiest thing to read.
- Save centered text for short lines, and avoid justified text on the web because it opens up awkward gaps.

**Watch for.** Mixed alignment within a single block, centered paragraphs, or elements that almost but do not quite line up.

**Check.** Collect the left edges of elements in each column. Flag edges that are off by only a few pixels, and centered text longer than about three lines.

### Legibility vs. readability

Legibility is how easily individual letters can be told apart. Readability is how comfortably a whole block of text can be read. A typeface can be very legible and still be set in a way that is hard to read.

- Legibility comes from the typeface itself, like a generous x-height, open shapes, and distinct characters.
- Readability comes from how the type is set, applying size, weight, line length, line height, alignment, white space, and contrast.
- Make sure to test your typography on many different screen sizes to get a feel for how it reads in a wide range of scenarios.

**Watch for.** A legible typeface set in a way that is hard to read, like small, low contrast, and long lines.

**Check.** Check legibility through the typeface (x-height, open shapes, distinct I, l, and 1). Then check readability through size, line length, line height, contrast, and spacing.

### Tracking & kerning

Tracking is the overall spacing between letters, while kerning is the space between specific pairs of letters.

- When possible, tighten big headings slightly and loosen small uppercase labels with tracking.
- Leave lowercase body text alone. Spacing it out breaks up the word shapes we rely on to read quickly.
- Depending on the type of media you're producing, applying kerning might not always be practical. When typesetting something with fewer, more prominent words or headings, it could be worth the extra effort. When applying type to a longer, text heavy site or document, it might be too tedious. Consider the application of the text and use your best judgement.

**Watch for.** Letterspaced lowercase body text, or tight tracking on small uppercase labels.

**Check.** List letter-spacing values by text style. Flag positive tracking on lowercase body text and zero or negative tracking on small all-caps labels.

### X-height

X-height is the height of lowercase letters compared to capitals. Typefaces with a taller x-height stay readable at small sizes.

- For UI and small text, pick faces with a generous x-height and open letter shapes.
- Check that look-alike characters, like I, l, and 1, are easy to tell apart.

**Watch for.** Small text set in a face with a short x-height, which becomes hard to read.

**Check.** For text under about 14px, confirm the typeface has a generous x-height. Flag faces known for small x-heights used at small sizes.

### Pairing

Pairing is combining two or more different typefaces, each with a clear job, so that they support each other instead of competing.

- Two families is usually plenty, and sometimes just one will do the trick. Not every situation requires a new font. Staying within the same font family but applying different weights, cases, and playing with tracking can make the same font feel brand new.
- Pair fonts that contrast in personality but share similar proportions, so they feel related without blending together.

**Watch for.** Two typefaces that are too similar, or more families than needed.

**Check.** Count font families. Flag more than two, and pairs that are close enough in style to look like a mistake.

**Further reading.** [Practical Typography: Point size](https://practicaltypography.com/point-size.html), [Practical Typography: Bold or italic](https://practicaltypography.com/bold-or-italic.html), [Google Fonts Knowledge](https://fonts.google.com/knowledge), [IxDF: Typography](https://ixdf.org/literature/topics/typography), [Practical Typography: All caps](https://practicaltypography.com/all-caps.html), [NN/g: All caps](https://www.nngroup.com/articles/all-caps-hard-to-read/), [Practical Typography: Line length](https://practicaltypography.com/line-length.html), [Practical Typography: Line spacing](https://practicaltypography.com/line-spacing.html), [Practical Typography: Centered text](https://practicaltypography.com/centered-text.html), [IxDF: Legibility, readability, and comprehension](https://ixdf.org/literature/article/legibility-readability-and-comprehension-making-users-read-your-words), [NN/g: Legibility, readability, and comprehension](https://www.nngroup.com/articles/legibility-readability-comprehension/), [Practical Typography: Letterspacing](https://practicaltypography.com/letterspacing.html)

## 3. Gestalt

How human brains naturally group what we see. Use these principles well and layouts make much more sense at a glance.

### Proximity

Proximity refers to how objects that are close to each other are often seen as part of a group.

- Keep the white space inside a group a little smaller than the space between groups. Use consistent margins and padding to create a sense of unity.
- Put labels right next to the fields they describe, and put actions next to the things they affect.
- Proximity often does the job by itself, so that divider line might not be needed after all. But if proximity isn't fully pulling its weight, you can lean on common region.

**Watch for.** Labels closer to the wrong field, or equal spacing everywhere so nothing groups.

**Check.** For each label and control, measure its distance to the element it belongs to and to the nearest unrelated element. The related one should be clearly closer.

### Similarity

Similarity refers to how elements that look alike, in shape, color, size, or style, are seen as related.

- Make things that behave the same, look the same, sticking to a familiar pattern humans can quickly recognize and recall.
- If two elements look alike but do different things, we will guess wrong about one of them.

**Watch for.** Elements that look the same but behave differently, or the same action styled two ways.

**Check.** Group elements by appearance, then by behavior. Flag any mismatch between the two groupings.

### Common region

Common region refers to how elements that share a clearly defined boundary are seen as a group.

- A card, a background tint, or a border creates a stronger group than proximity alone.
- Avoid boxes inside boxes. Every extra container is one more thing to parse.
- Regions work well for content that belongs together but has unavoidable variety or complexity.

**Watch for.** Boxes inside boxes, or a card used where proximity alone would do.

**Check.** Count nested containers. Flag nesting more than two levels deep, and borders or backgrounds that do not change the grouping.

### Closure

Closure refers to how the mind fills in missing pieces and sees a complete shape even when parts of it aren't there.

- Logos and icons can drop strokes and still read as whole shapes.
- A card peeking in from the edge of a carousel tells us there's more to scroll and creates a sense of continuity.
- Only leave out what the human brain can reliably fill back in.

**Watch for.** A shape or icon with so much removed that it no longer reads as intended.

**Check.** For simplified marks and partial shapes, confirm the intended shape is still the most likely reading.

### Continuity

Continuity refers to how the eye follows lines, curves, and paths, and prefers smooth continuous forms over sudden changes.

- Line items up on a shared axis so the eye can travel along them.
- Steppers, timelines, and progress bars all rely on continuity to show a sequence.
- A break in alignment creates variety, disrupts common region, and reads as the end of a group.

**Watch for.** Elements in a sequence that break alignment for no reason.

**Check.** Check that items in a sequence share an axis. Flag breaks in that axis that do not signal the end of a group.

### Figure / ground

Figure and ground refers to how we separate the thing we're looking at (the figure) from whatever sits behind it (the ground).

- Modals dim the page behind them so the dialog is clearly the thing in front.
- Shadows, elevation, and contrast all tell us which layer is on top.
- When figure and ground are ambiguous, we can't tell what we're supposed to act on.

**Watch for.** Overlays, modals, or text over images where it is unclear what is in front.

**Check.** For each layered element, confirm a clear difference in contrast, elevation, or dimming between it and what is behind it.

### Common fate

Common fate refers to how elements that move together, in the same direction or at the same speed, are seen as a group.

- You can use a combination of similarity and the principle of movement to establish common fate without the need for animation or motion.
- When designing motion, animate related items together, like selected rows sliding as one.
- Use staggered motion to subtly break apart the group, making it easier to focus on one object at a time.
- Shared hover and loading states count as common fate too.

**Watch for.** Related items that move separately, or unrelated items that move together.

**Check.** List elements that animate or change state together. Confirm each set is actually related.

### Uniform connectedness

Uniform connectedness refers to how elements connected by a line or a shared container are seen as more related than elements that aren't.

- Connecting lines beat proximity and similarity, so use them sparingly for steps, relationships, and flows.
- Tabs that visually connect to their panel read as one object.
- Too many connections turns a layout into a wiring diagram, so use only where needed.

**Watch for.** So many connecting lines that the layout reads as a wiring diagram.

**Check.** Count connecting lines. Confirm each one connects related items and that the design still reads without the extra ones.

### Prägnanz

Prägnanz, also called the law of simplicity, refers to how humans interpret complicated or ambiguous images in the simplest form possible, because that takes the least effort.

- Reduce shapes to their simplest readable form, since simple icons get recognized faster. This is especially important in logo design.
- Our brains flatten a busy layout into simple groups anyway via proximity and common region, so design those groups on purpose.

**Watch for.** Icons or shapes more complex than they need to be.

**Check.** For each icon or mark, ask whether a simpler shape would carry the same meaning. Flag detail that does not help recognition.

### Symmetry

Symmetry refers to how mirrored elements are seen as belonging together and as a stable, complete, balanced whole.

- Symmetry feels calm and trustworthy, but it can also feel uncanny. When perfect symmetry feels like too much, resort to balance.
- Mirrored layouts are easier to balance but can be harder to scan. Break up symmetry to create variety, contrast, and emphasis.

**Watch for.** Perfect symmetry that feels static or uncanny, or near-symmetry that looks like a mistake.

**Check.** Compare both halves of symmetric layouts. Flag small unintended differences.

**Further reading.** [NN/g: Proximity principle](https://www.nngroup.com/articles/gestalt-proximity/), [NN/g: Similarity principle](https://www.nngroup.com/articles/gestalt-similarity/), [NN/g: Common region](https://www.nngroup.com/articles/common-region/), [IxDF: Gestalt principles](https://ixdf.org/literature/topics/gestalt-principles), [IxDF: Figure and ground](https://ixdf.org/literature/topics/figure-ground)

## 4. Motion

The principles that bring a design to life. Great motion subtly directs, and captures our attention.

### Timing & spacing

Timing is how long an object's motion takes, and spacing is how far something travels between frames. Together they set the speed and feel of the motion.

- Small UI changes usually feel right somewhere between 150 and 300 milliseconds. Bigger moves across the screen can take a bit longer.
- At the same speed, tight spacing reads as slow and wide spacing reads as fast.
- Play around with timing and spacing in your designs until it feels right, it's not a hard science. Draw on inspiration from real life to make the motion feel alive.

**Watch for.** Interface motion that is too slow, or every animation using the same duration.

**Check.** List durations. Flag small UI transitions over about 300ms and large ones over about 500ms.

### Easing

Easing describes how something speeds up and slows down over the course of a singular motion, the way real objects do.

- Use ease-out for things coming onto the screen and ease-in for things leaving it.
- Linear motion looks mechanical, so save it for progress bars, loops, and continuous spinning.

**Watch for.** Linear motion on things that should feel physical.

**Check.** List easing curves. Flag linear easing outside of progress, loops, and continuous rotation. Confirm entering elements ease out and leaving elements ease in.

### Mass & weight

Mass and weight refers to how the way something moves tells us how heavy it is. Heavy things are slow to start and stop, and light things react fast and bounce.

- Give big surfaces like sheets and modals slower, softer motion than small things like chips and toggles.
- Try to give the sense of weight some consistency for the same kind of objects across a design.
- Create a sense of bounciness by allowing an object to overshoot its final destination before settling back in place.

**Watch for.** Large surfaces snapping around faster than small ones.

**Check.** Compare duration and easing by element size. Larger surfaces should move slower and softer.

### Anticipation

Anticipation is a small movement in the opposite direction right before the main action, which gets us ready for what's about to happen.

- A slight press-in before a button springs back, or a little pull before a swipe, signals that something is coming.
- Keep it short in interfaces so it never delays the actual response.

**Watch for.** Anticipation that delays the actual response to the input.

**Check.** Confirm visible feedback starts within about 100ms of the input, even when anticipation is used.

### Arcs

Arcs refers to how most natural movement follows a curved path instead of a straight line.

- Move elements along gentle curves when they travel a long way across the screen.
- Straight paths feel precise and technical, while arcs feel more organic.

**Watch for.** Long moves across the screen in perfectly straight lines that feel mechanical.

**Check.** For motion paths that cover large distances, note whether a gentle curve would feel more natural.

### Squash & stretch

Squash and stretch is deforming an object as it moves, stretching with speed and squashing on impact, making it feel both flexible and weighty.

- Use tiny amounts in interfaces, like a button that compresses a little when we press it.
- Try to keep the volume the same. If something gets wider, it should also get shorter.

**Watch for.** Deformation so strong that it distracts, or that changes the apparent volume.

**Check.** Confirm width and height change in opposite directions, and that the effect stays subtle in interfaces.

### Follow-through & overlap

Follow-through and overlapping action refers to how parts of an object continue moving after the main body stops, and how different parts move at slightly different rates.

- Let the content inside a panel settle a beat after the panel itself lands.
- Combined with easing, a little overshoot and settle makes motion feel lively and bouncy instead of robotic and linear.

**Watch for.** Every part of a component stopping at exactly the same moment.

**Check.** Check that child content settles slightly after its container, without long, bouncy delays.

### Exaggeration

Exaggeration is pushing a movement past what's realistic so the idea behind it comes through more clearly.

- Exaggerate and give emphasis to the moments we should remember, like a success state or a celebration.
- Most interface motion should stay subtle. Exaggeration works by creating variety when everything around remains calm.

**Watch for.** Exaggerated motion on routine interactions.

**Check.** List exaggerated animations. Confirm they are limited to moments worth remembering, like success states.

### Secondary action

Secondary action is a smaller movement that supports the main action and adds detail without stealing focus.

- Think of an icon that nudges when its button is pressed, or a badge that pulses when a count changes.
- Keep it subtle. If the secondary action pulls attention away from the main one, it's too much.

**Watch for.** Supporting motion that pulls attention from the main action.

**Check.** For each secondary animation, confirm it is smaller and shorter than the primary one.

### Offset & delay

Offset and delay refers to starting related elements at slightly different times, which creates a sequence and pattern, and shows how they relate.

- Stagger list items by 20 to 50 milliseconds as they come in so our eyes read them in order.
- Too much delay makes the whole interface feel sluggish, so keep the full sequence short.

**Watch for.** Stagger so long that the interface feels sluggish.

**Check.** Multiply the stagger by the number of items. Flag total sequences over about 500ms.

### Parenting

Parenting is linking one element's movement to another, so a child moves along with its parent while still doing its own thing.

- Keep a menu and the button that opened it moving together so we never lose the connection.
- Children should inherit the parent's motion and only add what's unique to them.

**Watch for.** Child elements that drift away from the element they belong to.

**Check.** Confirm menus, tooltips, and attached panels move with their trigger.

### Staging

Staging is presenting an idea so clearly that there's no question where to look.

- Create contrast by dimming or use a change in proximity to free up the viewer's attention and direct it back to the focal element as it animates.
- Pick one star for every transition and let everything else play backup.

**Watch for.** Several elements animating at once with no clear star.

**Check.** For each transition, identify the single focal element. Flag transitions where several unrelated elements move together.

**Further reading.** [NN/g: Animation duration and motion](https://www.nngroup.com/articles/animation-duration/), [Material Design: Easing and duration](https://m3.material.io/styles/motion/easing-and-duration/applying-easing-and-duration), [easings.net](https://easings.net/), [NN/g: Animation for attention and comprehension](https://www.nngroup.com/articles/animation-usability/), [NN/g: The role of animation and motion in UX](https://www.nngroup.com/articles/animation-and-motion-ux/)
