export ZPLUG_HOME=~/.zplug
if [ ! -d "$ZPLUG_HOME" ];then
  # curl -fLo ~/.zplug/zplug --create-dirs git.io/zplug
  # git clone https://github.com/zplug/zplug $ZPLUG_HOME
  echo "install zplug"
  curl -sL zplug.sh/installer | zsh
fi

export NVM_LAZY_LOAD=true

zplug () {
unset -f zplug

source $ZPLUG_HOME/init.zsh

cache_dir=$HOME/.zplug/cache

if [ -d $cache_dir ]; then
  plugins=$HOME/.zsh.d/zplug_plugin.zsh
  cache=$cache_dir/interface
  plugin_date=$(date -r $plugins +%s)
  cache_date=$(date -r $cache +%s)
  # echo $package_date $cache_date
  if [ ! -d $cache_dir -o $plugin_date -gt $cache_date ]; then
    loadlib $HOME/.zsh.d/zplug_plugin.zsh
  fi
else
  loadlib $HOME/.zsh.d/zplug_plugin.zsh
fi

zplug "$@"
}

# zplug load
