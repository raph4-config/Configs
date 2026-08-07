---
name: explain-diff
description: Explain what a pull request does, how it does it, and what deserves attention in review. Takes a PR URL or number, or falls back to the current branch diff against its base.
argument-hint: [pr-url]
disable-model-invocation: true
---

Explain the pull request at $ARGUMENTS.

## 1. Resolve the target

`$ARGUMENTS` is a PR URL (`https://github.com/<owner>/<repo>/pull/<n>`), a bare PR number, or empty.

If empty, explain the current branch instead: `git diff $(git merge-base HEAD origin/main)...HEAD`, and state which range you used.

## 2. Handle the gh account

The active `gh` account may not have access to the target repo. `arn_ibf` is an Enterprise Managed User and cannot read personal repos, `raph4-config` cannot read iBanFirst ones.

If a `gh` call fails with an authorization error:
1. `gh auth status` to see the configured accounts
2. `gh auth switch --user <the other account>`
3. retry the call
4. switch back to the account that was active before, even if the retry failed

Never print or echo a token.

## 3. Gather

```bash
gh pr view <target> --json title,body,author,baseRefName,headRefName,additions,deletions,files
gh pr diff <target>
```

Read the actual diff, not just the file list. On a large diff, focus on source changes and skip lockfiles, generated code, and snapshots, then say what you skipped.

A diff alone is not enough to understand the code. You also need the surrounding source, so:
- open the changed files around the hunks, to see the functions the diff sits in
- find the callers of anything whose signature or behavior changed (`grep` the symbol), to know what else is affected
- check whether tests cover the changed path

This is how you catch what the diff hides: a caller that was not updated, a branch that is now dead, an error case that stopped being handled.

## 4. Get the source

If the current directory is already a clone of the target repo, use it and skip this step.

Otherwise clone the PR head into a scratch directory. Wipe the scratch directory first, so a leftover from an interrupted run never gets reused:

```bash
WORK="${TMPDIR:-/tmp}/claude-explain-diff"
rm -rf "$WORK" && mkdir -p "$WORK"
gh repo clone <owner>/<repo> "$WORK/repo" -- --depth=1 --quiet
git -C "$WORK/repo" fetch --depth=1 --quiet origin pull/<N>/head
git -C "$WORK/repo" checkout --quiet FETCH_HEAD
```

Fetching the `pull/<N>/head` ref works for fork PRs too, unlike cloning a branch name. Read and grep inside `$WORK/repo`.

Never clone into the user's own directories, and never `rm -rf` a path other than `$WORK`.

## 5. Write the explanation

The goal is that the reader understands what the code now does without reading every file, and knows exactly where to focus during review.

Readability is part of the job. A dense wall of prose is a failed explanation, even when every
sentence in it is correct. Keep sentences short, break lines often, and give every idea its own
visual slot so the reader can skim first and dive second.

In English, three sections, nothing else:

```markdown
## Summary
<what the PR changes, at the intent level, 1 to 3 short lines. Then, if the PR touches a
list of things (options, endpoints, files, flags), put that list on its own line below
instead of cramming it into the sentence.>

## How
<the mechanism. Follow the main path end to end: what triggers the new code, what it does,
what it returns or writes. Name the key function or module. Explain the non-obvious parts,
an unusual data structure, a retry, a lock, a fallback.

Prose if it is one path, 2 to 5 lines. A numbered list if the change lands in several
distinct places, one entry each, so the reader sees the shape at a glance.>

## Review points
<one numbered block per point, most important first. Never a flat bullet list of long
sentences. Each block is:

**<n>. <emoji> <the claim, one short line, bold>**
<1 to 2 plain lines: where it is and why it matters, with `file.py:line` when it helps.>
→ <the action or the open question, only when there is one.>

Leave a blank line between blocks. Write "Nothing notable" if it is clean.>
```

Emoji are severity markers on those bold claim lines, not decoration. Use exactly this set,
and nothing else:
- 🔴 it can break: correctness bug, security hole, data loss, race
- 🟠 blast radius: behavior change for existing users, unchanged caller, breaking API or schema
- 🟡 worth a second opinion: hardcoded value, new dependency, missing coverage, chosen tradeoff
- 🟢 checked and fine: a claim from the PR description you verified, or a risk you ruled out

Skip the emoji entirely on a short PR with one or two points, where they add noise instead of
structure.

What belongs in Review points:
- Logic that can break: unhandled edge case, wrong boundary, silent failure, race
- Blast radius: a caller left unchanged, a behavior change for existing users, a breaking API or schema change
- Missing coverage: a new path no test exercises
- Decisions worth a second opinion: hardcoded value, new dependency, chosen tradeoff
- Security and perf: unvalidated input, secret handling, a query or loop that scales badly

What does not belong: formatting, naming taste, anything the linter catches, and generic advice that would apply to any PR.

Separate what you verified from what you suspect. "`parse_amount` is called in 3 other places and none were updated" is useful, "there might be other callers" is noise, so go check.

Rules:
- Do not walk through the files one by one, the Files changed tab already does that
- Do not restate the diff, explain intent and consequence
- Name a file or symbol only when it matters to the point being made
- State what you could not verify instead of guessing
- One idea per block. If a point needs three sentences to land, it is two points
- No filler openers, never use the em dash character
- Emoji only as the severity markers above, never inside a sentence

**Example:**
```markdown
## Summary
Caches quote responses in Redis with a 60s TTL, to absorb repeated calls from the front end.

## How
A `@cached` decorator wraps the `/quotes` handler. The cache key combines the currency pair
and the rounded amount, so near-identical requests share an entry. A miss falls through to
the existing pricing call unchanged.

## Review points

**1. 🔴 A stale quote can be shown as a live price**
Nothing invalidates the entry when a rate moves, so the price can be up to 60s old. On a
volatile pair that is a wrong number in front of the user.
→ Confirm this is intended, or invalidate on rate update.

**2. 🟠 The batch job now hits the cache too**
`get_quote` is also called from `jobs/pricing.py:88`, a path that expects fresh rates.
→ Either bypass the cache there or accept the staleness explicitly.

**3. 🟡 Rounding collapses distinct amounts**
The key is built from the rounded amount, so 100.4 and 100.6 share an entry.

**4. 🟡 TTL is hardcoded**
It lives in the decorator rather than in config, so it cannot be tuned per environment.

**5. 🟡 No test for a stale hit**
The cache-hit path is covered, but no test asserts what happens once the underlying rate
has changed.
```

## 6. Clean up

If you cloned in step 4, delete the clone in the same turn, right after writing the explanation:

```bash
rm -rf "${TMPDIR:-/tmp}/claude-explain-diff"
```

Do this even if the analysis failed halfway. Nothing is left on disk outside the user's own clones.
