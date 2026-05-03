# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## What This Repository Is

This is a **superpowers skill** (`resume-forge`), not a traditional codebase. It contains no executable code, build system, or tests. The skill is an expert resume reviewer that analyzes resumes against industry best practices and delivers structured, actionable feedback.

## Repository Structure

- `SKILL.md` — The main skill definition. This is the core of the repository — it defines the resume review framework, evaluation criteria, report format, and tone guidelines. Any changes here directly affect skill behavior.
- `references/` — Supporting documentation that the skill consults during reviews:
  - `bullet_points.md` — Deep dive on writing effective bullet points (how-and-why test, language rules, formatting)
  - `summary.md` — How to write a strong summary section
  - `skills.md` — Skills section best practices and the "15-minute interview rule"
  - `ats.md` — ATS optimization rules and common failures
- `evals/evals.json` — Evaluation test cases for the skill. Contains prompts and expected outputs used to validate skill behavior. Each eval has an `id`, `prompt`, `expected_output`, and `files` array.

## Key Conventions

- **SKILL.md frontmatter** uses YAML with `name`, `description`, and trigger keywords. The `description` field doubles as the trigger list — it defines all the scenarios that should activate this skill.
- **Reference files are consulted at runtime** — the skill instructs Claude to read `references/*.md` when it needs detailed guidance on a specific section. Changes to reference files affect review quality without modifying the skill entry point.
- **Evals test skill behavior, not code** — `evals/evals.json` contains resume review scenarios with expected outputs. When modifying the skill, ensure existing evals still produce the expected behavior.

## Editing Guidelines

- When updating `SKILL.md`, maintain the report structure format — downstream consumers may depend on the exact section ordering.
- Reference files should contain concrete good/bad examples, not abstract advice. The skill relies on these examples to ground its feedback.
- Keep the evals in sync with the skill — if you add a new review dimension, add a corresponding eval case.
