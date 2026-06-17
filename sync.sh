#!/bin/zsh

echo "🔄 Syncing configs..."

# ─── ZSH ────────────────────────────────────────────────────
cp ~/raph_config/zsh/.zshrc ~/.zshrc
echo "✅ .zshrc"

# ─── OH MY POSH ─────────────────────────────────────────────
cp ~/raph_config/zsh/zash.omp.json ~/.config/oh-my-posh/zash.omp.json
echo "✅ Oh My Posh theme"

# ─── WEZTERM ────────────────────────────────────────────────
cp ~/raph_config/wezterm/.wezterm.lua ~/.wezterm.lua
echo "✅ WezTerm"

# ─── NEOVIM ─────────────────────────────────────────────────
cp -r ~/raph_config/nvim/* ~/.config/nvim/
echo "✅ Neovim"

# ─── ESPANSO ────────────────────────────────────────────────
if command -v espanso &>/dev/null; then
    ESPANSO_DIR="$(espanso path config)"
    mkdir -p "$ESPANSO_DIR/config" "$ESPANSO_DIR/match"
    cp ~/raph_config/espanso/config/* "$ESPANSO_DIR/config/"
    cp ~/raph_config/espanso/match/* "$ESPANSO_DIR/match/"
    espanso restart &>/dev/null
    echo "✅ Espanso"
else
    echo "⚠️  Espanso not installed, skipped"
fi

# ─── RELOAD ZSH ─────────────────────────────────────────────
source ~/.zshrc
echo ""
echo "🚀 All configs synced successfully!"
