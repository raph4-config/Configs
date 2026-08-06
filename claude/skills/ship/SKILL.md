---
name: ship
description: Commit, rename the branch, push, and open a pull request. Writes English commit messages and short PR descriptions following the user's gitmoji convention. Use when the user asks to ship, commit, push, or open a PR.
disable-model-invocation: true
---

## Convention

Commit format (from the user's gc() shell function):
```
fix      → 🐛 fix: <message>
feat     → ✨ feat: <message>
docs     → 📝 docs: <message>
style    → 💄 style: <message>
refactor → ♻️ refactor: <message>
test     → ✅ test: <message>
chore    → 🚀 chore: <message>
config   → 🔧 config: <message>
```

Branch naming convention:
```
feat/<short-slug>
fix/<short-slug>
chore/<short-slug>
config/<short-slug>
docs/<short-slug>
refactor/<short-slug>
test/<short-slug>
style/<short-slug>
```

## Steps

### 1. Assess the situation

Run these to understand the current state:
```bash
git status
git diff --stat
git branch --show-current
git log --oneline -5
```

### 2. Determine type and message

Look at the staged and unstaged changes (use `git diff` and `git diff --cached`) to determine:

**Type**: pick the most appropriate:
- `feat`: new user-facing feature or behavior
- `fix`: bug fix
- `refactor`: code restructure with no behavior change
- `config`: config files, env, CI/CD, tooling setup
- `chore`: maintenance, dependency updates, generated files, cleanup
- `docs`: documentation only
- `test`: adding or updating tests only
- `style`: formatting, whitespace, no logic change

**Message rules:**
- In English
- Lowercase, imperative mood ("add", "fix", "remove", not "added", "fixes", "removed")
- Max 60 characters
- Specific: say what changed, not "update code" or "fix stuff"
- No period at the end
- No markdown, no dashes at the start, no AI-ish filler
- If multiple things changed, pick the most significant one for the message

Examples of good messages:
```
add user authentication with JWT
fix null pointer on empty cart checkout
remove deprecated payment gateway
update Python to 3.12
add rate limiting to public API endpoints
refactor order processing into separate service
```

Examples of bad messages:
```
update code                     ← too vague
fixed the bug                   ← past tense
-- initial commit --            ← dashes and filler
Added some improvements.        ← period, past tense, vague
Various changes and fixes       ← vague
```

### 3. Propose to user before doing anything

Before staging or committing, show the user what you plan to do:

```
Type:    feat
Message: add user authentication with JWT
Branch:  feat/user-authentication
Commit:  ✨ feat: add user authentication with JWT

Files to stage:
  - src/auth/jwt.py
  - src/auth/middleware.py
  - tests/test_auth.py

PR description draft:
  ## What
  Adds JWT authentication so users stay logged in across sessions.

  ## Why
  Sessions were dropped on every deploy.

  ## How to test
  Log in, redeploy, the session is still valid.

Proceed? (yes/no)
```

Write the draft with the type template and the 6 line budget from step 7. The "Files to stage" list above is for this local confirmation only, it never goes into the PR description. If no PR is planned for this branch, omit the draft block entirely.

Use AskUserQuestion to confirm or let the user adjust the type, message, branch name, or PR description.

### 4. Rename the branch (if needed)

Check the current branch name:
- If it already matches the convention (e.g., `feat/something`), keep it
- If it's `main`, `master`, or `develop`, do NOT rename. Warn the user and stop
- If it's a feature branch with an inconsistent name, rename it:

```bash
git branch -m <new-branch-name>
```

Branch slug rules:
- Lowercase, kebab-case
- 2 to 5 words max, derived from the commit message
- No issue numbers unless the user explicitly includes one

### 5. Stage and commit

Stage only relevant files, do not blindly `git add .` if there are unrelated changes:
```bash
git add <specific files>
```

Commit using the direct git command with the full emoji format (do NOT use the gc() shell alias, write the full commit message directly):
```bash
git commit -m "✨ feat: add user authentication with JWT"
```

### 6. Push

Check if a remote tracking branch exists:
```bash
git rev-parse --abbrev-ref @{u} 2>/dev/null
```

- If upstream exists: `git push`
- If no upstream: `git push -u origin <branch-name>`

### 7. Pull request

If the user asked for a PR, or a PR already exists for this branch, create or update it with `gh pr create` / `gh pr edit`, using the description validated in step 3.

**Title** = the commit message, same emoji format:
```
🐛 fix: guard empty cart on checkout
```

**Body budget: 6 lines of text max**, headings excluded. 1 to 2 lines per section. If the whole PR fits in one line, write one `## What` section and stop.

**Core sections** (per type, below). **Optional sections**, add only when they apply:
- `## How to test`: repro or verification steps. On `feat` and `fix`. Skip on `chore`, `docs`, `style`.
- `## Screenshot`: UI changes only, one image line.
- `## Ticket`: only if the user mentions a Jira/GitHub issue. One link, no prose.
- `## Risk`: on `refactor` (state that behavior is unchanged) and `config` (state the action required: re-install, new env var, or none).

**Body rules:**
- English, plain, factual
- Say what changed and why, at the intent level
- Never list the modified files and never walk through the diff file by file. Reviewers already see all of it in the PR's Files changed tab, repeating it adds noise and goes stale on the next push
- No filler openers ("This PR introduces...", "In this change we..."), no background essay, no emoji in the body
- No "Generated with Claude" footer, no co-author trailer
- Never use the em dash character

**Templates by type:**

`feat`
```markdown
## What
Adds <feature> so users can <capability>.

## Why
<the need, 1 line>

## How to test
<step, then expected result>
```

`fix`
```markdown
## Problem
<what was broken and who it affected>

## Fix
<what changed>

## How to test
<repro, then expected behavior now>
```

`refactor`
```markdown
## What
<what was restructured>

## Why
<the pain it removes>

## Risk
No behavior change. Covered by <tests / manual check>.
```

`config`
```markdown
## What
<what setting, tool or pipeline changed>

## Risk
<action required for others: re-install, new env var, or none>
```

`test`
```markdown
## What
Adds tests for <area>.

## Why
<gap that was covered>
```

`chore`, `docs`, `style` (one section, one line):
```markdown
## What
Bumps Python to 3.12, no code change.
```

**Good example:**
```markdown
## Problem
Checkout crashed on an empty cart, blocking the payment step.

## Fix
Guard the total computation and return an empty summary.

## How to test
Open checkout with an empty cart, the page renders a 0 total.
```

**Bad example:**
```markdown
## Description
This pull request introduces a comprehensive set of changes to the checkout
flow in order to address a long standing issue that has been reported by
several users over the past weeks...

## Changes
- Modified `cart.py`
- Modified `checkout.py`
- Modified `test_cart.py`
```
Too long, filler opener, restates the file list.

### 8. Summary

Print a brief one-line summary of what was done:
```
Shipped: ✨ feat: add user authentication with JWT → feat/user-authentication
```
If a PR was created, add its URL on the next line.
