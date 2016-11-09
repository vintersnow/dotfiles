"---------------------------------------------------------------------------
" deoplete.nvim
let g:deoplete#enable_at_startup = 1

" let g:deoplete#disable_auto_complete = 1
" autocmd InsertLeave,CompleteDone * if pumvisible() == 0 | pclose | endif

let g:tern_request_timeout = 1
let g:tern#command = ['tern', '--no-port-file', '--persistent']


" deoplete-clang
let g:deoplete#sources#clang#libclang_path='/Library/Developer/CommandLineTools/usr/lib/libclang.dylib'
let g:deoplete#sources#clang#clang_header='/Library/Developer/CommandLineTools/usr/lib/clang'

call deoplete#custom#set('ultisnips', 'rank', 9999)
