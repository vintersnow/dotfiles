" unuse vi mode
if &compatible
  set nocompatible
endif

" filetype off for plugin setting
filetype off
filetype plugin indent off


" Enable syntax highlighting and colorscheme
syntax on

" max column for highlighting
set synmaxcol=200

" disable highlighting when searching
set nohlsearch

" enable highlighting the cursor line
" this make vim too slow
" set cursorline
" set cursorline highlighting for denite
hi CursorLine cterm=None ctermbg=235 ctermfg=red

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
" set smartcase
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

" commadline completion
set wildmenu
set wildmode=longest:full,full

" fold
" let javaScript_fold=1

" 折り返し
set nowrap

" canceal conceal
if has('conceal')
  set conceallevel=0
endif
let g:vim_json_syntax_conceal = 0

" don't redraw when script is running
set lazyredraw

" don't show the mode in cmdline
set noshowmode 

" match < and >
set matchpairs+=<:>

" don't show preview window when completion
set completeopt-=preview
