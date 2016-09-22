#!/bin/bash
# Stop script if errors occur
trap 'echo Error: $0:$LINENO stopped; exit 1' ERR INT
set -eu

. "$DOTPATH"/etc/libs.sh

log_info "install language-pack-jp"
yes | sudo apt-get install language-pack-ja
sudo update-locale LANG=ja_JP.UTF-8

log_pass "install package for japanse!!"
