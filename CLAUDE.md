# raph_config

Personal macOS dotfiles: zsh, WezTerm, Neovim (LazyVim), a QMK split-keyboard firmware, and Espanso.

## Stack

- **Shell**: zsh with [oh-my-posh](https://ohmyposh.dev/) prompt, zsh-autosuggestions, zsh-syntax-highlighting, zsh-completions
- **Terminal**: WezTerm (Lua config)
- **Editor**: Neovim via [LazyVim](https://lazyvim.github.io/) (plugins pinned in `nvim/lazy-lock.json`)
- **Keyboard**: QMK firmware for a split keyboard (AVR, `caterina` bootloader)
- **Package manager**: Homebrew (`/opt/homebrew`)
- **Languages referenced**: Python 3.12 (Poetry), Java (openjdk@21)
- **Containers**: Colima + Docker

## Architecture

Each top-level directory holds the config for one tool. `sync.sh` copies these files into their live locations under `~` and `~/.config`, then reloads zsh. The repo is the source of truth; running `sync.sh` is a one-way push to the system.

- `zsh/` — `.zshrc` and the `zash.omp.json` oh-my-posh theme
- `wezterm/` — `.wezterm.lua`
- `nvim/` — full LazyVim setup; user config in `nvim/lua/config/`, plugins in `nvim/lua/plugins/`
- `keyboard/` — QMK `keymap.c`, `config.h`, `rules.mk`; layout docs in `README.md` and `setup.md`
- `espanso/` — text-expansion config (currently empty)

## Commands

```sh
./sync.sh          # copy all configs into place and reload zsh
```

There is no build/test/lint for the repo itself. Tool-specific:

- **Neovim**: managed by lazy.nvim; `:Lazy` to update/sync plugins, `stylua` formats Lua (`nvim/stylua.toml`)
- **Keyboard**: build with QMK (`qmk compile` / `qmk flash`) from a QMK tree containing this keymap

## Conventions

- Commits use gitmoji prefixes via the `gc` shell function in `zsh/.zshrc`, e.g. `gc feat :add docker aliases` → `✨ feat: add docker aliases`. Types: `fix 🐛`, `feat ✨`, `docs 📝`, `style 💄`, `refactor ♻️`, `test ✅`, `chore 🚀`, `config 🔧`.
- Section headers in dotfiles use `─── TITLE ───` box-drawing banners.
- After editing any config here, run `./sync.sh` to apply it.
