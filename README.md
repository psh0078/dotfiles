# .dotfiles

## Steps to bootstrap a new Mac

1. Install Apple's Command Line Tools, which are prerequisites for Git and Homebrew.

```zsh
xcode-select --install
```


2. Clone repo into `~/dotfiles`.
3. Link dotfiles into `$HOME`.

```zsh
./install/link.sh --migrate
```

Preview changes only:

```zsh
./install/link.sh --simulate
```


4. Install Homebrew, followed by the software listed in the Brewfile.

```zsh
# These could also be in an install script.

# Install Homebrew

# Then pass in the Brewfile location...
brew bundle --file ~/.dotfiles/Brewfile

# ...or move to the directory first.
cd ~/.dotfiles && brew bundle
```


## Layout

- `.zshrc` is the shell entrypoint.
- `.config/zsh/*.zsh` contains modular shell config:
  - `00-env.zsh`: shared exports
  - `10-path.zsh`: PATH ordering
  - `20-aliases.zsh`: aliases
  - `30-tools.zsh`: tool initializers (opam, pyenv, bun, sdkman)
  - `90-local.zsh`: machine-specific overrides (untracked)
- tmux themes live in `.config/tmux/themes/`.
- tmux session script lives at `.config/scripts/tmux-session-dispensary.sh`.
- tmux startup chooser lives at `.config/scripts/tmux-chooser.sh`.
- Ghostty canonical config lives in `.config/ghostty/config`.
- this repo keeps canonical configs at root (`.zshrc`, `.tmux.conf`, `.config/...`) and links them into `$HOME` via `install/link.sh`.

## Health check

Run:

```zsh
./install/doctor.sh
```

## Safe rollback

This repo is git-tracked, so you can always inspect or discard changes.

```zsh
git status
git diff
git restore .
```
