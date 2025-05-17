-- ~/.config/nvim/lua/plugins/conform.lua
return {
  "folke/conform.nvim",
  opts = {
    -- map filetypes to formatter names:
    formatters_by_ft = {
      -- if your templates are ft=html:
      html = { "djhtml" },
      -- if ft=htmldjango (via treesitter/html-django):
      htmldjango = { "djhtml" },
    },
    formatters = {
      djhtml = {
        command = "djhtml",
        args = { "$FILENAME" },
        stdin = false,
      },
    },
  },
}
