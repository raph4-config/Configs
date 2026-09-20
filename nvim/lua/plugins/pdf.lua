return {
  {
    "r-pletnev/pdfreader.nvim",
    dependencies = {
      "folke/snacks.nvim", -- image rendering backend
      "nvim-telescope/telescope.nvim", -- bookmarks / recents / TOC pickers
    },
    event = "BufReadPre *.pdf",
    config = function()
      -- pdfreader only recognises kitty and ghostty from $TERM and silently
      -- falls back to text mode otherwise. WezTerm speaks the kitty graphics
      -- protocol and snacks.image handles it, so skip that check.
      require("pdfreader.validation").is_supported_terminal = function()
        return true
      end
      require("pdfreader").setup()
    end,
    -- <leader>fb and <leader>fp are LazyVim's buffer and project pickers.
    keys = {
      { "<leader>fd", "<cmd>PDFReader showRecentBooks<cr>", desc = "Recent PDFs" },
    },
  },
  {
    "folke/snacks.nvim",
    opts = {
      image = {
        enabled = true, -- off by default in LazyVim, draws the pdf pages
        -- Default list minus pdf: snacks claims *.pdf with a BufReadCmd that
        -- would shadow pdfreader and only ever show page one.
        formats = {
          "png",
          "jpg",
          "jpeg",
          "gif",
          "bmp",
          "webp",
          "tiff",
          "heic",
          "avif",
          "mp4",
          "mov",
          "avi",
          "mkv",
          "webm",
          "icns",
        },
      },
    },
  },
}
