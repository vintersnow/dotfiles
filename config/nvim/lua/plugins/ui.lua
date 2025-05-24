return {
  -- {
  --   'goolord/alpha-nvim',
  --   event = "VimEnter",
  --   dependencies = { 'nvim-tree/nvim-web-devicons' },
  --   config = function ()
  --       require'alpha'.setup(require'alpha.themes.startify'.config)
  --   end
  -- },
  {
    "nvim-lualine/lualine.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    event = "VeryLazy",
    opts = {
      options = {
        icons_enabled = true,
        theme = "auto",
        -- section_separators = {'', ''},
        -- component_separators = {'', ''},
        disabled_filetypes = {},
      },
      sections = {
        lualine_a = { "mode" },
        lualine_b = { "branch" },
        lualine_c = { "filename" },
        lualine_x = {
          {
            "diagnostics",
            sources = { "nvim_diagnostic" },
            symbols = { error = " ", warn = " ", info = " ", hint = " " },
          },
          "encoding",
          "filetype",
        },
        lualine_y = { "progress" },
        lualine_z = { "location" },
      },
      inactive_sections = {
        lualine_a = {},
        lualine_b = {},
        lualine_c = { "filename" },
        lualine_x = { "location" },
        lualine_y = {},
        lualine_z = {},
      },
      tabline = {},
      extensions = { "fugitive" },
    },
    -- config = function()
    --   require("plugins/lualine")
    -- end,
  },
  {
    "EdenEast/nightfox.nvim",
    lazy = false,
    priority = 1000, -- make sure to load this before all the other start plugins
    config = function()
      vim.cmd([[colorscheme nordfox]])
    end,
  },
  {
    "folke/todo-comments.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    opts = {
      -- your configuration comes here
      -- or leave it empty to use the default settings
      -- refer to the configuration section below
    },
  },
  -- {
  --   "shortcuts/no-neck-pain.nvim",
  --   version = "*"
  -- },
  {
    "MunifTanjim/nui.nvim",
  },
  {
    "rcarriga/nvim-notify",
  },
  {
    "kevinhwang91/nvim-ufo",
    dependencies = { "kevinhwang91/promise-async" },
    event = "VeryLazy",
    config = function()
      vim.o.foldcolumn = "1" -- '0' is not bad
      vim.o.foldlevel = 99 -- Using ufo provider need a large value, feel free to decrease the value
      vim.o.foldlevelstart = 99
      vim.o.foldenable = true

      vim.keymap.set("n", "zR", require("ufo").openAllFolds)
      vim.keymap.set("n", "zM", require("ufo").closeAllFolds)

      require("ufo").setup({
        provider_selector = function(bufnr, filetype, buftype)
          return { "treesitter", "indent" }
        end,
      })
    end,
    -- keys = {
    --   -- { 'zR', require('ufo').openAllFolds, mode = 'n', desc = 'Open all folds' },
    --   -- { 'zM', require('ufo').closeAllFolds, mode = 'n', desc = 'Close all folds' },
    -- }
  },
}
