-- This is ripped from the LazyVim defaults for the tailwindcss extra (see link below)
-- https://www.lazyvim.org/extras/lang/tailwind
--
-- the main difference is that we use our custom nvinm-json-conf plugin to read project local
-- config. I did this so that the tailwindcss lsp would work properly with a tailwindcss v4 project that uses
-- a css file entry point
local util = require("lspconfig.util")

return {
  "neovim/nvim-lspconfig",
  dependencies = { "mrfolksy/nvim-json-conf" },
  opts = {
    servers = {
      tailwindcss = {
        filetypes_exclude = { "markdown" },
        filetypes_include = {},
        root_dir = function(fname)
          return util.root_pattern("package.json", "postcss.config.js", ".git")(fname)
        end,
      },
    },
    setup = {
      tailwindcss = function(_, opts)
        opts.filetypes = opts.filetypes or {}

        -- Add default filetypes
        vim.list_extend(opts.filetypes, vim.lsp.config.tailwindcss.filetypes)

        -- Remove excluded filetypes
        --- @param ft string
        opts.filetypes = vim.tbl_filter(function(ft)
          return not vim.tbl_contains(opts.filetypes_exclude or {}, ft)
        end, opts.filetypes)

        local project_cfg = require("nvim-json-conf").get()
        local proj_lsp = project_cfg
            and project_cfg.lsp
            and project_cfg.lsp.tailwindcss
            and project_cfg.lsp.tailwindcss.settings
          or {}

        opts.settings = vim.tbl_deep_extend("force", opts.settings or {}, {
          tailwindCSS = {
            includeLanguages = {
              elixir = "html-eex",
              eelixir = "html-eex",
              heex = "html-eex",
            },
          },
        }, proj_lsp)

        -- Add additional filetypes
        require("lspconfig").tailwindcss.setup(opts)
        return true
      end,
    },
  },
}
