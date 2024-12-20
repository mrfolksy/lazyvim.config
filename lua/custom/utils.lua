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

M.create_floating_window = function(opts)
  opts = opts or {}
  local width = opts.width or "80%"
  local height = opts.height or "80%"

  -- Get editor dimensions
  local columns = vim.o.columns
  local lines = vim.o.lines
  local row = vim.o.lines

  -- Calculate dimensions
  local win_width = width
  local win_height = height

  if type(width) == "string" and width:match("%%$") then
    win_width = math.floor(columns * tonumber(width:match("(%d+)")) / 100)
  end
  if type(height) == "string" and height:match("%%$") then
    win_height = math.floor(lines * tonumber(height:match("(%d+)")) / 100)
  end

  -- Calculate starting position
  local row_pos = math.floor((lines - win_height) / 2)
  local col_pos = math.floor((columns - win_width) / 2)

  -- Create buffer
  local buf = vim.api.nvim_create_buf(false, true)

  -- Window options
  local win_opts = {
    relative = "editor",
    width = win_width,
    height = win_height,
    row = row_pos,
    col = col_pos,
    style = "minimal",
    border = opts.border or "rounded",
  }

  -- Add title if provided
  if opts.title then
    win_opts.title = opts.title
    win_opts.title_pos = "center"
  end

  -- Create window
  local win = vim.api.nvim_open_win(buf, true, win_opts)

  return win, buf
end

return M
