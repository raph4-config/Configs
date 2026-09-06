# Terminal — WezTerm + zsh

## zsh line editing (the big mouse-saver)
| Action | Key |
|--------|-----|
| Search history (fzf, fuzzy) | `⌃ + R` (type, arrows to pick) |
| Start / end of line | `⌃ + A` / `⌃ + E` |
| Word back / forward | `⌥ + B` / `⌥ + F` |
| Delete word back / to start / to end | `⌃ + W` / `⌃ + U` / `⌃ + K` |
| Accept autosuggestion (grey text) | `→` or `⌃ + E` |
| Clear screen | `⌃ + L` |
| Cancel line / EOF | `⌃ + C` / `⌃ + D` |
| Tab completion menu (arrows to pick) | `Tab` |

## zsh history tricks
| Expands to | Type |
|-----------|------|
| Repeat last command | `!!` |
| Last arg of last command | `!$` |
| Re-run last as root | `sudo !!` |

## WezTerm (defaults)
| Action | Key |
|--------|-----|
| New tab / Close tab | `⌘ + T` / `⌘ + W` |
| Prev / Next tab | `⌘ + ⇧ + [` / `]` |
| Go to tab 1..9 | `⌘ + 1..9` |
| New window | `⌘ + N` |
| Copy / Paste | `⌘ + C` / `⌘ + V` |
| Search scrollback | `⌘ + F` |
| Clear scrollback | `⌘ + K` |
| Command palette | `⌃ + ⇧ + P` |
| Copy mode (keyboard select) | `⌃ + ⇧ + X` |
| Font size +/-/reset | `⌘ + +` / `-` / `0` |

## WezTerm panes (custom, in `.wezterm.lua`)
| Action | Key |
|--------|-----|
| Split left \| right | `⌘ + D` |
| Split top / bottom | `⌘ + ⇧ + D` |
| Close pane | `⌘ + W` |
| Move between panes | `⌘ + ⌥ + ← / → / ↑ / ↓` |

## Navigation (zoxide + fzf)
| Command | Example | Does |
|---------|---------|------|
| `z <chunk>` | `z raph` → `~/raph_config` | jump to the best-ranked match |
| `z <a> <b>` | `z conf key` → `~/raph_config/keyboard` | match several chunks of the path |
| `zi` | `zi conf` | interactive picker when `z` guesses wrong |
| `⌃ + T` | `nvim` then `⌃ + T` | insert a file path into the current command |
| `⌥ + C` | | cd into a subdirectory, fuzzy |

Ranking is frecency (frequency + recency): it self-corrects after a few days of real use.

## My aliases
| Alias | Does |
|-------|------|
| `e` | nvim |
| `g` | git |
| `gc <type> :msg` | gitmoji commit (feat/fix/docs/…) |
| `sync-config` | push dotfiles into place + reload |
| `reload` | reload zsh |
| `py` | python3.12 · `po` poetry · `test` pytest · `linter` pre-commit |
| `pyvenv` / `renv` | create+activate .venv / delete it |
| `ff <name>` / `fls <name>` | find file by name |
| `fgrep <txt>` | recursive grep (skips .git/venv/node_modules) |
| `hgrep <txt>` | search shell history |
| `cc` | claude |

## Docker / Colima
| Alias | Does |
|-------|------|
| `cstart` / `cstop` / `cstatus` | colima start (60G/8G/4cpu) / stop / status |
| `d` / `dc` | docker / docker compose |
| `dps` / `dpsa` | running / all containers |
| `dcup` / `dcdown` | compose up -d / down |
| `dclogs` | compose logs -f |
| `dsh <ctr>` | shell into a container |
| `dlf <ctr>` | follow a container's logs |
| `dclean` / `dnuke` | prune images / prune everything + volumes |
