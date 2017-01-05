#######################################
# manually loading

### enhancd
loadlib $ZPLUG_HOME/repos/b4b4r07/enhancd/init.sh

### pure prompt
fpath=( "$HOME/.zfunctions" "$HOME/.zplug/repos/mollifier/anyframe(N-)/" $fpath )
autoload -U promptinit; promptinit
prompt pure

### zsh-completions
loadlib $ZPLUG_HOME/repos/zsh-users/zsh-completions/zsh-completions.plugin.zsh

### zsh-autosuggestions
# crapped
# loadlib $ZPLUG_HOME/repos/zsh-users/zsh-autosuggestions/zsh-autosuggestions.zsh

### zsh-notify
loadlib $ZPLUG_HOME/repos/marzocchi/zsh-notify/notify.plugin.zsh
zstyle ':notify:*' command-complete-timeout 10

### anyframe
# loadlib $ZPLUG_HOME/repos/mollifier/anyframe/anyframe.plugin.zsh
loadlib $ZPLUG_HOME/repos/vintersnow/anyframe/anyframe.plugin.zsh
loadlib $DOTFILES/.zsh.d/any_frame.zsh

### zsh-colors
loadlib $ZPLUG_HOME/repos/Tarrasch/zsh-colors/colors.plugin.zsh

autoload -U compinit;
compinit -C
# compinit -i
# { zcompile "~/.zcompdump" } &!

### zsh-syntax-highlighting
loadlib $ZPLUG_HOME/repos/zsh-users/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

