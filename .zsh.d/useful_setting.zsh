case ${OSTYPE} in
  darwin*)
    # iTerm2のタブ名を変更する
    function title {
      echo -ne "\033]0;"$*"\007"
    }
    #辞書検索
    dict () { open dict:///"$@" ; }

    ;;
  linux*)
    #Linux用の設定
    ;;
esac

#cd and ls
function chpwd() {
  if [ 50 -gt `ls -1 | wc -l` ]; then
    ls
  fi
}
#lsのカラーをsolarizedに設定
if [ -f ~/.dotfiles/dircolors-solarized/dircolors.ansi-dark ]; then
  if type dircolors > /dev/null 2>&1; then
    eval $(dircolors ~/.dotfiles/dircolors-solarized/dircolors.ansi-dark)
  elif type gdircolors > /dev/null 2>&1; then
    eval $(gdircolors ~/.dotfiles/dircolors-solarized/dircolors.ansi-dark )
  fi
fi
if [ -n "$LS_COLORS" ]; then
  zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}
fi

#less color
export LESS='-gj10 --no-init --quit-if-one-screen --RAW-CONTROL-CHARS'
export LESSOPEN='| /usr/local/bin/src-hilite-lesspipe.sh %s'


# 解凍コマンド
function extract() {
  case $1 in
    *.tar.gz|*.tgz) tar xzvf $1;;
    *.tar.xz) tar Jxvf $1;;
    *.zip) unzip $1;;
    *.lzh) lha e $1;;
    *.tar.bz2|*.tbz) tar xjvf $1;;
    *.tar.Z) tar zxvf $1;;
    *.gz) gzip -d $1;;
    *.bz2) bzip2 -dc $1;;
    *.Z) uncompress $1;;
    *.tar) tar xvf $1;;
    *.arj) unarj $1;;
esac
}
alias -s {gz,tgz,zip,lzh,bz2,tbz,Z,tar,arj,xz}=extract

# less option
export LESS='-gj10 --no-init --quit-if-one-screen --RAW-CONTROL-CHARS -W -S'
