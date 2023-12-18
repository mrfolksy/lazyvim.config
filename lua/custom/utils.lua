local Path = require("plenary.path")

local M = {}

M.get_config_dir = function()
  return vim.api.nvim_list_runtime_paths()[1]
end

M.load_dev_plugin = function(name, opts)
  local mpath = Path:new(M.get_config_dir() .. "/dev/plugins/" .. name)
  if mpath:is_dir() then
    return {
      dir = vim.api.nvim_list_runtime_paths()[1] .. "/dev/plugins/" .. name,
      name = name,
      lazy = false,
      opts = opts or {},
    }
  else
    return {}
  end
end

return M
