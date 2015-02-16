#!/bin/zsh -u
DOTFILES="${HOME}/.dotfiles"
if [ -d $DOTFILES -a -r $DOTFILES -a -x $DOTFILES ]; then
  for i in $DOTFILES/.?*; do
    [ \( -f $i -o -h $i \) -a -r $i ] && . $i
    if [[ -f $i -a -r $i ]]; then
      case $i in
        ..)
          continue;;
        .git)
          continue;;
        *)
          ln -is "$DOTFILES/$i" $HOME;;
      esac
    fi
  done
fi
