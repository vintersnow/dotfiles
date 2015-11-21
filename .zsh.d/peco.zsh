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


#pecoでsublime-projectを開く(project managerを使用)
function sublime-projects() {
  subl_root='/User/izuku/Dropbox/app/sublimeText3/Packages/User/Projects'
  root_len=${#subl_root}+3
  # files=`(ls -l ~/Projects/sublime_projects | grep project | cut -d " " -f 10)`
  files=`find ~/Dropbox/app/sublimeText3/Packages/User/Projects -name "*sublime-project"`
  if [[ -n "$files" ]]; then
    project=`echo $files | awk '{ name=substr($0,'${root_len}'); print substr(name,0,index(name,".sublime-project"))}'| peco`
    if [[ -n "$project" ]]; then
      subl `echo $files | grep $project`
    fi
  else
    echo "no projects"
  fi
}
alias subp='sublime-projects'
