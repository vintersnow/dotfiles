#Added by the Heroku Toolbelt
export_path /usr/local/heroku/bin

### golang
# export GOPATH="$HOME/go"
# export PATH="$GOPATH/bin:$PATH"
# if [ ! -d $GOPATH ];then
#   mkdir $GOPATH
# fi

[[ -s "/Users/vinter/.gvm/scripts/gvm" ]] && source "/Users/vinter/.gvm/scripts/gvm"


### pads
# export PADS_HOME=~/Projects/UTLecture/2016tau/pads/pads
# source $PADS_HOME/scripts/Q_DO_SETENV.sh

### rust
export RUST_SRC_PATH=~/.rust/rustc-1.9.0/src
if [ -f ~/.cargo/env ]; then
  source ~/.cargo/env
fi

# gem
export_path /home/vinter/.gem/ruby/2.4.0/bin
