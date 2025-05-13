-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here
local opt = vim.opt
local g = vim.g

-- Basic options
opt.swapfile = false
opt.foldmethod = "expr"
opt.foldexpr = "nvim_treesitter#foldexpr()"
opt.showtabline = 1
opt.tabline = "%!v:lua.require'config.tabline'.tabline()"
opt.exrc = true

-- LazyVim config Options

-- Which lsp to use with the lang.python extra basedpyright | pyright
g.lazyvim_python_lsp = "basedpyright"

-- Use the telescope picker for fuzzy searches
g.lazyvim_picker = "telescope"
g.root_spec = { "cwd" }

-- Moonfly options
g.moonflyWinSeparator = "2"
