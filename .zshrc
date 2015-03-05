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
if (which zprof > /dev/null) ;then
          zprof | less
  fi
