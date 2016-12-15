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
  exec 3>&2 2>/tmp/zshprofilelog.$$
  trap 'setopt xtrace prompt_subst' EXIT
}

function ztrace_end() {
  # turn off tracing
  trap 'unsetopt xtrace' EXIT
  # restore stderr to the value saved in FD 3
  exec 2>&3 3>&-
}

function loadlib() {
  lib=${1:?"You have to specify a library file"}
  if [ -f "$lib" ];then
    zcompare $lib
    source $lib
  fi
}
