
# load common alias
loadlib $ZSHHOME/alias.sh

# global alias
alias -g L='| less -R'
alias -g G='| grep'
alias -g A='| ag'
alias -g H='| head'
alias -g T='| tail'
alias -g G='| grep'
alias -g W='| wc'
alias -g Te='| tee'


#suffix alias
alias -s hs=runhaskell
alias -s py=python
alias -s rb=ruby
alias -s c=runc
alias -s cpp=runcpp


# C で標準出力をクリップボードにコピーする
# mollifier delta blog : http://mollifier.hatenablog.com/entry/20100317/p1
if which pbcopy >/dev/null 2>&1 ; then
  # Mac
  alias -g C='| pbcopy'
elif which xsel >/dev/null 2>&1 ; then
  # Linux
  alias -g C='| xsel --input --clipboard'
elif which putclip >/dev/null 2>&1 ; then
  # Cygwin
  alias -g C='| putclip'
fi

