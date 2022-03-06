
call jetpack#begin()
""" UI
Jetpack 'marko-cerovac/material.nvim'
Jetpack 'hoob3rt/lualine.nvim'

" icons
Jetpack 'kyazdani42/nvim-web-devicons'

""" Tools
Jetpack 'folke/trouble.nvim'

" Spell Check
Jetpack 'kamykn/spelunker.vim'

" Git
Jetpack 'tpope/vim-fugitive'


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
Jetpack 'nvim-lua/plenary.nvim'
Jetpack 'nvim-telescope/telescope.nvim'
Jetpack 'ThePrimeagen/harpoon'

call jetpack#end()
