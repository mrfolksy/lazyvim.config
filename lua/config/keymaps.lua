-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
local map = vim.keymap.set

-- Neovim
map("n", "<leader>Q", "<cmd>qa<cr>", { desc = "Quit All" })

-- Execute lua code
map("n", "<leader>X", ":.lua<CR>")
map("v", "<leader>X", ":lua<CR>")

-- buffers
map("n", "<leader>bt", "<cmd>tab split<cr>", { desc = "Open in new tab" })

-- plugins
-- hop (kinda annoyed that this doesn't seem to work from the plugin spec file)
map("", "f", "<cmd>lua require'hop'.hint_char1()<cr>", {})

-- harpoon
-- map("n", "<leader>m", function()
--   require("harpoon.mark").add_file()
-- end)
-- map("n", "<leader>sm", "<cmd>Telescope harpoon marks<cr>")

-- oil
map("n", "<leader>o", "<cmd>Oil<cr>")

-- quickfix list
map("n", "<leader>cn", "<cmd>cnext<CR>")
map("n", "<leader>cp", "<cmd>cprev<CR>")
