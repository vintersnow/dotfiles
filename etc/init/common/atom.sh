#!/bin/bash
# Stop script if errors occur
trap 'echo Error: $0:$LINENO stopped; exit 1' ERR INT
set -eu

. "$DOTPATH"/etc/libs.sh

if has "apm"; then
  # At now all packages are forced to install and became slow.
  # apm stars --install
else
  log_fail "error: require: apm; install atom."
  exit 1
fi

log_pass "atom plugins successfully installed!!"
