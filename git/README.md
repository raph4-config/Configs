# git

`.gitconfig`, copied to `~/.gitconfig` by `sync-config`. Used through the `g` alias.

| Command                        | Does                                          |
| ------------------------------ | --------------------------------------------- |
| `g st`                         | short status                                  |
| `g df` / `g dfs`               | diff working tree / staged                    |
| `g a <file>` / `g au` / `g aa` | stage a file / tracked changes / everything   |
| `gc <type> :<msg>`             | gitmoji commit                                |
| `g cm "<msg>"`                 | plain commit                                  |
| `g lo` / `g log-all`           | last 20 commits / all branches, as a graph    |
| `g cob <branch>`               | create and switch                             |
| `g sw <branch>`                | switch                                        |
| `g br`                         | list branches                                 |
| `g psb`                        | push and set upstream                         |
| `g pl` / `g f`                 | pull / fetch and prune                        |
| `g amend`                      | add staged changes to the last commit         |
| `g undo`                       | undo the last commit, keep the changes staged |
| `g pf`                         | force push with lease                         |
