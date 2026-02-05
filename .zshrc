##### My Zsh Config #####

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
    | fzf
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

# Path to your Oh My Zsh installation.
PATH=$PATH:/usr/local/opt/riscv-gnu-toolchain/bin
export ZSH="$HOME/.oh-my-zsh"
export XDG_CONFIG_HOME="$HOME/.config"
VIM="nvim"
ZSH_THEME="philips"

eval $(opam env)

plugins=(
  z
  git
  aliases
  you-should-use
  zsh-autosuggestions
  zsh-syntax-highlighting
  )
source $ZSH/oh-my-zsh.sh

#### ALIAS ####
alias l="ls -alh"
alias c="clear"
alias vim="nvim"
alias vi="nvim"
alias venv="source .venv/bin/activate"
alias lg="lazygit"
alias bopen="open -a 'Brave Browser'"
alias ghidra="cd ~/dev/ghidra_11.4.2_PUBLIC/; ./ghidraRun"
alias ol="printf 'light' > ~/.tmux_theme; tmux source-file ~/.tmux_light.conf; tmux set-environment -g THEME 'light'"
alias od="printf 'dark' > ~/.tmux_theme; tmux source-file ~/.tmux_dark.conf; tmux set-environment -g THEME 'dark'"
alias sd="cd ~ && cd \$(find * -type d | fzf --height 40% --reverse)"

if command -v pyenv >/dev/null 2>&1; then
  eval "$(pyenv init -)"
fi

# BEGIN opam configuration
# This is useful if you're using opam as it adds:
#   - the correct directories to the PATH
#   - auto-completion for the opam binary
# This section can be safely removed at any time if needed.
[[ ! -r '/Users/kafka/.opam/opam-init/init.zsh' ]] || source '/Users/kafka/.opam/opam-init/init.zsh' > /dev/null 2> /dev/null
# END opam configuration

. "$HOME/.local/bin/env"

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="$HOME/.sdkman"
[[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"
# The following lines have been added by Docker Desktop to enable Docker CLI completions.
fpath=(/Users/kafka/.docker/completions $fpath)
autoload -Uz compinit
compinit
# End of Docker CLI completions
export PATH="$PATH:/Applications/Docker.app/Contents/Resources/bin"
export PATH="/opt/homebrew/bin:$PATH"

# bun completions
[ -s "/Users/kafka/.bun/_bun" ] && source "/Users/kafka/.bun/_bun"

# bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"
export PATH="$HOME/.bun/bin:$PATH"

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/Users/kafka/miniforge3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/Users/kafka/miniforge3/etc/profile.d/conda.sh" ]; then
        . "/Users/kafka/miniforge3/etc/profile.d/conda.sh"
    else
        export PATH="/Users/kafka/miniforge3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<


# >>> mamba initialize >>>
# !! Contents within this block are managed by 'mamba shell init' !!
export MAMBA_EXE='/Users/kafka/miniforge3/bin/mamba';
export MAMBA_ROOT_PREFIX='/Users/kafka/miniforge3';
__mamba_setup="$("$MAMBA_EXE" shell hook --shell zsh --root-prefix "$MAMBA_ROOT_PREFIX" 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__mamba_setup"
else
    alias mamba="$MAMBA_EXE"  # Fallback on help from mamba activate
fi
unset __mamba_setup
# <<< mamba initialize <<<
