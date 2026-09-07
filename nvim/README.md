# nvim

Neovim on [LazyVim](https://lazyvim.github.io/), synced to `~/.config/nvim/` by `sync.sh`.
Plugin versions pinned in `lazy-lock.json`.

Leader is `Space`. Press it alone and wait: which-key lists everything available.
Strict minimum to code: [`CODING.md`](CODING.md). Long-form guide: [`../CHEATSHEET.md`](../CHEATSHEET.md).

## Structure

| Path           | Role                                                     |
| -------------- | -------------------------------------------------------- |
| `init.lua`     | entry point, bootstraps LazyVim                          |
| `lua/config/`  | `lazy.lua`, `options.lua`, `keymaps.lua`, `autocmds.lua` |
| `lua/plugins/` | plugin specs                                             |

Plugins: `tokyonight.nvim` (colorscheme, transparent), snacks explorer (neo-tree is disabled),
`indent-blankline.nvim`, `Comment.nvim`, and the LazyVim Python extra.

Day-to-day editing keys (move, select, search, LSP) live in [`CODING.md`](CODING.md).

## Custom (in `lua/config/`)

| Key / option          | Does                                                    |
| --------------------- | ------------------------------------------------------- |
| `n` / `N`             | next / previous match, screen recentered                |
| `⌃ + d` / `⌃ + u`     | half page, screen recentered                            |
| `<` / `>` in visual   | indent and keep the selection, so it can be repeated    |
| `<leader>p` in visual | paste over a selection without losing the yank          |
| `scrolloff = 8`       | always keep 8 lines of context around the cursor        |
| `<leader>e`           | focus the explorer, never closes it                     |
| explorer at startup   | opened by `autocmds.lua`, focus handed back to the code |

## Tasks

- `:Lazy` manage and update plugins
- `stylua` formats Lua (`stylua.toml`)
