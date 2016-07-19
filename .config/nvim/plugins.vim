"dein Scripts-----------------------------

let s:dein_dir = expand('~/.cache/dein')
let s:dein_repo_dir = s:dein_dir . '/repos/github.com/Shougo/dein.vim'

if !isdirectory(s:dein_repo_dir)
  execute '!git clone https://github.com/Shougo/dein.vim' s:dein_repo_dir
endif
" Required:
execute 'set runtimepath^=' . fnamemodify(s:dein_repo_dir,':p')

let s:toml = './config/dein.toml'
let s:toml_lazy= './config/dein_lazy.toml'

if dein#load_state(s:dein_dir)
  call dein#begin(s:dein_dir,[expand('<sfile>'),s:toml,s:toml_lazy])
  call dein#load_toml(s:toml,{'lazy':0})
  call dein#load_toml(s:toml_lazy,{'lazy':1})

  call dein#end()
  call dein#save_state()
endif

if dein#check_install()
  call dein#install()
endif

