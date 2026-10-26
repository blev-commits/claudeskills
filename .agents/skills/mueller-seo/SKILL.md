---
name: mueller-seo
description: Make SEO, indexing, structured data, AI search and tracking decisions grounded in Google's docs and John Mueller's (u/johnmu) guidance, with myths flagged.
---

# Mueller SEO

Use this whenever a project needs an SEO or search-tracking decision. Sitemaps, robots, canonicals, schema, content changes, migrations, AI search visibility, analytics setup, traffic drops. It all lands here.

The point is simple. Make the call Google would back, say how confident you are, and kill myths before they cost time.

## How to answer

1. Name the decision in one line.
2. Give the recommendation first. No hedging preamble.
3. Tag the evidence level for each claim.
   - **Documented** means it's in Google Search Central docs.
   - **Mueller** means John Mueller (or Gary Illyes, Danny Sullivan, Martin Splitt) said it publicly on Reddit, Bluesky, X or Search Off the Record.
   - **Industry belief** means common SEO lore with no Google confirmation.
   - **Unknown** means nobody outside Google knows. Say so.
4. Say what to do, what to skip, and what to measure afterward.
5. For anything time sensitive (rich result eligibility, Search Console features, AI Overviews and AI Mode behavior, recent updates), search developers.google.com/search and recent Search Engine Roundtable or Search Engine Journal coverage before asserting. Google changes these often. This file can go stale.

## Mueller's recurring principles

These show up in his answers again and again. Use them as the tiebreaker.

- **It depends, so look at your own data.** He pushes people to check real usage and real logs instead of generic advice. "Ymmv" is a real answer.
- **Build for users, not for a signal.** If a change only exists to game one factor, it's probably wasted or risky.
- **No shortcuts.** PBNs, link schemes, spun or fluffy content, fake freshness. He treats all of it as a dead end.
- **Patience.** Recovery after an update or a fix takes months, not days. Disavow and site moves also settle slowly.
- **SEO can't fix a weak product or site.** Sometimes the honest answer is that SEO won't help.
- **Urgency is a red flag.** New acronyms sold with a hard push usually mean spam or a scam.
- **Learn the fundamentals.** HTML, how crawling works, how rendering works. Most bad SEO calls come from skipping this.

## Crawling and indexing

- robots.txt controls crawling, not indexing. A blocked URL can still get indexed from links. **Documented**
- To keep a page out of the index, use `noindex` and let Google crawl it. Never block a noindexed page in robots.txt or Google won't see the tag. **Documented**
- `noindex` inside robots.txt is unsupported (since 2019). **Documented**
- `rel=canonical` is a hint, not a directive. Google weighs it with redirects, internal links and sitemaps. Keep those signals consistent. **Documented**
- 404s and 410s are normal. They don't hurt the rest of the site. Don't redirect every dead URL to the homepage, that becomes a soft 404. **Documented / Mueller**
- Keep 301s in place for at least a year on migrations, longer if links point at the old URLs. **Mueller**
- Crawl budget only matters for very large or very fast-changing sites (roughly a million plus pages, or tens of thousands changing daily). Small sites should ignore it. **Documented**
- JavaScript sites can be indexed, but server rendering or static output removes a whole class of risk. Check with URL Inspection's rendered HTML. **Documented**
- `rel=next/prev` isn't used for indexing. **Documented**
- Internal linking is one of the strongest levers you fully control. **Mueller**

### Sitemaps

- Only include canonical, indexable URLs.
- Use `lastmod` only when the date reflects a real content change. Uniform or fake dates get ignored. **Mueller**
- Skip `priority` and `changefreq`. Google ignores both. **Documented**
- Don't add dynamic parameters to force a fresh sitemap daily. It's counterproductive. **Mueller**
- A sitemap helps discovery. It doesn't guarantee indexing.

## Content

- No ideal word count. Length should match the query. **Mueller**
- Don't bump dates or add the year to titles without real updates. He has called that a low-quality signal. **Mueller**
- Keyword density isn't a thing. Write naturally and cover the topic. **Mueller**
- Don't delete pages just because they get little traffic. If they're useful and accurate, keep them. Prune what's thin, outdated or duplicated. **Mueller**
- AI-assisted content is fine if it's genuinely helpful. Mass-produced pages made to rank violate the scaled content abuse policy no matter how they were made. **Documented**
- Titles and meta descriptions can be rewritten by Google. Write them well anyway since they still shape the snippet most of the time. **Documented**

## Technical myths to shut down

- Meta keywords are ignored. **Documented**
- Geotagging images does nothing for SEO. **Mueller**
- W3C validation, text-to-HTML ratio and exact-match domains aren't ranking levers. **Mueller**
- PageSpeed Insights scores fluctuate with no site changes. Use field data (CrUX / Core Web Vitals report), not one lab score. **Mueller**
- Core Web Vitals matter, but past "good" there's little to gain. Don't trade content or UX for a few points. **Mueller**
- Subdomain vs subfolder rarely matters on its own. Pick what fits the setup and keep it consistent. **Mueller**
- TLD choice (.com vs .io vs .design) doesn't affect ranking outside country-code targeting. **Mueller**

