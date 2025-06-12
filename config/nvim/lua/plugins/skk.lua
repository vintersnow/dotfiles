return {
  {
    "vim-skk/skkeleton",
    -- event = "InsertEnter",
    event = { "BufNewFile", "BufRead" },
    dependencies = {
      "vim-denops/denops.vim",
      "delphinus/skkeleton_indicator.nvim",
    },
    config = function()
      -- call skkeleton#config({ 'globalJisyo': '~/Library/Application Support/AquaSKK/SKK-JISYO.L' })
      -- Coment out for now
      vim.cmd(
        "call skkeleton#config({ 'globalDictionaries': ['~/Library/Application Support/AquaSKK/SKK-JISYO.L'], 'eggLikeNewline': v:true })"
      )

      -- imap <C-j> <Plug>(skkeleton-enable)
      -- cmap <C-j> <Plug>(skkeleton-enable)
      -- vim.cmd("call skkeleton#config({ 'keymap': { 'mode': { '=': 'katakana' }}})")
      vim.cmd("call add(g:skkeleton#mapped_keys, '=')")
      vim.cmd("call skkeleton#register_keymap('input', '=', 'katakana')")
      vim.cmd("call add(g:skkeleton#mapped_keys, '/')")
      vim.cmd("call skkeleton#register_keymap('input', '/', 'abbrev')")

      vim.keymap.set({ "i", "c" }, [[<C-j>]], [[<Plug>(skkeleton-enable)]], opts)

      require("skkeleton_indicator").setup({})
    end,
  },
}
