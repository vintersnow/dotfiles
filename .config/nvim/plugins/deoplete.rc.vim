"---------------------------------------------------------------------------
" deoplete.nvim
let g:deoplete#enable_at_startup = 1

" let g:deoplete#disable_auto_complete = 1
" autocmd InsertLeave,CompleteDone * if pumvisible() == 0 | pclose | endif

" let g:tern_request_timeout = 1
let g:tern#command = ['tern', '--no-port-file', '--persistent']

