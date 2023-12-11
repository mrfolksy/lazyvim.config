local Path = require("plenary.path")

local M = {}

M.load_dev_plugin = function(name, opts)
  local mpath = Path:new(vim.api.nvim_list_runtime_paths()[1] .. "/dev/plugins/" .. name)
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
