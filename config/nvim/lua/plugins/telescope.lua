-- keymap
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
-- telescope.load_extension('harpoon')

-- vim.api.nvim_set_keymap("n", "<leader>ff", "<Cmd>lua require('telescope').extensions.frecency.frecency({ workspace = 'CWD' })<CR>", {noremap = true, silent = true})
vim.api.nvim_set_keymap("n", "<leader>fr", "<Cmd>lua require('telescope').extensions.frecency.frecency()<CR>", {noremap = true, silent = true})
-- vim.api.nvim_set_keymap("n", "<leader>fF", "<Cmd>lua require('telescope').<CR>", {noremap = true, silent = true})
