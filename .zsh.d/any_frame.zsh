
if has "fzf-tmux"; then
 zstyle ":anyframe:selector:" use fzf-tmux
elif has "fzy"; then
 zstyle ":anyframe:selector:" use fzy
elif has "fzf"; then
 zstyle ":anyframe:selector:" use fzf
elif has "peco"; then
 zstyle ":anyframe:selector:" use peco
fi

bindkey '^r' anyframe-widget-put-history
bindkey '^u' anyframe-widget-cdr
bindkey '^s' anyframe-widget-tmux-attach

alias any='anyframe-widget-select-widget'
alias gh='anyframe-widget-cd-ghq-repository'

