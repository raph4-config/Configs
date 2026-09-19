# fzf

Config in [`../zsh/.zshrc`](../zsh/.zshrc), sections `FZF` and `FZF POWER TOOLS`.

## The one idea

fzf takes **lines on stdin**, you **narrow them by typing**, it **prints the one you picked**.

```sh
g branch | f      # f is fzf: any command that prints lines can be filtered
docker ps | f
```

Everything below is a wrapper that decides where the lines come from and what happens to your pick.

## In the shell

| Key        | Lines                  | The pick                   |
| ---------- | ---------------------- | -------------------------- |
| **`⌃ R`**  | shell history          | fills the command line     |
| **`⌃ T`**  | files below here       | is inserted where you type |
| `⌥ C`      | directories below here | you cd into it             |
| `**` + `⇥` | depends on the command | completes it               |

`⌃ Y` in `⌃ R` copies the command instead of running it.

## In the window

| Key           | Does                           |
| ------------- | ------------------------------ |
| `⌃ J` / `⌃ K` | move the selection             |
| **`Enter`**   | accept                         |
| **`Esc`**     | cancel                         |
| `⇥`           | mark several, where it applies |
| `⌃ /`         | toggle the preview             |
| `⌥ ↑` / `⌥ ↓` | scroll the preview             |

Words are fuzzy and ANDed: `zsh fzf md` finds `cli/fzf.md`. To anchor: `'foo` exact,
`^src` starts with, `.lua$` ends with, `!test` excludes.

## The commands

| Command | Does                                                          |
| ------- | ------------------------------------------------------------- |
| `frg`   | live ripgrep over the project, `Enter` opens nvim on the line |
| `fbr`   | branches by recency, `Enter` switches                         |
| `flog`  | commits with their diff, `Enter` copies the sha               |
| `fkill` | processes, `Enter` sends TERM (`fkill 9` for KILL)            |

`frg` is the one to keep: you know a string exists but not where.

```sh
frg send_composed
```
