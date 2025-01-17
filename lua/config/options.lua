-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here
local opt = vim.opt
local g = vim.g

opt.swapfile = false
opt.foldmethod = "expr"
opt.foldexpr = "nvim_treesitter#foldexpr()"
opt.showtabline = 1
opt.tabline = "%!v:lua.require'config.tabline'.tabline()"

g.lazyvim_picker = "telescope"
g.root_spec = { "cwd" }

g.moonflyWinSeparator = "2"
