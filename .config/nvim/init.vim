" Set my augroup.
augroup MyAutoCmd
  autocmd!
  autocmd CursorHold *? syntax sync minlines=300
augroup END

" if has('mac')
  " let g:python3_host_prog = '/usr/local/bin/python3'
  " let g:python3_host_prog = '~/.ghq/github.com/riywo/anyenv/envs/pyenv/shims/python'
" endif

if has('vim_starting')
  " settings
  if isdirectory(expand('~/.config/nvim'))
    set runtimepath+=~/.config/nvim/
    " runtime! vimrc.d/*.vim
  endif
  
  let $BASE = '~/.config/nvim'
  execute 'source' expand('$BASE/vimrc.d/basic.vim')
  execute 'source' expand('$BASE/vimrc.d/keymap.vim')
  execute 'source' expand('$BASE/vimrc.d/lang_setting.vim')

  " plugins
  " source ~/.config/nvim/plugins.vim
  execute 'source' expand('$BASE/plugins.vim')


  " secret
  if filereadable(expand('$BASE/pw.vim'))
    " source ~/.config/nvim/pw.vim
    execute 'source' expand('$BASE/pw.vim')
  endif
endif

" allow intelligent auto-indenting for each filetype, and for plugins that are filetype specific.
filetype indent plugin on
