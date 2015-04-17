#setting for zprof restart zsh
#zmodload zsh/zprof && zprof

# nvm Path set
PATH=${NVM_DIR:-$HOME/.nvm}/default/bin:$PATH
MANPATH=${NVM_DIR:-$HOME/.nvm}/default/share/man:$MANPATH
export NODE_PATH=${NVM_DIR:-$HOME/.nvm}/default/lib/node_modules
# # $NODE_PATH にバージョン番号が含まれていないと `yo doctor` が警告を出す
# # 次のように書くと $NODE_PATH のシンボリックリンクが展開され、警告が出なくなる
# # (Hint: .nvm/default は .nvm/vX.Y.Z へのシンボリックリンク)
NODE_PATH=${NODE_PATH:A}
#if [[ -s ~/.nvm/nvm.sh ]];
# then source ~/.nvm/nvm.sh
# fi
