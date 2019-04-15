#Added by the Heroku Toolbelt
export_path /usr/local/heroku/bin

[[ -s "/Users/vinter/.gvm/scripts/gvm" ]] && source "/Users/vinter/.gvm/scripts/gvm"

### rust
export RUST_SRC_PATH=~/Projects/stuff/Rust/rust/src/
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

# python
export PIPENV_VENV_IN_PROJECT=true 

# pyenv
# zplugin ice wait'[[ -n ${ZLAST_COMMANDS[(r)py*]} ]]'
zplugin ice wait'1' lucid
zplugin snippet "$ZSHHOME/pyenv.zsh"
