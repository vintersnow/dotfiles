zplugin ice wait"0" lucid blockf
zplugin light "zsh-users/zsh-completions"

export ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=243'
export ZSH_AUTOSUGGEST_STRATEGY='match_prev_cmd'
zplugin ice wait"0" lucid atload"_zsh_autosuggest_start"
zplugin light "zsh-users/zsh-autosuggestions"

zplugin ice wait"0" lucid atinit"zpcompinit; zpcdreplay"
zplugin light "zdharma/fast-syntax-highlighting"
# zplugin light "zsh-users/zsh-syntax-highlighting"

zplugin ice wait'0' lucid if"has 'terminal-notifier' || has 'notify-send'"
zplugin light "marzocchi/zsh-notify"
zstyle ':notify:*' command-complete-timeout 10

source $ZSHHOME/any_frame.zsh
zplugin ice wait'0' lucid atload"anyframe_setup"
zplugin light "vintersnow/anyframe"

source $ZSHHOME/zaw.zsh
zplugin ice wait'0' lucid atload"zaw_setup"
zplugin light "zsh-users/zaw"
# # zplugin light "skywind3000/z.lua"
# zplugin light "rupa/z"

##################################
### command

zplugin ice wait'0' lucid as"program" pick"bin/xpanes"
zplugin light "greymd/tmux-xpanes"

# zplugin ice wait'0' lucid
# zplugin light "b4b4r07/enhancd"

zplugin ice wait'0' lucid
zplugin light "Tarrasch/zsh-colors"

export NVM_LAZY_LOAD=true
zplugin ice wait'0' lucid
zplugin light "lukechilds/zsh-nvm"

##################################
### Prompt
zplugin ice pick"async.zsh" src"pure.zsh"; zplugin light "sindresorhus/pure"
