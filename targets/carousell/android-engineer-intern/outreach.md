# Outreach: Carousell Group, Android Engineer Intern

Recipient target: Android engineer on Core Marketplace (Bengaluru). No named contact published, so send to the Android hiring team or a Core Marketplace Android engineer found on LinkedIn.

## Email 1

**Subject:** Frame jank on listing-card feeds

Your 2021 browse refactor pulled listing cards into shared components, and the Sell Form keeps absorbing attributes. That combination usually surfaces as frame jank on image-heavy cards long before it surfaces as crashes.

I built WatchTower: `WorkManager` crawls behind semaphore-limited coroutines, holding `60 FPS` while a Myers diff runs over DOM snapshots. Same shape as a feed mixing server-driven components with cached media.

Repo: github.com/amanverma-765/WatchTower

I am applying for the Android Engineer Intern role. Worth 15 minutes to talk through where your frame budget actually breaks?

Body word count: 84 (<= 120). No attachments on Email 1.

## Day 5 Follow-up (2 lines)

Bumping this: I measured the WatchTower feed at 60 FPS with 12 concurrent fetches, and the only jank came from unpooled bitmap decode on card thumbnails.

If listing-card media is still your top jank source, I would like to compare notes on the benchmark harness.

## 1-Weekend MVP Demo Spec

**Scope:** A Compose macrobenchmark harness that measures frame timing and jank on a listing-card feed at 90Hz and 120Hz, then emits a JSON report of every frame that blew its budget, grouped by card type (image-heavy, text-only, promoted). Skips backend integration, auth, and real listings: the feed is generated from a local fixture set with realistic image sizes.

**Stack:** Kotlin, Jetpack Compose, `Macrobenchmark` and `JankStats`, `WorkManager` for fixture prefetch, Gradle managed devices for repeatable runs.

**Deliverable:** Public repo with a README documenting the frame-budget methodology, a JSON schema for the report, plus a 60-second video walkthrough showing a janky baseline and the fixed variant.
