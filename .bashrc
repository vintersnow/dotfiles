export DOTFILES="${HOME}/.dotfiles"
ZSHHOME="${DOTFILES}/.zsh.d"

. $DOTFILES/etc/libs.sh

loadlib $ZSHHOME/alias.sh
loadlib $ZSHHOME/os.zsh

export PS1="[\u@\h] \W
# $ "
