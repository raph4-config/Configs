-- <leader>q quits outright. LazyVim parks quit and the four session commands
-- under a <leader>q group, so they move up to <leader>Q: left where they were,
-- every <leader>q would stall for 'timeoutlen' (300ms) waiting to find out
-- whether a second key is coming.
return {
  {
    "folke/persistence.nvim",
    -- a function replaces LazyVim's key list; a plain table would be appended
    -- to it and the <leader>q* mappings would survive
    keys = function()
      return {
        { "<leader>Qs", function() require("persistence").load() end, desc = "Restore Session" },
        { "<leader>QS", function() require("persistence").select() end, desc = "Select Session" },
        { "<leader>Ql", function() require("persistence").load({ last = true }) end, desc = "Restore Last Session" },
        { "<leader>Qd", function() require("persistence").stop() end, desc = "Don't Save Current Session" },
      }
    end,
  },
  {
    "folke/which-key.nvim",
    opts = {
      spec = {
        { "<leader>Q", group = "session" },
      },
    },
  },
}
