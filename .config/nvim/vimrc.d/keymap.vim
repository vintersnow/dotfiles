" The prefix key.
nnoremap    [Leader]   <Nop>
nmap    <Space> [Leader]
vnoremap    [Leader]   <Nop>
vmap    <Space> [Leader]

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
nnoremap [Leader]y "+yy
vnoremap [Leader]y "+y

" tag back
nnoremap <C-[> <C-t>

" term
if has('nvim')
  nnoremap [Leader]t- :split<Space>term://.//zsh<CR>
  nnoremap [Leader]t\ :vsplit<Space>term://.//zsh<CR>

  tnoremap <silent> <ESC> <C-\><C-n>
endif

" move right in insert mode
inoremap <C-l> <C-g>U<Right>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" plugins

" unite
" let g:Leader_source_history_yank_enable =1
" nnoremap <silent> [Leader]f :<C-u>Unite<Space>file<CR>
" nnoremap <silent> [Leader]u :<C-u>Unite<Space>-start-insert<Space>file_rec/async<CR>
" nnoremap <silent> [Leader]g :<C-u>Unite<Space>grep:. -buffer-name=search-buffer<CR>
" nnoremap <silent> [Leader]bu :<C-u>Unite<Space>buffer<CR>
" nnoremap <silent> [Leader]bm :<C-u>Unite<Space>bookmark<CR>
" nnoremap <silent> [Leader]a :<C-u>UniteBookmarkAdd<CR>
" nnoremap <silent> [Leader]m :<C-u>Unite<Space>file_mru<CR>
" nnoremap <silent> [Leader]r :<C-u>Unite -buffer-name=register register<CR>
" nnoremap <silent> [Leader]c :<C-u>UniteWithBufferDir -buffer-name=files file<CR>

" denite
nnoremap <silent> [Leader]u :<C-u>Denite<Space>file_rec<CR>
nnoremap <silent> [Leader]g :<C-u>Denite<Space>grep<CR>
nnoremap <silent> [Leader]m :<C-u>Denite<Space>file_mru<CR>
nnoremap <silent> [Leader]l :<C-u>Denite<Space>line<CR>
nnoremap <silent> [Leader]ft :<C-u>Denite<Space>filetype<CR>
nnoremap <silent> [Leader]h :<C-u>Denite<Space>neoyank<CR>
nnoremap <silent> [Leader]b :<C-u>Denite<Space>buffer<CR>

" quickrun
nmap [Leader]r <Plug>(quickrun)

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" filetype
augroup filetype_keymap
  autocmd!
  " help
  autocmd FileType help nnoremap <buffer> q :q<CR>
  " qf
  autocmd FileType qf nnoremap <buffer> q :q<CR>

  " js
  autocmd FileType javascript nnoremap <silent> <buffer> <C-]> :TernDef<CR>
  autocmd FileType javascript nnoremap <buffer> <C-[> <C-o>
augroup END

