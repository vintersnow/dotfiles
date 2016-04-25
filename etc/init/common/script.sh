#!/bin/bash
# Stop script if errors occur
trap 'echo Error: $0:$LINENO stopped; exit 1' ERR INT
set -eu

. "$DOTPATH"/etc/libs.sh

find  "$DOTPATH"/bin -type f -exec chmod +x {} +

log_pass "script chmod successfully finished!!"
