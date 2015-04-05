case ${OSTYPE} in
  darwin*)
    #Mac用の設定
    # 一定時間以上かかる処理の場合は終了時に通知してくれる
    local COMMAND=""
    local COMMAND_TIME=""
    precmd() {
      if [ "$COMMAND_TIME" -ne "0" ] ; then
        local d=`date +%s`
        d=`expr $d - $COMMAND_TIME`
        if [ "$d" -ge "5" ] ; then
          COMMAND="$COMMAND "
          which terminal-notifier > /dev/null 2>&1 && terminal-notifier -message "${${(s: :)COMMAND}[1]}" -m "$COMMAND";
        fi
      fi
      COMMAND="0"
      COMMAND_TIME="0"
    }
    preexec () {
      COMMAND="${1}"
      if [ "`perl -e 'print($ARGV[0]=~/ssh|^vi/)' $COMMAND`" -ne 1 ] ; then
        COMMAND_TIME=`date +%s`
      fi
    }

    #lsのカラーをsolarizedに設定
    if [ -f ~/.dircolors ]; then
      if type dircolors > /dev/null 2>&1; then
        eval $(dircolors ~/.dircolors)
        elif type gdircolors > /dev/null 2>&1; then
        eval $(gdircolors ~/.dircolors)
      fi
    fi
    if [ -n "$LS_COLORS" ]; then
      zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}
    fi

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
