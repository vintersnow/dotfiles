if empty(glob('~/.local/share/nvim/site/autoload/plug.vim'))
  !curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.local/share/nvim/plugged')

let $PLUGIN_BASE = expand('$BASE/plugins')

" Tools
" Plug 'tpope/vim-fugitive'
Plug 'lambdalisue/gina.vim'

" UI
" Plug 'w0ng/vim-hybrid'
Plug 'marko-cerovac/material.nvim'
" source $PLUGIN_BASE/rc/airline.rc.vim
" let g:airline_theme='hybrid'
" Plug 'vim-airline/vim-airline'
" Plug 'vim-airline/vim-airline-themes'
Plug 'hoob3rt/lualine.nvim'

Plug 'folke/trouble.nvim'

" Spell Check
Plug 'kamykn/spelunker.vim'

" Syntax highlight
" let g:polyglot_disabled = ['javascript', 'elm']
" let g:cpp_class_scope_highlight = 1
" Plug 'sheerun/vim-polyglot'

" source $PLUGIN_BASE/rc/semshi.rc.vim
" Plug 'numirias/semshi', {'for': 'python'}
Plug 'psf/black'

" other
Plug 'jiangmiao/auto-pairs'
let g:AutoPairsMultilineClose = 0

" Plug 'easymotion/vim-easymotion'
Plug 'ggandor/lightspeed.nvim'

" source $PLUGIN_BASE/rc/easymotion.rc.vim

Plug 'editorconfig/editorconfig-vim'

Plug 'tpope/vim-surround'
Plug 'Shougo/context_filetype.vim'
Plug 'tyru/caw.vim'
" source $PLUGIN_BASE/rc/caw.rc.vim

""" Auto Completion
" Plug 'prabirshrestha/vim-lsp'
" Plug 'mattn/vim-lsp-settings'
" Plug 'Shougo/deoplete.nvim'
" Plug 'lighttiger2505/deoplete-vim-lsp'
Plug 'neovim/nvim-lspconfig'
Plug 'tami5/lspsaga.nvim'

Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/cmp-cmdline'
Plug 'hrsh7th/nvim-cmp'

Plug 'ray-x/lsp_signature.nvim'

" Snippets
Plug 'honza/vim-snippets'
Plug 'SirVer/ultisnips'
Plug 'quangnguyen30192/cmp-nvim-ultisnips'

" Syntax
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}

" fizzy finder
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'ThePrimeagen/harpoon'
" icons
Plug 'kyazdani42/nvim-web-devicons'

" markdown
" Plug 'godlygeek/tabular'
" Plug 'plasticboy/vim-markdown'

" filer

" matcher
" if has('nvim')
"   Plug 'Shougo/denite.nvim', { 'do': ':UpdateRemotePlugins' }
" else
"   Plug 'Shougo/denite.nvim'
"   Plug 'roxma/nvim-yarp'
"   Plug 'roxma/vim-hug-neovim-rpc'
" endif

" coc
" if has('nvim')
"   " source $PLUGIN_BASE/rc/coc.rc.vim
"   " Plug 'neoclide/coc.nvim', {'branch': 'release'}
" endif

" other
" " Vue.js
" Plug 'posva/vim-vue'

Plug 'vim-denops/denops.vim'
Plug 'vim-denops/denops-helloworld.vim'
Plug 'vim-skk/skkeleton'
Plug 'delphinus/skkeleton_indicator.nvim'


call plug#end()

" source $PLUGIN_BASE/rc/ultisnips.rc.vim
" source $PLUGIN_BASE/rc/vim-lsp.rc.vim
" source $PLUGIN_BASE/rc/deoplete.rc.vim
" source $PLUGIN_BASE/rc/denite.rc.vim
" source $PLUGIN_BASE/rc/python.rc.vim
" source $PLUGIN_BASE/rc/lspconfig.rc.nvim
