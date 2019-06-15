export DOTFILES="$HOME/.dotfiles"
export ZSHHOME="$ZDOTDIR/zsh.d"

. $DOTFILES/etc/libs.zsh

# version check
if versioncompare $ZSH_VERSION "5.3.0"; then
  ### Load Zplugin
  source "$HOME/.zplugin/bin/zplugin.zsh"
  autoload -Uz _zplugin
  (( ${+_comps} )) && _comps[zplugin]=_zplugin
  ###
  
  zplugin snippet "$ZSHHOME/env_path.zsh"
  zplugin snippet "$ZSHHOME/develop.zsh"
  zplugin snippet "$ZSHHOME/normal_option.zsh"
  zplugin snippet "$ZSHHOME/alias.sh"
  zplugin snippet "$ZSHHOME/alias.zsh"
  zplugin snippet "$ZSHHOME/os.zsh"
  zplugin snippet "$ZSHHOME/tmux.zsh"  # load after alias.sh
  zplugin snippet "$ZSHHOME/color.zsh"
  zplugin snippet "$ZSHHOME/useful_setting.zsh"

  if [ -f "$ZSHHOME/pw.zsh" ]; then
    zplugin snippet "$ZSHHOME/pw.zsh"
  fi

  # load local setting
  if [ -f "$HOME/.zsh.local" ]; then
    zplugin snippet "$HOME/.zsh.local"
  fi
  
  # zplugin snippet "$ZSHHOME/tmux.zsh"
  source "$ZSHHOME/plugins.zsh"

else
  echo "this zsh version is not supported"
fi

#setting for zprof
if (which zprof > /dev/null 2>&1) ;then
  zprof
fi
