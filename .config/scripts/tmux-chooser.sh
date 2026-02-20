# Start tmux chooser if not already inside tmux
if [[ -z "$TMUX" ]] && command -v tmux >/dev/null 2>&1; then
  # List session names only (empty if server not running)
  session_names="$(tmux list-sessions -F '#S' 2>/dev/null)"

  create_new_session="Create new session"
  start_without_tmux="Start without tmux"

  choice="$(
    printf "%s\n%s\n%s\n" \
      ${=session_names} \
      "$create_new_session" \
      "$start_without_tmux" \
    | fzf --height 40% --reverse
  )"

  case "$choice" in
    "" )
      # fzf cancelled
      ;;
    "$create_new_session" )
      tmux new-session
      ;;
    "$start_without_tmux" )
      :
      ;;
    * )
      # Attach by session NAME
      tmux attach-session -t "$choice"
      ;;
  esac
fi
