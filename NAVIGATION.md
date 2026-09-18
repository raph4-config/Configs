# Navigation

Getting somewhere else, from the whole Mac down to the cursor.
Acting on text once you are there is in [`nvim/CODING.md`](nvim/CODING.md).

`⌘` Cmd · `⌥` Option · `⌃` Ctrl · `⇧` Shift · `␣` Space, the nvim leader

## One rule

> **`⌘` outside nvim, `⌃` inside nvim.**

`⌘ h j k l` walks WezTerm panes, `⌃ h j k l` walks nvim splits. Same fingers, same
directions, the modifier tells you which layer you are on.

| Layer   | Unit             | Modifier     |
| ------- | ---------------- | ------------ |
| macOS   | app, window      | `⌘`          |
| WezTerm | pane, tab        | `⌘`          |
| nvim    | buffer, split    | `⇧` then `⌃` |
| Line    | word, start, end | `⌃` and `⌥`  |

## macOS

| Move                        | Key         |
| --------------------------- | ----------- |
| Next app                    | `⌘ ⇥`       |
| Next window of the same app | `` ⌘ ` ``   |
| Launch or search            | `⌘ ␣`       |
| Minimize                    | `⌘ M`       |
| Close window / quit app     | `⌘ W` `⌘ Q` |
| Fullscreen                  | `⌃ ⌘ F`     |
| Desktop left / right        | `⌃ ← / →`   |
| Mission Control             | `⌃ ↑`       |

More in [`shortcuts/macos.md`](shortcuts/macos.md).

## WezTerm

| Move                | Key                 |
| ------------------- | ------------------- |
| Split right         | `⌘ D`               |
| Split down          | `⌘ ⇧ D`             |
| **Between panes**   | `⌘ h j k l` or `⌘ ←↓↑→` |
| Close pane          | `⌘ W`               |
| New tab             | `⌘ T`               |
| Tab 1 to 9          | `⌘ 1` … `⌘ 9`       |
| Previous / next tab | `⌘ ⇧ [` / `⌘ ⇧ ]`   |

`⌘ H` moves to the left pane here, it no longer hides the app: use `⌘ M`.
`⌘ K` moves up, it no longer clears the scrollback: use the `cl` alias.

## nvim: between files

Buffers are the open files, splits are the panes on screen, tabs are whole layouts
of splits. You will live in buffers and splits; tabs are rarely worth it.

| Move                  | Key         |
| --------------------- | ----------- |
| Previous / next buffer | `⇧ H` / `⇧ L` |
| Back to the last one  | `` ␣ ` ``   |
| Pick from a list      | `␣ ,`       |
| **Close the buffer**  | `Q`         |
| Close all the others  | `␣ b o`     |
| Split right / down    | `␣ \|` / `␣ -` |
| **Between splits**    | `⌃ h j k l` |
| Resize the split      | `⌃ ←↓↑→`    |
| Close the split       | `␣ w d`     |
| New tab               | `␣ ⇥ ⇥`     |
| Previous / next tab   | `␣ ⇥ [` / `␣ ⇥ ]` |

## nvim: open something

| Move                   | Key     |
| ---------------------- | ------- |
| Fuzzy find in the project | `␣ ␣` |
| Recent files           | `␣ f r` |
| File explorer          | `␣ e`   |
| Grep the project       | `␣ /`   |
| Go to definition       | `g d`   |
| **Come back**          | `⌃ o`   |

`g d` then `⌃ o` is the loop: jump to the definition, read it, return.

Inside the explorer (`␣ e`):

| Key             | Does                            |
| --------------- | ------------------------------- |
| `j` / `k`       | down / up                       |
| `l` / `Enter`   | open the file, unfold the folder |
| `h`             | fold the folder                 |
| `a` / `d` / `r` | create / delete / rename        |
| `H` / `I`       | toggle hidden / ignored files   |

## Shell: move on the line

| Move                    | Key           |
| ----------------------- | ------------- |
| **Start / end of line** | `⌃ A` / `⌃ E` |
| **Word back / forward** | `⌥ B` / `⌥ F` |
| Char back / forward     | `⌃ B` / `⌃ F` |
| Delete word back        | `⌃ W`         |
| Delete word forward     | `⌥ D`         |
| Delete to start / end   | `⌃ U` / `⌃ K` |
| Paste back what you cut | `⌃ Y`         |
| Undo the edit           | `⌃ _`         |
| Clear the screen        | `⌃ L`         |

`WORDCHARS=''` in [`zsh/.zshrc`](zsh/.zshrc) makes the word moves stop at `/ . - _`,
so `⌥ B` walks a path one segment at a time instead of jumping over the whole thing.

## Shell: go elsewhere

| Move                          | Command   |
| ----------------------------- | --------- |
| cd by name, from anywhere     | `cd raph` |
| Picker when it guesses wrong  | `ci`      |
| Browse, then cd where you landed | `y`    |
| Previous directory            | `back`    |
| Search the history            | `⌃ R`     |
| Insert a file path            | `⌃ T`     |
| cd into a subdirectory        | `⌥ C`     |

More in [`cli/README.md`](cli/README.md).
