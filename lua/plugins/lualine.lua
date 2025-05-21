return {
  "nvim-lualine/lualine.nvim",
  opts = function(_, opts)
    opts.options.component_separators = {
      left = "|",
      right = "|",
    }
    opts.options.section_separators = {
      left = "",
      right = "",
    }
    opts.options.tabline = {
      lualine_z = {
        {
          "tabs",
          cond = function()
            return #vim.fn.gettabinfo() > 1
          end,
        },
      },
    }
    opts.options.theme = "catppuccin-mocha"
  end,
}
