# Bullet Points Deep Dive

The most important part of any resume. Recruiters read bullet points first — if they're hard to follow, the resume fails.

## The How-and-Why Test

Every bullet point should answer "how?" and "why?" when a reader asks. If it doesn't, it's incomplete.

**Examples:**

- Bad (no why): "Refactored the backend's code" — Why?
- Bad (no how): "Improved coding readability" — How?
- Good: "Refactored the backend's code for better readability, easier maintenance, and development"

- Bad (day-to-day task): "Answered customer calls everyday and resolved a thousand tickets"
- Bad (one-time task): "Implemented a notification system"
- Good (achievement): "Implemented a notification system that increased user engagement by 20%"

## The HR Test

HR will read your bullets before any technical person. If a non-technical reader can't understand the purpose of what you did, rewrite it.

Structure: **Why** (satisfies HR) + **How** (satisfies technical reviewer)

- Bad: "Used replication, indexing, and materialized views" — Why? HR has no idea.
- Good: "Constructed a systematized transaction system with PostgreSQL replication, indexing, and materialized views, for efficiency and high volumes"

## Language Rules

- **Past tense, passive voice** for all bullets (except summary)
  - "Led a team of 5 engineers" not "Lead a team of 5 engineers"
  - "The system was redesigned to handle 10x traffic" (passive is fine)

- **Third person** — never use "I"
  - Bad: "I am a developer with 5 years of experience"
  - Good: "A backend developer with 5 years of experience"

- **Strong action verbs** — avoid weak verbs like "did," "helped," "worked on"
  - Bad: "Created a new software system that increased productivity by 20%"
  - Good: "Implemented a new software system that increased productivity by 20%"
  - Strong verbs: implemented, designed, constructed, optimized, architected, led, developed, automated, built, integrated, refactored, deployed, migrated, scaled

- **Quantify achievements** — numbers make claims believable
  - "Reduced load time by 50%" is stronger than "Improved performance"
  - BUT: don't overdo it. Too many numbers looks fabricated and gets resumes rejected. Every number should be defensible in an interview.
  - Bad: "Increased code performance by 200%" (no context or evidence)
  - Good: "Optimized SQL queries by creating a caching layer, reducing load time by 50%, approved by A/B testing for the release candidate"

- **No synonym stuffing**
  - Bad: "A collaborator team-player backend developer with 5 years industry experience in backend engineering"
  - Good: "A team-player backend developer with 5 years experience"

- **No vague language**
  - Bad: "Managed a project to completion"
  - Good: "Successfully led a cross-functional team to complete a project ahead of schedule and under budget, resulting in a 20% increase in productivity"

## Formatting Rules

- Use bullet points (•), not paragraphs
- 2-6 bullets per job entry (merge if you have more than 6-7)
- Each bullet: 1-2 lines max
- Professional language, no slang or casual tone
- Use Grammarly or equivalent to catch grammar errors

## Action Verb Reference List

Use these verbs to start your bullet points. Match the verb to the type of work you did.

### Leadership & Mentorship
| Verb | Example |
|------|---------|
| Led | Led a team of 5 engineers to ship the platform 3 weeks early |
| Managed | Managed cross-functional team of 8 across engineering, design, and product |
| Mentored | Mentored 3 junior developers, all promoted within 12 months |
| Coached | Coached team on TDD practices, reducing production bugs by 40% |
| Directed | Directed technical strategy for the payments platform |

### Design & Architecture
| Verb | Example |
|------|---------|
| Architected | Architected a microservices platform serving 2M daily requests |
| Designed | Designed a schema that reduced query time from 4s to 200ms |
| Spec'd | Spec'd the authentication system, handling 50K daily logins |
| Rebuilt | Rebuilt the data pipeline from scratch, processing 10GB/day |

### Development & Implementation
| Verb | Example |
|------|---------|
| Built | Built an internal dashboard that saved the ops team 10 hours/week |
| Implemented | Implemented a notification service with 99.9% delivery uptime |
| Developed | Developed a Python CLI tool for automated deployments, adopted by the whole team |
| Created | Created a real-time monitoring system using WebSockets and Redis |
| Shipped | Shipped the new checkout flow, increasing conversion by 15% |

