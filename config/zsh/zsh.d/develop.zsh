#Added by the Heroku Toolbelt
export_path /usr/local/heroku/bin

[[ -s "/Users/vinter/.gvm/scripts/gvm" ]] && source "/Users/vinter/.gvm/scripts/gvm"

### rust
# export RUST_SRC_PATH=''
if [ -f ~/.cargo/env ]; then
  source ~/.cargo/env
fi

# haskell
export_path $HOME/.cabal/bin
export_path $HOME/Library/Haskell/bin

# egison
export_path $HOME/.egison/bin


# C/C++
if [ -d  $HOME/.local/include ]; then
  export CPATH=$CPATH:$HOME/.local/include
fi
if [ -d  $HOME/.local/lib ]; then
  export LIBRARY_PATH=$LIBRARY_PATH:$HOME/.local/lib
  export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:$HOME/.local/lib:/usr/lib
fi

# python
export PIPENV_VENV_IN_PROJECT=true 

# pyenv
# zplugin ice wait'[[ -n ${ZLAST_COMMANDS[(r)py*]} ]]'
zinit ice wait'0' lucid
zinit snippet "$ZSHHOME/pyenv.zsh"

export_path "$HOME/.poetry/bin"
