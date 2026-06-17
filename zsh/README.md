# zsh

Shell config: oh-my-posh prompt, autosuggestions, syntax highlighting, completions, plus aliases and helper functions. Synced to `~/.zshrc` by `sync.sh`.

## Basics

| Alias | Action |
|-------|--------|
| `e` | `nvim` |
| `g` | `git` |
| `cl` | `clear` |
| `py` / `python3` | `python3.12` |
| `reload` | re-source `~/.zshrc` |
| `back` | `cd -` (previous dir) |

## Config shortcuts

| Alias | Action |
|-------|--------|
| `sync-config` | run `~/raph_config/sync.sh` |
| `config` | edit `~/.zshrc` |
| `gconfig` | edit `~/.gitconfig` |
| `confposh` | edit oh-my-posh theme |
| `confvim` | edit nvim config |

## Search & find

| Alias | Action |
|-------|--------|
| `ff` | find file by name (case-insensitive), skips `venv`/`.git`/`node_modules` |
| `fls` | find file by exact name, same excludes |
| `fgrep` | recursive grep, excludes `.git`/`venv`/`node_modules` |
| `hgrep` | grep shell history |

## Python & Poetry

| Alias | Action |
|-------|--------|
| `po` | `poetry` |
| `test` | `poetry run pytest` |
| `linter` | `poetry run pre-commit run --all-files` |
| `pyvenv` | activate `.venv` (create if missing) |
| `renv` | delete `.venv` |

## Colima

| Alias | Action |
|-------|--------|
| `cstart` | start (60GB / 8GB RAM / 4 CPU) |
| `cstop` | stop |
| `crestart` | stop + start |
| `cstatus` | status |
| `cdelete` | delete VM |
| `clist` | list |
| `cssh` | ssh into VM |

## Docker

| Alias | Action | | Alias | Action |
|-------|--------|-|-------|--------|
| `d` | `docker` | | `dstop` | stop running containers |
| `dc` | `docker compose` | | `dstopall` | stop all containers |
| `dps` / `dpsa` | `ps` / `ps -a` | | `drm` | remove all containers |
| `dimg` | `images` | | `drmiall` | remove all images |
| `dvol` / `dnet` | `volume ls` / `network ls` | | `dclean` | `system prune -af` |
| `dlogs` | `logs -f` | | `dcleanvol` | `volume prune -f` |
| `dinspect` | `inspect` | | `dnuke` | prune all + volumes |
| `dstats` / `dtop` | `stats` / `top` | | `drun` / `dexec` | `run -it --rm` / `exec -it` |

### Docker Compose

| Alias | Action |
|-------|--------|
| `dcup` / `dcdown` | `up -d` / `down` |
| `dcrestart` / `dcstop` | `restart` / `stop` |
| `dclogs` / `dcps` | `logs -f` / `ps` |
| `dcbuild` / `dcpull` | `build` / `pull` |

## Apps

| Alias | Action |
|-------|--------|
| `fz` | open FileZilla |
| `db` | open DBeaver |
| `cc` | `claude` |

## Functions

| Function | Action |
|----------|--------|
| `gc <type> :<msg>` | gitmoji commit (see below); otherwise passes through to `git` |
| `ccheck` | start Colima if not running |
| `cinfo` | Colima status + containers + images overview |
| `creload` | restart Colima |
| `dsh <container>` | shell into a container (bash, falls back to sh) |
| `dlf <container>` | follow a container's logs |
| `dkill <container>` | stop + remove a container |
| `drmi <image>` | remove an image |
| `dimgsize` | list images sorted by size |

## Gitmoji (`gc`)

Usage: `gc feat :add login form` → commits `✨ feat: add login form`.

| Type | Prefix |
|------|--------|
| `fix` | 🐛 fix: |
| `feat` | ✨ feat: |
| `docs` | 📝 docs: |
| `style` | 💄 style: |
| `refactor` | ♻️ refactor: |
| `test` | ✅ test: |
| `chore` | 🚀 chore: |
| `config` | 🔧 config: |
