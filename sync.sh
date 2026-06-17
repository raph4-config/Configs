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

# ─── RELOAD ZSH ─────────────────────────────────────────────
source ~/.zshrc
echo ""
echo "🚀 All configs synced successfully!"
