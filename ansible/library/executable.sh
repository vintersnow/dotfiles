#!/bin/sh

# runs a shell script (value string) if the command (key string) not found.

source `dirname $0`/args
if which $name > /dev/null ; then
  echo '{"changed": false}'
else
  msg=$(sh -c "$action" 2>&1 > /dev/null) || f=', "failed": true'
  echo "{\"changed\": true, \"msg\": \"$msg\"$f}"
fi
