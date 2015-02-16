#export PATH="$(brew --prefix homebrew/php/php55)/bin:$PATH"
export PATH="$HOME/.rbenv/bin:$PATH"

#rbenv
if which rbenv > /dev/null; then
  eval "$(rbenv init -)";
fi

#Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"

# setting for GO
export GOPATH=$HOME/go
# export GOROOT=/usr/local/opt/go/libexec もう必要ないらしい
export PATH=$GOPATH/bin:$GOROOT/bin:$PATH
# Go completion
if [ -f $GOROOT/misc/zsh/go ]; then
  #  source $GOROOT/misc/zsh/go
  # error ocured
fi

# pyenv
export PYENV_ROOT="${HOME}/.pyenv"
if [ -d "${PYENV_ROOT}" ]; then
  export PATH=${PYENV_ROOT}/bin:$PATH
  eval "$(pyenv init -)"
fi