return {
  {
    "nvim-telescope/telescope.nvim",
    init = function()
      local opts = { noremap = true, silent = true }
      local keymap = vim.api.nvim_set_keymap
      keymap("n", "<leader>fr", "<cmd>Telescope find_files<cr>", opts)
      keymap("n", "<leader>ff", "<cmd>Telescope smart_open<cr>", opts)
      keymap("n", "<leader>fg", "<cmd>Telescope live_grep<cr>", opts)
      keymap("n", "<leader>fb", "<cmd>Telescope buffers<cr>", opts)
      keymap("n", "<leader>fh", "<cmd>Telescope help_tags<cr>", opts)
      keymap("n", "<leader>tr", "<cmd>Telescope registers<cr>", opts)
    end,
    config = function()
      local actions = require('telescope.actions')
      local telescope = require('telescope')
      telescope.setup{
        defaults = {
          mappings = {
            n = {
              ["q"] = actions.close
            },
          },
        }
      }
      telescope.load_extension("smart_open")
    end,
    lazy = true,
    cmd = "Telescope",
  },
  { "kkharji/sqlite.lua" },
  {
    "danielfalk/smart-open.nvim",
    lazy = true,
    branch = "0.2.x",
    dependencies = {
      "kkharji/sqlite.lua",
      -- Only required if using match_algorithm fzf
      -- { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
      -- Optional.  If installed, native fzy will be used when match_algorithm is fzy
      -- { "nvim-telescope/telescope-fzy-native.nvim" },
    },
  },
}
