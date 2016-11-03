#!/bin/bash
# Stop script if errors occur
trap 'echo Error: $0:$LINENO stopped; exit 1' ERR INT
set -eu

. "$DOTPATH"/etc/libs.sh
. "$DOTPATH"/.zsh.d/1develop.zsh

if has "ghq" || -x $GOAPTH/bin/ghq ; then
  if [ ! -d $($GOPATH/bin/ghq root)/github.com/tmux-plugins/tpm ]; then
    ghq get tmux-plugins/tpm
  fi
else
  log_fail "error: require: ghq"
  exit 1
fi

log_pass "tmux plugin manager successfully installed!!"
