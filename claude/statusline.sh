#!/bin/bash
# ─── CLAUDE CODE STATUSLINE ─────────────────────────────────
# Ligne 1 : modele, effort, dossier, branche, PR.
# Ligne 2 : barre de contexte coloree, tokens, cout, quota 5h.
# Registered via "statusLine" in ~/.claude/settings.json.
# Runs on every assistant message, so it stays to a single jq call.

input=$(cat)

# Un champ par ligne : IFS=tab fusionnerait les champs vides et decalerait tout.
# Boucle read plutot que mapfile, absent du bash 3.2 livre par macOS.
FIELD=()
while IFS= read -r line; do FIELD+=("$line"); done < <(jq -r '[
    .model.display_name,
    (.effort.level // ""),
    (if .fast_mode then "1" else "" end),
    ((.context_window.used_percentage // 0) | floor),
    (.context_window.total_input_tokens // 0),
    (.context_window.context_window_size // 0),
    (.cost.total_cost_usd // 0),
    ((.cost.total_duration_ms // 0) / 60000 | floor),
    (.pr.number // ""),
    (.pr.review_state // ""),
    (.rate_limits.five_hour.used_percentage // ""),
    (.workspace.git_worktree // .worktree.name // "")
  ] | .[] | tostring' <<<"$input")

MODEL=${FIELD[0]}    EFFORT=${FIELD[1]}    FAST=${FIELD[2]}
PCT=${FIELD[3]}      USED=${FIELD[4]}      SIZE=${FIELD[5]}
COST=${FIELD[6]}     DUR=${FIELD[7]}       PR=${FIELD[8]}
PR_STATE=${FIELD[9]} RL5=${FIELD[10]}      WT=${FIELD[11]}

# "Opus 5 (1M context)" -> "Opus 5" : la taille est deja dans le compteur de tokens.
MODEL=${MODEL%% (*}

# Garde-fou : un PCT hors bornes ferait exploser la boucle de la barre.
PCT=${PCT%%.*}; PCT=${PCT:-0}
(( PCT < 0 ))   && PCT=0
(( PCT > 100 )) && PCT=100

RESET=$'\033[0m'; DIM=$'\033[2m'; BLUE=$'\033[34m'
GREEN=$'\033[32m'; YELLOW=$'\033[33m'; RED=$'\033[31m'

# Barre coloree par seuil : vert < 50, jaune < 80, rouge au-dela.
if   (( PCT >= 80 )); then C=$RED
elif (( PCT >= 50 )); then C=$YELLOW
else                       C=$GREEN
fi
W=10; F=$(( PCT * W / 100 ))
# Un bloc minimum des que le contexte n'est pas vide, sinon 1..9% affiche une barre vide.
(( PCT > 0 && F == 0 )) && F=1
E=$(( W - F )); BAR=""
(( F > 0 )) && printf -v fill "%${F}s" && BAR="${fill// /▓}"
(( E > 0 )) && printf -v pad  "%${E}s" && BAR="${BAR}${pad// /░}"

fmt() { awk -v n="$1" 'BEGIN{if(n>=1e6)printf "%.1fM",n/1e6; else if(n>=1e3)printf "%.0fk",n/1e3; else printf "%d",n}'; }

# ─── LIGNE 1 : identite de la session ───────────────────────
# Pas de dossier ni de branche : deja visibles ailleurs, et ca evite tout appel git.
L1="🧠 ${BLUE}${MODEL}${RESET}"
[[ -n $EFFORT ]] && L1+=" ${DIM}${EFFORT}${RESET}"
[[ -n $FAST   ]] && L1+=" ⚡"
[[ -n $WT     ]] && L1+="  🌳 ${WT}"
if [[ -n $PR ]]; then
  case $PR_STATE in
    approved)          S="✅" ;;
    changes_requested) S="🔴" ;;
    pending)           S="🕓" ;;
    draft)             S="📝" ;;
    *)                 S=""   ;;
  esac
  L1+="  🔀 #${PR} ${S}"
fi

# ─── LIGNE 2 : consommation ─────────────────────────────────
L2="${C}${BAR}${RESET} ${PCT}% ${DIM}$(fmt "$USED")/$(fmt "$SIZE")${RESET}"
L2+="  💰 $(printf "%.2f" "${COST:-0}")\$"
(( DUR > 0 )) && L2+="  ⏱ ${DUR}m"
[[ -n $RL5 ]] && L2+="  📊 ${RL5%.*}% 5h"

printf '%s\n%s\n' "$L1" "$L2"
