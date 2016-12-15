#!/bin/bash

# copy from "b4b4r07/dotfiles"

############################################################
# detect OS
############################################################
export PLATFORM

# lower returns a copy of the string with all letters mapped to their lower case.
# shellcheck disable=SC2120

lower() {
  if [ $# -eq 0 ]; then
    cat <&0
  elif [ $# -eq 1 ]; then
    if [ -f "$1" -a -r "$1" ]; then
      cat "$1"
    else
      echo "$1"
    fi
  else
    return 1
  fi | tr "[:upper:]" "[:lower:]"
}

ostype(){
  uname | lower
}

# os_detect export the PLATFORM variable as you see fit
os_detect() {
  export PLATFORM
  case "$(ostype)" in
    *'linux'*)  PLATFORM='linux'   ;;
    *'darwin'*) PLATFORM='osx'     ;;
    *'bsd'*)    PLATFORM='bsd'     ;;
    *)          PLATFORM='unknown' ;;
  esac
}

get_os(){
  os_detect
  echo $PLATFORM
}


# is_osx returns true if running OS is Macintosh
is_osx() {
  os_detect
  if [ "$PLATFORM" = "osx" ]; then
      return 0
  else
      return 1
  fi
}
alias is_mac=is_osx

# is_linux returns true if running OS is GNU/Linux
is_linux() {
  os_detect
  if [ "$PLATFORM" = "linux" ]; then
      return 0
  else
      return 1
  fi
}

# is_bsd returns true if running OS is FreeBSD
is_bsd() {
  os_detect
  if [ "$PLATFORM" = "bsd" ]; then
      return 0
  else
      return 1
  fi
}



############################################################
# log functions
############################################################

ink() {
  if [ "$#" -eq 0 -o "$#" -gt 2 ]; then
    echo "Usage: ink <color> <text>"
    echo "Colors:"
    echo "  black, white, red, green, yellow, blue, purple, cyan, gray"
    return 1
  fi

  local open="\033["
  local close="${open}0m"
  local black="0;30m"
  local red="1;31m"
  local green="1;32m"
  local yellow="1;33m"
  local blue="1;34m"
  local purple="1;35m"
  local cyan="1;36m"
  local gray="0;37m"
  local white="$close"

  local text="$1"
  local color="$close"

  if [ "$#" -eq 2 ]; then
    text="$2"
    case "$1" in
      black | red | green | yellow | blue | purple | cyan | gray | white)
      eval color="\$$1"
      ;;
    esac
  fi

  printf "${open}${color}${text}${close}"
}

logging() {
  if [ "$#" -eq 0 -o "$#" -gt 2 ]; then
    echo "Usage: ink <fmt> <msg>"
    echo "Formatting Options:"
    echo "  TITLE, ERROR, WARN, INFO, SUCCESS"
    return 1
  fi

  local color=
  local text="$2"

  case "$1" in
    TITLE)
        color=yellow
        ;;
    ERROR | WARN)
        color=red
        ;;
    INFO)
        color=blue
        ;;
    SUCCESS)
        color=green
        ;;
    *)
        text="$1"
  esac

  timestamp() {
    ink gray "["
    ink purple "$(date +%H:%M:%S)"
    ink gray "] "
  }

  timestamp; ink "$color" "$text"; echo
}

log_pass() {
  logging SUCCESS "$1"
}

log_fail() {
  logging ERROR "$1" 1>&2
}

log_fail() {
  logging WARN "$1"
}

log_info() {
  logging INFO "$1"
}

log_echo() {
  logging TITLE "$1"
}


############################################################

# is_exists returns true if executable $1 exists in $PATH
is_exists() {
  which "$1" >/dev/null 2>&1
  return $?
}

# has is wrapper function
has() {
  is_exists "$@"
}

# die returns exit code error and echo error message
die() {
  log_fail "$1" 1>&2
  exit "${2:-1}"
}


shell_has_started_interactively() {
  [ ! -z "$PS1" ];
}

function is_ssh_running() {
  [ ! -z "$SSH_CONECTION" ];
}

# loader
function loadlib() {
  lib=${1:?"You have to specify a library file"}
  if [ -f "$lib" ];then
    source $lib
  fi
}

function export_path () {
  dir=${1:?"You have to specify a path"}
  if [ -d "$dir" ];then
    export PATH="$dir:$PATH"
  fi
}

