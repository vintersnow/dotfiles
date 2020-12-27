if empty(glob('~/.local/share/nvim/site/autoload/plug.vim'))
  !curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.local/share/nvim/plugged')

let $PLUGIN_BASE = expand('$BASE/plugins')

Plug 'tpope/vim-fugitive'

" UI
Plug 'w0ng/vim-hybrid'
source $PLUGIN_BASE/rc/airline.rc.vim
let g:airline_theme='hybrid'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" Sytax highlight
let g:polyglot_disabled = ['javascript', 'elm']
let g:cpp_class_scope_highlight = 1
Plug 'sheerun/vim-polyglot'

" source $PLUGIN_BASE/rc/semshi.rc.vim
" Plug 'numirias/semshi', {'for': 'python'}

" other
Plug 'jiangmiao/auto-pairs'
let g:AutoPairsMultilineClose = 0

Plug 'easymotion/vim-easymotion'
source $PLUGIN_BASE/rc/easymotion.rc.vim

Plug 'editorconfig/editorconfig-vim'

Plug 'tpope/vim-surround'
Plug 'tyru/caw.vim'
source $PLUGIN_BASE/rc/caw.rc.vim

Plug 'prabirshrestha/vim-lsp'
Plug 'mattn/vim-lsp-settings'
Plug 'Shougo/deoplete.nvim'
Plug 'lighttiger2505/deoplete-vim-lsp'

Plug 'honza/vim-snippets'
Plug 'SirVer/ultisnips'


" filer

" nvim
if has('nvim')
  " source $PLUGIN_BASE/rc/coc.rc.vim
  " Plug 'neoclide/coc.nvim', {'branch': 'release'}
endif

call plug#end()

source $PLUGIN_BASE/rc/ultisnips.rc.vim
source $PLUGIN_BASE/rc/vim-lsp.rc.vim
source $PLUGIN_BASE/rc/deoplete.rc.vim
