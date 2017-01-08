
export DOTFILES="${HOME}/.dotfiles"
export ZSHHOME="${DOTFILES}/.zsh.d"

. $DOTFILES/etc/libs.zsh

# loadfiles
loadlib $ZSHHOME/0env_path.zsh
loadlib $ZSHHOME/1develop.zsh
loadlib $ZSHHOME/2normal_option.zsh
loadlib $ZSHHOME/alias.zsh
loadlib $ZSHHOME/os.zsh
loadlib $ZSHHOME/dasht.zsh

# if has 'peco'; then
#   loadlib $ZSHHOME/peco.zsh
# fi

loadlib $ZSHHOME/tmux.zsh
loadlib $ZSHHOME/useful_setting.zsh

loadlib $ZSHHOME/zplug_manager.zsh;
# zplug load

loadlib $ZSHHOME/manual_load_plugin.zsh

# loadlib $ZSHHOME/zim_setting.zsh
# loadlib $ZSHHOME/zgen_setting.zsh

#setting for zprof
if (which zprof > /dev/null 2>&1) ;then
  zprof
fi
