-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
--
-- Add any additional autocmds here
-- with `vim.api.nvim_create_autocmd`
--
-- Or remove existing autocmds by their group name (which is prefixed with `lazyvim_` for the defaults)
-- e.g. vim.api.nvim_del_augroup_by_name("lazyvim_wrap_spell")
--
vim.schedule(function()
  Snacks.explorer.open({
    -- on_show: the picker takes focus asynchronously, so the code can only get
    -- it back once the picker is actually shown.
    on_show = function()
      vim.schedule(function()
        vim.cmd("wincmd p")
      end)
    end,
  })
end)

local EXPLORER_MIN_MIN_COLS = 120
vim.api.nvim_create_autocmd("VimResized", {
  desc = "Hide the explorer when the window gets narrow",
  callback = function()
    local explorer = Snacks.picker.get({ source = "explorer" })[1]
    local open = explorer and not explorer.closed

    if vim.o.columns < EXPLORER_MIN_MIN_COLS then
      if open then
        explorer:close()
      end
    elseif not open then
      Snacks.explorer.open({
        on_show = function()
          vim.schedule(function()
            vim.cmd("wincmd p")
          end)
        end,
      })
    end
  end,
})
