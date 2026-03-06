if command -v opam >/dev/null 2>&1; then
  eval "$(opam env)"
  [ -r "$HOME/.opam/opam-init/init.zsh" ] && source "$HOME/.opam/opam-init/init.zsh" >/dev/null 2>/dev/null
fi

if command -v pyenv >/dev/null 2>&1; then
  eval "$(pyenv init -)"
fi

[ -r "$HOME/.local/bin/env" ] && source "$HOME/.local/bin/env"
[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ] && source "$HOME/.sdkman/bin/sdkman-init.sh"

if [ -d "$HOME/.docker/completions" ]; then
  fpath=("$HOME/.docker/completions" $fpath)
  autoload -Uz compinit
  compinit
fi

[ -s "$HOME/.bun/_bun" ] && source "$HOME/.bun/_bun"

eval "$(zoxide init zsh)"
