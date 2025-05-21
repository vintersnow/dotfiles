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
  {
    "CopilotC-Nvim/CopilotChat.nvim",
    branch = "main",
    dependencies = {
      { "github/copilot.vim" },
      { "nvim-lua/plenary.nvim" }, -- for curl, log wrapper
    },
    opts = {
      debug = true, -- Enable debugging
      -- See Configuration section for rest
    },
    -- See Commands section for default commands if you want to lazy load on them
  },

  {
    "yetone/avante.nvim",
    event = "VeryLazy",
    lazy = false,
    version = "*", -- Set this to "*" to always pull the latest release version, or set it to false to update to the latest code changes.
    opts = {
      -- provider = "copilot",
      provider = "claude",
      -- auto_suggestions_provider = "copilot",
      auto_suggestions_provider = "claude",
      file_selector = {
        provider = "telescope",
        -- provider = "fzf",
        -- provider = "mini.pick",
        opts = {
          -- fzf = {
          --   fzf_layout = "default",
          --   fzf_args = "--reverse --prompt='Avante> '",
          -- },
          telescope = {
            layout_config = {
              prompt_position = "top",
            },
          },
        },
      },

      hints = { enabled = true },

    },
    -- if you want to build from source then do `make BUILD_FROM_SOURCE=true`
    build = "make",
    -- build = "powershell -ExecutionPolicy Bypass -File Build.ps1 -BuildFromSource false" -- for windows
    dependencies = {
      "stevearc/dressing.nvim",
      "nvim-lua/plenary.nvim",
      "MunifTanjim/nui.nvim",
      --- The below dependencies are optional,
      -- "echasnovski/mini.pick", -- for file_selector provider mini.pick
      "nvim-telescope/telescope.nvim", -- for file_selector provider telescope
      "hrsh7th/nvim-cmp", -- autocompletion for avante commands and mentions
      -- "ibhagwan/fzf-lua", -- for file_selector provider fzf
      "nvim-tree/nvim-web-devicons", -- or echasnovski/mini.icons
      -- "zbirenbaum/copilot.lua", -- for providers='copilot'
      {
        -- support for image pasting
        "HakonHarnes/img-clip.nvim",
        event = "VeryLazy",
        opts = {
          -- recommended settings
          default = {
            embed_image_as_base64 = false,
            prompt_for_file_name = false,
            drag_and_drop = {
              insert_mode = true,
            },
            -- required for Windows users
            use_absolute_path = true,
          },
        },
      },
      {
        -- Make sure to set this up properly if you have lazy=true
        'MeanderingProgrammer/render-markdown.nvim',
        opts = {
          file_types = { "markdown", "Avante" },
        },
        ft = { "markdown", "Avante" },
      },
    },
  },

  -- lua/plugins/ai-terminals.lua
  -- {
  --   "aweis89/ai-terminals.nvim",
  --   -- Example opts using functions for dynamic command generation
  --   -- (matches plugin defaults)
  --   opts = {
  --     terminals = {
  --       goose = {
  --         cmd = function()
  --           return string.format("GOOSE_CLI_THEME=%s goose", vim.o.background)
  --         end,
  --       },
  --       aichat = {
  --         cmd = function()
  --           return string.format(
  --             "AICHAT_LIGHT_THEME=%s aichat -r %%functions%% --session",
  --             -- Convert boolean to string "true" or "false"
  --             tostring(vim.o.background == "light")
  --           )
  --         end,
  --       },
  --       claude = {
  --         cmd = function()
  --           return string.format("claude config set -g theme %s && claude", vim.o.background)
  --         end,
  --       },
  --       kode = {
  --         cmd = function()
  --           return string.format("kode config set -g theme %s && kode", vim.o.background)
  --         end,
  --       },
  --       aider = {
  --         cmd = function()
  --           return string.format("aider --watch-files --%s-mode --no-auto-commit", vim.o.background)
  --         end,
  --       },
  --     },
  --     window_dimensions = {
  --       right = { width = 0.3, height = 1.0 }, -- Right side
  --     },
  --     -- You can also set window, default_position, enable_diffing here
  --     default_position = "right",
  --   },
  --   dependencies = { "folke/snacks.nvim" },
  --   keys = {
  --     -- Diff Tools
  --     {
  --       "<leader>dvo",
  --       function() require("ai-terminals").diff_changes() end,
  --       desc = "Show diff (vimdiff)",
  --     },
  --     {
  --       "<leader>dvD",
  --       function() require("ai-terminals").diff_changes({ delta = true }) end,
  --       desc = "Show diff (delta)",
  --     },
  --     {
  --       "<leader>dvr",
  --       function() require("ai-terminals").revert_changes() end,
  --       desc = "Revert changes from backup",
  --     },
  --     -- Example Keymaps (using default terminal names: 'claude', 'goose',
  --     -- 'aider', 'aichat', 'kode')
  --     -- Claude Keymaps
  --     {
  --       "<leader>atc", -- Mnemonic: AI Terminal Claude
  --       function() require("ai-terminals").toggle("claude") end,
  --       mode = { "n", "v" }, -- Works in normal and visual mode
  --       desc = "Toggle Claude terminal (sends selection in visual mode)",
  --     },
  --     {
  --       "<leader>adc", -- Mnemonic: AI Diagnostics Claude
  --       function() require("ai-terminals").send_diagnostics("claude") end,
  --       mode = { "n", "v" },
  --       desc = "Send diagnostics to Claude",
  --     },
  --     -- Goose Keymaps
  --     -- {
  --     --   "<leader>atg",
  --     --   function() require("ai-terminals").toggle("goose") end,
  --     --   mode = { "n", "v" },
  --     --   desc = "Toggle Goose terminal (sends selection in visual mode)",
  --     -- },
  --     -- {
  --     --   "<leader>adg",
  --     --   function() require("ai-terminals").send_diagnostics("goose") end,
  --     --   mode = { "n", "v" },
  --     --   desc = "Send diagnostics to Goose",
  --     -- },
  --     -- Aider Keymaps
  --     {
  --       "<leader>ata",
  --       function() require("ai-terminals").toggle("aider") end,
  --       mode = { "n", "v" },
  --       desc = "Toggle Aider terminal (sends selection in visual mode)",
  --     },
  --     {
  --       "<leader>ac",
  --       function()
  --         -- Adds comment and saves file
  --         require("ai-terminals").aider_comment("AI!")
  --       end,
  --       desc = "Add 'AI!' comment above line",
  --     },
  --     {
  --       "<leader>aC",
  --       function()
  --         -- Adds comment and saves file
  --         require("ai-terminals").aider_comment("AI?")
  --       end,
  --       desc = "Add 'AI?' comment above line",
  --     },
  --     {
  --       "<leader>al", -- Mnemonic: AI add Local file
  --       function()
  --         -- add current file (path conversion happens inside)
  --         require("ai-terminals").aider_add_files(vim.fn.expand("%"))
  --       end,
  --       desc = "Add current file to Aider (/add)",
  --     },
  --     {
  --       "<leader>aR", -- Mnemonic: AI add Read-only
  --       function()
  --         -- add current file as read-only (path conversion happens inside)
  --         require("ai-terminals").aider_add_files(vim.fn.expand("%"), { read_only = true })
  --       end,
  --       desc = "Add current file to Aider (read-only)",
  --     },
  --     {
  --       "<leader>aL", -- Mnemonic: AI add Listed buffers
  --       function() require("ai-terminals").aider_add_buffers() end,
  --       desc = "Add all listed buffers to Aider",
  --     },
  --     {
  --       "<leader>ada",
  --       function() require("ai-terminals").send_diagnostics("aider") end,
  --       mode = { "n", "v" },
  --       desc = "Send diagnostics to Aider",
  --     },
  --     -- aichat Keymaps
  --     -- {
  --     --   "<leader>ati",
  --     --   function() require("ai-terminals").toggle("aichat") end,
  --     --   mode = { "n", "v" },
  --     --   desc = "Toggle AI Chat terminal (sends selection in visual mode)",
  --     -- },
  --     -- {
  --     --   "<leader>adi",
  --     --   function() require("ai-terminals").send_diagnostics("aichat") end,
  --     --   mode = { "n", "v" },
  --     --   desc = "Send diagnostics to AI Chat",
  --     -- },
  --     -- Kode Keymaps
  --     -- {
  --     --   "<leader>atk",
  --     --   function() require("ai-terminals").toggle("kode") end,
  --     --   mode = { "n", "v" },
  --     --   desc = "Toggle Kode terminal (sends selection in visual mode)",
  --     -- },
  --     -- {
  --     --   "<leader>adk",
  --     --   function() require("ai-terminals").send_diagnostics("kode") end,
  --     --   mode = { "n", "v" },
  --     --   desc = "Send diagnostics to Kode",
  --     -- },
  --     -- Run Command and Send Output
  --     -- {
  --     --   "<leader>ar", -- Mnemonic: AI Run command
  --     --   function()
  --     --     -- Prompts user for command, then sends output to Aider
  --     --     require("ai-terminals").send_command_output("aider")
  --     --   end,
  --     --   desc = "Run command (prompts) and send output to Aider terminal",
  --     -- },
  --     -- Destroy All Terminals
  --     {
  --       "<leader>ax", -- Mnemonic: AI eXterminate
  --       function() require("ai-terminals").destroy_all() end,
  --       desc = "Destroy all AI terminals (closes windows, stops processes)",
  --     },
  --     -- Focus Terminal
  --     {
  --       "<leader>af", -- Mnemonic: AI Focus
  --       function() require("ai-terminals").focus() end,
  --       desc = "Focus the last used AI terminal window",
  --     },
  --   },
  -- },

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
    "lambdalisue/vim-gin",
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
  {
    "kdheepak/lazygit.nvim",
    lazy = true,
    cmd = {
        "LazyGit",
        "LazyGitConfig",
        "LazyGitCurrentFile",
        "LazyGitFilter",
        "LazyGitFilterCurrentFile",
    },
    -- optional for floating window border decoration
    dependencies = {
        "nvim-lua/plenary.nvim",
    },
    -- setting the keybinding for LazyGit with 'keys' is recommended in
    -- order to load the plugin when the command is run for the first time
    keys = {
        { "<leader>lg", "<cmd>LazyGit<cr>", desc = "LazyGit" }
    },
    config = function()
      vim.g.lazygit_use_neovim_remote = 0
      -- vim.env.GIT_EDITOR = "nvr -cc split --remote-wait +'set bufhidden=wipe'"
    end,
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
  -- {
  --   "mfussenegger/nvim-dap",
  --   config = function()
  --     require("plugins/nvim-dap")
  --   end,
  -- },
  -- {
  --   "rcarriga/nvim-dap-ui",
  -- },
  -- {
  --   "leoluz/nvim-dap-go",
  --   config = function()
  --     require("dap-go").setup()
  --   end,
  -- },
  {
    "jackMort/ChatGPT.nvim",
    event = "VeryLazy",
    config = function()
      require("plugins/chatgpt")
    end,
    dependencies = {
      "MunifTanjim/nui.nvim",
      "nvim-lua/plenary.nvim",
      "folke/trouble.nvim",
      "nvim-telescope/telescope.nvim"
    }
  },

  {
    "folke/which-key.nvim",
    event = "VeryLazy",
    opts = {
      -- your configuration comes here
      -- or leave it empty to use the default settings
      -- refer to the configuration section below
    },
    keys = {
      {
        "<leader>?",
        function()
          require("which-key").show({ global = false })
        end,
        desc = "Buffer Local Keymaps (which-key)",
      },
    },
  }
}
