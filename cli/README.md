# cli

Modern Unix tools, aliased in `zsh/.zshrc`.

| Command                     | Does                                    |
| --------------------------- | --------------------------------------- |
| `ls` / `ll` / `lt`          | list / long list with git status / tree |
| `cat <file>` / `bat <file>` | plain / highlighted with pager          |
| `ff <name>`                 | find files by name                      |
| `fgrep <text>`              | search inside files                     |
| `dust`                      | biggest folders here                    |
| `z <chunk>` / `zi`          | jump to a folder / pick it              |
| `cd <chunk>` / `ci`         | same as `z` / `zi`                      |
| `y`                         | browse with yazi, cd where you quit     |

## fzf

| Key / Command | Does                                      |
| ------------- | ----------------------------------------- |
| `⌃ R`         | search history                            |
| `⌃ T`         | insert a file path                        |
| `⌥ C`         | cd into a subfolder                       |
| `**` `⇥`      | complete from a fuzzy list                |
| `<cmd> \| f`  | filter any output                         |
| `frg <text>`  | live grep, `Enter` opens nvim on the line |
| `fbr`         | switch branch                             |
| `flog`        | browse commits, `Enter` copies the sha    |
| `fkill`       | kill a process                            |

| In the list                   | Does                         |
| ----------------------------- | ---------------------------- |
| `⌃ J` / `⌃ K`                 | move                         |
| `⇥`                           | mark several                 |
| `⌃ /`                         | toggle preview               |
| `'foo` `^src` `.lua$` `!test` | exact, starts, ends, exclude |
