packadd vim-jetpack

call jetpack#begin()
""" UI
" Jetpack 'marko-cerovac/material.nvim'
Jetpack 'EdenEast/nightfox.nvim'
Jetpack 'hoob3rt/lualine.nvim'

" icons
Jetpack 'kyazdani42/nvim-web-devicons'

""" Tools
Jetpack 'folke/trouble.nvim'
Jetpack 'akinsho/toggleterm.nvim'

" Spell Check
Jetpack 'kamykn/spelunker.vim'

" Git
Jetpack 'lambdalisue/gina.vim'

""" Editing utils
Jetpack 'jiangmiao/auto-pairs'
let g:AutoPairsMultilineClose = 0
Jetpack 'ggandor/lightspeed.nvim'
Jetpack 'editorconfig/editorconfig-vim'
Jetpack 'tpope/vim-surround'
Jetpack 'Shougo/context_filetype.vim'
Jetpack 'tyru/caw.vim'

" SKK
Jetpack 'vim-denops/denops.vim'
Jetpack 'vim-denops/denops-helloworld.vim'
Jetpack 'vim-skk/skkeleton'
Jetpack 'delphinus/skkeleton_indicator.nvim'

" Snippets
Jetpack 'honza/vim-snippets'
Jetpack 'SirVer/ultisnips'
Jetpack 'quangnguyen30192/cmp-nvim-ultisnips'

Jetpack 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}

""" Auto Completion
Jetpack 'neovim/nvim-lspconfig'
Jetpack 'tami5/lspsaga.nvim'

Jetpack 'hrsh7th/cmp-nvim-lsp'
Jetpack 'hrsh7th/cmp-buffer'
Jetpack 'hrsh7th/cmp-path'
Jetpack 'hrsh7th/cmp-cmdline'
Jetpack 'hrsh7th/nvim-cmp'

Jetpack 'ray-x/lsp_signature.nvim'

""" Tools

" Fizzy finder
Jetpack 'nvim-lua/popup.nvim'
Jetpack 'nvim-lua/plenary.nvim'
Jetpack 'nvim-telescope/telescope.nvim'
Jetpack 'ThePrimeagen/harpoon'

" Other
"" Python
Jetpack 'psf/black', { 'on': 'Black' }

" IME
Jetpack 'vim-denops/denops.vim'
Jetpack 'vim-denops/denops-helloworld.vim'
Jetpack 'vim-skk/skkeleton'
Jetpack 'delphinus/skkeleton_indicator.nvim'

call jetpack#end()

function! s:load_configurations() abort
  for path in glob(expand('$BASE/plugin.d/') . '*.vim', 1, 1, 1)
    execute printf('source %s', path)
  endfor
endfunction

colorscheme nordfox
call s:load_configurations()
