return {
  -- Explorateur de fichiers : on garde celui de snacks (defaut LazyVim), neo-tree desactive
  { "nvim-neo-tree/neo-tree.nvim", enabled = false },
  {
    "folke/snacks.nvim",
    opts = {
      dashboard = { enabled = false },
      picker = {
        sources = {
          explorer = {
            win = { list = { keys = { ["q"] = false, ["<esc>"] = false } } },
          },
        },
      },
    },
    keys = {
      {
        "<leader>e",
        function()
          local explorer = Snacks.picker.get({ source = "explorer" })[1]
          if explorer and not explorer.closed then
            explorer:focus()
          else
            Snacks.explorer.reveal()
          end
        end,
        desc = "Explorer (focus, and never closed)",
      },
    },
  },
  -- Indentation visuelle
  { "lukas-reineke/indent-blankline.nvim", main = "ibl", opts = {} },
  -- Commentaires rapides
  { "numToStr/Comment.nvim", opts = {} },
}
