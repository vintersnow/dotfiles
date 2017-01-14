let $BASE = '~/.config/nvim'

" Set my augroup.
execute 'source' expand('$BASE/myautocmd.vim')

if has('mac')
  let g:python_host_prog = '/usr/local/bin/python2'
  let g:python3_host_prog = expand('~/.ghq/github.com/riywo/anyenv/envs/pyenv/shims/python3')
endif

if has('vim_starting')
  " settings
  if isdirectory(expand('~/.config/nvim'))
    set runtimepath+=~/.config/nvim/
    " runtime! vimrc.d/*.vim
  endif
  
  " plugins
  execute 'source' expand('$BASE/plugins.vim')

  " colorscheme
  set background=dark
  colorscheme hybrid

  execute 'source' expand('$BASE/vimrc.d/basic.vim')
  execute 'source' expand('$BASE/vimrc.d/keymap.vim')
  execute 'source' expand('$BASE/vimrc.d/lang_setting.vim')


  " secret
  if filereadable(expand('$BASE/pw.vim'))
    execute 'source' expand('$BASE/pw.vim')
  endif
endif


" allow intelligent auto-indenting for each filetype, and for plugins that are filetype specific.
filetype indent plugin on
