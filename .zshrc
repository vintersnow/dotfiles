
export DOTFILES="${HOME}/.dotfiles"
export ZSHHOME="${HOME}/.zsh.d"

. $DOTFILES/etc/libs.zsh

# loadfiles
loadlib $ZSHHOME/env_path.zsh
loadlib $ZSHHOME/develop.zsh
loadlib $ZSHHOME/normal_option.zsh
loadlib $ZSHHOME/alias.zsh
loadlib $ZSHHOME/os.zsh
loadlib $ZSHHOME/dasht.zsh

# if has 'peco'; then
#   loadlib $ZSHHOME/peco.zsh
# fi

loadlib $ZSHHOME/tmux.zsh

export NVM_LAZY_LOAD=true
loadlib $ZSHHOME/zplug_manager.zsh;
zplug load

# loadlib $ZSHHOME/manual_load_plugin.zsh

loadlib $ZSHHOME/pw.zsh

# loadlib $ZSHHOME/zim_setting.zsh
# loadlib $ZSHHOME/zgen_setting.zsh

loadlib $ZSHHOME/useful_setting.zsh

#setting for zprof
if (which zprof > /dev/null 2>&1) ;then
  zprof
fi
