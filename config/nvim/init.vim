let $BASE = '~/.config/nvim'

" Set my augroup.
execute 'source' expand('$BASE/myautocmd.vim')

if has('mac')
  "let g:python_host_prog = '/usr/local/bin/python2'
  "let g:python3_host_prog = expand('~/.ghq/github.com/riywo/anyenv/envs/pyenv/shims/python3')
  "let g:python3_host_prog = '~/.pyenv/shims/python3'
  if exists("$VIRTUAL_ENV")
    if !empty(glob("$VIRTUAL_ENV/bin/python3"))
      let g:python3_host_prog = substitute(system("which python"), '\n', '', 'g')
    else
      let g:python_host_prog = substitute(system("which python"), '\n', '', 'g')
    endif
  endif
else
  let g:python_host_prog = '/usr/bin/python2'
  " TODO: dynamic versioning
  " slow: echo -n "$(pyenv root)/versions/$(pyenv global)/bin/python"
  let g:python3_host_prog = '/home/vinter/.pyenv/shims/python'
endif

if has('vim_starting')
  set runtimepath+=~/.local/share/nvim/site
  set packpath+=~/.local/share/nvim/site
  " settings
  " if isdirectory(expand('~/.config/nvim'))
  "   set runtimepath+=~/.config/nvim/
  "   " runtime! vimrc.d/*.vim
  " endif

  " plugins
  " execute 'source' expand('$BASE/vimplug.vim')
  execute 'source' expand('$BASE/jetpack.vim')

  " colorscheme
  set background=dark
  try
    " TODO: failed to load material colorscheme
    " colorscheme hybrid
    " colorscheme material
    " let g:material_style = 'deep ocean'
  catch /^Vim\%((\a\+)\)\=:E185/
    echo 'No hybrid colorscheme'
  endtry

  execute 'source' expand('$BASE/vimrc.d/basic.vim')
  execute 'source' expand('$BASE/vimrc.d/keymap.vim')
  execute 'source' expand('$BASE/vimrc.d/lang_setting.vim')
  execute 'source' expand('$BASE/vimrc.d/clip.vim')

  " secret
  if filereadable(expand('$BASE/pw.vim'))
    execute 'source' expand('$BASE/pw.vim')
  endif
endif

" allow intelligent auto-indenting for each filetype, and for plugins that are filetype specific.
filetype indent plugin on
