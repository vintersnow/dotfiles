## 重複パスを登録しない
typeset -U path PATH cdpath fpath manpath

### 環境変数
export LANG=ja_JP.UTF-8
export PATH=/opt/local/bin:/opt/local/sbin:$PATH
export PATH=/usr/local/bin:$PATH
PATH=${HOME}/.cabal/bin:$PATH
export PATH=/usr/local/git/bin:$PATH
export PATH=/usr/local/bin:/usr/bin:$PATH
export PATH=/usr/local/sbin:$PATH
export PATH=/usr/texbin:$PATH
export PATH=~/.dotfiles/shellscripts:$PATH

case ${OSTYPE} in
  darwin*)
  #Mac用の設定
  export PATH=$PATH:~/Projects/android/android_lec/adt-bundle-mac-/sdk/platform-tools:$PATH
  fpath=(/usr/local/share/zsh-completions $fpath)
  #Sheet EDITOR
  export EDITOR=/usr/local/bin/vim
  export PATH=/opt/X11/include:$PATH
  export PATH=/usr/local/bin:$PATH

  ;;
  linux*)
  #Linux用の設定
  ;;
esac
