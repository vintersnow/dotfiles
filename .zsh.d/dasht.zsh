DASHTHOME="$HOME/.ghq/github.com/sunaku/dasht"
export PATH="$DASHTHOME/bin:$PATH"

if has "dasht"; then
  export MANPATH="$DASHTHOME/man:$MANPATH"
  loadlib $DASHTHOME/etc/zsh/comletions.zsh
fi
