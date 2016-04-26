## 重複パスを登録しない
typeset -U path PATH cdpath fpath manpath

### 環境変数
export PATH=/opt/local/bin:/opt/local/sbin:$PATH
export PATH=/usr/local/bin:$PATH
export PATH=/usr/local/git/bin:$PATH
export PATH=/usr/local/bin:/usr/bin:$PATH
export PATH=/usr/local/sbin:$PATH
export PATH=/usr/texbin:$PATH
export PATH=~/.dotfiles/bin:$PATH
export PATH=~/.local/bin:$PATH

# change brew cask install place
export HOMEBREW_CASK_OPTS='--appdir=/Applications'


# neovim
export XDG_CONFIG_HOME=$HOME/.config

export LANG=ja_JP.UTF-8
export LC_ALL=ja_JP.UTF-8

case ${OSTYPE} in
  darwin*)
  #Mac用の設定
  fpath=($(brew --prefix)/share/zsh/site-functions $fpath)
  #Sheet EDITOR
  export EDITOR=/usr/local/bin/nvim
  export PATH=/opt/X11/include:$PATH
  export PATH=/usr/local/bin:$PATH

  ;;
  linux*)
  #Linux用の設定
  ;;
esac
