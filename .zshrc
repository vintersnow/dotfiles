#include .zsh file from .zsh.d (http://d.hatena.ne.jp/dgdg/20071127/1196179056)
DOTFILE="${HOME}/.dotfiles"
ZSHHOME="${DOTFILE}/.zsh.d"
if [ -d $ZSHHOME -a -r $ZSHHOME -a -x $ZSHHOME ]; then
  for i in $ZSHHOME/*; do
    [[ ${i##*/} = *.zsh ]] &&
      [ \( -f $i -o -h $i \) -a -r $i ] && . $i
  done
fi

[ -f ${DOTFILE}/antigen/antigen.zsh ] && source $ZSHHOME/zshrc.antigen ]

if [[ -r /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh ]]; then
  # source /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
fi

if [ -z "$TMUX" -a -z "$STY" ]; then
  if type tmux >/dev/null 2>&1; then
    if tmux has-session && tmux list-sessions | /usr/bin/grep -qE '.*]$'; then
      tmux attach && echo "tmux attached session "
    else
      tmux new-session && echo "tmux created new session"
    fi
  fi
fi

#setting for zprof
if (which zprof > /dev/null) ;then
  zprof | less
fi
