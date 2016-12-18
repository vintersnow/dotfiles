#######################################
# manually loading

# source $ZPLUG_HOME/repos/b4b4r07/enhancd/init.sh
loadlib ~/.ghq/github.com/vintersnow/enhancd/init.sh

# /pure
fpath=( "$HOME/.zfunctions" "$HOME/.zplug/repos/mollifier/anyframe(N-)/" $fpath )

autoload -U promptinit; promptinit
prompt pure

loadlib $ZPLUG_HOME/repos/zsh-users/zsh-completions/zsh-completions.plugin.zsh

loadlib $ZPLUG_HOME/repos/mollifier/anyframe/anyframe.plugin.zsh
loadlib $DOTFILES/.zsh.d/any_frame.zsh

autoload -U compinit;
compinit -C
# compinit -i
# { zcompile "~/.zcompdump" } &!

loadlib $ZPLUG_HOME/repos/zsh-users/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
# source ~/.ghq/github.com/vintersnow/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

