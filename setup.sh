#!/bin/zsh -u
DOTFILES="${HOME}/.dotfiles"
DIR=`pwd`
if [ -d $DOTFILES -a -r $DOTFILES -a -x $DOTFILES ]; then
  cd $DOTFILES
  for i in .?*; do
    if [ -r $i ]; then
      case $i in
        ..)
          continue;;
        .git)
          continue;;
        .gitignore)
          continue;;
        *)
          ln -sfn "$DOTFILES/$i" "$HOME/$i";;
      esac
    fi
  done
  cd $DIR
fi
