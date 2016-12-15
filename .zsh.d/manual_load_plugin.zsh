#######################################
# manually loading

# source $ZPLUG_HOME/repos/b4b4r07/enhancd/init.sh
source ~/.ghq/github.com/vintersnow/enhancd/init.sh

# /pure
fpath=( "$HOME/.zfunctions" $fpath )

autoload -U promptinit; promptinit
prompt pure

source $ZPLUG_HOME/repos/zsh-users/zsh-completions/zsh-completions.plugin.zsh

autoload -U compinit;
compinit -C
# compinit -i
# { zcompile "~/.zcompdump" } &!

source $ZPLUG_HOME/repos/zsh-users/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

