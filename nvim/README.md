# nvim

Neovim on [LazyVim](https://lazyvim.github.io/), synced to `~/.config/nvim/` by `sync.sh`.
Plugin versions pinned in `lazy-lock.json`.

Leader is `Space`. Press it alone and wait: which-key lists everything available.
For the long-form guide (vim grammar, modes, learning path), see [`../CHEATSHEET.md`](../CHEATSHEET.md).

## Structure

| Path | Role |
|------|------|
| `init.lua` | entry point, bootstraps LazyVim |
| `lua/config/` | `lazy.lua`, `options.lua`, `keymaps.lua`, `autocmds.lua` |
| `lua/plugins/` | plugin specs |

Plugins: `tokyonight.nvim` (colorscheme, transparent), `neo-tree.nvim`, `indent-blankline.nvim`,
`Comment.nvim`, and the LazyVim Python extra.

## Files and search

| Key | Does |
|-----|------|
| `<leader><leader>` | find file in the project |
| `<leader>fr` | recent files |
| `<leader>/` | grep the whole project |
| `<leader>e` | file explorer |
| `<leader>,` | jump to an open buffer |
| `/text` then `n` / `N` | search in the current file |

## Move

| Key | Does |
|-----|------|
| `w` / `b` / `e` | word forward / back / end |
| `0` / `^` / `$` | line start / first char / end |
| `gg` / `G` | top / bottom of file |
| `⌃ + u` / `⌃ + d` | half page up / down |
| `f<char>` then `;` | jump to a char on the line, repeat |
| `%` | matching bracket |
| `⌃ + o` / `⌃ + i` | back / forward in the jump history |

## Edit

| Key | Does |
|-----|------|
| `ciw` / `diw` | change / delete the word under the cursor |
| `ci"` `ci(` `ci{` | change inside quotes, parens, braces |
| `dd` / `yy` / `p` | cut / copy / paste a line |
| `.` | repeat the last change |
| `gcc` / `gc` | comment a line / a selection |
| `u` / `⌃ + r` | undo / redo |

## Code (LSP)

| Key | Does |
|-----|------|
| `gd` / `gr` | go to definition / references |
| `K` | hover doc |
| `<leader>cr` / `<leader>ca` | rename symbol / code action |
| `<leader>cf` | format |
| `]d` / `[d` | next / previous diagnostic |

## Windows, git, exit

| Key | Does |
|-----|------|
| `⇧ + H` / `⇧ + L` | previous / next buffer |
| `<leader>bd` | close buffer |
| `<leader>-` / `<leader>\|` | split below / right |
| `⌃ + h/j/k/l` | move between splits |
| `<leader>gg` | LazyGit |
| `⌃ + /` | toggle terminal |
| `⌃ + s` / `<leader>qq` | save / quit all |

## Custom (in `lua/config/`)

| Key / option | Does |
|--------------|------|
| `n` / `N` | next / previous match, screen recentered |
| `⌃ + d` / `⌃ + u` | half page, screen recentered |
| `<` / `>` in visual | indent and keep the selection, so it can be repeated |
| `<leader>p` in visual | paste over a selection without losing the yank |
| `scrolloff = 8` | always keep 8 lines of context around the cursor |

## Tasks

- `:Lazy` manage and update plugins
- `stylua` formats Lua (`stylua.toml`)
