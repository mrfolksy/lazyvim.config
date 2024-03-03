return {
  "ThePrimeagen/harpoon",
  lazy = false,
  depedencies = {
    "nvim-lua/plenary.nvim",
    "nvim-telescope/telescope.nvim",
  },
  config = function()
    require("harpoon").setup({})
    require("telescope").load_extension("harpoon")
  end,
}
