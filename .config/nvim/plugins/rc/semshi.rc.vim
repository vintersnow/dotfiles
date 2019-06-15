function MyCustomHighlights()
  " hi semshiLocal           ctermfg=3 guifg=#ff875f " ?
  hi semshiGlobal          ctermfg=3 guifg=#ffaf00
  hi semshiImported        ctermfg=3 guifg=#ffaf00
  hi semshiParameter       ctermfg=12  guifg=#5fafff
  " hi semshiParameterUnused ctermfg=117 guifg=#87d7ff cterm=underline gui=underline
  " hi semshiFree            ctermfg=218 guifg=#ffafd7 " ?
  hi semshiBuiltin         ctermfg=13 guifg=#ff5fff
  hi semshiAttribute       ctermfg=14  guifg=#00ffaf
  " hi semshiSelf            ctermfg=249 guifg=#b2b2b2
  " hi semshiUnresolved      ctermfg=226 guifg=#ffff00 cterm=underline gui=underline
  hi semshiSelected        ctermfg=231 guifg=#ffffff ctermbg=52 guibg=#d7005f
endfunction
autocmd FileType python call MyCustomHighlights()
