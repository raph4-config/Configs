# cli

Modern replacements for the classic Unix tools. Installed with Homebrew, wired up in
[`../zsh/.zshrc`](../zsh/.zshrc) (aliases) and [`../git/.gitconfig`](../git/.gitconfig) (delta).

```sh
brew install eza bat fd ripgrep dust git-delta fzf zoxide prettier
```

## Jump to a directory (zoxide)

| Command     | Example                                 | Does                                      |
| ----------- | --------------------------------------- | ----------------------------------------- |
| `z <chunk>` | `z raph` → `~/raph_config`              | jump to the best-ranked match             |
| `z <a> <b>` | `z conf key` → `~/raph_config/keyboard` | match several chunks of the path          |
| `zi`        | `zi conf`                               | interactive picker when `z` guesses wrong |

Ranking is frecency (frequency + recency). A fresh machine starts empty; `sync.sh` seeds it once.

## Fuzzy everything (fzf)

| Key          | Does                                                              |
| ------------ | ----------------------------------------------------------------- |
| `⌃ + R`      | search shell history                                              |
| `⌃ + T`      | insert a file path into the command being typed                   |
| `⌥ + C`      | cd into a subdirectory                                            |
| `**` + `Tab` | after `nvim`, `cd`, `kill -9`, `ssh`: pick from the matching list |

Filter syntax inside the window: `foo bar` = both, `'foo` = exact, `^src` = starts with,
`.lua$` = ends with, `!test` = exclude.

## List files (eza)

| Alias | Does                                                |
| ----- | --------------------------------------------------- |
| `ls`  | plain list, directories first                       |
| `ll`  | long list with sizes, dates and per-file git status |
| `lt`  | tree, 2 levels deep                                 |

## Read a file (bat)

| Command         | Does                                          |
| --------------- | --------------------------------------------- |
| `cat <file>`    | plain output, no pager (aliased to `bat -pp`) |
| `bat <file>`    | syntax highlighting, line numbers, pager      |
| `bat -n <file>` | line numbers without the file header          |

Theme is `TwoDark`, set by `BAT_THEME` in `.zshrc`.

## Find files (fd)

| Command          | Does                                |
| ---------------- | ----------------------------------- |
| `ff <name>`      | find by name, respects `.gitignore` |
| `fd -e lua`      | filter by extension                 |
| `fd -H <name>`   | include hidden files                |
| `fd -t d <name>` | directories only                    |

## Search inside files (rg)

| Command           | Does                                    |
| ----------------- | --------------------------------------- |
| `fgrep <text>`    | recursive search, respects `.gitignore` |
| `rg -i <text>`    | case-insensitive                        |
| `rg -l <text>`    | list matching files only                |
| `rg -t py <text>` | restrict to one file type               |

## Disk usage (dust)

| Command     | Does                                |
| ----------- | ----------------------------------- |
| `dust`      | biggest directories here, as a tree |
| `dust -d 1` | one level only                      |

## Format markdown (prettier)

Nothing to run by hand: nvim formats markdown on save through conform, and prettier is the
formatter it calls. It needs to be on the PATH, hence the brew install above.

## Git diffs (delta)

Automatic: it is git's pager, so `g df`, `g dfs` and `g show` are already rendered by it.
Inside the pager, `n` and `N` jump to the next and previous file.
