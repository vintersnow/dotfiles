"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Neomake

augroup neomake_run
  autocmd!
  " 保存時とenter時にlint
  autocmd BufWritePost,BufEnter * Neomake

  " インサートモードを抜けた時もlint
  " autocmd! InsertLeave *.js Neomake 

  " vim終了時にeslint_dを終了
  " autocmd VimLeave *.js  !eslint_d stop
augroup END

" js
let g:neomake_javascript_enabled_makers = ['eslint_d']
let g:neomake_jsx_enabled_makers = ['eslint_d']

" c++
let g:neomake_cpp_enable_markers=['clang']
let g:neomake_cpp_clang_args = ["-std=c++11", "-Wextra", "-Wall", "-fsanitize=undefined","-g", "-fsyntax-only"]

" let g:neomake_open_list = 2

" Debug
" let g:neomake_verbose=3
" let g:neomake_logfile='/tmp/neomake.log'
