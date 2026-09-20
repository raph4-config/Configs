return {
  -- Explorateur de fichiers : on garde celui de snacks (defaut LazyVim), neo-tree desactive
  { "nvim-neo-tree/neo-tree.nvim", enabled = false },
  {
    "folke/snacks.nvim",
    opts = {
      dashboard = { enabled = false },
      explorer = { replace_netrw = false},
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
          local root = vim.fs.normalize(vim.fn.getcwd())
          local file = vim.fs.normalize(vim.api.nvim_buf_get_name(0))
          local in_root = file:find(root .. "/", 1, true) == 1
          local explorer = Snacks.picker.get({ source = "explorer" })[1]

          if explorer and not explorer.closed then
            if explorer:is_focused() then
              explorer:close()
              return
            end
            if explorer:cwd() ~= root then
              explorer:set_cwd(root)
            end
            if in_root then
              Snacks.explorer.reveal()
            end
              explorer:focus()
          else
            Snacks.explorer.open({
              cwd = root,
              on_show = function ()
                if in_root then
                  vim.schedule(function()
                    Snacks.explorer.reveal()
                  end)
                end
              end
           })
          end
        end,
        desc = "Explorer (focus, and close if open)",
      },
    },
  },
  -- Indentation visuelle
  { "lukas-reineke/indent-blankline.nvim", main = "ibl", opts = {} },
}
