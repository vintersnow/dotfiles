#include .zsh file from .zsh.d (http://d.hatena.ne.jp/dgdg/20071127/1196179056)
DOTFILE="${HOME}/.dotfiles"
ZSHHOME="${DOTFILE}/.zsh.d"
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

# plugin manager
# [ -f ${DOTFILE}/antigen/antigen.zsh ] && source $ZSHHOME/zshrc.antigen ]


PATH="/Users/izuku/perl5/bin${PATH+:}${PATH}"; export PATH;
PERL5LIB="/Users/izuku/perl5/lib/perl5${PERL5LIB+:}${PERL5LIB}"; export PERL5LIB;
PERL_LOCAL_LIB_ROOT="/Users/izuku/perl5${PERL_LOCAL_LIB_ROOT+:}${PERL_LOCAL_LIB_ROOT}"; export PERL_LOCAL_LIB_ROOT;
PERL_MB_OPT="--install_base \"/Users/izuku/perl5\""; export PERL_MB_OPT;
PERL_MM_OPT="INSTALL_BASE=/Users/izuku/perl5"; export PERL_MM_OPT;

#setting for zprof
if (which zprof > /dev/null 2>&1) ;then
  zprof | less
fi
