return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        tailwindcss = {},
        lua_ls = {
          settings = {
            Lua = {
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
                  vim.fn.expand("~/.luarocks/share/lua/5.1"),
                  "/usr/share/lua/5.1",
                },
              },
            },
          },
        },
      },
    },
  },
}
