#!/usr/bin/env bash

if [[ -n "$TMUX" ]] || ! command -v tmux >/dev/null 2>&1; then
  exit 0
fi

session_names="$(tmux list-sessions -F '#S' 2>/dev/null)"

dispensary="$HOME/.config/scripts/tmux-session-dispensary.sh"
if [ ! -x "$dispensary" ] && [ -x "$HOME/dotfiles/.config/scripts/tmux-session-dispensary.sh" ]; then
  dispensary="$HOME/dotfiles/.config/scripts/tmux-session-dispensary.sh"
fi

create_new_session="Create new session"
start_without_tmux="Start without tmux"

choice="$({
  [ -n "$session_names" ] && printf "%s\n" "$session_names"
  printf "%s\n%s\n" "$create_new_session" "$start_without_tmux"
} | fzf --height 40% --reverse)"

case "$choice" in
  "")
    ;;
  "$create_new_session")
    if [ -x "$dispensary" ]; then
      "$dispensary"
    else
      tmux new-session
    fi
    ;;
  "$start_without_tmux")
    ;;
  *)
    tmux attach-session -t "$choice"
    ;;
esac