## Analytics, user signals and other channels

- Google Analytics data isn't used for ranking. Mueller said so in 2020 and again in 2022 ("We don't use that at all"). **Mueller**
- Bounce rate and time on site are useful for you, not for Google. Don't optimize them as ranking levers. **Mueller**
- Chrome browsing data isn't used for ranking, with one exception. The Chrome UX Report (opted-in, aggregated field data) feeds page experience and Core Web Vitals. **Mueller**
- Clicks and interactions inside Google's own results are a different thing. DOJ trial testimony in 2023 confirmed systems like Navboost use that data. Don't conflate it with GA or on-site metrics, and don't try to fake it. **Documented (court record)**
- Running Google Ads doesn't help or hurt organic rankings. The two are kept separate. **Mueller**
- Social shares and likes aren't ranking signals. Social is still a fine way to test whether content resonates and to earn real links. **Mueller**
- Site speed counts but never outranks relevance. Fix content first, then speed. **Mueller**
- When a Googler says a signal isn't used and no patent, paper or court record contradicts it, trust the Googler over SEO lore.

## Structured data

- Structured data doesn't directly boost rankings. It makes pages eligible for rich results. **Documented**
- Only types listed in Google's search gallery earn rich results. Other schema.org types are fine for other consumers but won't change Google's display. **Documented**
- FAQ rich results only show for well-known authoritative government and health sites (since 2023). HowTo rich results were removed. **Documented**
- Markup must match visible content. Mismatches risk a manual action. **Documented**
- Validate with the Rich Results Test, then watch the Search Console enhancement reports.

## Links

- Don't buy links or trade them at scale. Don't use PBNs. **Documented / Mueller**
- Earned coverage and digital PR are fine. He's spoken positively about it. **Mueller**
- Most sites never need a disavow file. Use it for a manual action or a known paid-link history you can't remove. **Mueller**
- When you do disavow, the Search Console links report is enough to work from. **Mueller**
- Random spammy links pointing at you are usually ignored by Google already. **Mueller**

## AI search (AI Overviews, AI Mode, LLMs)

- Google's stance is that good SEO covers its AI features. AI Overviews and AI Mode pull from the same index. No special markup earns inclusion. **Documented / Mueller**
- llms.txt isn't used by Google. Keep it only as a harmless aid for agents if you want. **Mueller**
- What you call it (SEO, GEO, AEO) matters less than how your audience actually behaves. Check what share of real traffic comes from AI tools before investing. **Mueller**
- Other engines (ChatGPT, Perplexity, Claude) aren't covered by Google's advice. Treat claims about them as **Industry belief** or **Unknown** unless the vendor documents it.
- Google-Extended controls use for Gemini training, not inclusion in Search. **Documented**

## International

- hreflang needs return links on every page in the set and should point at canonical URLs. **Documented**
- Don't auto-redirect by IP. Googlebot mostly crawls from the US and may never see other versions. **Documented / Mueller**

## Tracking and measurement

### Setup

- Verify Search Console as a Domain property so every protocol and subdomain is covered.
- Submit the sitemap there. Connect GA4 if you use it.
- Annotate every meaningful change (deploys, migrations, content pushes, Google updates). Without dates you can't read the data later.
- Capture a baseline before any change. Four weeks minimum, longer for seasonal sites.
- Keep server logs if you can. Mueller repeatedly points people to logs for crawl questions.

### Reading the data

- Search Console is the source of truth for Google search performance. GA4 will never match it exactly (different counting, consent banners, bots, attribution). Expect the gap. Don't chase it.
- The most recent day is often partial. Refresh it on the next pull. **Mueller**
- Rare queries are anonymized, so query totals won't add up to page totals. **Documented**
- Average position is an average across every impression. Read it alongside clicks and impressions, never alone.
- AI Overviews and AI Mode impressions and position in Search Console are a moving target. Google says the counting will change as the features change. Treat it as a directional series, not a fixed baseline. **Mueller**
- Daily swings are noise. Compare week over week or against the same period last year.
- Rank trackers show one location, one device, one moment. Use them for trends, not truth.

### Diagnosing a drop

1. Check whether it's real. Tracking changes, consent tools and GA4 config break more often than rankings do.
2. Check Search Console for manual actions, security issues and indexing coverage.
3. Line it up with known Google update dates and your own deploy log.
4. Split by page type, query type and device to find where it actually fell.
5. If it's an update, improve the site overall. Don't patch one signal. Expect months before it shows.

## Red flags in any recommendation

Push back when you see these.

- Guaranteed rankings or a fixed timeline
- A new acronym sold with urgency
- Fake freshness, date bumping or mass page generation
- Link packages, PBNs or guest posts bought at scale
- Schema types Google doesn't support being sold as a ranking boost
- "Optimize for X signal" with no user benefit
- Any claim backed only by "Google said once" with no source

## Output format

Keep it tight. Recommendation, evidence tags, what to measure. Add a short Sources list with links to Google docs or the specific Mueller post when you used one. If a claim can't be sourced, label it **Industry belief** or **Unknown** rather than stating it as fact.
