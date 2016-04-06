" unuse vi mode
if &compatible
  set nocompatible
endif

" allow intelligent auto-indenting for each filetype, and for plugins that are filetype specific.
filetype indent plugin on

" Enable syntax highlighting and colorscheme
syntax on
"colorscheme desert

" disable highlighting when searching
set nohlsearch

" enable highlighting the cursor line
set cursorline

" use true color
if has('nvim')
  let $NVIM_TUI_ENABLE_TRUE_COLOR=1
endif


" One of the most important options to activate. Allows you to switch from an
" unsaved buffer without saving it first.
set hidden

" Better command-line completion
set wildmenu

" Show partial commands in the last line of the screen
set showcmd

" Use case insensitive search, except when using capital letters
set ignorecase
set smartcase

" Allow backspacing over autoindent, line breaks and start of insert action
set backspace=indent,eol,start

" When opening a new line and no filetype-specific indenting is enabled, keep
" the same indent as the line you're currently on. Useful for READMEs, etc.
set autoindent

" Stop certain movements from always going to the first character of a line.
set nostartofline

" Display the cursor position on the last line of the screen or in the status line of a window
set ruler

" Always display the status line, even if only one window is displayed
set laststatus=2

" Use visual bell instead of beeping when doing something wrong
set visualbell

" Display line numbers on the left
set number

"dein Scripts-----------------------------

let s:dein_dir = expand('~/.cache/dein')
let s:dein_repo_dir = s:dein_dir . '/repos/github.com/Shougo/dein.vim'

if !isdirectory(s:dein_repo_dir)
  execute '!git clone https://github.com/Shougo/dein.vim' s:dein_repo_dir
endif
" Required:
execute 'set runtimepath^=' . fnamemodify(s:dein_repo_dir,':p')

let s:toml = '~/.vim/dein.toml'
let s:toml_lazy= '~/.vim/dein_lazy.toml'

if dein#load_state(s:dein_dir)
  call dein#begin(s:dein_dir,[expand('<sfile>'),s:toml,s:toml_lazy])
  call dein#load_toml(s:toml,{'lazy':0})
  call dein#load_toml(s:toml_lazy,{'lazy':1})

  call dein#end()
  call dein#save_state()
endif

if dein#check_install()
  call dein#install()
endif

" colorscheme
colorscheme solarized
