export DOTFILES="${HOME}/.dotfiles"
ZSHHOME="${HOME}/.zsh.d"

. $DOTFILES/etc/libs.sh

loadlib $ZSHHOME/env_path.zsh
loadlib $ZSHHOME/alias.sh
loadlib $ZSHHOME/os.zsh

export PS1="[\u@\h] \W
# $ "
