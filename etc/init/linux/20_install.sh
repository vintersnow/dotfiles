#!/bin/bash
# Stop script if errors occur
trap 'echo Error: $0:$LINENO stopped; exit 1' ERR INT
set -eu

. "$DOTPATH"/etc/libs.sh

if [ "$(get_os)" != "linux" ]; then
  log_fail "error: this scipr only support for linux"
  exit 1
fi

if has "apt-get"; then
  bash "$DOTPATH"/etc/init/linux/inner/apt.sh
elif has "yum"; then
  bash "$DOTPATH"/etc/init/linux/inner/yum.sh
else
  log_fail "error: no package manager found"
  exit 1
fi

log_pass "install: package install successfully installed!!"
