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
    opts.options.theme = "night-owl"
  end,
}