# git

`.gitconfig` synced to `~/.gitconfig` by `sync.sh`. Aliases are used through the shell `g` alias.

Diffs are rendered by [delta](../cli/README.md): `g df`, `g dfs` and `g show` are colored and
side-aware out of the box, `n` / `N` jump between files inside the pager.

## Daily

| Command | Does |
|---------|------|
| `g st` | short status with branch |
| `g df` / `g dfs` | diff working tree / staged |
| `g a <file>` / `g au` / `g aa` | stage a file / tracked changes / everything |
| `gc <type> :<msg>` | gitmoji commit, see [`../zsh/README.md`](../zsh/README.md) |
| `g cm "<msg>"` | plain commit |
| `g lo` | last 20 commits, graph |

## Branches

| Command | Does |
|---------|------|
| `g cob <branch>` | create and switch |
| `g sw <branch>` | switch to an existing one |
| `g br` | list |
| `g psb` | push the current branch and set upstream |
| `g f` | fetch all remotes, prune stale branches |

## Fixing things

| Command | Does |
|---------|------|
| `g amend` | fold staged changes into the last commit, keep the message |
| `g undo` | undo the last commit, keep the changes staged |
| `g pf` | force push, refuses if someone else pushed meanwhile |

## Defaults worth knowing

`pull.rebase = true`, `init.defaultBranch = main`, `merge.conflictstyle = zdiff3` (conflict
markers also show the common ancestor), credentials in the macOS keychain.
