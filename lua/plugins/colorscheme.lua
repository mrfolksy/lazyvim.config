
return {
  {
    "ellisonleao/gruvbox.nvim",
    name = "gruvbox",
    lazy = false,
  },
  {
    "rebelot/kanagawa.nvim",
    name = "kanagawa",
    lazy = false,
  },
  {
    "Mofiqul/vscode.nvim",
    name = "vscode",
    lazy = false,
  },
  {
    "bluz71/vim-moonfly-colors",
    name = "moonfly",
    lazy = false,
  },
  {
    "bluz71/vim-nightfly-colors",
    name = "nightfly",
    lazy = false,
  },
  {
    "EdenEast/nightfox.nvim",
    name = "nightfox",
    lazy = false,
  },
  {
    "oxfist/night-owl.nvim",
    name = "nightowl",
    lazy = false,
  },
  {
    "vague2k/vague.nvim",
    name = "vague",
    lazy = false,
  },
  {
    "catppuccin/nvim",
    name = "catppuccin",
    lazy = false,
    priority = 1000,
    config = function()
      require("catppuccin").setup({
        flavour = "mocha",
      })
    end,
  },

  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "catppuccin-mocha",
    },
  },
}
