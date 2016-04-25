#!/bin/bash
# Stop script if errors occur
trap 'echo Error: $0:$LINENO stopped; exit 1' ERR INT
set -eu

. "$DOTPATH"/etc/libs.sh

if [ "$(get_os)" != "osx" ]; then
  log_fail "error: this scipr only support for osx"
  exit 1
fi


if has ghq; then
  if ! has anyenv; then
    ghq get riywo/anyenv
    exec $SHELL -l
  fi
  for i in $(anyenv envs) 
  do
    echo $i
  done

else
  log_fail "error: require: ghq"
  exit 1
fi

log_pass "anyenv: setting successfully"
