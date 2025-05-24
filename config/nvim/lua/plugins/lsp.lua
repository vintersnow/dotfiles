return {
  {
    "folke/trouble.nvim",
    cmd = "Trouble",
    opts = {},
    -- config = function()
    --   require("plugins/trouble")
    -- end,
  },
  {
    "neovim/nvim-lspconfig",
    cond = not vim.g.vscode,
    event = { "BufReadPost", "BufNewFile" },
		cmd = { "LspInfo", "LspInstall", "LspUninstall" },
    dependencies = {
      { "williamboman/mason.nvim" },
      { "williamboman/mason-lspconfig.nvim" },
      { "ray-x/lsp_signature.nvim" },
    },
    config = function()
      require("plugins/lspconfig_setting")
    end,
  },
  {
    "williamboman/mason.nvim",
    lazy = true,
    build = ":MasonUpdate",
  },
  {
    "williamboman/mason-lspconfig.nvim",
    lazy = true,
    dependencies = { "williamboman/mason.nvim" },
    -- config = function()
    --   require('mason').setup()
    --   require('mason-lspconfig').setup_handlers({ function(server)
    --   local opt = {
    --     -- -- Function executed when the LSP server startup
    --     -- on_attach = function(client, bufnr)
    --     --   local opts = { noremap=true, silent=true }
    --     --   vim.api.nvim_buf_set_keymap(bufnr, 'n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', opts)
    --     --   vim.cmd 'autocmd BufWritePre * lua vim.lsp.buf.formatting_sync(nil, 1000)'
    --     -- end,
    --     capabilities = require('cmp_nvim_lsp').update_capabilities(
    --       vim.lsp.protocol.make_client_capabilities()
    --     )
    --   }
    --   require('lspconfig')[server].setup(opt)
    -- end })
    -- end
  },
}
