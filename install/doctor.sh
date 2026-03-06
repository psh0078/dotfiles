#!/usr/bin/env bash

set -euo pipefail

repo="${DOTFILES_DIR:-$HOME/dotfiles}"
errors=0
warnings=0

pass() { printf "OK   %s\n" "$1"; }
warn() { printf "WARN %s\n" "$1"; warnings=$((warnings + 1)); }
fail() { printf "FAIL %s\n" "$1"; errors=$((errors + 1)); }

check_cmd() {
  local name="$1"
  if command -v "$name" >/dev/null 2>&1; then
    pass "command found: $name"
  else
    warn "command missing: $name"
  fi
}

check_file() {
  local path="$1"
  local label="$2"
  if [ -e "$path" ]; then
    pass "$label exists: $path"
  else
    warn "$label missing: $path"
  fi
}

echo "== Dotfiles doctor =="

if [ -d "$repo" ]; then
  pass "repo found: $repo"
else
  fail "repo missing: $repo"
fi

check_file "$HOME/.zshrc" "zsh entrypoint"
check_file "$HOME/.tmux.conf" "tmux config"
check_file "$HOME/.config/nvim/init.lua" "nvim config"
check_file "$HOME/.config/ghostty/config" "ghostty config"
check_file "$repo/install/link.sh" "link script"

check_cmd zsh
check_cmd git
check_cmd nvim
check_cmd tmux
check_cmd fzf
check_cmd fd

if [ -f "$repo/.zshrc" ]; then
  shopt -s nullglob
  zsh_files=("$repo/.zshrc" "$repo/.zprofile" "$repo"/.config/zsh/*.zsh)
  if zsh -n "${zsh_files[@]}"; then
    pass "zsh config syntax is valid"
  else
    fail "zsh config syntax check failed"
  fi
fi

for script in \
  "$repo/.config/scripts/tmux-chooser.sh" \
  "$repo/.config/scripts/tmux-session-dispensary.sh"
do
  if [ -f "$script" ]; then
    if bash -n "$script"; then
      pass "bash syntax is valid: $script"
    else
      fail "bash syntax check failed: $script"
    fi
  fi
done

if command -v nvim >/dev/null 2>&1; then
  if nvim --headless "+qa" >/dev/null 2>&1; then
    pass "nvim headless startup is healthy"
  else
    fail "nvim headless startup failed"
  fi
fi

echo
echo "Summary: $errors failure(s), $warnings warning(s)"

if [ "$errors" -gt 0 ]; then
  exit 1
fi
