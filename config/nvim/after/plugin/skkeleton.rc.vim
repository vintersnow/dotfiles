
call skkeleton#config({ 'globalJisyo': '~/Library/Application Support/AquaSKK/SKK-JISYO.L' })

imap <C-j> <Plug>(skkeleton-enable)
cmap <C-j> <Plug>(skkeleton-enable)


lua << EOF
require'skkeleton_indicator'.setup{}
EOF
