export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"

if command -v pyenv 1>/dev/null 2>&1; then
  # eval "$(pyenv init -)"
  # eval "$(pyenv init --path)"

  # TODO: make it more simple
  unset_all() { 
    unset -f pyenv
    unset -f pip
    unset -f python
    unset -f nvim
    unset -f v
  }
  pyenv_load_function() {
    evalcache "pyenv" "pyenv init -"
    evalcache "pyenv-path" "pyenv init --path"
  }

  pyenv () {
    unset_all
    pyenv_load_function
    pyenv "$@"
  }
  pip () {
    unset_all
    pyenv_load_function
    pip "$@"
  }

  python () {
    unset_all
    pyenv_load_function
    python "$@"
  }

  nvim () { 
    unset_all
    pyenv_load_function
    nvim "$@"
  }
  v () { 
    unset_all
    pyenv_load_function
    alias v='nvim'
    nvim "$@"
  }
  git () { 
    unset -f git
    pyenv_load_function
    git "$@"
  }
  tig () { 
    unset -f tig
    pyenv_load_function
    tig "$@"
  }
fi
