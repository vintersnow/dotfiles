#!/bin/bash
# Stop script if errors occur
trap 'echo Error: $0:$LINENO stopped; exit 1' ERR INT
set -eu

. "$DOTPATH"/etc/libs.sh

if [ "$(get_os)" != "osx" ]; then
  log_fail "error: this scipr only support for osx"
  exit 1
fi

if has "brew"; then
  if ! has "brew-file"; then
    brew install rcmdnk/file/brew-file
  fi
  HOMEBREW_BREWFILE="$DOTPATH"/etc/init/osx/Brewfile brew file install
else
  log_fail "error: require: brew"
  exit 1
fi

log_pass "brew: formula install successfully finished!!"
