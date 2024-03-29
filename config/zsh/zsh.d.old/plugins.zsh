zinit ice wait"0" lucid blockf
zinit light "zsh-users/zsh-completions"

export ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=243'
export ZSH_AUTOSUGGEST_STRATEGY='match_prev_cmd'
zinit ice wait"0" lucid atload"_zsh_autosuggest_start"
zinit light "zsh-users/zsh-autosuggestions"

zinit ice wait"0" lucid atinit"zpcompinit; zpcdreplay"
zinit light "zdharma-continuum/fast-syntax-highlighting"

zinit ice wait'0' lucid if"has 'terminal-notifier' || has 'notify-send'"
zinit light "marzocchi/zsh-notify"
zstyle ':notify:*' command-complete-timeout 10

source $ZSHHOME/any_frame.zsh
zinit ice wait'0' lucid atload"anyframe_setup"
zinit light "vintersnow/anyframe"

source $ZSHHOME/zaw.zsh
zinit ice wait'0' lucid atload"zaw_setup"
zinit light "zsh-users/zaw"

##################################
### command

zinit ice wait'0' lucid as"program" pick"bin/xpanes"
zinit light "greymd/tmux-xpanes"

zinit ice wait'0' lucid
zinit light "Tarrasch/zsh-colors"

export NVM_LAZY_LOAD=false
zinit ice wait'0' lucid
zinit light "lukechilds/zsh-nvm"

##################################
### other

##################################
### Prompt
# zinit ice pick"async.zsh" src"pure.zsh"; zinit light "sindresorhus/pure"
if has "starship"; then 
  # Optimize loading
  # eval "$(starship init zsh)"
  starship_cache="$HOME/.starship_init.zsh"
  if [[ ! -f $starship_cache ]] then;
    starship init zsh --print-full-init > $starship_cache
  fi
  zinit snippet $starship_cache
fi
