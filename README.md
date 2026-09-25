# dotfiles

Personal macOS config. `sync-config` copies everything into place.

## Text

| Action                    | WezTerm (zsh)     | Neovim        |
| ------------------------- | ----------------- | ------------- |
| Delete previous word      | `⌘ ⌫`             | `⌘ ⌫`         |
| Delete next word          | `⌘ ⇧ ⌫`           | `⌘ ⇧ ⌫`       |
| Line start / end          | `⌘ ⇧ ←` / `⌘ ⇧ →` | `0` / `$`     |
| Previous / next word      | `⌘ ←` / `⌘ →`     | `⌘ ←` / `⌘ →` |
| Previous / next paragraph | none              | `⌘ ↑` / `⌘ ↓` |
| Undo / redo               | `⌘ u` / `⌘ ⇧ u`   | `u` / `⌃ R`   |

## Splits

| Action              | WezTerm     | Neovim      |
| ------------------- | ----------- | ----------- |
| Split left \| right | `⌘ D`       | `␣ \|`      |
| Split top / bottom  | `⌘ ⇧ D`     | `␣ -`       |
| Move between splits | `⌘ h j k l` | `⌃ h j k l` |
| Close               | `⌃ D`       | `␣ w d`     |

## Folders

| Folder                              | Config                             |
| ----------------------------------- | ---------------------------------- |
| [`claude/`](claude/README.md)       | Claude Code skills and status line |
| [`cli/`](cli/README.md)             | eza, bat, fd, rg, dust, delta, fzf |
| [`direnv/`](direnv/README.md)       | direnv                             |
| [`espanso/`](espanso/README.md)     | text expansion                     |
| [`git/`](git/README.md)             | git config and aliases             |
| [`keyboard/`](keyboard/README.md)   | QMK firmware for the Corne         |
| [`lazygit/`](lazygit/README.md)     | lazygit                            |
| [`nix/`](nix/README.md)             | Home Manager packages              |
| [`nvim/`](nvim/README.md)           | Neovim (LazyVim)                   |
| [`shortcuts/`](shortcuts/README.md) | macOS and Chrome                   |
| [`wezterm/`](wezterm/README.md)     | WezTerm                            |
| [`zsh/`](zsh/README.md)             | zsh, aliases, oh-my-posh           |
