-- Function to customize the tabline
local M = {}

M.tabline = function()
  local tabline = ""
  local num_tabs = vim.fn.tabpagenr("$") -- Total number of tabs

  for tab = 1, num_tabs do
    local is_current = (vim.fn.tabpagenr() == tab)
    local hl_group = is_current and "%#TabLineSel#" or "%#TabLine#"

    -- Get the buffer number of the active buffer in the tab
    local buf = vim.fn.tabpagebuflist(tab)[vim.fn.tabpagewinnr(tab)]
    local buf_name = vim.fn.bufname(buf)

    -- Shorten the buffer name for readability
    buf_name = vim.fn.fnamemodify(buf_name, ":t")
    buf_name = buf_name ~= "" and buf_name or "[No Name]"

    -- Add to tabline
    tabline = tabline .. hl_group .. " " .. tab .. ": " .. buf_name .. " "

    -- Add a separator
    tabline = tabline .. "%#TabLineFill#|"
  end

  -- Fill the rest of the tabline
  tabline = tabline .. "%#TabLineFill#"

  return tabline
end

return M
-- -- Set the custom tabline function
-- vim.o.tabline = "%!v:lua.tabline()"
