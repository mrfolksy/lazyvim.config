return {
  {
    "catppuccin/nvim",
    name = "catppuccin",
    config = function()
      require("catppuccin").setup({
        flavour = "mocha",
      })
    end,
  },

  -- Set the colorscheme for LazyVim
  -- {
  --   "LazyVim/LazyVim",
  --   opts = {
  --     colorscheme = "catppuccin",
  --     integrations = {
  --       which_key = true,
  --     },
  --   },
  -- },
}
