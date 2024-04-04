local utils = require("../custom/utils")

require("luasnip.loaders.from_vscode").lazy_load({
  paths = { utils.get_config_dir() .. "/snippets" },
})
