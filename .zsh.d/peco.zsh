###peco
#pecoでhistory検索
function peco-select-history() {
  # local tac
  # if which tac > /dev/null; then
  #   tac="tac"
  # else
  #   tac="tail -r"
  # fi
  BUFFER=$(\history -n -r 1 | peco --query "$LBUFFER")
  CURSOR=$#BUFFER
  zle clear-screen
}
zle -N peco-select-history
bindkey '^r' peco-select-history

# ### search a destination from cdr list
function peco-get-destination-from-cdr() {
  cdr -l | \
  sed -e 's/^[[:digit:]]*[[:blank:]]*//' | \
  peco --query "$LBUFFER"
}

### search a destination from cdr list and cd the destination
function peco-cdr() {
  local destination="$(peco-get-destination-from-cdr)"
  if [ -n "$destination" ]; then
    BUFFER="cd $destination"
    zle accept-line
  else
    zle reset-prompt
  fi
}
zle -N peco-cdr
bindkey '^x' peco-cdr

#pecoでkill
function peco-pkill() {
  for pid in `ps aux | peco | awk '{ print $2 }'`
  do
    kill $pid
    echo "Killed ${pid}"
  done
}
alias pk="peco-pkill"

# cool-peco
# [ -f ~/Projects/github/cool-peco/cool-peco ] && source ~/Projects/github/cool-peco/cool-peco ]

alias gh='cd $(ghq list -p | peco)'
alias gho='gh-open $(ghq list -p | peco)'
