return {
  "nvim-telescope/telescope.nvim",
  -- keys = {
  --   { "<space><space>", "<cmd>Telescope buffers<cr>", desc = "Telescope Buffers" },
  --   { "<leader>sb", "<cmd>Telescope buffers<cr>", desc = "Telescope Buffers" },
  --   { "<leader>ff", "<cmd>Telescope find_files<cr>", desc = "Telescope Buffers" },
  --   { "<leader>sf", "<cmd>Telescope find_files<cr>", desc = "Telescope Buffers" },
  -- },
  config = function(_, opts)
    vim.keymap.set("n", "<leader><space>", require("telescope.builtin").buffers)
    vim.keymap.set("n", "<leader>sb", require("telescope.builtin").buffers)
    vim.keymap.set("n", "<leader>ff", require("telescope.builtin").find_files)
    vim.keymap.set("n", "<leader>sf", require("telescope.builtin").find_files)
    vim.keymap.set("n", "<leader>ss", require("telescope.builtin").lsp_document_symbols)
  end,
}
