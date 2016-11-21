# エイリアス

# alias rm='rm -i'
alias cp='cp -i'
alias mv='mv -i'

alias mkdir='mkdir -p'

#locateコマンドのアップデート用
alias updatedb='sudo /usr/libexec/locate.updatedb'

# sudo の後のコマンドでエイリアスを有効にする
alias sudo='sudo '

alias so='source '
alias sz='source ~/.zshrc'

alias cd..='cd ..'
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias .....='cd ../../../..'
alias ......='cd ../../../../..'

alias du='du -sh'

alias v='nvim'
alias vim='nvim'

# git
alias g='git'

# fzf
alias fzf=fzf-tmux

alias labmem='ssh vega command ../hnakazawa/labmem/labmem.py'

alias zshtime='for i in $(seq 1 10); do time zsh -i -c exit; done'


#OS別alias
case ${OSTYPE} in
  darwin*)
  #Mac用の設定

  function o() {
    if [ $# -gt 0 ]; then
      open $@
    else
      open .
    fi
  }

  alias uc='ulimit -c '
  alias ucu='ulimit -c unlimited'

  alias ls='gls -F  --color=auto'
  alias la='gls -AF --color=auto'
  alias ll='gls -slhF --color=auto'
  alias lly='gls -slhF --color=auto --time-style=long-iso'

  alias rm='gmv -f --backup=numbered --target-directory ~/.Trash'

  #emacs deamon
  # alias E='/Applications/Emacs.app/Contents/MacOS/Emacs -nw'
  # alias emacs="TERM=xterm-256color /Applications/Emacs.app/Contents/MacOS/bin/emacsclient -nw"
  # alias ekill="emacsclient -e '(kill-emacs)'"

  #purge
  alias purge='sudo purge'

  #other
  alias fa='find . -name 'alias fa='find . -name '
  alias jsc='/System/Library/Frameworks/JavaScriptCore.framework/Versions/A/Resources/jsc'

  #wine
  alias wine='~/Applications/wine/bin/nihonshu '

  #brew
  # alias brew='env PATH=${PATH/\/user\/local\/var\/\.pyenv\/shims:/} brew'

  #alias gdb='/usr/local/Cellar/gdb/7.9/bin/gdb'

  # Go
  alias gob='go build'
  alias gobd='go build -gcflags "-N -l"'

  #ag
  alias ag='ag -S'
  alias agl='ag -S --pager="less -R"'

  #pandoc
  alias panmp='pandoc -V documentclass=ltjarticle --latex-engine=lualatex'

  # quick look
  alias ql='qlmanage -p "$@" >& /dev/null'

  #git_make
  alias gi='/Users/izuku/Projects/UTLecture/2015practice/big_software/git_make/bin/git'

  alias cvlc='/Applications/VLC.app/Contents/MacOS/VLC --intf=rc'

  alias ipn='ipython notebook'

  #autojump
  # alias j="autojump"
  # if [ -f `brew --prefix`/etc/autojump ]; then
  #   . `brew --prefix`/etc/autojump
  # fi
  # [[ -s $(brew --prefix)/etc/profile.d/autojump.sh ]] && . $(brew --prefix)/etc/profile.d/autojump.sh

  # gcc
  alias gc='/usr/local/bin/gcc-5'

  # wkhtml
  alias wkhtmltopdf='wkhtmltopdf --print-media-type --header-right "[date]" --header-spacing 2 --header-font-name Times --footer-center "[page]/[topage]" --footer-spacing 2 --footer-font-name Times --margin-top 12 --margin-right 5 --margin-left 5 --margin-bottom 12'

  # ctags
  alias ctags='/usr/local/bin/ctags'

  ;;
  linux*)
  #Linux用の設定
  alias ls='ls -Fh  --color=auto'
  alias la='ls -A --color=auto'
  alias ll='ls -slhF --color=auto'
  alias lly='ls -slhF --color=auto --time-style=long-iso'
  ;;
esac


function runc () {
  clang $1 && shift && ./a.out $@
}
function runcpp () {
  clang++ $1 && shift && ./a.out $@
}

#git
alias gref='git reflog'
alias glog='git log --oneline --decorate --color --graph'


function except_rm() {
  if [[ $# -eq 0 ]]; then
    return
  fi
  files=`\ls`
  for file in $*; do
    files=`echo $files | grep -v -E $file`
  done
  echo $files | xargs rm
}
alias erm='except_rm'

function md(){
  mkdir -p "$1" && cd "$1"
}
