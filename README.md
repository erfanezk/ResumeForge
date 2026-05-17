# Resume Forge

An expert resume reviewer for Claude Code. Reviews resumes against industry best practices and delivers scored, section-by-section feedback.

## What It Does

- **Resume Review** — Share your resume (text, PDF, DOCX, image) and get actionable feedback on every section
- **Job Tailoring** — Paste a job description alongside your resume for keyword alignment feedback
- **Resume Q&A** — Ask any resume question: "How do I write bullet points?", "What skills for a Python role?", "How to handle employment gaps?"

Triggers on: review my resume, check my CV, improve my resume, ATS tips, how to write a summary, what skills to include, and any resume-related question.

## Installation

### bunx (fastest)

```bash
bunx skill add /path/to/resume-forge/skills/resume-forge
```

### Clone + settings.json

```bash
git clone https://github.com/erfanezk/resume-forge.git
```

Add to `~/.claude/settings.json`:

```json
{
  "skills": [
    "/path/to/resume-forge/skills/resume-forge"
  ]
}
```

Restart Claude Code.

## Usage

```
Can you review my resume?

[paste resume here]
```

```
I'm applying for [job title]. Here's my resume and job description:

[resume]

[job description]
```

```
How should I write bullet points for a senior Python developer?
```

## License

MIT