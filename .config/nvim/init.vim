" plugins
source ~/.config/nvim/plugins.vim

" settings
if isdirectory(expand('~/.config/nvim/vimrc.d'))
  set runtimepath+=~/.config/nvim/
  runtime! vimrc.d/*.vim
endif

" colorscheme
set background=dark
" colorscheme solarized
colorscheme hybrid

" secret
if filereadable(expand('~/.config/nvim/pw.vim'))
  source ~/.config/nvim/pw.vim
endif

" allow intelligent auto-indenting for each filetype, and for plugins that are filetype specific.
filetype indent plugin on
