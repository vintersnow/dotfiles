#export PATH="$(brew --prefix homebrew/php/php55)/bin:$PATH"
export PATH="$HOME/.rbenv/bin:$PATH"

#rbenv
if which rbenv > /dev/null; then
  # eval "$(rbenv init -)";
  eval "$(rbenv init - --no-rehash)"
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

# pyenv
export PYENV_ROOT="${HOME}/.pyenv"
if [ -d "${PYENV_ROOT}" ]; then
  export PATH=${PYENV_ROOT}/bin:$PATH
  eval "$(pyenv init -)"
fi
export PYTHON=python2

# nvmの遅延読み込み
nvm() {
  # まず仮の nvm コマンドを unset
  unset -f nvm

  # nvm.sh をロード
  # ここで本物の nvm コマンドが定義される
  source "${NVM_DIR:-$HOME/.nvm}/nvm.sh"

  # 仮の nvm コマンドに渡された引数を本物に受け渡す
  nvm "$@"
}
