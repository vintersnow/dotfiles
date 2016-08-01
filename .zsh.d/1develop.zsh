# anyenv
export ANYENV_ROOT="$(ghq root)/github.com/riywo/anyenv"
if [ -d $ANYENV_ROOT ]; then
  export PATH="$ANYENV_ROOT/bin:$PATH"

  # eval "$(env PATH="$ANYENV_ROOT/libexec:$PATH" $ANYENV_ROOT/libexec/anyenv-init - --no-rehash)"
  # eval "$(anyenv init - --no-rehash)"
  for D in `ls $ANYENV_ROOT/envs`
  do
    export PATH="$ANYENV_ROOT/envs/$D/shims:$PATH"
  done
fi
alias envup='eval "$(anyenv init - --no-rehash)"'


#Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"

# setting for GO
export GOPATH=$HOME/gopath
# export GOROOT=/usr/local/opt/go/libexec もう必要ないらしい
export PATH=$GOPATH/bin:$GOROOT/bin:$PATH
# Go completion
if [ -f $GOROOT/misc/zsh/go ]; then
  #  source $GOROOT/misc/zsh/go
  # error ocured
fi

# export PYTHON=python2
# export PYTHON=/Users/izuku/.pyenv/shims:$PATH
# export PYTHON=/usr/bin/python2.7:$PATH

# brew file setting
# something wrong. stop here
# if [ -f $(brew --prefix)/etc/brew-wrap ];then
#   source $(brew --prefix)/etc/brew-wrap
# fi


### Added by the Bluemix CLI
# source /usr/local/Bluemix/bx/zsh_autocomplete


### golang
export GOROOT=/usr/local/opt/go/libexec
export GOPATH=$HOME/go
export PATH=$PATH:$GOROOT/bin:$GOPATH/bin


### pads
# export PADS_HOME=~/Projects/UTLecture/2016tau/pads/pads
# source $PADS_HOME/scripts/Q_DO_SETENV.sh

### rust
export RUST_SRC_PATH=~/.rust/rustc-1.9.0/src
if [ -f ~/.cargo/env ]; then
  source ~/.cargo/env
fi

