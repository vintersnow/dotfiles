#!/bin/bash

trap 'echo Error: $0:$LINENO stopped; exit 1' ERR INT
set -eu

. "$DOTPATH"/etc/libs.sh

sudo apt-get update

if ! has "nvim"; then
  sudo apt-get -y install software-properties-common
  sudo add-apt-repository ppa:neovim-ppa/unstable
  sudo apt-get -y install neovim
  sudo apt-get -y install python-dev python-pip python3-dev python3-pip
fi

if ! has "go"; then
  sudo apt-get -y install golang
fi

if ! has "ghq"; then
  if has "go"; then
    go get github.com/motemen/ghq
  else
    log_fail "ghq: go is needed"
  fi
fi
