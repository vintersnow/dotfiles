return {

  -- UI
  {
    'goolord/alpha-nvim',
    event = "VimEnter",
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    config = function ()
        require'alpha'.setup(require'alpha.themes.startify'.config)
    end
  },
  {
    "nvim-lualine/lualine.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
      require("plugins/lualine")
    end,
  },
  {
    "EdenEast/nightfox.nvim",
    config = function()
      vim.cmd([[colorscheme nordfox]])
    end,
  },
  -- {
  --   "folke/noice.nvim",
  --   event = "VeryLazy",
  --   opts = {
  --     -- add any options here
  --   },
  --   dependencies = {
  --     -- if you lazy-load any plugin below, make sure to add proper `module="..."` entries
  --     "MunifTanjim/nui.nvim",
  --     -- OPTIONAL:
  --     --   `nvim-notify` is only needed, if you want to use the notification view.
  --     --   If not available, we use `mini` as the fallback
  --     "rcarriga/nvim-notify",
  --   },
  --   config = function()
  --     require('plugins/noice')
  --   end
  -- },
  {
    'MunifTanjim/nui.nvim'
  },
  {
    'rcarriga/nvim-notify'
  },

  -- LSP
  {
    "folke/trouble.nvim",
    config = function()
      require("plugins/trouble")
    end,
  },
  {
    "neovim/nvim-lspconfig",
    dependencies = { "williamboman/mason-lspconfig.nvim" },
    config = function()
      require("plugins/lspconfig")
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
      require("plugins/cmp")
    end,
  },
  {
    "ray-x/lsp_signature.nvim",
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
      require('plugins/copilot')
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

  -- Lang
  {
    "akinsho/flutter-tools.nvim",
    lazy = false,
    dependencies = { "nvim-lua/plenary.nvim", "neovim/nvim-lspconfig", "stevearc/dressing.nvim" },
    config = function()
      local config = require("plugins/lspconfig")
      require("flutter-tools").setup({
        lsp = {
          on_attach = config.on_attach,
          capabilities = config.capabilities,
        },
      })
    end,
  },

  -- Tools
  {
    "akinsho/toggleterm.nvim",
    lazy = true,
    cmd = { "ToggleTerm", "ToggleTermToggleAll", "TermExec" },
    config = function()
      require("plugins/toggleterm")
    end,
  },
  {
    "lambdalisue/gina.vim",
    -- config = function()
    -- end
  },
  "vim-denops/denops.vim",
  "vim-denops/denops-helloworld.vim",
  {
    "nvim-treesitter/nvim-treesitter",
    config = function()
      require("plugins/treesitter")
    end,
    build = ":TSUpdate",
  },

  -- Editor
  {
    "windwp/nvim-autopairs",
    config = function()
      require("nvim-autopairs").setup({})
    end,
  },
  -- {
  --   'ggandor/lightspeed.nvim'
  -- },
  {
    "folke/flash.nvim",
    event = "VeryLazy",
    opts = {},
    keys = {
      {
        "s",
        mode = { "n", "x", "o" },
        function()
          -- default options: exact mode, multi window, all directions, with a backdrop
          require("flash").jump()
        end,
      },
      {
        "S",
        mode = { "o", "x" },
        function()
          require("flash").treesitter()
        end,
      },
    },
  },
  -- {
  --   "editorconfig/editorconfig-vim",
  -- },
  {
    "tpope/vim-surround",
  },
  {
    "numToStr/Comment.nvim",
    config = function()
      require("Comment").setup()
    end,
  },

  -- SKK
  {
    "vim-skk/skkeleton",
    dependencies = { "vim-denops/denops.vim" },
    config = function()
      require("plugins/skkeleton")
    end,
  },
  {
    "delphinus/skkeleton_indicator.nvim",
    dependencies = { "vim-skk/skkeleton" },
  },

  -- Snippets
  "honza/vim-snippets",
  "SirVer/ultisnips",
  "quangnguyen30192/cmp-nvim-ultisnips",

  -- Fizzy finder
  "nvim-lua/plenary.nvim",
  {
    "nvim-telescope/telescope.nvim",
    init = function()
      local opts = { noremap = true, silent = true }
      local keymap = vim.api.nvim_set_keymap
      keymap("n", "<leader>ff", "<cmd>Telescope find_files<cr>", opts)
      keymap("n", "<leader>fg", "<cmd>Telescope live_grep<cr>", opts)
      keymap("n", "<leader>fb", "<cmd>Telescope buffers<cr>", opts)
      keymap("n", "<leader>fh", "<cmd>Telescope help_tags<cr>", opts)
      keymap("n", "<leader>tr", "<cmd>Telescope registers<cr>", opts)
    end,
    config = function()
      require("plugins/telescope")
    end,
    lazy = true,
    cmd = "Telescope",
  },
  { "kkharji/sqlite.lua" },
  {
    "nvim-telescope/telescope-frecency.nvim",
    dependencies = { "nvim-telescope/telescope.nvim", "kkharji/sqlite.lua" },
    config = function()
      require("telescope").load_extension("frecency")
    end,
  },
  -- 'ThePrimeagen/harpoon',

  -- Other
  -- Python
  -- { 'psf/black' }
  --
  -- {
  --   "jose-elias-alvarez/null-ls.nvim",
  --   dependencies = { "nvim-lua/plenary.nvim" },
  --   config = function()
  --     require("plugins/nullls")
  --   end,
  -- },
  --
  {
    "mfussenegger/nvim-dap",
    config = function()
      require("plugins/nvim-dap")
    end,
  },
  {
    "rcarriga/nvim-dap-ui",
  },
  {
    "leoluz/nvim-dap-go",
    config = function()
      require("dap-go").setup()
    end,
  },
}
