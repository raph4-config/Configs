# Coding in nvim: the strict minimum

Leader is `Space`. Everything here is verified against this config.
The one idea worth internalising: **operator + motion**. `d` delete, `c` change, `y` copy,
`v` select, each followed by a motion below. `d}` deletes to the end of the paragraph,
`ciw` changes the word. Learn the motions once, they work with every operator.

## Move

| Key                | Moves to                                         |
| ------------------ | ------------------------------------------------ |
| `w` / `b`          | next / previous word                             |
| `e`                | end of the word                                  |
| `{` / `}`          | previous / next paragraph (blank line)           |
| `0` / `^` / `$`    | start of line / first character / end of line    |
| `gg` / `G`         | top / bottom of the file                         |
| `42G`              | line 42                                          |
| `⌃ + d` / `⌃ + u`  | half page down / up                              |
| `f<char>` then `;` | next occurrence of that char on the line, repeat |
| `%`                | matching bracket                                 |
| `⌃ + o` / `⌃ + i`  | back / forward through your jumps                |

`⌃ + o` is the one to remember: it always brings you back where you came from.

## Select

| Key               | Selects                                              |
| ----------------- | ---------------------------------------------------- |
| `v`               | character by character, extend with any motion above |
| `V`               | whole lines                                          |
| `⌃ + v`           | rectangular block (column editing)                   |
| `viw`             | the word under the cursor                            |
| `vi"` `vi(` `vi{` | inside the quotes, parens, braces                    |
| `gv`              | reselect what you had before                         |

Once selected: `d` cut, `y` copy, `c` replace, `>` / `<` indent, `gc` comment.

## Undo and redo

| Key     | Does                                                             |
| ------- | ---------------------------------------------------------------- |
| `u`     | undo                                                             |
| `⌃ + r` | redo                                                             |
| `.`     | repeat the last change (not an undo, but the biggest time saver) |

## Search in the current file

| Key                  | Does                                     |
| -------------------- | ---------------------------------------- |
| `/text` then `Enter` | search forward                           |
| `n` / `N`            | next / previous match, screen recentered |
| `*`                  | search the word under the cursor         |
| `:%s/old/new/g`      | replace everywhere in the file           |
| `:%s/old/new/gc`     | same, asking for confirmation each time  |

## Search the whole project

| Key          | Does                                             |
| ------------ | ------------------------------------------------ |
| `<leader>/`  | grep the project, live results                   |
| `<leader>sw` | grep the word under the cursor, or the selection |
| `<leader>sg` | same as `<leader>/`                              |

## Find a file

| Key                | Does                             |
| ------------------ | -------------------------------- |
| `<leader><leader>` | fuzzy find a file in the project |
| `<leader>fr`       | recently opened files            |
| `<leader>,`        | jump to an already open buffer   |
| `<leader>e`        | focus the explorer               |

## Understand the code (LSP)

| Key          | Does                                         |
| ------------ | -------------------------------------------- |
| `gd`         | go to definition                             |
| `gr`         | list references                              |
| `K`          | documentation of the symbol under the cursor |
| `<leader>ca` | code action (fix, import, refactor)          |
| `<leader>cr` | rename the symbol everywhere                 |
| `<leader>cf` | format the file                              |
| `]d` / `[d`  | next / previous diagnostic                   |

`gd` then `⌃ + o` is the loop you will use most: jump to the definition, read, come back.
