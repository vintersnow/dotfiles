#!/bin/bash

trap 'echo Error: $0:$LINENO stopped; exit 1' ERR INT
set -eu

. "$DOTPATH"/etc/libs.sh
. "$DOTPATH"/.zsh.d/1develop.zsh

sudo apt-get update

if ! has "nvim"; then
  if [ -f /etc/debian_version ]; then
    log_info "install nvim for debian"
    sudo apt-get -y install neovim
    sudo apt-get -y install python3-pip
    pip install --upgrade pip
    pip install neovim
    pip3 install --upgrade pip
    pip3 install neovim
  else
    log_info "install nvim for ubuntu"
    sudo apt-get -y install software-properties-common
    sudo add-apt-repository ppa:neovim-ppa/unstable
    sudo apt-get -y install neovim
    sudo apt-get -y install python-dev python-pip python3-dev python3-pip
  fi
fi

if ! has "go"; then
  log_info "install golang"
  sudo apt-get -y install golang
fi

if ! has "ghq"; then
  if has "go"; then
    log_info "isntall ghq"
    go get github.com/motemen/ghq
  else
    log_fail "install failed: ghq need go"
  fi
fi
