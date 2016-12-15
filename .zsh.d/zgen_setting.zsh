# install zgen

# load zgen
source "${HOME}/.zgen/zgen.zsh"

# if the init scipt doesn't exist
if ! zgen saved; then

  # specify plugins here
  # zgen load "zsh-users/zsh-completions"
  # zgen load "mafredri/zsh-async"
  # zgen load "sindresorhus/pure"
  # zgen load "zsh-users/zsh-syntax-highlighting"
  # zgen "b4b4r07/enhancd", use:init.sh

  # generate the init script from plugins above
  zgen save
fi
