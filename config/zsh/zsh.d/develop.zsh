#Added by the Heroku Toolbelt
export_path /usr/local/heroku/bin

[[ -s "/Users/vinter/.gvm/scripts/gvm" ]] && source "/Users/vinter/.gvm/scripts/gvm"

### rust
export RUST_SRC_PATH=''
if [ -f ~/.cargo/env ]; then
  source ~/.cargo/env
fi

# gem
export_path /home/vinter/.gem/ruby/2.4.0/bin

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
zplugin ice wait'1' lucid
zplugin snippet "$ZSHHOME/pyenv.zsh"
