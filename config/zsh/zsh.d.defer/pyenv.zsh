# export PYENV_ROOT="$HOME/.pyenv"
# export PATH="$PYENV_ROOT/bin:$PATH"

# if command -v pyenv 1>/dev/null 2>&1; then
#   # eval "$(pyenv init --path)"
#
#   # eval "$(pyenv init -)"
#   # equals to below
#   PATH="$(bash --norc -ec 'IFS=:; paths=($PATH); 
#   for i in ${!paths[@]}; do 
#   if [[ ${paths[i]} == "''/Users/vinter/.pyenv/shims''" ]]; then unset '\''paths[i]'\''; 
#   fi; done; 
#   echo "${paths[*]}"')"
#   export PATH="/Users/vinter/.pyenv/shims:${PATH}"
#   export PYENV_SHELL=zsh
#   source '/Users/vinter/.pyenv/libexec/../completions/pyenv.zsh'
#   # skip this for speed
#   silent_background pyenv rehash 2>/dev/null
#   pyenv() {
#     local command
#     command="${1:-}"
#     if [ "$#" -gt 0 ]; then
#       shift
#     fi
#
#     case "$command" in
#     rehash|shell)
#       eval "$(pyenv "sh-$command" "$@")"
#       ;;
#     *)
#       command pyenv "$command" "$@"
#       ;;
#     esac
#   }
# fi
