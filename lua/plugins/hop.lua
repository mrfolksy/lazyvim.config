return {
  "phaazon/hop.nvim",
  branch = "v2",
  lazy = false,
  config = function()
    require("hop").setup({
      keys = "etovxqpdygfblzhckisuran",
    })
  end,
  keys = function()
    local hop = require("hop")
    return {
      {},
    }
  end,
}
