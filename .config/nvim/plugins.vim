"dein Scripts-----------------------------

let s:dein_dir = expand('~/.cache/dein')
let s:dein_repo_dir = s:dein_dir . '/repos/github.com/Shougo/dein.vim'

if !isdirectory(s:dein_repo_dir)
  execute '!git clone https://github.com/Shougo/dein.vim' s:dein_repo_dir
endif
" Required:
execute 'set runtimepath^=' . fnamemodify(s:dein_repo_dir,':p')

let s:toml = '~/.config/nvim/dein.toml'
let s:toml_lazy= '~/.config/nvim/dein_lazy.toml'
let s:toml_neo= '~/.config/nvim/deineo.toml'

if dein#load_state(s:dein_dir)
  call dein#begin(s:dein_dir, [expand('<sfile>'), s:toml, s:toml_lazy, s:toml_neo])
  call dein#load_toml(s:toml,{'lazy':0})
  call dein#load_toml(s:toml_lazy,{'lazy':1})
  if has('nvim')
    call dein#load_toml(s:toml_neo, {})
  endif

  call dein#end()
  call dein#save_state()
endif

if dein#check_install()
  call dein#install()
endif
