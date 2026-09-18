return {
  "dstein64/nvim-scrollview",
  event = "VeryLazy",
  dependencies = { "lewis6991/gitsigns.nvim" },
  opts = {
    -- only the focused window carries a bar, otherwise every split gets one
    -- and the screen fills with vertical lines
    current_only = true,
    -- the bar is a floating window: some blend keeps it from hiding the text
    -- underneath it
    winblend = 40,
    excluded_filetypes = {
      "snacks_explorer",
      "snacks_picker_list",
      "lazy",
      "mason",
      "trouble",
      "help",
    },
    -- marks in the gutter, in the order they stack
    signs_on_startup = { "diagnostics", "search", "marks", "conflicts", "cursor" },
    -- warnings and errors only: hints would paint the whole bar
    diagnostics_severities = {
      vim.diagnostic.severity.ERROR,
      vim.diagnostic.severity.WARN,
    },
  },
  config = function(_, opts)
    require("scrollview").setup(opts)
    -- added/changed/deleted hunks in the scrollbar, through the gitsigns bridge
    require("scrollview.contrib.gitsigns").setup()
  end,
}
