export ZPLUG_HOME=~/.zplug
if [ ! -d "$ZPLUG_HOME" ];then
  # curl -fLo ~/.zplug/zplug --create-dirs git.io/zplug
  # git clone https://github.com/zplug/zplug $ZPLUG_HOME
  echo "install zplug"
  curl -sL zplug.sh/installer | zsh
fi

export NVM_LAZY_LOAD=true

source $ZPLUG_HOME/init.zsh

loadlib $HOME/.zsh.d/zplug_plugin.zsh

zplug load

zstyle ':notify:*' command-complete-timeout 10
loadlib $DOTFILES/.zsh.d/any_frame.zsh
