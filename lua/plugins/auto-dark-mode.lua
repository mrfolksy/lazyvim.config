return {
  "f-person/auto-dark-mode.nvim",
  opts = {
    update_interval = 1000,
    set_dark_mode = function()
      vim.api.nvim_set_option_value("background", "dark", {})
      vim.cmd("colorscheme catppuccin-mocha")
      require("lualine").setup({
        options = {
          theme = "catppuccin-mocha"
        }
      })
    end,
    set_light_mode = function()
      vim.api.nvim_set_option_value("background", "light", {})
      vim.cmd("colorscheme catppuccin-latte")
      require("lualine").setup({
        options = {
          theme = "catppuccin-latte"
        }
      })
    end,
  },
}
