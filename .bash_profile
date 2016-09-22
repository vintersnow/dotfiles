export DOTFILES="${HOME}/.dotfiles"
ZSHHOME="${DOTFILES}/.zsh.d"

. $DOTFILES/etc/libs.sh

loadlib .bashrc
loadlib $ZSHHOME/0env_path.zsh
loadlib $ZSHHOME/1develop.zsh
