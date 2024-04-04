return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      inlay_hints = { enabled = true },
      servers = {
        -- deno
        denols = {
          root_dir = require("lspconfig").util.root_pattern("deno.json"),
          settings = {
            enable = true,
          },
        },
        -- lua
        lua_ls = {
          settings = {
            Lua = {
              hint = { enable = false },
              runtime = {
                version = "Lua 5.1",
                path = {
                  "?.lua",
                  "?/init.lua",
                  vim.fn.expand("~/.luarocks/share/lua/5.1/?.lua"),
                  vim.fn.expand("~/.luarocks/share/lua/5.1/?/init.lua"),
                  "/usr/share/5.1/?.lua",
                  "/usr/share/lua/5.1/?/init.lua",
                },
              },
              workspace = {
                library = {
                  vim.env.RUNTIME,
                  vim.fn.expand("~/.luarocks/share/lua/5.1"),
                  "/usr/share/lua/5.1",
                },
              },
            },
          },
        },
        -- omnisharp (csharp)
        omnisharp = {
          enable_roslyn_analyzers = true,
          organize_imports_on_format = true,
          enable_import_completion = true,
        },
        -- tailwind
        tailwindcss = {},
        -- typescript
        tsserver = {},
      },
    },
  },
}
