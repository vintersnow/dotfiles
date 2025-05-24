return {
  {
    "hrsh7th/nvim-cmp",
    event = { "InsertEnter", "CmdLineEnter" },
    -- dependencies = { "zbirenbaum/copilot-cmp", "onsails/lspkind.nvim" },
    dependencies = { 
      "onsails/lspkind.nvim",
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-path",
      "hrsh7th/cmp-cmdline",
    },
    config = function()
      require("plugins/cmp_setting")
    end,
  },
  {
    'github/copilot.vim',
    -- event = "InsertEnter", -- this does not work
    init = function()
      local opts = { noremap = true, silent = true }
      local term_opts = { silent = true }

      local keymap = vim.api.nvim_set_keymap

      -- vim.g.copilot_no_tab_map = true
      vim.g.copilot_assume_mapped = true
      -- vim.g.copilot_tab_fallback = ""
      -- vim.keymap.set('i', '<C-j>', '<Plug>(copilot-next)')
      -- vim.keymap.set('i', '<C-k>', '<Plug>(copilot-previous)')
      -- vim.keymap.set('i', '<C-/>', '<Plug>(copilot-dismiss)')
    end,
    -- config = function()
    -- end
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
}
