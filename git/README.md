# Git config

`.gitconfig` synced to `~/.gitconfig` by `sync.sh`. Aliases are used through the shell `g` alias (`g = git`).

## Aliases

| Command | Expands to | Description |
|---------|-----------|-------------|
| `g co -b <branch>` | `git checkout -b <branch>` | Create and switch to a new branch |
| `g cob <branch>` | `git checkout -b <branch>` | Shortcut for creating a branch |
| `g co <branch>` | `git checkout <branch>` | Switch branch |
| `g sw <branch>` | `git switch <branch>` | Switch branch (modern) |
| `g psb <branch>` | `git push -u origin <branch>` | Push branch to origin (no arg = current branch) |
| `g pf` | `git push --force-with-lease` | Safe force push |
| `g pl` | `git pull` | Pull |
| `g f` | `git fetch --all --prune` | Fetch all remotes, prune stale branches |
| `g lo` | `git log --oneline --graph --decorate -20` | Compact recent log |
| `g log-all` | `git log --oneline --graph --decorate --all` | Full graph across branches |
| `g st` | `git status -sb` | Short status |
| `g df` | `git diff` | Working tree diff |
| `g dfs` | `git diff --staged` | Staged diff |
| `g aa` | `git add --all` | Stage everything |
| `g cm "<msg>"` | `git commit -m "<msg>"` | Commit with message |
| `g amend` | `git commit --amend --no-edit` | Amend last commit, keep message |
| `g undo` | `git reset --soft HEAD~1` | Undo last commit, keep changes staged |
| `g br` | `git branch` | List branches |
