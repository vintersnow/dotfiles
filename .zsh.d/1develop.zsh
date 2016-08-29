#Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"

### golang
# export GOROOT="/usr/local/opt/go/libexec"
export GOPATH="$HOME/go"
export PATH="$GOROOT/bin:$GOPATH/bin:$PATH"
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
export ANYENV_ROOT="$(ghq root)/github.com/riywo/anyenv"
if [ -d $ANYENV_ROOT ]; then
  export PATH="$ANYENV_ROOT/bin:$PATH"
  for D in `command ls $ANYENV_ROOT/envs`
  do
    export PATH="$ANYENV_ROOT/envs/$D/shims:$PATH"
  done
fi

function anyenv_init() {
  eval "$(anyenv init -)"
}
function anyenv_unset() {
  unset -f ndenv
  unset -f rbenv
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

