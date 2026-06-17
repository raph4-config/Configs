# nvim

Neovim config built on [LazyVim](https://lazyvim.github.io/). Synced to `~/.config/nvim/` by `sync.sh`. Plugin versions pinned in `lazy-lock.json`.

## Structure

| Path | Role |
|------|------|
| `init.lua` | entry point (bootstraps LazyVim) |
| `lua/config/lazy.lua` | lazy.nvim setup |
| `lua/config/options.lua` | option overrides (defaults) |
| `lua/config/keymaps.lua` | keymap overrides (defaults) |
| `lua/config/autocmds.lua` | autocommand overrides (defaults) |
| `lua/plugins/` | plugin specs |

## Plugins

| Plugin | Purpose |
|--------|---------|
| `tokyonight.nvim` | colorscheme — `tokyonight-night`, transparent |
| `neo-tree.nvim` | file explorer |
| `indent-blankline.nvim` | indent guides |
| `Comment.nvim` | quick commenting |
| LazyVim Python extra | Python language support |

## Tasks

- `:Lazy` — manage / update / sync plugins
- `stylua` — format Lua (config in `stylua.toml`)
