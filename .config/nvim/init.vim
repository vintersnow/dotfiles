" plugins
source ~/.config/nvim/plugins.vim

" settings
if isdirectory(expand('~/.config/nvim/user_autoload'))
  set runtimepath+=~/.config/nvim/
  runtime! user_autoload/*.vim
endif

" colorscheme
set background=dark
colorscheme solarized

" secret
if filereadable(expand('~/.config/nvim/pw.vim'))
  source ~/.config/nvim/pw.vim
endif

" allow intelligent auto-indenting for each filetype, and for plugins that are filetype specific.
filetype indent plugin on
