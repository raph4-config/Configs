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
  -- snacks already opens the explorer when nvim starts on a directory; opening it
  -- again would toggle it closed.
  local existing = Snacks.picker.get({ source = "explorer" })[1]
  if existing and not existing.closed then
    return
  end
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
    -- Deferred on purpose: snacks re-lays out its open pickers on this same
    -- VimResized event, and closing one from under it crashes init_layout.
    vim.schedule(function()
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
    end)
  end,
})

vim.api.nvim_create_autocmd({ "InsertLeave", "TextChanged" }, {
  desc = "Auto-save the current file once it stops changing",
  callback = function(ev)
    local buf = ev.buf
    -- Only real files: skip terminals, quickfix, help, and unnamed buffers.
    if vim.bo[buf].buftype ~= "" then
      return
    end
    if not vim.bo[buf].modifiable or vim.bo[buf].readonly then
      return
    end
    if not vim.bo[buf].modified or vim.api.nvim_buf_get_name(buf) == "" then
      return
    end
    vim.api.nvim_buf_call(buf, function()
      -- noautocmd on purpose: a plain write would run format-on-save on every
      -- pause and reshuffle the code under the cursor. An explicit <C-s> still
      -- formats.
      vim.cmd("silent! noautocmd write")
    end)
  end,
})

vim.api.nvim_create_autocmd("VimResized", {
  desc = "Rebuild the global statusline a resize left blank",
  callback = function()
    -- noice externalises the cmdline, so neovim drops 'cmdheight' to 0 and the
    -- global statusline of laststatus=3 ends up sharing the last screen row
    -- with it. A resize (a wezterm Cmd+D split) leaves that row unassigned and
    -- the bar just vanishes. Only a *second* resize ever brought it back, which
    -- is why moving to the other display seemed to fix it: the two screens have
    -- different DPI, so crossing them resizes the terminal again.
    -- Redrawing is not enough, the row has to be re-assigned: toggling
    -- laststatus tears the global statusline down and rebuilds it.
    -- Deferred past the resize itself, which is still settling the layout.
    vim.defer_fn(function()
      if vim.o.laststatus == 3 then
        vim.o.laststatus = 2
        vim.o.laststatus = 3
      end
    end, 50)
  end,
})
