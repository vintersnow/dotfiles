export ZPLUG_HOME=~/.zplug
if [ ! -d "$ZPLUG_HOME" ];then
  # curl -fLo ~/.zplug/zplug --create-dirs git.io/zplug
  # git clone https://github.com/zplug/zplug $ZPLUG_HOME
  curl -sL zplug.sh/installer | zsh
fi

source $ZPLUG_HOME/init.zsh

zplug "zsh-users/zsh-completions"
# zplug "b4b4r07/easy-oneliner", if:"which fzf"
zplug "mafredri/zsh-async"
zplug "sindresorhus/pure"

zplug "zsh-users/zsh-syntax-highlighting", nice:10


# Install plugins if there are plugins that have not been installed
# if ! zplug check --verbose; then
#   printf "Install? [y/N]: "
#   if read -q; then
#     echo; zplug install
#   fi
# fi

# Then, source plugins and add commands to $PATH
zplug load
