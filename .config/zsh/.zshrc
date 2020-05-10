export DOTFILES="$HOME/.dotfiles"
export ZSHHOME="$ZDOTDIR/zsh.d"

. $DOTFILES/etc/libs.zsh

# version check
if versioncompare $ZSH_VERSION "5.3.0"; then
  ### Load Zplugin
  source "$HOME/.zinit/bin/zinit.zsh"
  autoload -Uz _zinit
  (( ${+_comps} )) && _comps[zinit]=_zinit
  ###
  
  zinit snippet "$ZSHHOME/env_path.zsh"
  zinit snippet "$ZSHHOME/develop.zsh"
  zinit snippet "$ZSHHOME/normal_option.zsh"
  zinit snippet "$ZSHHOME/alias.sh"
  zinit snippet "$ZSHHOME/alias.zsh"
  zinit snippet "$ZSHHOME/os.zsh"
  zinit snippet "$ZSHHOME/tmux.zsh"  # load after alias.sh
  zinit snippet "$ZSHHOME/color.zsh"
  zinit snippet "$ZSHHOME/useful_setting.zsh"

  if [ -f "$ZSHHOME/pw.zsh" ]; then
    zinit snippet "$ZSHHOME/pw.zsh"
  fi

  # load local setting
  if [ -f "$HOME/.zsh.local" ]; then
    zinit snippet "$HOME/.zsh.local"
  fi
  
  # zinit snippet "$ZSHHOME/tmux.zsh"
  source "$ZSHHOME/plugins.zsh"

else
  echo "this zsh version is not supported"
fi

#setting for zprof
if (which zprof > /dev/null 2>&1) ;then
  zprof
fi
