#!/bin/bash
# Stop script if errors occur
trap 'echo Error: $0:$LINENO stopped; exit 1' ERR INT
set -eu

if [ -z "$DOTPATH" ]; then
    # shellcheck disable=SC2016
    echo '$DOTPATH not set' >&2
    exit 1
fi


. "$DOTPATH"/etc/libs.sh

for i in "$DOTPATH"/etc/init/"$(get_os)"/*.sh
do
  if [ -f $i ]; then   
    log_info "$(basename $i)"
    bash $i
  else
    continue
  fi
done

log_pass "$0: Finish!!" | sed "s $DOTPATH \$DOTPATH g"
