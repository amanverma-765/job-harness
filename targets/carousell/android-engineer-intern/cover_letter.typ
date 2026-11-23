#import "/core/templates/cover_letter_base.typ": cover_letter

#show: cover_letter.with(
  name: "Aman Verma",
  location: "Jaunpur, UP, India",
  phone: "+91 6386617608",
  email: "akverma4aman@gmail.com",
  linkedin: "linkedin.com/in/amanverma765",
  site: "github.com/amanverma-765",
  date_str: "November 22, 2026",
  recipient_name: "Engineering Hiring Team",
  recipient_title: "",
  company_name: "Carousell Group",
  company_address: "Bengaluru, Karnataka, India",
)

Carousell's Android app is where the Sell Form meets reality: thirteen years of accumulated listing attributes, photo uploads, and network variance inside a flow the team now measures in seconds. The Gemini-driven *List with AI* work cut median listing time under two minutes and lifted items listed per seller by 20 percent, and that kind of gain only survives if the client holds its frame budget and keeps state predictable.

At *LexoLegal* I shipped a case management client in *Kotlin Multiplatform* and *Compose Multiplatform*, sharing 85 percent of the code between the *Kotlin* Android core and iOS while grounding *168 unit tests* in *JUnit 5* and *MockK*. *WatchTower*, my local-first Android monitoring app, runs *WorkManager* crawls behind semaphore-limited *Kotlin Coroutines* and holds a *60 FPS* UI while the diff engine works. *Cypher-X* pairs *Room* and *SQLite* persistence with *MVI* state and hardware-backed *AndroidKeyStore* encryption, the discipline a marketplace needs when listing drafts and chat state must survive process death.

Performance claims only matter when they are measured. *WatchTower* diffs crawled DOM snapshots with a *Myers diff* instead of re-rendering unchanged cards, and bounds concurrency with semaphores rather than unbounded coroutine launches, so the main thread never competes with network work. On the server half of *LexoLegal*, an idempotent diffing engine over *Celery* and *Redis* delivers two-stage alerts across *25 High Courts* with zero duplicate notifications under retry storms, which means I have debugged both ends of the same reliability problem.

The HEART values read like the way I already work: accountable for the release, relentlessly resourceful on a hard bug. I am available for the full 6-month internship, can relocate to Bengaluru for the duration, and would welcome a conversation about where the Android performance budget needs the most attention.
