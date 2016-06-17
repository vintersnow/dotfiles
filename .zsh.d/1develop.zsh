# anyenv
export ANYENV_ROOT="$(ghq root)/github.com/riywo/anyenv"
if [ -d $ANYENV_ROOT ]; then
  export PATH="$ANYENV_ROOT/bin:$PATH"
  eval "$(anyenv init -)"
  for D in `ls $ANYENV_ROOT/envs`
  do
    export PATH="$ANYENV_ROOT/envs/$D/shims:$PATH"
  done
fi


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
export PYTHON=/Users/izuku/.pyenv/shims:$PATH
export PYTHON=/usr/bin/python2.7:$PATH

# brew file setting
# something wrong. stop here
if [ -f $(brew --prefix)/etc/brew-wrap ];then
  # source $(brew --prefix)/etc/brew-wrap
fi


### Added by the Bluemix CLI
source /usr/local/Bluemix/bx/zsh_autocomplete


### golang
export GOROOT=/usr/local/opt/go/libexec
export GOPATH=$HOME/go
export PATH=$PATH:$GOROOT/bin:$GOPATH/bin

