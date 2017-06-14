### 環境変数

export_path /opt/local/bin
export_path /opt/local/sbin
export_path /usr/local/bin
export_path /usr/local/git/bin
export_path /usr/local/bin:/usr/bin
export_path /usr/local/sbin
export_path /usr/texbin
export_path $HOME/.dotfiles/bin
export_path $HOME/bin
export_path $HOME/go/bin
export_path $HOME/bin

# haskell
export_path $HOME/.cabal/bin
export_path $HOME/Library/Haskell/bin
# egison
export_path $HOME/.egison/bin

# change brew cask install place
export HOMEBREW_CASK_OPTS='--appdir=/Applications'

# neovim
export XDG_CONFIG_HOME=$HOME/.config

export LANGUAGE=ja_JP.UTF-8
export LANG=ja_JP.UTF-8
export LC_ALL=ja_JP.UTF-8

#Sheet EDITOR
if has 'nvim'; then
  export EDITOR=nvim
  export VISUAL=nvim
else
  export EDITOR=vim
  export VISUAL=vim
fi


case ${OSTYPE} in
  darwin*)
  #Mac用の設定

  export PATH=/opt/X11/include:$PATH
  export PATH=/usr/local/bin:$PATH

  export PATH=~/.local/bin:$PATH
  export CPATH=$CPATH:$HOME/.local/include
  export LIBRARY_PATH=$LIBRARY_PATH:~/.local/lib

  ;;
  linux*)
  if has vivaldi-stable;then
    export BROWSER=vivaldi-stable
  fi
  ;;
esac
