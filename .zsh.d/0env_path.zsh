### 環境変数

export_path /opt/local/bin:/opt/local/sbin
export_path /usr/local/bin
export_path /usr/local/git/bin
export_path /usr/local/bin:/usr/bin
export_path /usr/local/sbin
export_path /usr/texbin
export_path ~/.dotfiles/bin
export_path ~/bin

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

  export PATH=~/.local/bin:$PATH
  export CPATH=$CPATH:~/.local/include
  export LIBRARY_PATH=$LIBRARY_PATH:~/.local/lib

  ;;
  linux*)
  #Linux用の設定
  ;;
esac
