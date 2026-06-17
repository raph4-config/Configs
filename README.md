# raph_config

Personal macOS dotfiles.

## Contents

| Dir | Config |
|-----|--------|
| `zsh/` | zsh, aliases, oh-my-posh theme |
| `wezterm/` | WezTerm terminal |
| `nvim/` | Neovim (LazyVim) |
| `keyboard/` | QMK split-keyboard firmware |
| `espanso/` | Espanso text expansion |

## Install

```sh
./sync.sh
```

Copies every config into place (`~`, `~/.config`) and reloads the shell.

## Commits

Gitmoji prefix via the `gc` function in `zsh/.zshrc`:

```
gc feat :add docker aliases   →   ✨ feat: add docker aliases
```

Types: `fix 🐛` · `feat ✨` · `docs 📝` · `style 💄` · `refactor ♻️` · `test ✅` · `chore 🚀` · `config 🔧`
