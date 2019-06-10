"---------------------------------------------------------------------------
" deoplete.nvim
let g:deoplete#enable_at_startup = 1
let g:deoplete#auto_complete_start_length = 1
" let g:deoplete#auto_complete_delay = 0

" let g:deoplete#disable_auto_complete = 1
" autocmd InsertLeave,CompleteDone * if pumvisible() == 0 | pclose | endif

" call deoplete#custom#set('ultisnips', 'rank', 9999)

let g:deoplete#sources = {}
let g:deoplete#omni#functions = {}
let g:deoplete#omni#input_patterns = {}

let g:deoplete#omni#functions.elm = ['elm#Complete']
let g:deoplete#omni#input_patterns.elm = '[^ \t]+'
let g:deoplete#sources.elm = ['omni']
