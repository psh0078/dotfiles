# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:$HOME/.local/bin:/usr/local/bin:$PATH

_tmux_set_theme_from_system() {
  command -v tmux >/dev/null 2>&1 || return 0

  local theme="light"
  if [[ "$OSTYPE" == darwin* ]]; then
    # If this key exists, macOS is in Dark Mode
    defaults read -g AppleInterfaceStyle >/dev/null 2>&1 && theme="dark"
  fi

  # propagate to new tmux server via env and to existing server via set-environment
  export THEME="$theme"
  # Set globally for the tmux server (works even before attach if server exists)
  tmux set-environment -g THEME "$theme" 2>/dev/null || true
}

if [[ -o interactive && -z "$TMUX" && "${TERM_PROGRAM:l}" == "ghostty" ]]; then
  if command -v tmux >/dev/null 2>&1; then
    _tmux_set_theme_from_system
    exec tmux new-session -A -s main
  fi
fi


# Path to your Oh My Zsh installation.
PATH=$PATH:/usr/local/opt/riscv-gnu-toolchain/bin
export ZSH="$HOME/.oh-my-zsh"
export XDG_CONFIG_HOME="$HOME/.config"
VIM="nvim"
ZSH_THEME="philips"

# OCaml: Activates opam environment
eval $(opam env)
# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment one of the following lines to change the auto-update behavior
# zstyle ':omz:update' mode disabled  # disable automatic updates
# zstyle ':omz:update' mode auto      # update automatically without asking
# zstyle ':omz:update' mode reminder  # just remind me to update when it's time

# Uncomment the following line to change how often to auto-update (in days).
# zstyle ':omz:update' frequency 13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# You can also set it to another string to have that shown instead of the default red dots.
# e.g. COMPLETION_WAITING_DOTS="%F{yellow}waiting...%f"
# Caution: this setting can cause issues with multiline prompts in zsh < 5.7.1 (see #5765)
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
  z
  git
  aliases
  you-should-use
  zsh-autosuggestions
  zsh-syntax-highlighting
  )
source $ZSH/oh-my-zsh.sh

# bindkey '\t' autosuggest-accept
# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='nvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch $(uname -m)"

# Set personal aliases, overriding those provided by Oh My Zsh libs,
# plugins, and themes. Aliases can be placed here, though Oh My Zsh
# users are encouraged to define aliases within a top-level file in
# the $ZSH_CUSTOM folder, with .zsh extension. Examples:
# - $ZSH_CUSTOM/aliases.zsh
# - $ZSH_CUSTOM/macos.zsh
# For a full list of active aliases, run `alias`.
#
alias l="ls -alh"
alias c="clear"
alias vim="nvim"
alias vi="nvim"
alias venv="source .venv/bin/activate"
alias lg="lazygit"
alias ghidra="cd ~/dev/ghidra_11.4.2_PUBLIC/; ./ghidraRun"
alias ol="tmux source-file ~/.tmux_light.conf; tmux set-environment THEME 'light'"
alias od="tmux source-file ~/.tmux_dark.conf; tmux set-environment THEME 'dark'"

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
