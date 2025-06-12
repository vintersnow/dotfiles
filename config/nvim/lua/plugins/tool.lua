return {
  {
    "akinsho/toggleterm.nvim",
    lazy = true,
    cmd = { "ToggleTerm", "ToggleTermToggleAll", "TermExec" },
    keys = {
      { "<leader>tt", "<cmd>ToggleTerm<cr>", desc = "Toggle Terminal" },
      { "<leader>tT", "<cmd>ToggleTermToggleAll<cr>", desc = "Toggle All Terminals" },
    },
    config = function()
      require("toggleterm").setup({
        size = 100,
        hide_numbers = true,
        shade_filetypes = {},
        shade_terminals = true,
        shading_factor = 2,
        start_in_insert = true,
        insert_mappings = true,
        persist_size = true,
        direction = 'float',
        close_on_exit = true,
      })
      vim.keymap.set("t", "<ESC>", [[<C-\><C-n>]], { silent = true })
    end,
  },
  {
    "vim-denops/denops.vim",
    lazy = false,
  },
  {
    "vim-denops/denops-helloworld.vim",
    lazy = true,
    dependencies = { "vim-denops/denops.vim" },
    cmd = { "DenopsHello" },
  },
}
