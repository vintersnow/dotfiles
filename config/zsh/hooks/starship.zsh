if has "starship"; then 
  # Optimize loading
  # eval "$(starship init zsh)"
  starship_cache="$HOME/.starship_init.zsh"
  if [[ ! -f $starship_cache ]] then;
    starship init zsh --print-full-init > $starship_cache
  fi
  source $starship_cache
fi
