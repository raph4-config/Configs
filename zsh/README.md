# zsh

`.zshrc` and the oh-my-posh theme, copied into place by `sync-config`.

| Alias                                         | Does                                  |
| --------------------------------------------- | ------------------------------------- |
| `e` / `g` / `lg` / `cl`                       | nvim / git / lazygit / clear          |
| `py`                                          | `python3.12`                          |
| `reload`                                      | reload `.zshrc`                       |
| `back`                                        | previous folder                       |
| `sync-config`                                 | copy this repo into place             |
| `config` / `gconfig` / `confposh` / `confvim` | edit zsh / git / prompt / nvim config |
| `cc` / `cce`                                  | claude / claude with `.env` loaded    |
| `fz` / `db`                                   | FileZilla / DBeaver                   |

## Python

| Alias    | Does                                    |
| -------- | --------------------------------------- |
| `pyvenv` | create and activate `.venv`             |
| `renv`   | delete `.venv`                          |
| `po`     | poetry                                  |
| `test`   | `poetry run pytest`                     |
| `linter` | `poetry run pre-commit run --all-files` |

## Gitmoji

`gc feat :add login` commits `✨ feat: add login`.

| Type                | Emoji  |
| ------------------- | ------ |
| `fix` / `feat`      | 🐛 / ✨  |
| `docs` / `style`    | 📝 / 💄  |
| `refactor` / `test` | ♻️ / ✅ |
| `chore` / `config`  | 🚀 / 🔧  |

## Colima and Docker

| Alias                           | Does                                    |
| ------------------------------- | --------------------------------------- |
| `cstart` / `cstop` / `crestart` | start / stop / restart Colima           |
| `cstatus` / `cinfo`             | status / status, containers, images     |
| `d` / `dc`                      | docker / docker compose                 |
| `dps` / `dpsa` / `dimg`         | containers / all containers / images    |
| `dsh <c>` / `dlf <c>`           | shell into / follow logs of a container |
| `drun` / `dexec`                | `run -it --rm` / `exec -it`             |
| `dstop` / `dkill <c>`           | stop all / stop and remove one          |
| `dcup` / `dcdown` / `dclogs`    | compose up / down / logs                |
| `dclean` / `dnuke`              | prune all / prune all with volumes      |
