return {
  {
    "akinsho/toggleterm.nvim",
    lazy = true,
    cmd = { "ToggleTerm", "ToggleTermToggleAll", "TermExec" },
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
