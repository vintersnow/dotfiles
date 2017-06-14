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

  test $val -ge $min
  return $status
}


# overwrite

function loadlib() {
  lib=${1:?"You have to specify a library file"}
  if [ -f "$lib" ];then
    zcompare $lib
    source $lib
  fi
}
