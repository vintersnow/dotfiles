#include .zsh file from .zsh.d (http://d.hatena.ne.jp/dgdg/20071127/1196179056)
export DOTFILES="${HOME}/.dotfiles"
ZSHHOME="${DOTFILES}/.zsh.d"
if [ -d $ZSHHOME -a -r $ZSHHOME -a -x $ZSHHOME ]; then
  for i in $ZSHHOME/*; do
    [[ ${i##*/} = *.zsh ]] &&
      [ \( -f $i -o -h $i \) -a -r $i ] && . $i
  done
fi

if [ -z "$TMUX" -a -z "$STY" ]; then
  if [ $(echo ${OSTYPE} | grep -e 'darwin') ]; then
    if ! type reattach-to-user-namespace >/dev/null 2>&1; then
      # check for dependency
      echo "install reattach-to-user-namespacse"
    elif type tmux >/dev/null 2>&1; then
      if tmux has-session && tmux list-sessions | /usr/bin/grep -qE '.*]$'; then
        tmux attach && echo "tmux attached session "
      else
        tmux new-session && echo "tmux created new session"
      fi
    fi
  fi
fi

#setting for zprof
if (which zprof > /dev/null 2>&1) ;then
  zprof | less
fi

### Added by the Bluemix CLI
source /usr/local/Bluemix/bx/zsh_autocomplete
