return {
  "mrfolksy/nvim-json-conf",
  dir = require("../../custom/utils").load_dev_plugin_path("mrfolksy/nvim-json-conf"),
  event = "VeryLazy",
  config = function()
    require("nvim-json-conf").setup()
  end,
}
