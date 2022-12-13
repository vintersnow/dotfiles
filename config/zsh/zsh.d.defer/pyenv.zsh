export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"

if command -v pyenv 1>/dev/null 2>&1; then
  # eval "$(pyenv init -)"
  # eval "$(pyenv init --path)"
  evalcache "pyenv" "pyenv init -"
  evalcache "pyenv-path" "pyenv init --path"
fi
