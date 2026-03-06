tmux_chooser="$HOME/.config/scripts/tmux-chooser.sh"
if [ ! -x "$tmux_chooser" ] && [ -x "$HOME/dotfiles/.config/scripts/tmux-chooser.sh" ]; then
  tmux_chooser="$HOME/dotfiles/.config/scripts/tmux-chooser.sh"
fi
"$tmux_chooser"

export ZSH="$HOME/.oh-my-zsh"
export ZSH_THEME="philips"

plugins=(
  git
  aliases
  you-should-use
  zsh-autosuggestions
  zsh-syntax-highlighting
)

source "$ZSH/oh-my-zsh.sh"

zsh_config_dir="${XDG_CONFIG_HOME:-$HOME/.config}/zsh"
if [ ! -d "$zsh_config_dir" ] && [ -d "$HOME/dotfiles/.config/zsh" ]; then
  zsh_config_dir="$HOME/dotfiles/.config/zsh"
fi

if [ -d "$zsh_config_dir" ]; then
  for module in "$zsh_config_dir"/*.zsh(N); do
    [ -r "$module" ] && source "$module"
  done
fi
