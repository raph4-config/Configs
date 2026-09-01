# raph_config

Personal macOS dotfiles.

## Contents

| Dir | Config |
|-----|--------|
| `zsh/` | zsh, aliases, oh-my-posh theme |
| `git/` | git config and aliases |
| `wezterm/` | WezTerm terminal |
| `aerospace/` | AeroSpace tiling window manager |
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

### AeroSpace

```sh
brew install --cask --appdir="$HOME/Applications" nikitabobko/tap/aerospace
```

`--appdir` is required: this account is not in the `admin` group, so a plain cask install fails
trying to `sudo` into `/Applications`. The app lands in `~/Applications`, the `aerospace` CLI in
`/opt/homebrew/bin`.

`sync.sh` copies `aerospace/aerospace.toml` to `~/.config/aerospace/`. First launch asks for
Accessibility permission (System Settings > Privacy & Security > Accessibility). Shortcuts:
[`shortcuts/macos.md`](shortcuts/macos.md).
