#!/bin/bash
# Stop script if errors occur
trap 'echo Error: $0:$LINENO stopped; exit 1' ERR INT
set -eu

. "$DOTPATH"/etc/libs.sh

if [ "$(get_os)" != "linux" ]; then
  log_fail "error: this scipr only support for linux"
  exit 1
fi

if ! has "apt-get" -o  ! has "yum"; then
  log_fail "error: no package manager found"
  exit 1
fi

package=(nvim)

update() {
  if has "apt-get"; then
    yes | sudo apt-get update
  elif has "yum"; then
    yes | sudo yum update
  else
    log_fail "error: no package manager found"
    exit 1
  fi
}

upgrade () {
  if has "apt-get"; then
    yes | sudo apt-get upgrade
  elif has "yum"; then
    yes | sudo yum upgrade
  else
    log_fail "error: no package manager found"
    exit 1
  fi
}

install_nvim() {
  if has "nvim"; then
    return
  fi

  log_info "install nvim"
  if has "apt-get"; then
    yes | sudo apt-get install software-properties-common
    yes | sudo apt-get update
    yes | sudo add-apt-repository ppa:neovim-ppa/unstable
    yes | sudo apt-get install neovim
    yes | sudo apt-get install python-dev python-pip python3-dev python3-pip
  elif has "yum"; then
    log_fail "neovim: yum not support"
  fi
}

install_ghq() {
  if has "ghq"; then
    return
  fi

  log_info "install ghq"
  if has "go"; then
    go get github.com/motemen/ghq
  else
    log_fail "ghq: go is needed"
  fi
}

normal_install () {
  if [ $# -eq 1 ]; then
    command_name=$1
    pckg_name=$1
  elif [ $# -eq 2 ]; then
    command_name=$1
    pckg_name=$2
  else
    return 
  fi

  if has "$1"; then
    return
  fi

  log_info "install $command_name"
  if has "apt-get"; then
    yes | sudo apt-get install $pckg_name
  elif has "yum"; then
    log_fail "golang: yum not support"
    exit 1
  fi
}

update
upgrade

install_nvim
normal_install go golang
install_ghq
normal_install tree
normal_install zsh

log_pass "install: package install successfully installed!!"
