# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## What This Repository Is

This is a **superpowers skill** (`resume-forge`), not a traditional codebase. It contains no executable code, build system, or tests. The skill is an expert resume reviewer that analyzes resumes against industry best practices and delivers structured, actionable feedback.

It operates in two modes: **Resume Review** (scored, section-by-section critique from a shared resume) and **Resume Q&A** (answer resume-writing questions without a resume).

## Repository Structure

- `SKILL.md` — The main skill definition: review framework, 10 evaluation dimensions, report format, and tone guidelines. Any changes here directly affect skill behavior.
- `references/` — 20 supporting docs the skill consults at runtime when it needs detailed section guidance. Organized by resume section/topic:
  - **Core sections**: `bullet_points.md`, `summary.md`, `skills.md`, `work_experience.md`, `education.md`, `personal_information.md`, `projects.md`
  - **Optional sections**: `awards.md`, `certifications.md`, `languages.md`, `memberships.md`, `publications.md`, `volunteer_experience.md`, `references.md`
  - **Strategy & format**: `ats.md`, `structure.md`, `templates.md`, `common_mistakes.md`, `shotgun_vs_target.md`, `after_sending_resume.md`
- `evals/evals.json` — Test cases for validating skill behavior. Each eval has `id`, `prompt`, `expected_output`, and `files`.
- `README.md` — Installation and usage guide for end users.

## Key Conventions

- **SKILL.md frontmatter** uses YAML with `name`, `description`, and trigger keywords. The `description` field doubles as the trigger list — it defines all scenarios that should activate this skill.
- **Reference files are runtime dependencies** — the skill instructs Claude to read specific `references/*.md` files when it needs detailed guidance. Changes to reference files affect review quality without modifying the skill entry point.
- **Reference files must contain concrete good/bad examples** — the skill relies on these to ground its feedback. Abstract advice without examples weakens reviews.
- **Evals test skill behavior, not code** — when modifying the skill or references, ensure existing evals still produce the expected behavior. Add new evals when adding review dimensions.

## Editing Guidelines

- When updating `SKILL.md`, maintain the report structure format — the section ordering is part of the skill contract.
- Keep the evals in sync with the skill — if you add a new review dimension, add a corresponding eval case.
- The `README.md` project structure listing should be updated if files are added or removed.
