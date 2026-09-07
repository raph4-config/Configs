return {
  -- Trying markview instead of the render-markdown that ships with the LazyVim extra
  { "MeanderingProgrammer/render-markdown.nvim", enabled = false },
  {
    "OXY2DEV/markview.nvim",
    lazy = false,
    opts = {},
  },
}