### Optimization & Performance
| Verb | Example |
|------|---------|
| Optimized | Optimized database queries, reducing p95 latency from 800ms to 120ms |
| Reduced | Reduced infrastructure costs by 30% through right-sizing and caching |
| Improved | Improved page load time by 40% via code splitting and CDN optimization |
| Slew | Slashed CI/CD pipeline time from 45 minutes to 8 minutes through parallelization |
| Cut | Cut deployment failures by 60% by introducing automated rollback checks |

### Reliability & Operations
| Verb | Example |
|------|---------|
| Improved | Improved system uptime from 99.0% to 99.9% through automated alerting |
| Established | Established on-call rotation and incident response runbook |
| Migrated | Migrated 50+ services to Kubernetes with zero downtime |
| Automated | Automated database backups and disaster recovery testing |

### Data & Analytics
| Verb | Example |
|------|---------|
| Built | Built an ETL pipeline processing 500GB of data daily |
| Analyzed | Analyzed user behavior data to identify $200K in lost revenue |
| Created | Created a real-time analytics dashboard for the executive team |

### Collaboration & Process
| Verb | Example |
|------|---------|
| Collaborated | Collaborated with product team to define roadmap priorities |
| Partnered | Partnered with security team to achieve SOC 2 compliance |
| Introduced | Introduced code review practice across the engineering org |
| Streamlined | Streamlined sprint planning, reducing planning overhead by 50% |
| Facilitated | Facilitated cross-team technical design reviews for major features |

### Security & Compliance
| Verb | Example |
|------|---------|
| Implemented | Implemented OAuth 2.0 and JWT authentication for all APIs |
| Secured | Secured payment processing to meet PCI-DSS Level 1 requirements |
| Audited | Audited code dependencies, removing 40+ vulnerabilities |

## Before/After Transformation Examples

Use this table to upgrade weak bullet points into strong ones.

| Level | Before (Weak) | After (Strong) |
|-------|---------------|----------------|
| Vague task | "Worked on the backend" | "Built and maintained backend APIs handling 100K daily requests using Python and FastAPI" |
| Day-to-day | "Responsible for code reviews" | "Led biweekly code reviews for a team of 6, catching 15+ bugs before production per cycle" |
| No impact | "Improved database performance" | "Optimized 20 slow queries, reducing average response time from 3.2s to 340ms" |
| No how | "Set up monitoring" | "Configured Datadog alerting and dashboards, reducing mean time to detect incidents from 45min to 4min" |
| No why | "Used Docker and Kubernetes" | "Containerized 12 services with Docker, deployed to Kubernetes, enabling daily production releases" |
| Vague achievement | "Increased user satisfaction" | "Redesigned onboarding flow, lifting user activation rate from 22% to 38% (measured over 30 days)" |
| Task-only | "Deployed the application" | "Migrated deployment from manual SSH to CI/CD pipeline, reducing release time from 2 hours to 8 minutes" |
| Buzzword | "Leveraged agile synergies to drive scalable solutions" | "Led adoption of Scrum practices, increasing sprint velocity by 25% over 3 quarters" |
| Generic | "Responsible for customer support" | "Resolved an average of 40 customer tickets per week, maintaining a 4.8/5.0 satisfaction rating" |

## Bullet Count Guidelines by Role Level

| Role Level | Bullets per Job | Total Recommended |
|-----------|----------------|-------------------|
| Entry-level (0-2 years) | 3-5 bullets | 6-10 total |
| Mid-level (2-5 years) | 3-5 bullets | 9-15 total |
| Senior (5-10 years) | 3-4 bullets | 9-12 total |
| Lead / Staff (10+ years) | 2-4 bullets | 6-10 total |

**Why not more bullets?** Recruiters spend 6 seconds on first scan. If they see 10 bullets per job, they read nothing. Quality over quantity — 3 great bullets beat 6 mediocre ones.

**How to cut:** Combine related points. "Reviewed PRs", "Mentored junior devs", "Set up CI" → "Established engineering standards through code reviews, team mentorship, and CI/CD setup"

**What goes in each bullet:** Each bullet should contain at least one of What you did, How you did it (the approach or tool), Result you achieved (measurable outcome). Result is optional but preferred. If you can't quantify, describe the scope or impact qualitatively.
