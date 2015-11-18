###peco
#pecoでhistory検索
function peco-select-history() {
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
function ghq-fullpath() {
  ghq_root=`ghq root`
  repo=`(ghq list | peco)`
  if [[ -n "$repo" ]]; then
    echo "${ghq_root}/${repo}"
  fi
}
alias gh='cd $(ghq-fullpath)'
alias gho='gh-open $(ghq-fullpath)'


#pecoでsublime-projectを開く
function sublime-projects() {
  subl_root='~/Projects/sublime_projects'
  files=`(ls -l ~/Projects/sublime_projects | grep project | cut -d " " -f 10)`
  # echo "$files"
  if [[ -n "$files" ]]; then
    project=`echo $files | peco`
    # echo "${subl_root}/${project}"
    if [[ -n "$project" ]]; then
      subl "${subl_root}/${project}"
    fi
  else
    echo "no projects"
  fi
}
alias subp='sublime-projects'
