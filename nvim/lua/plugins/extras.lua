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
            -- dotfiles stay visible: this is a config repo, .zshrc and
            -- .gitconfig are the files being edited, not noise
            hidden = true,
            -- but gitignored files stay out (.venv, node_modules, ...).
            -- `H` and `I` toggle either one live in the explorer.
            ignored = false,
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
