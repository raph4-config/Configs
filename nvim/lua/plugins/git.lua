return {
  "lewis6991/gitsigns.nvim",
  opts = {
    -- author and commit at the end of the current line, always on.
    -- `<leader>uB` toggles it when it gets in the way.
    current_line_blame = true,
    current_line_blame_opts = {
      virt_text = true,
      virt_text_pos = "eol",
      -- LazyVim's default is 1000ms, which feels like a lag rather than a hint
      delay = 300,
      ignore_whitespace = false,
    },
    -- <author_time:%R> renders as "3 days ago" rather than a raw date
    current_line_blame_formatter = "  <author>, <author_time:%R> · <summary>",
  },
  keys = {
    {
      "<leader>uB",
      function()
        require("gitsigns").toggle_current_line_blame()
      end,
      desc = "Toggle inline git blame",
    },
  },
}
