# ─── OH MY POSH ─────────────────────────────────────────────
eval "$(oh-my-posh init zsh --config ~/.config/oh-my-posh/zash.omp.json)"

# ─── HOMEBREW ───────────────────────────────────────────────
eval "$(/opt/homebrew/bin/brew shellenv zsh)"

# ─── 🛠️ LOCAL BIN ───────────────────────────────────────────
# User-installed CLIs (qmk, uv, ...) live here
export PATH="$HOME/.local/bin:$PATH"

# ─── BASIC ALIASES ──────────────────────────────────────────
alias e='nvim'
alias g='git'
alias cl='clear'
alias py='python3.12'
alias python3='python3.12'
alias reload='source ~/.zshrc && echo "✅ Shell reloaded"'
alias back='cd -'

# ─── 📝 CONFIG FILE SHORTCUTS ───────────────────────────────
alias sync-config='~/raph_config/sync.sh'
alias config='nvim ~/.zshrc'
alias gconfig='nvim ~/.gitconfig'
alias confposh='nvim ~/.config/oh-my-posh/zash.omp.json'
alias confvim='nvim ~/.config/nvim'

# ─── 🔍 SEARCH & FIND ───────────────────────────────────────
alias ff='find . -type f \( -path "./venv" -o -path "./.git" -o -path "./node_modules" \) -prune -false -o -iname'
alias fls='find . -type f \( -path "./venv" -o -path "./.git" -o -path "./node_modules" \) -prune -false -o -name'
alias fgrep='grep -rni --exclude-dir={.git,venv,node_modules}'
alias hgrep='history | grep'

# ─── 🐍 PYTHON & POETRY ─────────────────────────────────────
alias po='poetry'
alias test='poetry run pytest'
alias linter='poetry run pre-commit run --all-files'
alias pyvenv='[ -d .venv ] && source .venv/bin/activate || (python3.12 -m venv .venv && source .venv/bin/activate)'
alias renv='rm -rf .venv && echo "✅ .venv deleted"'
alias dbtibf='/Users/arn/ibanfirst/dbt_ibf/.venv/bin/dbt'

# ─── 💄 GITMOJI COMMIT ──────────────────────────────────────
gc() {
    if [[ "$1" =~ ^(fix|feat|docs|style|refactor|test|chore|config)$ && "$2" == :* ]]; then
        type=$1
        message="${*:2}"
        message="${message#:}"
        case $type in
            fix)      emoji="🐛 fix: " ;;
            feat)     emoji="✨ feat: " ;;
            docs)     emoji="📝 docs: " ;;
            style)    emoji="💄 style: " ;;
            refactor) emoji="♻️ refactor: " ;;
            test)     emoji="✅ test: " ;;
            chore)    emoji="🚀 chore: " ;;
            config)   emoji="🔧 config: " ;;
        esac
        git commit -m "$emoji$message"
    else
        git "$@"
    fi
}

# ─── 🐳 COLIMA ───────────────────────────────────────────────
alias cstart='colima start --disk 60 --memory 8 --cpu 4'
alias cstop='colima stop'
alias crestart='colima stop && colima start --disk 60 --memory 8 --cpu 4'
alias cstatus='colima status'
alias cdelete='colima delete'
alias clist='colima list'
alias cssh='colima ssh'

ccheck() {
    if ! colima status &>/dev/null; then
        echo "⚠️  Colima is not running. Starting..."
        colima start --disk 60 --memory 8 --cpu 4
    else
        echo "✅ Colima is active"
        colima status
    fi
}

cinfo() {
    echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
    echo "🐳 COLIMA — 60GB | 8GB RAM | 4 CPUs"
    echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
    colima status
    echo ""
    echo "📦 CONTAINERS"
    docker ps
    echo ""
    echo "🖼️  IMAGES"
    docker images
}

creload() {
    echo "🔄 Restarting Colima..."
    colima stop && sleep 2
    colima start --disk 60 --memory 8 --cpu 4
    echo "✅ Colima restarted"
}

# ─── 🐳 DOCKER ──────────────────────────────────────────────
alias d='docker'
alias dc='docker compose'
alias dps='docker ps'
alias dpsa='docker ps -a'
alias dimg='docker images'
alias dvol='docker volume ls'
alias dnet='docker network ls'
alias dlogs='docker logs -f'
alias dinspect='docker inspect'
alias dstats='docker stats'
alias dtop='docker top'
alias dstop='docker stop $(docker ps -q)'
alias dstopall='docker stop $(docker ps -aq)'
alias drm='docker rm $(docker ps -aq)'
alias drmiall='docker rmi $(docker images -q)'
alias dclean='docker system prune -af'
alias dcleanvol='docker volume prune -f'
alias dnuke='docker system prune -af --volumes'
alias drun='docker run -it --rm'
alias dexec='docker exec -it'
alias dcup='docker compose up -d'
alias dcdown='docker compose down'
alias dcrestart='docker compose restart'
alias dclogs='docker compose logs -f'
alias dcps='docker compose ps'
alias dcbuild='docker compose build'
alias dcpull='docker compose pull'
alias dcstop='docker compose stop'

dsh() {
    [ -z "$1" ] && echo "Usage: dsh <container>" && return 1
    docker exec -it "$1" sh -c '[ -x /bin/bash ] && /bin/bash || /bin/sh'
}

dlf() {
    [ -z "$1" ] && echo "Usage: dlf <container>" && return 1
    docker logs -f "$1"
}

dkill() {
    [ -z "$1" ] && echo "Usage: dkill <container>" && return 1
    docker stop "$1" && docker rm "$1"
}

drmi() {
    [ -z "$1" ] && echo "Usage: drmi <image>" && return 1
    docker rmi "$1"
}

dimgsize() {
    docker images --format "table {{.Repository}}\t{{.Tag}}\t{{.Size}}" | sort -k 3 -h
}

# ─── ☕ JAVA ─────────────────────────────────────────────────
export JAVA_HOME="/opt/homebrew/opt/openjdk@21"
export PATH="$JAVA_HOME/bin:$PATH"


# ─── 🔮 AUTOCOMPLETION ──────────────────────────────────────
# Autosuggestions (suggestions en gris basées sur l'historique)
source $(brew --prefix)/share/zsh-autosuggestions/zsh-autosuggestions.zsh

# Syntax highlighting (commandes en vert/rouge)
source $(brew --prefix)/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# Completions avancées
fpath[1,0]=$(brew --prefix)/share/zsh-completions

ZSH_DISABLE_COMPFIX=true
# Active le système de completion
autoload -Uz compinit && compinit -u

# Menu de sélection avec Tab
zstyle ':completion:*' menu select
# Completion insensible à la casse
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'
alias fz='open /Applications/FileZilla.app'

alias db='open /Applications/DBeaver.app'
alias cc='claude'
alias mcpcc='set -a && source .env && claude --strict-mcp-config --mcp-config .mcp.json'
