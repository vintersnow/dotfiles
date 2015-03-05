set nocursorline " カーソル行を強調表示しない
autocmd InsertEnter,InsertLeave * set cursorline!  " 挿入モードの時のみ、カーソル行をハイライトする
set number "行数表示"
set showmatch "括弧入力時の対応する括弧を表示
set tabstop=2 "インデントをスペース4つ分に設定
set smartindent "オートインデント"
"#####検索設定#####
set ignorecase "大文字/小文字の区別なく検索する
set smartcase "検索文字列に大文字が含まれている場合は区別して検索する
set wrapscan "検索時に最後まで行ったら最初に戻る
" タブ入力を複数の空白入力に置き換える
set expandtab

" set cursor in tmux
if exists('$TMUX')
  let &t_SI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=1\x7\<Esc>\\"
  let &t_EI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=0\x7\<Esc>\\"
else
  let &t_SI = "\e]50;CursorShape=1\x7"
  let &t_EI = "\e]50;CursorShape=0\x7"
endif

" keymap
noremap <C-j> <esc>
noremap! <C-j> <esc>

"---------------------------
" Start Neobundle Settings.
"---------------------------
" bundleで管理するディレクトリを指定
" set runtimepath+=~/.vim/bundle/neobundle.vim/
if has('vim_starting')
  set nocompatible               " Be iMproved

  " Required:
  set runtimepath+=~/.vim/bundle/neobundle.vim
endif

" Required:
call neobundle#begin(expand('~/.vim/bundle/'))

" neobundle自体をneobundleで管理
NeoBundleFetch 'Shougo/neobundle.vim'

" Plugins
NeoBundle 'scrooloose/nerdtree'
NeoBundle 'Townk/vim-autoclose'
NeoBundle 'rking/ag.vim'
NeoBundle 'Shougo/unite.vim'
NeoBundle 'Shougo/neomru.vim'
NeoBundle 'bronson/vim-trailing-whitespace'
NeoBundle 'nathanaelkane/vim-indent-guides'
let g:indent_guides_enable_on_vim_startup = 1
NeoBundle 'tomtom/tcomment_vim'
NeoBundle 'Shougo/neocomplcache'
NeoBundle 'altercation/vim-colors-solarized'

call neobundle#end()
" Required:
filetype plugin indent on

" 未インストールのpluginがあるとインストールするか聞いてくる。
NeoBundleCheck

"-------------------------
" End Neobundle Settings.
"-------------------------

""""""""""""""""""""""""""""""
" Unit.vimの設定
" """"""""""""""""""""""""""""
" 入力モードで開始する
 let g:unite_enable_start_insert=1
" " バッファ一覧
 noremap <C-P> :Unite buffer<CR>
" " ファイル一覧
 noremap <C-N> :Unite -buffer-name=file file<CR>
" " 最近使ったファイルの一覧
 noremap <C-Z> :Unite file_mru<CR>
" " sourcesを「今開いているファイルのディレクトリ」とする
 noremap :uff :<C-u>UniteWithBufferDir file -buffer-name=file<CR>
" " ウィンドウを分割して開く
 au FileType unite nnoremap <silent> <buffer> <expr> <C-J> unite#do_action('split')
 au FileType unite inoremap <silent> <buffer> <expr> <C-J> unite#do_action('split')
" " ウィンドウを縦に分割して開く
 au FileType unite nnoremap <silent> <buffer> <expr> <C-K> unite#do_action('vsplit')
 au FileType unite inoremap <silent> <buffer> <expr> <C-K> unite#do_action('vsplit')
" " ESCキーを2回押すと終了する
 au FileType unite nnoremap <silent> <buffer> <ESC><ESC> :q<CR>
 au FileType unite inoremap <silent> <buffer> <ESC><ESC> <ESC>:q<CR>
" """""""""""""""""""""""""""""""
"
" tcomment.vim
let g:tcommentMapLeader1 = '<C-/>'
"-------------------------
" カーソル位置の単語をgrep検索
nnoremap <silent> ,cg :<C-u>Unite grep:.  -buffer-name=search-buffer<CR><C-R><C-W>
" unite grep に ag(The Silver Searcher) を使う
if executable('ag')
 let g:unite_source_grep_command = 'ag'
 let g:unite_source_grep_default_opts = '--nogroup --nocolor --column'
 let g:unite_source_grep_recursive_opt = ''
endif

"""""""""""""""""""""""""""
"neocomplcache.vim
"""""""""""""""""""""""""""
" Disable AutoComplPop.
let g:acp_enableAtStartup = 0
" Use neocomplcache.
let g:neocomplcache_enable_at_startup = 1
" Use smartcase.
let g:neocomplcache_enable_smart_case = 1
" Set minimum syntax keyword length.
let g:neocomplcache_min_syntax_length = 3
let g:neocomplcache_lock_buffer_name_pattern = '\*ku\*'

" Define dictionary.
let g:neocomplcache_dictionary_filetype_lists = {
  \ 'default' : ''
  \ }

" Plugin key-mappings.
inoremap <expr><C-g>     neocomplcache#undo_completion()
inoremap <expr><C-l>     neocomplcache#complete_common_string()

" Recommended key-mappings.
" <CR>: close popup and save indent.
inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
function! s:my_cr_function()
  return neocomplcache#smart_close_popup() . "\<CR>"
endfunction
" <TAB>: completion.
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
" <C-h>, <BS>: close popup and delete backword char.
inoremap <expr><C-h> neocomplcache#smart_close_popup()."\<C-h>"
inoremap <expr><BS> neocomplcache#smart_close_popup()."\<C-h>"
inoremap <expr><C-y>  neocomplcache#close_popup()
inoremap <expr><C-e>  neocomplcache#cancel_popup() "

""""""""""""""""""""""""
" colorscheme
" """""""""""""""""""""
syntax enable
set background=dark
colorscheme solarized

