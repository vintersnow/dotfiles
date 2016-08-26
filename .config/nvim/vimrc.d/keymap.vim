" The prefix key.
nnoremap    [Leader]   <Nop>
nmap    <Space> [Leader]

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" nomal bindings

" 分割
nnoremap [Leader]- :<C-u>sp<CR>
nnoremap [Leader]\ :<C-u>vs<CR>

" 画面resize
" 同じに揃える
" nnoremap [Leader]s= <C-w>=
" 最大化
" nnoremap [Leader]o <C-w>_<C-w>|

" tab new
nnoremap [Leader]tt :<C-u>tabnew<CR>

" copy and paste from clipboard
noremap [Leader]p "+p<CR>
noremap [Leader]y "+y<CR>

" tag back
nnoremap <C-[> <C-t>

" term
if has('nvim')
  nnoremap [Leader]t- :split<Space>term://.//zsh<CR>
  nnoremap [Leader]t\ :vsplit<Space>term://.//zsh<CR>

  tnoremap <silent> <ESC> <C-\><C-n>
endif

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" plugins

" unite
let g:Leader_source_history_yank_enable =1
nnoremap <silent> [Leader]f :<C-u>Unite<Space>file<CR>
nnoremap <silent> [Leader]u :<C-u>Unite<Space>-start-insert<Space>file_rec/async<CR>
nnoremap <silent> [Leader]g :<C-u>Unite<Space>grep:.<CR>
nnoremap <silent> [Leader]bu :<C-u>Unite<Space>buffer<CR>
nnoremap <silent> [Leader]bm :<C-u>Unite<Space>bookmark<CR>
nnoremap <silent> [Leader]a :<C-u>UniteBookmarkAdd<CR>
nnoremap <silent> [Leader]m :<C-u>Unite<Space>file_mru<CR>
nnoremap <silent> [Leader]r :<C-u>Unite -buffer-name=register register<CR>
nnoremap <silent> [Leader]c :<C-u>UniteWithBufferDir -buffer-name=files file<CR>

" vinarise
let g:vinarise_enable_auto_detect = 1 
" Leader-build map
nnoremap <silent> [Leader]vb :Unite build<CR>
nnoremap <silent> [Leader]vcb :Unite build:!<CR>
nnoremap <silent> [Leader]vch :UniteBuildClearHighlight<CR>

" Leader-grepの便利キーマップ
" vnoremap /g y:Unite grep::-iRn:<C-R>=escape(@", '\\.*$^[]')<CR><CR>
