"---------------------------------------------------------------------------
" deoplete.nvim
let g:deoplete#enable_at_startup = 1

" let g:deoplete#disable_auto_complete = 1
" autocmd InsertLeave,CompleteDone * if pumvisible() == 0 | pclose | endif

let g:tern_request_timeout = 1
let g:tern#command = ['tern', '--no-port-file', '--persistent']


" clang
" copy from https://gist.github.com/htfy96/e865fe4cfb1ee8f7206e4ec9c1a74812
let g:clang_complete_auto = 0
let g:clang_auto = 0
let g:clang_auto_select = 0
let g:clang_default_keymappings = 0
let g:clang_use_library = 1
let g:clang_close_preview = 1
let g:deoplete#omni_patterns = {}
let g:deoplete#omni_patterns.cpp = '[^. *\t]\.\w*|[^. *\t]\::\w*|[^. *\t]\->\w*|#include\s*[<"][^>"]*'
let g:deoplete#omni#input_patterns={}
let g:deoplete#omni#input_patterns.cpp = ['[^. *\t]\.\w*','[^. *\t]\::\w*','[^. *\t]\->\w*','#include\s*[<"][^>"]*']
let g:clang_cpp_options = ' -std=c++11'
let g:clang_verbose_pmenu = 1
let g:clang_diagsopt = ''

let g:inccomplete_showdirs = 1
let g:inccomplete_addclosebracket = "none"
let g:inccomplete_autoselect = 0
