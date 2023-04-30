
-- call skkeleton#config({ 'globalJisyo': '~/Library/Application Support/AquaSKK/SKK-JISYO.L' })
vim.cmd("call skkeleton#config({ 'globalJisyo': '~/Library/Application Support/AquaSKK/SKK-JISYO.L' })")

-- imap <C-j> <Plug>(skkeleton-enable)
-- cmap <C-j> <Plug>(skkeleton-enable)

require'skkeleton_indicator'.setup{}
