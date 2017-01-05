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
loadlib $ZPLUG_HOME/repos/zsh-users/zsh-autosuggestions/zsh-autosuggestions.plugin.zsh

### anyframe
# loadlib $ZPLUG_HOME/repos/mollifier/anyframe/anyframe.plugin.zsh
loadlib $ZPLUG_HOME/repos/vintersnow/anyframe/anyframe.plugin.zsh
loadlib $DOTFILES/.zsh.d/any_frame.zsh

autoload -U compinit;
compinit -C
# compinit -i
# { zcompile "~/.zcompdump" } &!

### zsh-syntax-highlighting
loadlib $ZPLUG_HOME/repos/zsh-users/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

