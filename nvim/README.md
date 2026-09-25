# nvim

LazyVim, copied to `~/.config/nvim/` by `sync-config`. Leader is `␣`, press it alone to list
everything. Files auto-save.

## Files and buffers

| Key           | Does                          |
| ------------- | ----------------------------- |
| `␣ ␣`         | find a file                   |
| `␣ f r`       | recent files                  |
| `␣ e`         | open, focus or close explorer |
| `⇧ H` / `⇧ L` | previous / next buffer        |
| `␣ ,`         | pick a buffer                 |
| `Q`           | close the buffer              |
| `␣ b o`       | close the other buffers       |
| `␣ q`         | quit                          |

## Move

| Key             | Does                               |
| --------------- | ---------------------------------- |
| `w` / `b` / `e` | next / previous / end of word      |
| `0` / `^` / `$` | line start / first char / line end |
| `{` / `}`       | previous / next paragraph          |
| `gg` / `G`      | top / bottom                       |
| `f<char>` / `;` | next char on the line / repeat     |
| `%`             | matching bracket                   |
| `⌃ d` / `⌃ u`   | half page down / up                |
| `⌃ o`           | jump back                          |

## Edit

| Key                   | Does                                          |
| --------------------- | --------------------------------------------- |
| `i` / `a` / `I` / `A` | insert before / after / line start / line end |
| `o` / `O`             | new line below / above                        |
| `x` / `r<char>`       | delete / replace a char                       |
| `dd` / `yy` / `p`     | cut / copy / paste a line                     |
| `D` / `C`             | cut / change to line end                      |
| `diw` / `ciw`         | cut / change the word                         |
| `ci"` / `ci(`         | change inside quotes / parens                 |
| `>>` / `<<`           | indent / unindent                             |
| `gcc` / `gc`          | comment line / selection                      |
| `u` / `⌃ r` / `.`     | undo / redo / repeat                          |

## Select

| Key               | Does                           |
| ----------------- | ------------------------------ |
| `v` / `V` / `⌃ v` | chars / lines / block          |
| `viw` / `vi"`     | word / inside quotes           |
| `ggVG`            | whole file                     |
| `gv`              | previous selection             |
| `␣ p`             | paste over, keep the clipboard |

## Search

| Key               | Does                              |
| ----------------- | --------------------------------- |
| `/text` / `n` `N` | search / next, previous           |
| `*`               | word under the cursor             |
| `:%s/a/b/g`       | replace in the file               |
| `␣ /`             | grep the project                  |
| `␣ s w`           | grep the word under the cursor    |
| `␣ s r`           | search and replace in the project |
| `␣ s k`           | search keymaps                    |

## Code

| Key           | Does                       |
| ------------- | -------------------------- |
| `g d` / `g r` | definition / references    |
| `K`           | documentation              |
| `␣ c a`       | code action                |
| `␣ c r`       | rename                     |
| `␣ c f`       | format                     |
| `] d` / `[ d` | next / previous diagnostic |
| `␣ x x`       | all diagnostics            |

## Git and terminal

| Key           | Does                 |
| ------------- | -------------------- |
| `␣ g g`       | lazygit              |
| `␣ g b`       | blame the line       |
| `] h` / `[ h` | next / previous hunk |
| `␣ g h s`     | stage the hunk       |
| `␣ g h r`     | reset the hunk       |
| `⌃ /`         | toggle terminal      |
| `Esc Esc`     | leave terminal mode  |
