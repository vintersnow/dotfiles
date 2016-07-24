" The prefix key.
nnoremap    [Leader]   <Nop>
nmap    <Space> [Leader]

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" nomal bindings

" 分割
nnoremap [Leader]s :<C-u>sp<CR>
nnoremap [Leader]v :<C-u>vs<CR>

" 画面resize
" 同じに揃える
nnoremap [Leader]s= <C-w>=
" 最大化
nnoremap [Leader]o <C-w>_<C-w>|

" tab new
nnoremap [Leader]t :<C-u>tabnew<CR>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Leader Keymap

" Leader.vim keymap
let g:Leader_source_history_yank_enable =1
nnoremap <silent> [Leader]u :<C-u>Unite<Space>file<CR>
nnoremap <silent> [Leader]g :<C-u>Unite<Space>grep<CR>
nnoremap <silent> [Leader]f :<C-u>Unite<Space>buffer<CR>
nnoremap <silent> [Leader]b :<C-u>Unite<Space>bookmark<CR>
nnoremap <silent> [Leader]a :<C-u>UniteBookmarkAdd<CR>
nnoremap <silent> [Leader]m :<C-u>Unite<Space>file_mru<CR>
nnoremap <silent> [Leader]h :<C-u>Unite<Space>history/yank<CR>
nnoremap <silent> [Leader]r :<C-u>Unite -buffer-name=register register<CR>
nnoremap <silent> [Leader]c :<C-u>UniteWithBufferDir -buffer-name=files file<CR>
nnoremap <silent> ,vr :LeaderResume<CR>
" vinarise
let g:vinarise_enable_auto_detect = 1 
" Leader-build map
nnoremap <silent> ,vb :Unite build<CR>
nnoremap <silent> ,vcb :Unite build:!<CR>
nnoremap <silent> ,vch :UniteBuildClearHighlight<CR>

let g:Unite_source_grep_command = 'ag'
let g:Unite_source_grep_default_opts = '--nocolor --nogroup'
let g:Unite_source_grep_max_candidates = 200
let g:Unite_source_grep_recursive_opt = ''
" Leader-grepの便利キーマップ
vnoremap /g y:Unite grep::-iRn:<C-R>=escape(@", '\\.*$^[]')<CR><CR>

" tag back
nnoremap <C-[> <C-t>
