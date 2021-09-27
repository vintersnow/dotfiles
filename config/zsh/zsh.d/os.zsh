# OS 別の設定
case ${OSTYPE} in
  darwin*)
    #Mac用の設定
    export CLICOLOR=1

    # arch切り替え
    if (( $+commands[sw_vers] )) && (( $+commands[arch] )); then
      alias x64='exec arch -x86_64 /bin/zsh'
      alias a64='exec arch -arm64e /bin/zsh'
      switch-arch() {
        if  [[ "$(uname -m)" == arm64 ]]; then
          arch=x86_64
        elif [[ "$(uname -m)" == x86_64 ]]; then
          arch=arm64e
        fi
        exec arch -arch $arch /bin/zsh
      }
    fi

    ;;
  linux*)
    #Linux用の設定
    ;;
esac
