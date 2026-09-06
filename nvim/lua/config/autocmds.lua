-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
--
-- Add any additional autocmds here
-- with `vim.api.nvim_create_autocmd`
--
-- Or remove existing autocmds by their group name (which is prefixed with `lazyvim_` for the defaults)
-- e.g. vim.api.nvim_del_augroup_by_name("lazyvim_wrap_spell")
--
-- Ce fichier est charge sur VeryLazy, donc apres VimEnter : on ouvre directement,
-- un autocmd VimEnter ici ne se declencherait jamais.
vim.schedule(function()
  Snacks.explorer.open({
    -- on_show : le picker prend le focus de maniere asynchrone, on ne peut
    -- rendre la main au code qu'une fois qu'il est affiche.
    on_show = function()
      vim.schedule(function()
        vim.cmd("wincmd p")
      end)
    end,
  })
end)
