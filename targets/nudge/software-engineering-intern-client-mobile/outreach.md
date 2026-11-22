# Cold Outreach & 1-Weekend MVP Package

**Target Company:** Nudge (iSocial Sports Private Limited)  
**Target Role:** Software Engineering Intern - Client (Mobile)  
**Target Recipient:** Mobile Engineering Leadership & Hiring Team  
**Recipient Email:** `support@justnudge.com`  
**Addressed Hiring Gap:** Unified cross-platform camera receipt capture, offline-first Room KMP upload synchronization, and 60 FPS Compose Multiplatform reward animations  

---

## 1. Peer-to-Peer Cold Email Draft

**Subject:** Unifying KMP receipt scanning and rewards  
**Word Count:** 111 words (strictly <= 120 words; subject strictly <= 7 words)  

Hi Team,

I have been following Nudge's commerce rewards platform, especially how your Android and iOS apps share a unified codebase built with Kotlin Multiplatform (KMP) and Compose Multiplatform.

At LexoLegal, I architected a cross-platform client in KMP and Compose Multiplatform with Room KMP and Koin DI, achieving 85%+ code sharing across 168 unit tests. At Webxela, I shipped Coupit, a cross-platform loyalty client in Compose Multiplatform with a 60 FPS Canvas spin wheel and dynamic QR voucher generation.

My open-source multiplatform e-commerce SDK is public here: https://github.com/amanverma-765/oak

Worth 15 minutes to chat through the trade-offs or the Client Intern role in Bangalore?

Best,  
Aman Verma  
akverma4aman@gmail.com | +91 6386617608  

---

## 2. Day 5 Follow-Up Draft

Hi Team,

Following up on cross-platform mobile architectures: I built a minimal Compose Multiplatform prototype demonstrating offline bill upload queueing with Room KMP and 60 FPS Canvas reward rendering. Happy to share the repository if helpful.

Best,  
Aman  

---

## 3. 1-Weekend MVP Demo Specification

- **Objective:** Build an offline-first Compose Multiplatform (CMP) receipt scanning and rewards prototype targeting Android and iOS with 60 FPS UI rendering and resilient upload queueing.
- **Scope:** Implements a shared camera capture interface in Compose Multiplatform with client-side image downsampling (<500KB) and contrast optimization, manages a persistent offline upload queue in Room KMP and Ktor with exponential backoff retries, and triggers a physics-driven Canvas reward spin wheel running at 60 FPS upon upload completion.
- **Stack:** Kotlin Multiplatform (KMP), Compose Multiplatform (CMP), Ktor HTTP client, Room KMP, Koin DI, Kotlin Coroutines, and Flow.
- **Build Steps (Total: 8 hours):**
  1. *Hours 1-2:* Scaffold cross-platform project in Kotlin 2.0 and Compose Multiplatform targeting Android and iOS; set up Koin DI and shared navigation shell.
  2. *Hours 3-4:* Implement platform-abstracted camera capture viewfinder with client-side image compression to bound upload payloads.
  3. *Hours 5-6:* Structure persistent offline upload queue in Room KMP with reactive Coroutines Flow and exponential backoff retry policies.
  4. *Hours 7-8:* Build hardware-accelerated 60 FPS Canvas reward spin wheel with MVI state transitions, record 60-second video walkthrough, and publish repository to GitHub.
