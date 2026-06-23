# 🧭 Cheatsheet — Neovim (LazyVim) + Terminal, zéro souris

> Pensé pour le clavier split Corne AZERTY (voir `keyboard/README.md`).
> **Leader = `Espace`** (pouce gauche). Astuce reine : appuie sur `Espace` et **attends** — `which-key` affiche tout ce qui est possible.

## Légende

| Symbole | Sens |
|---------|------|
| ✅ | Déjà natif (Vim ou LazyVim), rien à faire |
| 🆕 | **Ajout proposé** (à valider avant implémentation) |
| `<leader>` | La touche `Espace` |
| `N` / `I` / `V` / `T` | Mode **N**ormal / **I**nsert / **V**isuel / **T**erminal |

## Les modes, en 30 secondes

| Mode | On y entre par | On en sort par | À quoi ça sert |
|------|----------------|----------------|----------------|
| **Normal** | `Esc` (mode par défaut) | — | Naviguer, lancer des commandes. **Tu vis ici.** |
| **Insert** | `i` `a` `o` ... | `Esc` | Taper du texte |
| **Visual** | `v` (char) `V` (ligne) `Ctrl-v` (bloc) | `Esc` | Sélectionner |
| **Command** | `:` | `Esc` / `Entrée` | Commandes `:w`, `:q`, recherche/remplacement |
| **Terminal** | (dans un terminal nvim) | `Esc Esc` | Shell intégré |

> Sur ta map split : `Esc` est en haut à gauche (rangée Q). Le réflexe nº1 : **revenir en Normal avec `Esc`** entre chaque action.

---

# 1. ✏️ Modifier (Normal mode, natif Vim)

| Touche | Mode | Action |
|--------|:----:|--------|
| `i` / `a` | N | Insérer avant / après le curseur |
| `I` / `A` | N | Insérer début / fin de ligne |
| `o` / `O` | N | Nouvelle ligne dessous / dessus |
| `x` | N | Supprimer le caractère |
| `dd` / `yy` / `cc` | N | Couper / copier / remplacer **la ligne** |
| `D` / `C` | N | Couper / changer jusqu'à fin de ligne |
| `ciw` / `diw` / `yiw` | N | Changer / couper / copier **le mot** |
| `ci"` `ci(` `ci{` | N | Changer l'intérieur des `"..."`, `(...)`, `{...}` |
| `r<x>` | N | Remplacer un caractère par `<x>` |
| `u` / `Ctrl-r` | N | Annuler / Refaire |
| `.` | N | **Répéter** la dernière modif (énorme gain) |
| `>>` / `<<` | N | Indenter / désindenter la ligne |
| `gcc` | N | Commenter / décommenter la ligne ✅ |
| `gc` | V | Commenter / décommenter la sélection ✅ |

> **Opérateur + mouvement** = la grammaire de Vim : `d` (delete) `c` (change) `y` (yank) `>` (indent) suivis d'un mouvement. Ex. `d}` = supprime jusqu'au paragraphe, `c$` = change jusqu'à fin de ligne.

# 2. 🧭 Naviguer dans un fichier (Normal mode, natif Vim)

| Touche | Mode | Action |
|--------|:----:|--------|
| `h` `j` `k` `l` | N | Gauche / bas / haut / droite |
| `w` / `b` | N | Mot suivant / précédent |
| `e` | N | Fin du mot |
| `0` / `^` / `$` | N | Début de ligne / 1er caractère / fin de ligne |
| `gg` / `G` | N | Haut / bas du fichier |
| `{` / `}` | N | Paragraphe précédent / suivant |
| `Ctrl-d` / `Ctrl-u` | N | Demi-page bas / haut |
| `%` | N | Sauter à la parenthèse/accolade correspondante |
| `f<x>` / `t<x>` | N | Sauter au caractère `<x>` sur la ligne |
| `*` / `#` | N | Chercher le mot sous le curseur (avant / arrière) |
| `<num>G` | N | Aller à la ligne `<num>` (ex. `42G`) |
| `Ctrl-o` / `Ctrl-i` | N | Reculer / avancer dans l'historique du curseur |

> Ton clavier a aussi `←↓↑→` sur la couche RAISE (H/J/K/L). En nvim, reste sur `hjkl` en Normal : pas besoin de couche, plus rapide.

# 3. 📂 Naviguer entre fichiers (LazyVim)

