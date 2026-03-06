typeset -U path PATH

path=(
  /opt/homebrew/bin
  /opt/homebrew/sbin
  /usr/local/opt/riscv-gnu-toolchain/bin
  /Applications/Docker.app/Contents/Resources/bin
  "$HOME/.bun/bin"
  $path
)

export PATH
