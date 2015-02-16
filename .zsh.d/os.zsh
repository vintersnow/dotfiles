# OS 別の設定
case ${OSTYPE} in
  darwin*)
    #Mac用の設定
    export CLICOLOR=1
    ;;
  linux*)
    #Linux用の設定
    ;;
esac
