"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Neomake

augroup neomake_run
  autocmd!
  " 保存時とenter時にlint
  autocmd BufWritePost,BufEnter * Neomake

  " インサートモードを抜けた時もlint
  " autocmd! InsertLeave *.js Neomake 

  " vim終了時にeslint_dを終了
  autocmd VimLeave *.js  !eslint_d stop
augroup END

let g:neomake_javascript_enabled_makers = ['eslint_d']

" let g:neomake_open_list = 2
