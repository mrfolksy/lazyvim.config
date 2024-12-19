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

M.run_command = function(cmd, callback)
  local uv = vim.uv
  local stdin = uv.new_pipe()
  local stdout = uv.new_pipe()
  local stderr = uv.new_pipe()

  local handle, pid = uv.spawn(cmd[1], {
    args = vim.list_slice(cmd, 2),
    stdio = { stdin, stdout, stderr },
  }, function(code, signal)
    if code == 0 then
      callback(nil)
    else
      callback("Command failed with code: " .. code)
    end
  end)

  uv.read_start(stdout, function(err, data)
    assert(not err, err)
    if data then
      callback(data:gsub("%s+$", "")) -- Trim trailing whitespace
    end
  end)
end

return M
