#!/bin/bash
# Stop script if errors occur
trap 'echo Error: $0:$LINENO stopped; exit 1' ERR INT
set -eu

. "$DOTPATH"/etc/libs.sh

if [ "$(get_os)" != "linux" ]; then
  log_fail "error: this scipr only support for linux"
  exit 1
fi

# if ! has "apt-get" -o  ! has "yum"; then
#   log_fail "error: no package manager found"
#   exit 1
# fi

# package=(nvim)
#
# update() {
#   if has "apt-get"; then
#     sudo apt-get update
#   elif has "yum"; then
#     sudo yum update
#   else
#     log_fail "error: no package manager found"
#     exit 1
#   fi
# }
#
# install_nvim() {
#   if has "nvim"; then
#     return
#   fi
#
#   if has "apt-get"; then
#     sudo apt-get -y install software-properties-common
#     sudo add-apt-repository ppa:neovim-ppa/unstable
#     sudo apt-get -y install neovim
#     sudo apt-get -y install python-dev python-pip python3-dev python3-pip
#   elif has "yum"; then
#     log_fail "neovim: yum not support"
#   fi
# }
#
# install_go() {
#   if has "go"; then
#     return
#   fi
#
#   if has "apt-get"; then
#     sudo apt-get -y install golang
#   elif has "yum"; then
#     log_fail "golang: yum not support"
#     exit 1
#   fi
# }
#
# install_ghq() {
#   if has "ghq"; then
#     return
#   fi
#
#   if has "go"; then
#     go get github.com/motemen/ghq
#   else
#     log_fail "ghq: go is needed"
#   fi
# }

if has "apt-get"; then
  bash ./inner/apt.sh
elif has "yum"; then
  bash ./inner/yum.sh
else
  log_fail "error: no package manager found"
  exit 1
fi

# update

# install_nvim
# install_go
# install_ghq

log_pass "install: package install successfully installed!!"
