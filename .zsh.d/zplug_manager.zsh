export ZPLUG_HOME=~/.zplug
if [ ! -d "$ZPLUG_HOME" ];then
  echo "install zplug"
  # curl -sL zplug.sh/installer | zsh
  curl -sL --proto-redir -all,https https://raw.githubusercontent.com/zplug/installer/master/installer.zsh | zsh
fi

export NVM_LAZY_LOAD=true

source $ZPLUG_HOME/init.zsh

loadlib $HOME/.zsh.d/zplug_plugin.zsh
zplug load

zstyle ':notify:*' command-complete-timeout 10
loadlib $DOTFILES/.zsh.d/any_frame.zsh
