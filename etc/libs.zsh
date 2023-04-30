#!/bin/zsh

. $DOTFILES/etc/libs.sh

function zcompare() {
  if [[ -s ${1} && ( ! -s ${1}.zwc || ${1} -nt ${1}.zwc) ]]; then
    zcompile ${1}
  fi
}

function ztrace_start() {
  zmodload zsh/datetime
  setopt promptsubst
  PS4='+$EPOCHREALTIME %N:%i> '
  local logfile="${1:-"zsh_profile"}.$$"
  exec 3>&2 2>$logfile
  trap 'setopt xtrace prompt_subst' EXIT
}

function ztrace_end() {
  # turn off tracing
  trap 'unsetopt xtrace' EXIT
  # restore stderr to the value saved in FD 3
  exec 2>&3 3>&-
}

function versioncompare() {
  local min val

  val="${1:gs/.//}"
  min="${2:gs/.//}"

  if [ $#val -gt $#min ]; then
    min=${(r:$#val::0:)min}
  elif [ $#val -lt $#min ]; then
    val=${(r:$#min::0:)val}
  fi

  if [ $val -ge $min ]; then
    return 0
  fi
  return 1
}


# overwrite

function loadlib() {
  lib=${1:?"You have to specify a library file"}
  if [ -f "$lib" ];then
    zcompare $lib
    source $lib
  fi
}


#########
# cache eval
export EVAL_CACHE_DIR="$HOME/.cache/zsh_eval_cache"

function evalcache() { 
  local cacheName="$1"
  local cacheCommand="$2"
  local cacheFile="$EVAL_CACHE_DIR/init-$cacheName.sh"
  if [[ ! -f $cacheFile ]] then;
    mkdir -p $EVAL_CACHE_DIR
    eval "$cacheCommand" > "$cacheFile"
  fi
  source $cacheFile
}

function clearevalcache() { 
  rm $EVAL_CACHE_DIR/init-*.sh
}

#########
# silent background job
silent_background() {
  if [[ -n $ZSH_VERSION ]]; then
    setopt local_options no_notify no_monitor
    # We'd use &| to background and disown, but incompatible with bash, so:
    "$@" &
  elif [[ -n $BASH_VERSION ]]; then  # bash: https://stackoverflow.com/a/27340076/5353461
    { 2>&3 "$@"& } 3>&2 2>/dev/null
  else  # Unknownness - just background it
    "$@" &
  fi
  disown &>/dev/null  # Close STD{OUT,ERR} to prevent whine if job has already completed
}
