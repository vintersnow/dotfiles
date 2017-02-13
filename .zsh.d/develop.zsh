#Added by the Heroku Toolbelt
export_path /usr/local/heroku/bin

### golang
export GOPATH="$HOME/go"
export PATH="$GOPATH/bin:$PATH"
if [ ! -d $GOPATH ];then
  mkdir $GOPATH
fi


### pads
# export PADS_HOME=~/Projects/UTLecture/2016tau/pads/pads
# source $PADS_HOME/scripts/Q_DO_SETENV.sh

### rust
export RUST_SRC_PATH=~/.rust/rustc-1.9.0/src
if [ -f ~/.cargo/env ]; then
  source ~/.cargo/env
fi

# anyenv
export ANYENV_ROOT="$HOME/.ghq/github.com/riywo/anyenv"
if [ -d $ANYENV_ROOT ]; then
  # export PATH="$ANYENV_ROOT/bin:$PATH"
  for D in `command ls $ANYENV_ROOT/envs`
  do
    export PATH="$ANYENV_ROOT/envs/$D/shims:$PATH"
  done
fi

# lazy load anyenv
# Due to this, when you install global command (ex. npm i --global) you need to 
# eval "$(anyenv init -)" to validaty
function anyenv_init() {
  eval "$(anyenv init -)"
}
function anyenv_unset() {
  unset -f ndenv
  unset -f rbenv
  unset -f pyenv
  unset -f anyenv
}
function ndenv() {
  anyenv_unset
  anyenv_init
  ndenv "$@"
}
function rbenv() {
  anyenv_unset
  anyenv_init
  rbenv "$@"
}
function pyenv() {
  anyenv_unset
  anyenv_init
  pyenv "$@"
}
function anyenv() {
  anyenv_unset
  anyenv_init
  anyenv "$@"
}
