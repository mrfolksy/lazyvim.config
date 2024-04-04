-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
-- Add any additional autocmds here
--

vim.api.nvim_create_autocmd("LspAttach", {
  group = vim.api.nvim_create_augroup("custom-lsp-attach", { clear = true }),
  callback = function(event)
    local client = vim.lsp.get_client_by_id(event.data.client_id)
    local active_clients = vim.lsp.get_clients()

    -- stop tsserver if denols is already active
    if client and client.name == "denols" then
      for _, client_ in pairs(active_clients) do
        if client_.name == "tsserver" then
          client_.stop()
        end
      end
    end
    if client and client.name == "tsserver" then
      for _, client_ in pairs(active_clients) do
        if client_.name == "denols" then
          client.stop()
        end
      end
    end
  end,
})
