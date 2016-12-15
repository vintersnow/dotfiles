export ZPLUG_HOME=~/.zplug
if [ ! -d "$ZPLUG_HOME" ];then
  # curl -fLo ~/.zplug/zplug --create-dirs git.io/zplug
  # git clone https://github.com/zplug/zplug $ZPLUG_HOME
  echo "install zplug"
  curl -sL zplug.sh/installer | zsh
fi

zplug () {
  unset -f zplug 

  source $ZPLUG_HOME/init.zsh

  zplug "zsh-users/zsh-completions"
  zplug "sindresorhus/pure"
  zplug "b4b4r07/enhancd", use:"init.sh"

  zplug "zsh-users/zsh-syntax-highlighting", nice:10


  # Install plugins if there are plugins that have not been installed
  if ! zplug check --verbose; then
    printf "Install? [y/N]: "
    if read -q; then
      echo; zplug install
    fi
  fi

  zplug "$@"
}

# zplug load
