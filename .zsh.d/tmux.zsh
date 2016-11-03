
. $DOTFILES/etc/libs.sh

function is_screen_running() { [ ! -z "$STY" ]; }
function is_tmux_runnning() { [ ! -z "$TMUX" ]; }
function is_screen_or_tmux_running() { is_screen_running || is_tmux_runnning; }

function tmux_automatically_attach_session()
{
  if is_screen_or_tmux_running; then
    return 1
  fi

  if shell_has_started_interactively && ! is_ssh_running; then
    if ! is_exists 'tmux'; then
      echo 'Error: tmux command not found' 2>&1
      return 1
    fi

    if tmux has-session >/dev/null 2>&1 && tmux list-sessions | grep -qE '.*]$'; then
      # detached session exists
      tmux list-sessions
      echo -n "\nTmux: attach? (y/N/num) "
      read
      if [[ "$REPLY" =~ ^[Yy]$ ]] || [[ "$REPLY" == '' ]]; then
        tmux attach-session
        if [ $? -eq 0 ]; then
          echo "$(tmux -V) attached session"
          return 0
        fi
      elif [[ "$REPLY" =~ ^[0-9]+$ ]]; then
        tmux attach -t "$REPLY"
        if [ $? -eq 0 ]; then
          echo "$(tmux -V) attached session"
          return 0
        fi
      fi
    else
      echo "No tmux session found."
      echo -n "Do you want to create new session? (Y/n) "
      read
      if [[ ! "$REPLY" =~ ^[nN]$ ]]; then
        tmux new-session && echo "tmux created new session"
      fi
    fi
  fi
}
tmux_automatically_attach_session
