## 重複パスを登録しない
typeset -U path PATH cdpath fpath manpath

### 環境変数
export PATH=/opt/local/bin:/opt/local/sbin:$PATH
export PATH=/usr/local/bin:$PATH
PATH=${HOME}/.cabal/bin:$PATH
export PATH=/usr/local/git/bin:$PATH
export PATH=/usr/local/bin:/usr/bin:$PATH
export PATH=/usr/local/sbin:$PATH
export PATH=/usr/texbin:$PATH
export PATH=~/.dotfiles/shellscripts:$PATH
export PATH=/Users/izuku/.local/bin:$PATH

export LANG=ja_JP.UTF-8
export LC_ALL=ja_JP.UTF-8

case ${OSTYPE} in
  darwin*)
  #Mac用の設定
  export PATH=$PATH:/Users/izuku/Library/Android/sdk/platform-tools
  fpath=(/usr/local/share/zsh-completions $fpath)
  fpath=($(brew --prefix)/share/zsh/site-functions $fpath)
  #Sheet EDITOR
  export EDITOR=/usr/local/bin/vim
  export PATH=/opt/X11/include:$PATH
  export PATH=/usr/local/bin:$PATH

  #for chromium
  export PATH=/Users/izuku/Projects/UTLecture/2015practice/big_software/chromium/depot_tools:$PATH

  #PYTHON

  ;;
  linux*)
  #Linux用の設定
  ;;
esac
