#include .zsh file from .zsh.d (http://d.hatena.ne.jp/dgdg/20071127/1196179056)
export DOTFILES="${HOME}/.dotfiles"
ZSHHOME="${DOTFILES}/.zsh.d"
if [ -d $ZSHHOME -a -r $ZSHHOME -a -x $ZSHHOME ]; then
  for i in $ZSHHOME/*; do
    [[ ${i##*/} = *.zsh ]] &&
      [ \( -f $i -o -h $i \) -a -r $i ] && . $i
  done
fi

#setting for zprof
if (which zprof > /dev/null 2>&1) ;then
  zprof
fi
