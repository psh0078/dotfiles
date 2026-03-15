typeset -U path PATH

path=(
  /opt/homebrew/bin
  /opt/homebrew/sbin
  /Applications/Docker.app/Contents/Resources/bin
  "$HOME/.bun/bin"
  $path
)

export PATH
