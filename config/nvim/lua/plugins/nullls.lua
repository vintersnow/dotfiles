local null_ls = require("null-ls")
local augroup = vim.api.nvim_create_augroup("LspFormatting", {})
null_ls.setup({
  sources = {
    null_ls.builtins.formatting.black, -- python formatter
    -- null_ls.builtins.formatting.isort, -- python import sort
    -- null_ls.builtins.diagnostics.flake8, -- python linter
    null_ls.builtins.formatting.stylua, -- lua formatter
    null_ls.builtins.diagnostics.luacheck, -- lua linter
  },
  -- on_attach = function(client, bufnr)
  --     if client.supports_method("textDocument/formatting") then
  --         vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
  --         vim.api.nvim_create_autocmd("BufWritePre", {
  --             group = augroup,
  --             buffer = bufnr,
  --             callback = function()
  --                 -- on 0.8, you should use vim.lsp.buf.format({ bufnr = bufnr }) instead
  --                 -- on later neovim version, you should use vim.lsp.buf.format({ async = false }) instead
  --                 -- vim.lsp.buf.formatting_sync()
  --                 vim.lsp.buf.format({ async = false })
  --             end,
  --         })
  --     end
  -- end,
})
