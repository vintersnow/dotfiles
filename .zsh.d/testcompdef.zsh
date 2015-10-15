compdef _hogecmd hoge
function _hogecmd {
  local -a cmds
  if (( CURRENT == 2 ));then
    cmds=('init' 'update' 'upgrade' 'commit')
    _describe -t commands "subcommand" cmds
  else
    _files
  fi

  return 1;
}
