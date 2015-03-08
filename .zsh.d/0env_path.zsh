## 重複パスを登録しない
typeset -U path PATH cdpath fpath manpath

### 環境変数
export LANG=ja_JP.UTF-8
export PATH=/opt/local/bin:/opt/local/sbin:$PATH
export PATH=/usr/local/bin:$PATH
export PATH=/opt/local/var/macports/sources/rsync.macports.org/release/tarballs/ports/net:$PATH
export PATH=$PATH:~/Projects/android/android_lec/adt-bundle-mac-/sdk/platform-tools:$PATH
fpath=(/usr/local/share/zsh-completions $fpath)
PATH=${HOME}/.cabal/bin:$PATH
export PATH=/usr/local/git/bin:$PATH
export PATH=/usr/local/bin:/usr/bin:$PATH
export PATH=/usr/local/sbin:$PATH
export PATH=/usr/texbin:$PATH

#Sheet editor
export EDITOR=/usr/local/bin/vim