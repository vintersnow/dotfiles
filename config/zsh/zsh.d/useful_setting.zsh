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

# git checkout completion style
# http://stackoverflow.com/questions/12175277/disable-auto-completion-of-remote-branches-in-zsh
# not working?
zstyle :completion::complete:git-checkout:argument-rest:headrefs command "git for-each-ref --format='%(refname)' refs/heads 2>/dev/null"
# zstyle :completion::complete:git-checkout:argument-rest:headrefs command "git for-each-ref --format='%(refname)' refs/heads 2>/dev/null"
