zplug "zsh-users/zsh-completions"
zplug "zsh-users/zsh-autosuggestions"
zplug "zsh-users/zsh-syntax-highlighting", defer:2, lazy:true
#
zplug "mafredri/zsh-async"
zplug "sindresorhus/pure"

zplug "b4b4r07/enhancd", use:"init.sh", lazy:true
# # zplug "mollifier/anyframe"
zplug "vintersnow/anyframe", lazy:true

zplug "marzocchi/zsh-notify", if:"has 'terminal-notifier' || has 'notify-send'"

zplug "Tarrasch/zsh-colors"

# # zplug "lukechilds/zsh-nvm"

zplug "greymd/tmux-xpanes", lazy:true, as:command

zplug 'zplug/zplug', hook-build:'zplug --self-manage'

# Install plugins if there are plugins that have not been installed

# if ! zplug check --verbose; then
#   printf "Install? [y/N]: "
#   if read -q; then
#     echo; zplug install
#   fi
# fi
