# Message to the Hiring Team: Carousell Group

SmartRecruiters free-text field on the Android Engineer Intern application. Paste the block below as plain text (no markdown). Focused on internship work, per user direction.

Word count: 207. Zero em-dashes. Longest sentence under 30 words, optional "that" retained.

---

Hello Carousell Android team,

I spent my internship at LexoLegal working on the Android side of a product for legal case management, and that work is what I would bring to this role.

The client runs on Android and iOS from one codebase in Kotlin Multiplatform and Compose Multiplatform, with 85 percent of the code shared. I built the app shell on Navigation 3 so that navigation adapts to each platform, wired dependencies through Koin, and kept case data in Room. I wrote 168 unit tests with JUnit 5 and MockK, mostly against the shared logic, because a shared module that breaks takes down both apps at once.

Reliability took up the rest of the internship. Case data refreshes on a sweep every twelve hours, and the same hearing cannot be announced twice to the same person. I made that sweep idempotent with a diffing step on Celery and Redis, and it now covers 25 High Courts with zero duplicate alerts when a retry storm hits.

What I want next is a product where that kind of work reaches millions of people, and the Carousell Android app is exactly that.

I am available for the full six months and can relocate to Bengaluru.

Thank you for reading.
