" Set my augroup.
augroup MyAutoCmd
  autocmd!
  autocmd CursorHold *? syntax sync minlines=300
augroup END

if has('mac')
  let g:python3_host_prog = '/usr/local/bin/python3'
  " let g:python3_host_prog = '~/.ghq/github.com/riywo/anyenv/envs/pyenv/shims/python'
endif

" plugins
source ~/.config/nvim/plugins.vim

" settings
if isdirectory(expand('~/.config/nvim/vimrc.d'))
  set runtimepath+=~/.config/nvim/
  runtime! vimrc.d/*.vim
endif

" secret
if filereadable(expand('~/.config/nvim/pw.vim'))
  source ~/.config/nvim/pw.vim
endif

" allow intelligent auto-indenting for each filetype, and for plugins that are filetype specific.
filetype indent plugin on
