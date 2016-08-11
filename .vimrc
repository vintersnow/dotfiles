" load settings
if isdirectory(expand('~/.config/nvim/vimrc.d'))
  set runtimepath+=~/.config/nvim/
  runtime! vimrc.d/*.vim
endif
