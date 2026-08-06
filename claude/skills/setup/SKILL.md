---
name: setup
description: Generate a clean CLAUDE.md for this project and configure .claude/settings.json to deny access to credential files. Use when the user asks to set up or bootstrap the Claude Code config for a repo.
disable-model-invocation: true
---

## Steps

### 1. Explore the project

Before writing anything, understand the codebase:

- Read the root directory listing
- Check for package.json, pyproject.toml, Cargo.toml, go.mod, pom.xml, build.gradle, Makefile, docker-compose.yml, Dockerfile, .github/workflows, etc.
- Identify: language(s), framework(s), test runner, linter, build tool, CI setup
- Read existing README.md if present (for context only, do not copy it)
- Check directory structure (src/, app/, lib/, tests/, etc.)
- Look at a few key files to understand architecture and patterns

### 2. Generate CLAUDE.md

Write a CLAUDE.md at the project root. It must be:
- In English
- Concise, no padding, no filler sentences
- Written for a developer who will use Claude Code on this project
- Organized with clear headings

**Required sections** (include only sections that have real content):

```
# Project Name

One-line description of what this project does.

## Stack

Bullet list: language version, framework, key libraries, database, infra.

## Architecture

2 to 4 sentences on how the project is structured. Mention key directories only if non-obvious.

## Commands

Common tasks a developer needs:
- How to install dependencies
- How to run the app / server
- How to run tests
- How to run the linter / formatter
- How to build

## Environment

List required environment variables (names only, no values). Mention where to find the .env template if one exists.

## Conventions

Any non-obvious conventions: naming rules, branch strategy, commit format, code style decisions.
```

Rules:
- Skip any section where you have nothing meaningful to say
- Do not invent information, only write what you can verify from the code
- Do not add sections like "Contributing", "License", "Changelog" unless the project explicitly has them
- No AI boilerplate like "This document provides...", "Feel free to...", "Note that..."
- Write short, direct sentences

### 3. Configure .claude/settings.json

Create or update `.claude/settings.json` in the project root (not ~/.claude/settings.json).

Add a `permissions` block that denies read and write access to credential files:

```json
{
  "permissions": {
    "deny": [
      "Read(.env)",
      "Write(.env)",
      "Read(.env.*)",
      "Write(.env.*)",
      "Read(*.key)",
      "Write(*.key)",
      "Read(*.pem)",
      "Write(*.pem)",
      "Read(*.p12)",
      "Write(*.p12)",
      "Read(*.pfx)",
      "Write(*.pfx)",
      "Read(*credentials*)",
      "Write(*credentials*)",
      "Read(*secret*)",
      "Write(*secret*)",
      "Read(.netrc)",
      "Write(.netrc)",
      "Read(*.token)",
      "Write(*.token)"
    ]
  }
}
```

If a `.claude/settings.json` already exists, merge the deny list rather than overwriting other settings.

### 4. Confirm

After creating both files, print a brief summary:
- What was written in CLAUDE.md (sections included)
- That `.claude/settings.json` was created/updated with credential file protections
