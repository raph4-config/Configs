#!/bin/zsh

echo "🔄 Syncing configs..."

# ─── ZSH ────────────────────────────────────────────────────
cp ~/raph_config/zsh/.zshrc ~/.zshrc
echo "✅ .zshrc"

# ─── OH MY POSH ─────────────────────────────────────────────
cp ~/raph_config/zsh/zash.omp.json ~/.config/oh-my-posh/zash.omp.json
echo "✅ Oh My Posh theme"

# ─── GIT ────────────────────────────────────────────────────
cp ~/raph_config/git/.gitconfig ~/.gitconfig
echo "✅ Git"

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
    # launchd service is unreliable on this machine; run unmanaged
    espanso restart --unmanaged &>/dev/null || espanso start --unmanaged &>/dev/null
    echo "✅ Espanso"
else
    echo "⚠️  Espanso not installed, skipped"
fi

# ─── KEYBOARD (QMK) ─────────────────────────────────────────
QMK_KEYMAP="$HOME/qmk_firmware/keyboards/crkbd/keymaps/arn"
if [ -d "$QMK_KEYMAP" ]; then
    cp ~/raph_config/keyboard/keymap.c ~/raph_config/keyboard/config.h ~/raph_config/keyboard/rules.mk "$QMK_KEYMAP/"
    echo "✅ Keyboard (QMK keymap, compile/flash stays manual)"
else
    echo "⚠️  QMK keymap dir not found, skipped"
fi

# ─── RELOAD ZSH ─────────────────────────────────────────────
source ~/.zshrc
echo ""
echo "🚀 All configs synced successfully!"
