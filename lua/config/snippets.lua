local utils = require("../custom/utils")

print(utils.get_config_dir() .. "/snippets")

require("luasnip.loaders.from_vscode").lazy_load({
  paths = { utils.get_config_dir() .. "/snippets" },
})
