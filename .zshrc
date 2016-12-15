
export DOTFILES="${HOME}/.dotfiles"
export ZSHHOME="${DOTFILES}/.zsh.d"
# if [ -d $ZSHHOME -a -r $ZSHHOME -a -x $ZSHHOME ]; then
#   for i in $ZSHHOME/*; do
#     [[ ${i##*/} = *.zsh ]] &&
#       [ \( -f $i -o -h $i \) -a -r $i ] && . $i
#   done
# fi
#
. $DOTFILES/etc/libs.zsh

# loadfiles
loadlib $ZSHHOME/0env_path.zsh
loadlib $ZSHHOME/1develop.zsh
loadlib $ZSHHOME/2normal_option.zsh
loadlib $ZSHHOME/alias.zsh
loadlib $ZSHHOME/os.zsh

if has 'peco'; then
  loadlib $ZSHHOME/peco.zsh
fi

loadlib $ZSHHOME/tmux.zsh
loadlib $ZSHHOME/useful_setting.zsh
loadlib $ZSHHOME/zplug_manager.zsh

# loadlib $ZSHHOME/zim_setting.zsh
# loadlib $ZSHHOME/zgen_setting.zsh

#setting for zprof
if (which zprof > /dev/null 2>&1) ;then
  zprof
fi
