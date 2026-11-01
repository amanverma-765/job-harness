# Legal, Regulatory Frameworks & Algorithmic Bias Audits (2024–2026)

**Document Reference:** `research/04_LEGAL_REGULATORY_COMPLIANCE_AND_AI_AUDITS.md`  
**Focus Area:** EEOC Title VII & ADA Enforcement, *Mobley v. Workday*, NYC Local Law 144, and the EU AI Act  
**Verification Level:** High (Validated against official EEOC technical guidance, judicial rulings, NYC DCWP statutory rules, ACM FAccT empirical research, and adversarial panel consensus)

---

## 1. Federal Enforcement: The EEOC Title VII & ADA Framework

Over the 2023–2026 period, the U.S. Equal Employment Opportunity Commission (EEOC), in coordination with the Department of Justice (DOJ), Federal Trade Commission (FTC), and Consumer Financial Protection Bureau (CFPB), issued clear technical assistance guidance establishing how federal civil rights laws govern algorithmic hiring tools:

### Algorithmic Tools Are Formally Classified as "Selection Procedures"
Under the **Uniform Guidelines on Employee Selection Procedures (UGESP, 29 C.F.R. Part 1607)**, any computational or automated mechanism used to make or inform employment decisions—specifically including:
- Keyword-based resume scanners that score or rank applicants,
- Conversational screening chatbots and automated video/voice interviewers,
- Automated candidate fit ratings and predictive scoring engines—
is legally defined as an **employment "selection procedure."**

### Non-Delegable Employer Legal Liability
A critical legal principle enforced by the EEOC and established in federal case law:
> **Employers cannot insulate themselves from Title VII liability by relying on third-party vendor warranties, certifications, or indemnification agreements.**

If an enterprise deploys an ATS or AI tool (e.g., Workday, Eightfold, HiredScore) that results in an unvalidated disparate impact against a protected class, **the employer bears primary liability**. Vendor marketing assurances that an algorithm is "100% bias-free" or "EEOC compliant" hold zero legal weight in federal court.

### The Four-Fifths (80%) Rule & Disparate Impact
Under Title VII disparate impact doctrine (42 U.S.C. § 2000e-2(k)), adverse impact is identified when the selection rate for candidates in any protected demographic group (race, sex, national origin) is less than **four-fifths (80%)** of the rate for the highest-selected group:

$$\text{Impact Ratio} = \frac{\text{Selection Rate of Protected Group}}{\text{Selection Rate of Highest-Selected Group}} < 0.80$$

If an automated scoring or filtering tool produces an impact ratio below 0.80, the employer must demonstrate that the selection procedure is **job-related and consistent with business necessity**, and prove that no less discriminatory alternative algorithm was available during tool development.

---

## 2. Judicial Precedent: *Mobley v. Workday, Inc.* (N.D. Cal.)

In a watershed federal court ruling (*Mobley v. Workday, Inc.*, No. 23-cv-00770, N.D. Cal., Judge Rita F. Lin), the legal landscape governing ATS vendors shifted permanently:

### The Legal Core of the Decision
Plaintiff Derek Mobley alleged that Workday's algorithmic screening software, deployed by hundreds of corporate employers, systematically screened out African American, disabled, and older applicants in violation of Title VII, the Americans with Disabilities Act (ADA), and the Age Discrimination in Employment Act (ADEA).

Workday moved to dismiss, arguing it was merely a software vendor providing neutral tools to employers, and could not be sued as an "employer."

### The Precedent-Setting Ruling
Judge Lin **denied Workday's motion to dismiss**, establishing a groundbreaking legal doctrine:
1. **ATS Vendors as "Employment Agencies":**  
   The court held that an algorithmic software vendor that executes or substantially assists screening decisions functions as an **employment agency** under Title VII, the ADA, and the ADEA.
2. **Delegation of Traditional HR Functions:**  
   When an employer delegates traditional hiring discretion to an automated software platform (such as Workday's candidate recommendation models or Skills Cloud scoring), the software provider shares direct statutory liability for discriminatory outcomes.

---

## 3. Municipal & State Regulation: NYC Local Law 144

New York City's Local Law 144 (enforced by the Department of Consumer and Worker Protection, DCWP, beginning July 2023) established the first municipal statutory regime governing **Automated Employment Decision Tools (AEDTs)**:

### Definition of an AEDT
Under NYC Admin. Code § 20-870 and 6 RCNY § 5-300, an AEDT is defined as any computational process derived from machine learning, statistical modeling, data analytics, or AI that outputs a simplified score, classification, or recommendation used to **"substantially assist or replace discretionary decision-making."**

The DCWP regulations define "substantially assist or replace" as occurring when an employer:
1. Relies **solely** on the tool's output with no other factors considered,
2. Weights the tool's output **more heavily** than any other criterion, or
3. Uses the tool's output to **overrule** human discretionary judgment.

### Core Statutory Mandates
Employers deploying an AEDT for New York City candidates must satisfy three strict requirements:
1. **Independent Annual Bias Audit:**  
   Must engage an independent auditor to conduct an annual statistical audit calculating selection rates, scoring rates, and demographic impact ratios across EEOC categories (sex/gender, race/ethnicity).
2. **Public Summary Posting:**  
   Must conspicuously post a summary of the audit results and distribution date on the public careers section of their website.
3. **Candidate Notice (10 Business Days):**  
   Must provide written notice to NYC applicants at least 10 business days prior to using an AEDT, disclosing the qualifications the tool evaluates and informing candidates of alternative accommodation requests.
4. **Penalties:**  
   Violations carry daily civil fines ranging from **$500 to $1,500 per violation per day**.

### The Critical Regulatory Nuance: Disclosure vs. Remediation
A landmark empirical study (*Groves et al., ACM FAccT 2024 / arXiv:2402.08101*) analyzing the first year of Local Law 144 uncovered a vital structural paradox:
- **Local Law 144 is strictly a transparency statute, not a remediation mandate.**
- The law compels employers to publish their bias audit numbers, but **does not legally require employers to cease using a tool that demonstrates severe adverse impact** or to remediate identified bias under the municipal statute (though federal Title VII exposure remains).
- Furthermore, because the statute applies only when a tool "substantially assists" hiring decisions, many ATS vendors and employers actively claim exemptions by designating algorithmic match scores as "purely advisory sorting aids."

---

## 4. European Union: The EU AI Act (2024–2026 Implementation)

Across the European Union, the regulatory framework is significantly more stringent than US disclosure models:

### Annex III: "High-Risk AI Systems" in Employment
Under the EU AI Act, AI systems utilized in recruitment and employment are formally designated as **High-Risk AI Systems**:
- **Scope:** Algorithms used for targeted job advertisements, screening or filtering applications, evaluating candidates in interviews, and allocating task promotions or terminations.
- **Mandatory Requirements:**
  - **Fundamental Rights Impact Assessments (FRIA):** Comprehensive pre-deployment evaluations.
  - **High-Quality Training Data:** Rigorous data governance to prevent demographic bias in training datasets.
  - **Automated Logging & Traceability:** Systems must generate tamper-evident logs of all candidate evaluations and automated decision outputs.
  - **Guaranteed Human Oversight:** Mandatory human-in-the-loop controls; autonomous rejection algorithms without human validation are severely constrained.
  - **Severe Fines:** Non-compliance penalties reach up to **€35,000,000 or 7% of total global annual turnover**.
