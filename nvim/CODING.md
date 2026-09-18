# Coding in nvim

Acting on code once you are in the file. Getting to the file is in
[`../NAVIGATION.md`](../NAVIGATION.md). Leader is `Space`, written `␣`.

> **Operator + motion.** `d` delete, `c` change, `y` copy, `>` indent, each followed by
> a motion from the table below. `d}` deletes to the end of the paragraph, `c$` changes
> to the end of the line, `ciw` changes the word. Learn the motions once, every operator
> takes them.

## The modes

| Mode     | Enter with        | Leave with | For                       |
| -------- | ----------------- | ---------- | ------------------------- |
| Normal   | `Esc`, the default | -          | moving, running commands  |
| Insert   | `i` `a` `o`       | `Esc`      | typing text               |
| Visual   | `v` `V` `⌃ v`     | `Esc`      | selecting                 |
| Command  | `:`               | `Esc`      | `:w`, `:q`, replacements  |
| Terminal | inside a terminal | `Esc Esc`  | the embedded shell        |

You live in Normal. The reflex is `Esc` between every action.

## Move in the file

| Key             | Moves to                                      |
| --------------- | --------------------------------------------- |
| `w` / `b`       | next / previous word                          |
| `e`             | end of the word                               |
| `0` / `^` / `$` | start of line / first character / end of line |
| `{` / `}`       | previous / next blank line                    |
| `gg` / `G`      | top / bottom of the file                      |
| `42G`           | line 42                                       |
| `⌃ d` / `⌃ u`   | half page down / up, recentered               |
| `f<char>`       | next occurrence of that char on the line      |
| `;`             | repeat the last `f`                           |
| `%`             | matching bracket                              |

## Select

| Key               | Selects                                     |
| ----------------- | ------------------------------------------- |
| `v` / `V` / `⌃ v` | characters / whole lines / rectangular block |
| `viw`             | the word under the cursor                   |
| `vi"` `vi(` `vi{` | inside the quotes, parens, braces            |
| `ggVG`            | the whole file                              |
| `gv`              | whatever you had selected before            |

Then `d` cut, `y` copy, `c` replace, `>` / `<` indent, `gc` comment.

## Edit

| Key            | Does                                    |
| -------------- | --------------------------------------- |
| `i` / `a`      | insert before / after the cursor        |
| `I` / `A`      | insert at start / end of the line       |
| `o` / `O`      | open a line below / above               |
| `x`            | delete the character                    |
| `r<char>`      | replace the character                   |
| `dd` / `yy`    | cut / copy the line                     |
| `D` / `C`      | cut / change to the end of the line     |
| `ciw` / `diw`  | change / cut the word                   |
| `ci"` `ci(`    | change inside the quotes, the parens    |
| `>>` / `<<`    | indent / unindent the line              |
| `gcc` / `gc`   | comment the line / the selection        |

## Undo and repeat

| Key   | Does                                    |
| ----- | --------------------------------------- |
| `u`   | undo                                    |
| `⌃ r` | redo                                    |
| `.`   | repeat the last change                  |

`.` is the biggest time saver in the editor: change one thing, then move and press `.`.

## Copy and paste

`y` writes straight to the macOS clipboard and `p` reads from it, so copy and paste
work between nvim and the rest of the machine with no extra step.

| Key       | Does                                             |
| --------- | ------------------------------------------------ |
| `y` / `p` | copy / paste                                     |
| `P`       | paste before the cursor                          |
| `␣ p`     | paste over a selection without losing the copy   |

## Search and replace

| Key              | Does                                    |
| ---------------- | --------------------------------------- |
| `/text`          | search in the file                      |
| `n` / `N`        | next / previous match, recentered       |
| `*`              | search the word under the cursor        |
| `:%s/old/new/g`  | replace in the file, add `c` to confirm each |
| `␣ /`            | grep the project, live results          |
| `␣ s w`          | grep the word under the cursor          |
| `␣ s k`          | search the keymaps themselves           |

## Understand the code

| Key     | Does                                     |
| ------- | ---------------------------------------- |
| `g d`   | go to the definition                     |
| `⌃ o`   | come back                                |
| `g r`   | list the references                      |
| `K`     | documentation of the symbol              |
| `␣ c a` | code action: fix, import, refactor       |
| `␣ c r` | rename the symbol everywhere             |
| `␣ c f` | format the file                          |
| `] d` / `[ d` | next / previous diagnostic         |
| `␣ x x` | list every diagnostic                    |

`g d` then `⌃ o` is the loop you will use most.

## Git

| Key           | Does                              |
| ------------- | --------------------------------- |
| `␣ g g`       | open lazygit                      |
| `␣ g b`       | blame the line                    |
| `] h` / `[ h` | next / previous hunk              |
| `␣ g h s`     | stage the hunk                    |
| `␣ g h r`     | reset the hunk                    |

## Run something

| Key       | Does                                          |
| --------- | --------------------------------------------- |
| `⌃ /`     | open or hide a terminal in the project root   |
| `Esc Esc` | leave terminal mode, to scroll in it          |
| `⌃ s`     | save                                          |
| `␣ q`     | quit everything                               |
| `:q!`     | quit without saving                           |

Buffers auto-save once they stop changing, so `⌃ s` is mostly for peace of mind.
