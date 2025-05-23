return {
  {
    "folke/trouble.nvim",
    -- config = function()
    --   require("plugins/trouble")
    -- end,
  },
  {
    "neovim/nvim-lspconfig",
    dependencies = { "williamboman/mason-lspconfig.nvim" },
    config = function()
      require("plugins/lspconfig_setting")
    end,
  },
  {
    "hrsh7th/cmp-nvim-lsp",
  },
  {
    "hrsh7th/cmp-buffer",
  },
  {
    "hrsh7th/cmp-path",
  },
  {
    "hrsh7th/cmp-cmdline",
  },
  {
    "hrsh7th/nvim-cmp",
    -- dependencies = { "zbirenbaum/copilot-cmp", "onsails/lspkind.nvim" },
    dependencies = { "onsails/lspkind.nvim" },
    config = function()
      require("plugins/cmp_setting")
    end,
  },
  {
    "ray-x/lsp_signature.nvim",
    event = "InsertEnter",
    opts = {
      -- cfg options
    },
  },
  {
    "williamboman/mason.nvim",
    build = ":MasonUpdate",
  },
  {
    "williamboman/mason-lspconfig.nvim",
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
  {
    'github/copilot.vim',
    config = function()
      local opts = { noremap = true, silent = true }
      local term_opts = { silent = true }

      local keymap = vim.api.nvim_set_keymap

      -- vim.g.copilot_no_tab_map = true
      vim.g.copilot_assume_mapped = true
      -- vim.g.copilot_tab_fallback = ""
      -- vim.keymap.set('i', '<C-j>', '<Plug>(copilot-next)')
      -- vim.keymap.set('i', '<C-k>', '<Plug>(copilot-previous)')
      -- vim.keymap.set('i', '<C-/>', '<Plug>(copilot-dismiss)')
    end
  },
  -- {
  --   "zbirenbaum/copilot.lua",
  --   cmd = { "Copilot" },
  --   event = "InsertEnter",
  --   -- dependencies = { 'hrsh7th/nvim-cmp' },
  --   config = function()
  --     require("copilot").setup({
  --       panel = { enabled = false },
  --       suggestion = {
  --         enabled = false, -- Use copilot-cmp
  --         -- auto_trigger = true,
  --         -- debounce = 75,
  --         -- keymap = {
  --         --   accept = "<M-l>",
  --         --   accept_word = false,
  --         --   accept_line = false,
  --         --   next = "<M-]>",
  --         --   prev = "<M-[>",
  --         --   dismiss = "<C-[>",
  --         -- },
  --       },
  --     })
  --     -- local cmp = require('cmp')
  --     -- cmp.event:on("menu_opened", function()
  --     --   vim.b.copilot_suggestion_hidden = true
  --     -- end)
  --     --
  --     -- cmp.event:on("menu_closed", function()
  --     --   vim.b.copilot_suggestion_hidden = false
  --     -- end)
  --   end,
  -- },
  -- {
  --   "zbirenbaum/copilot-cmp",
  --   dependencies = { "zbirenbaum/copilot.vim" },
  --   event = "InsertEnter",
  --   config = function()
  --     require("copilot_cmp").setup()
  --   end,
  -- },
  {
    "onsails/lspkind.nvim",
  },
}
