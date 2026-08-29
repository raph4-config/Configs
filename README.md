# raph_config

Personal macOS dotfiles.

## Contents

| Dir | Config |
|-----|--------|
| `zsh/` | zsh, aliases, oh-my-posh theme |
| `git/` | git config and aliases |
| `wezterm/` | WezTerm terminal |
| `nvim/` | Neovim (LazyVim) |
| `keyboard/` | QMK split-keyboard firmware |
| `espanso/` | Espanso text expansion |
| `claude/` | Claude Code skills and status line |
| `shortcuts/` | Cheat-sheets (macOS, terminal, LazyVim) |

## Install

- Config path: `~/raph_config` (this repo is the source of truth)
- Command to synchronise: `sync-config`

### Claude Code status line

`sync.sh` copies `claude/statusline.sh` to `~/.claude/statusline.sh`. Enabling it is a one-time
manual step, because `~/.claude/settings.json` is not synced:

```json
"statusLine": { "type": "command", "command": "~/.claude/statusline.sh", "padding": 2 }
```

Requires `jq`. Shows model, effort, worktree and PR, plus a context bar that turns yellow at 50%
and red at 80%, with cost, session duration and the 5-hour quota.