| Touche | Mode | Action |
|--------|:----:|--------|
| `<leader><leader>` | N | **Find files** (racine du projet) ✅ |
| `<leader>ff` | N | Find files (racine) ✅ |
| `<leader>fF` | N | Find files (dossier courant) ✅ |
| `<leader>fr` | N | Fichiers **récents** ✅ |
| `<leader>e` | N | **Explorateur** (snacks) racine ✅ |
| `<leader>E` | N | Explorateur dossier courant ✅ |
| `gd` | N | Aller à la **définition** ✅ |
| `Ctrl-o` | N | Revenir d'où on venait ✅ |

**Dans l'explorateur (snacks) :**

| Touche | Action |
|--------|--------|
| `j` / `k` | Descendre / monter |
| `l` / `Entrée` | Ouvrir le fichier / déplier le dossier |
| `h` | Replier le dossier |
| `a` / `d` / `r` | Créer / supprimer / renommer |
| `H` | Afficher / cacher les fichiers cachés (dotfiles) |
| `Ctrl-c` ou `q` | Fermer l'explorateur |

# 4. 🪟 Buffers / Fenêtres / Onglets (LazyVim)

> **Buffer** = fichier ouvert · **Window** = un split à l'écran · **Tab** = un agencement de splits.

| Touche | Mode | Action |
|--------|:----:|--------|
| `Shift-h` / `Shift-l` | N | Buffer précédent / suivant ✅ |
| `<leader>,` | N | Chercher / sauter vers un buffer ✅ |
| `` <leader>` `` | N | Revenir au dernier buffer ✅ |
| `<leader>bd` | N | Fermer le buffer ✅ |
| `<leader>bo` | N | Fermer les **autres** buffers ✅ |
| `<leader>\|` | N | Split **vertical** (fenêtre à droite) ✅ |
| `<leader>-` | N | Split **horizontal** (fenêtre en bas) ✅ |
| `Ctrl-h/j/k/l` | N | Se déplacer entre les fenêtres ✅ |
| `Ctrl-↑/↓/←/→` | N | Redimensionner la fenêtre ✅ |
| `<leader>wd` | N | Fermer la fenêtre ✅ |
| `<leader><tab><tab>` | N | Nouvel onglet ✅ |
| `<leader><tab>]` / `[` | N | Onglet suivant / précédent ✅ |

# 5. 🔎 Rechercher (mot / fichier / dans un dossier)

| Touche | Mode | Action |
|--------|:----:|--------|
| `/texte` puis `Entrée` | N | Chercher **dans le fichier courant** ✅ |
| `n` / `N` | N | Résultat suivant / précédent ✅ |
| `*` | N | Chercher le mot sous le curseur ✅ |
| `<leader>/` | N | **Grep** : chercher un mot **dans tout le projet** ✅ |
| `<leader>sg` | N | Grep dans le projet (idem) ✅ |
| `<leader>sw` | N | Grep le mot sous le curseur dans le projet ✅ |
| `<leader>sb` | N | Chercher dans le buffer courant (lignes) ✅ |
| `<leader>ss` | N | Chercher un **symbole** (fonction, classe...) ✅ |
| `<leader>sk` | N | Chercher dans **tous les raccourcis** ✅ |

**Remplacer :**

| Commande | Mode | Action |
|----------|:----:|--------|
| `:%s/ancien/nouveau/g` | command | Remplacer partout dans le fichier ✅ |
| `:%s/ancien/nouveau/gc` | command | Idem avec confirmation à chaque occurrence ✅ |
| `<leader>sr` | N | Remplacer dans **tout le projet** (si extra grug-far installé) ⚠️ à activer |

# 6. 📋 Copier / Coller / Presse-papier

> ✅ LazyVim configure déjà `clipboard = unnamedplus` : **`y` copie directement dans le presse-papier macOS** et `p` colle depuis celui-ci. Pas de manip spéciale, copier/coller marche entre nvim et le reste du Mac.

| Touche | Mode | Action |
|--------|:----:|--------|
| `y` | V | Copier la sélection (→ presse-papier macOS) ✅ |
| `yy` | N | Copier la ligne ✅ |
| `yiw` | N | Copier le mot ✅ |
| `d` / `dd` | V / N | Couper la sélection / la ligne ✅ |
| `p` / `P` | N | Coller après / avant le curseur ✅ |
| `v` / `V` / `Ctrl-v` | N | Sélection caractère / ligne / **bloc** ✅ |
| `ggVG` | N | Tout sélectionner ✅ |
| `<leader>p` | V | 🆕 Coller **par-dessus** une sélection sans perdre ce qui est copié |

# 7. 💻 Terminal intégré (pour lancer scripts / commandes)

| Touche | Mode | Action |
|--------|:----:|--------|
| `Ctrl-/` | N | Ouvrir / fermer un terminal (dossier projet) ✅ |
| `<leader>ft` | N | Terminal (racine du projet) ✅ |
| `<leader>fT` | N | Terminal (dossier courant) ✅ |
| `Esc Esc` | T | Repasser en mode Normal (pour scroller) ✅ |
| `Ctrl-/` | T | Cacher le terminal ✅ |
| `Ctrl-h/j/k/l` | T | Aller vers une autre fenêtre depuis le terminal ✅ |

> Workflow type : `Ctrl-/` ouvre un terminal en bas, tu lances `python mon_script.py` (ou ton dbt), tu lis la sortie, `Ctrl-/` pour le cacher, et tu reviens au code.

# 8. 🧠 Code / LSP (langages : Python, SQL, Lua...)

| Touche | Mode | Action |
|--------|:----:|--------|
| `K` | N | Doc / type au survol ✅ |
| `gd` / `gr` | N | Aller à la définition / voir les références ✅ |
| `gI` | N | Aller à l'implémentation ✅ |
| `<leader>ca` | N | **Code action** (quick fix, import...) ✅ |
| `<leader>cr` | N | **Renommer** le symbole partout ✅ |
| `<leader>cf` | N/V | Formater le fichier / la sélection ✅ |
| `<leader>cd` | N | Voir le diagnostic de la ligne ✅ |
| `]d` / `[d` | N | Diagnostic suivant / précédent ✅ |
| `]e` / `[e` | N | Erreur suivante / précédente ✅ |
| `<leader>xx` | N | Liste de tous les diagnostics (Trouble) ✅ |

# 9. 🌳 Git (LazyVim)

| Touche | Mode | Action |
|--------|:----:|--------|
| `<leader>gg` | N | Ouvrir **lazygit** ✅ |
| `<leader>gb` | N | Blame de la ligne ✅ |
| `]h` / `[h` | N | Changement (hunk) suivant / précédent ✅ |
| `<leader>ghs` | N | Stager le hunk ✅ |
| `<leader>ghr` | N | Annuler le hunk ✅ |

# 10. 💾 Sauver / Quitter

| Touche / cmd | Mode | Action |
|--------------|:----:|--------|
| `Ctrl-s` | N/I | Sauver ✅ |
| `:w` | command | Sauver ✅ |
| `:q` / `:qa` | command | Quitter la fenêtre / tout ✅ |
| `:wq` ou `ZZ` | N | Sauver et quitter ✅ |
| `:q!` ou `ZQ` | N | Quitter sans sauver ✅ |

---

# 🆕 Ajouts proposés (à valider)

Rien ci-dessous n'est encore actif. Ce sont des **micro-confort**, ils ne changent pas tes habitudes (mêmes touches, comportement plus agréable). Tu me dis lesquels tu gardes.

### Fichier : `nvim/lua/config/keymaps.lua`

| Touche | Mode | Ce que ça fait | Pourquoi |
|--------|:----:|----------------|----------|
| `n` / `N` | N | Va au résultat **et recentre l'écran** (`nzzzv`) | Le match arrive au milieu, pas collé en bas |
| `Ctrl-d` / `Ctrl-u` | N | Demi-page **et recentre** (`zz`) | Le curseur ne dérive plus en haut/bas |
| `<` / `>` | V | Indente **en gardant la sélection** (`<gv`) | Ré-indenter en boucle sans re-sélectionner |
| `<leader>p` | V | Colle par-dessus **sans écraser** le presse-papier (`"_dP`) | Coller la même chose plusieurs fois |

### Fichier : `nvim/lua/config/options.lua`

| Option | Valeur | Pourquoi |
|--------|--------|----------|
| `scrolloff` | `8` | Garde toujours 8 lignes de contexte autour du curseur (au lieu de coller aux bords) |

### Extra LazyVim à activer (optionnel, via `:LazyExtras`)

| Extra | Apporte |
|-------|---------|
| `editor.grug-far` | `<leader>sr` : chercher/remplacer dans **tout le projet** avec aperçu |

> Valide en répondant simplement : « tout », « rien », ou la liste de ceux que tu veux.
