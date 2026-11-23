# Company Research: Carousell Group

Last verified: 2026-11-22
Scope: shared company intelligence for all Carousell Group roles (reuse for later openings within 30 days).

## 1. Fundamentals & Business Model

- Multi-category classifieds and recommerce marketplace for secondhand goods in Greater Southeast Asia, founded August 2012 in Singapore.
- Operates in seven markets under the brands Carousell, Carousell Media Group, Cho Tot (Vietnam), Laku6 (Indonesia, refurbished electronics), LuxLexicon (luxury), Mudah.my (Malaysia), OneShift (jobs), REFASH (fashion), Revo Financial (financing).
- Revenue surfaces: promoted listings and monetisation products, Carousell Media Group advertising, recommerce and inspection businesses (Laku6, REFASH, LuxLexicon), and financing (Revo Financial).
- Investors: Telenor Group, Rakuten Ventures, Naver, STIC Investments, 500 Global, Peak XV Partners (formerly Sequoia Capital India).
- 13-year-old platform per Google Cloud case study; Android app carries 10M+ installs, 4.1 stars, 380K reviews on Google Play.
- Stated culture acronym: HEART (Humility, Empathy, Accountability, Relentlessly resourceful, Teamwork).

## 2. Engineering & Product Signals (2025-2026)

- Google Cloud case study (current): Gemini-powered "List with AI" in the Sell Form raised items listed per seller by 20% and cut median listing time to under two minutes. Translation workflow built on the Gemini API automates 90% of translation needs. BigQuery plus Vertex AI compressed data model iteration from weeks to days.
- Infrastructure migration: moved core compute from N2D to C3D Compute Engine instances; the migration cut the on-call burden on that cluster to zero and reduced cluster cost by about 10%. Prior state: N2D instability consumed nearly 30% of the on-call infrastructure team's time.
- Quote: Rajath Ramesh, Group Director, Product and Platform Engineering ("From our early days, our focus was on having a stable, scalable cloud platform").
- Asynchronous messaging platform (Carousell Insider, September 2026): about a billion messages per month, roughly 5,000 messages per second at peak, p99 around 458ms, covering 120+ microservices behind a single API surface.
- Search: Elasticsearch with dense-vector relevance for the Spotlight internal search product; hybrid keyword plus embedding ranking.
- Android engineering history: app moved from Java to Kotlin (engineering "Then and Now" retrospective), a dynamic server-driven UI system built across 2018-2019, and a 2021 browse-page refactor that extracted reusable listing-card and filter state out of duplicated browse fragments.
- Mobile web: PWA rebuild delivered a 3x faster mobile web experience (2018 retrospective), showing a pattern of measured performance bets.

## 3. Android-Specific Context

- Bengaluru is an active engineering hub: current Carousell Group listings there include Lead Software Engineer, Senior Software Engineer - Android (Trust Engineering), and this Android Engineer Intern role in Engineering - Core Marketplace.
- The intern JD repeats "analyze and optimize performance and reliability of the Android app" twice, which signals that app health (frame timing, crash-free rate, ANR) is a live concern rather than boilerplate.
- Trust Engineering Android work centres on authentication and transaction safety in the marketplace app, adjacent to the Core Marketplace team that owns browse, search, listing, and chat surfaces.
- Mobile engineers publicly describe owning end-to-end Android and iOS SDK work with 99.5%+ crash-free targets, and code review standards as a lever on production defects.

## 4. Hiring Process Signals

- Public job-board restatements of the intern posting (JobGrid, Veyrai, SmartRecruiters) consistently list: Kotlin Android experience, strong CS fundamentals, Android framework/design patterns, shipped stable high-performance apps, stakeholder collaboration, and UX empathy.
- JobGrid restatement lists eligibility for 2024 and 2026 batches and calls out Kotlin/Java, product collaboration, and feature ownership.
- No public Glassdoor detail specific to this intern loop was retrievable (Exa rate limits and Medium 403s during research); treat the interview loop as unknown and assume a Kotlin/Android fundamentals screen plus a discussion of shipped apps.

## 5. Pain Points & Unassigned Gaps

1. Feed and listing-card rendering performance at scale: 10M+ installs, image-heavy cards, and a browse refactor that already moved card state into shared components.
2. Crash and ANR triage across a multi-brand codebase lineage (Carousell, Mudah.my, Cho Tot), where a single regression propagates to several markets.
3. Parity between Android, iOS, and mobile web for server-driven UI components, given the long-running dynamic UI system.
4. Sell Form complexity: 13 years of added attributes made the listing form heavy, and the AI listing flow now has to keep the client responsive while media uploads and model calls run.
5. Client-side latency budgets tied to the sub-two-minute median listing time target.

## 6. Key People

- Rajath Ramesh, Group Director, Product and Platform Engineering (quoted in the Google Cloud case study).
- Victor Neo, early engineering leader and Director of Engineering (historical engineering blog context; may have changed roles).
- No named hiring manager for the Core Marketplace Android intern role is published in the posting. Cover letter therefore addresses "Engineering Hiring Team" and leaves recipient_title empty.

## Sources

- Job posting: https://jobs.smartrecruiters.com/carousellgroup/744000155411579
- Google Cloud case study: https://cloud.google.com/customers/carousell
- Carousell Insider, asynchronous messaging platform: https://medium.com/carousell-insider/messaging-carousells-asynchronous-communication-platform-fcdf197d6dc7
- Carousell Insider, Spotlight dense-vector search: https://medium.com/carousell-insider/migrating-to-elasticsearch-with-dense-vector-for-carousell-spotlight-search-engine-e328b16155fc
- Carousell Insider, browse page refactor (Android): https://medium.com/carousell-insider/the-browse-page-refactoring-journey-on-android-3a3265d8fcab
- Carousell Insider, dynamic UI system: https://medium.com/carousell-insider/building-a-dynamic-ui-system-at-carousell-part-2-d46bba8facaa
- Carousell engineering retrospective: https://www.linkedin.com/pulse/carousell-engineering-now-victor-neo
- Google Play listing: https://play.google.com/store/apps/details?id=com.thecarousell.Carousell
- Job-board restatements: https://www.jobgrid.in/job/android-engineer-intern-at-carousell-group-at-carousell-group-2026-h4ax, https://veyrai.world/jobs/carousell-group-android-engineer-intern-6-months
