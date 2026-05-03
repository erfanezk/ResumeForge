# Resume Forge

An expert resume reviewer skill for [Claude Code](https://claude.ai/code). It analyzes resumes against proven best practices and delivers structured, section-by-section feedback to help candidates get more interviews.

## What It Does

Resume Forge reviews resumes across 10 dimensions: structure & formatting, personal information, summary quality, work experience bullet points, skills section, education, projects, ATS compatibility, and common mistakes.

It operates in two modes:

- **Resume Review** — Share a resume (text, PDF, DOCX, or image) and get a scored, section-by-section critique with a prioritized action plan
- **Resume Q&A** — Ask questions about resume writing without sharing a resume, and get specific, example-driven answers grounded in best practices

## Installation

1. Clone this repo somewhere on your machine:

```bash
git clone https://github.com/erfanezk/resume-forge.git
```

2. Add the path to your Claude Code settings. In `.claude/settings.json` (project-level or `~/.claude/settings.json` for global):

```json
{
  "skills": [
    "/path/to/resume-forge"
  ]
}
```

That's it. The skill activates automatically when you share a resume or ask resume-related questions.

### Get a Resume Review

```
Can you review my resume? Here it is:

John Doe
Software Engineer | john.doe@gmail.com | 555-123-4567 | New York, NY

SUMMARY
I am a passionate software developer with 5 years of experience...

WORK EXPERIENCE
Software Developer - ABC Corp (Jan 2020 - Present)
• Worked on the backend code
• Helped with database optimization
...
```

### Tailor to a Specific Job

```
I'm applying for a Python backend developer role at FinPay. Here's my resume and the job description:

[resume text]

[job description]
```

The skill will check keyword alignment, flag missing terms, and assess whether the summary and experience are properly tailored.

### Ask Resume Questions

```
How should I write bullet points for my work experience section?
```

```
What skills should I include for a senior Python role?
```

```
How do I handle an employment gap on my resume?
```

## Review Output

Reviews follow a structured format:

```
# Resume Review

## Overall Assessment
[2-3 sentence summary]

## Score: X/10
[Brief justification]

## Strengths
- [What's working well]

## Critical Issues (Fix First)
- [Issues likely causing rejections]

## Section-by-Section Feedback
### Personal Information | Summary | Skills | Work Experience | Education | Projects

## ATS Compatibility
[Assessment of ATS performance]

## Top 3 Action Items
1. [Most impactful change]
2. [Second]
3. [Third]
```

## Customization

To adapt the skill for your needs:

1. **Edit `SKILL.md`** to change the review framework, scoring criteria, or report format
2. **Edit reference files** to adjust guidelines for specific sections — the skill reads these at runtime when it needs detailed guidance
3. **Add eval cases** to `evals/evals.json` to test that changes produce the expected behavior

Reference files should contain concrete good/bad examples, not abstract advice. The skill relies on these examples to ground its feedback.

## License

MIT
