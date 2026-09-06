-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

-- Recentre l'ecran apres un saut : le resultat arrive au milieu, pas colle en bas
vim.keymap.set("n", "n", "nzzzv", { desc = "Next search result (centered)" })
vim.keymap.set("n", "N", "Nzzzv", { desc = "Prev search result (centered)" })
vim.keymap.set("n", "<C-d>", "<C-d>zz", { desc = "Half page down (centered)" })
vim.keymap.set("n", "<C-u>", "<C-u>zz", { desc = "Half page up (centered)" })

-- Garde la selection apres indentation, pour enchainer les <<  >>
vim.keymap.set("v", "<", "<gv", { desc = "Indent left, keep selection" })
vim.keymap.set("v", ">", ">gv", { desc = "Indent right, keep selection" })

-- Colle par-dessus une selection sans ecraser le presse-papier
vim.keymap.set("v", "<leader>p", '"_dP', { desc = "Paste without losing the yank" })
