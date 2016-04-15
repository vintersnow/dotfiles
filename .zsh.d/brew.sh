env PATH=${PATH/\/Users\/${USER}\/\.pyenv\/shims:?/} brew

if [ -f $(brew --prefix)/etc/brew-wrap ];then
  source $(brew --prefix)/etc/brew-wrap
fi
