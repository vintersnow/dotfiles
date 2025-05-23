return {
  {
    "akinsho/flutter-tools.nvim",
    lazy = false,
    dependencies = { "nvim-lua/plenary.nvim", "neovim/nvim-lspconfig", "stevearc/dressing.nvim" },
    config = function()
      local config = require("plugins/lspconfig_setting")
      require("flutter-tools").setup({
        lsp = {
          on_attach = config.on_attach,
          capabilities = config.capabilities,
        },
      })
    end,
  },
}
