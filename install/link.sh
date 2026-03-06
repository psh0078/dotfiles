#!/usr/bin/env bash

set -euo pipefail

repo="${DOTFILES_DIR:-$HOME/dotfiles}"
target="$HOME"
migrate=0
simulate=0

for arg in "$@"; do
  case "$arg" in
    --migrate)
      migrate=1
      ;;
    --simulate|-n)
      simulate=1
      ;;
    *)
      echo "Unknown option: $arg"
      echo "Usage: $0 [--migrate] [--simulate]"
      exit 1
      ;;
  esac
done

links=(
  ".zshrc"
  ".zprofile"
  ".tmux.conf"
  ".gitconfig"
  ".ghostty"
  ".config/aerospace/aerospace.toml"
  ".config/ghostty/config"
  ".config/zsh/00-env.zsh"
  ".config/zsh/10-path.zsh"
  ".config/zsh/20-aliases.zsh"
  ".config/zsh/30-tools.zsh"
  ".config/zsh/90-local.zsh.example"
  ".config/tmux/themes/dark.conf"
  ".config/tmux/themes/light.conf"
  ".config/scripts/tmux-chooser.sh"
  ".config/scripts/tmux-session-dispensary.sh"
)

if [ ! -d "$repo" ]; then
  echo "repo directory missing: $repo"
  exit 1
fi

resolve_path() {
  python3 - "$1" <<'PY'
import os
import sys
print(os.path.realpath(sys.argv[1]))
PY
}

maybe_remove_legacy_link() {
  local rel="$1"
  local path="$target/$rel"
  if [ -L "$path" ]; then
    if [ "$simulate" -eq 1 ]; then
      echo "Would remove legacy symlink: $path"
    else
      rm "$path"
      echo "Removed legacy symlink: $path"
    fi
  fi
}

link_one() {
  local rel="$1"
  local src="$repo/$rel"
  local dst="$target/$rel"
  local backup="${dst}.backup-$(date +%Y%m%d%H%M%S)"

  if [ ! -e "$src" ]; then
    echo "WARN missing source: $src"
    return
  fi

  if [ -L "$dst" ]; then
    local src_real dst_real
    src_real="$(resolve_path "$src")"
    dst_real="$(resolve_path "$dst")"
    if [ "$src_real" = "$dst_real" ]; then
      echo "OK already linked: $dst"
      return
    fi
    if [ "$migrate" -eq 1 ]; then
      if [ "$simulate" -eq 1 ]; then
        echo "Would relink symlink: $dst -> $src"
      else
        rm "$dst"
        ln -s "$src" "$dst"
        echo "Relinked symlink: $dst -> $src"
      fi
    else
      echo "WARN symlink points elsewhere: $dst"
    fi
    return
  fi

  if [ -e "$dst" ]; then
    if cmp -s "$src" "$dst"; then
      if [ "$migrate" -eq 1 ]; then
        if [ "$simulate" -eq 1 ]; then
          echo "Would replace identical file with symlink: $dst -> $src"
        else
          rm "$dst"
          ln -s "$src" "$dst"
          echo "Linked identical file: $dst -> $src"
        fi
      else
        echo "WARN identical file exists (use --migrate): $dst"
      fi
    else
      if [ "$migrate" -eq 1 ]; then
        if [ "$simulate" -eq 1 ]; then
          echo "Would backup and replace: $dst -> $backup"
          echo "Would create symlink: $dst -> $src"
        else
          mv "$dst" "$backup"
          ln -s "$src" "$dst"
          echo "Backed up and linked: $dst -> $src"
        fi
      else
        echo "WARN conflict exists (use --migrate): $dst"
      fi
    fi
    return
  fi

  if [ "$simulate" -eq 1 ]; then
    echo "Would create symlink: $dst -> $src"
    return
  fi

  mkdir -p "$(dirname "$dst")"
  ln -s "$src" "$dst"
  echo "Linked: $dst -> $src"
}

if [ "$migrate" -eq 1 ]; then
  maybe_remove_legacy_link ".config/scripts"
  maybe_remove_legacy_link ".config/ghostty"
  maybe_remove_legacy_link ".config/zsh"
  maybe_remove_legacy_link ".config/tmux"
  maybe_remove_legacy_link ".config/aerospace"
  maybe_remove_legacy_link ".local/bin/tmux-chooser"
  maybe_remove_legacy_link ".local/bin/tmux-session-dispensary"
fi

echo "Linking dotfiles from $repo to $target"
for rel in "${links[@]}"; do
  link_one "$rel"
done
echo "Done"
