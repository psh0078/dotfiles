# .dotfiles

## Steps to bootstrap a new Mac

1. Install Apple's Command Line Tools, which are prerequisites for Git and Homebrew.

```zsh
xcode-select --install
```


2. Clone repo into new hidden directory.
3. Create symlinks in the Home directory to the real files in the repo. (Be sure to execute this command in \dotfiles)

```
stow .
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


## TODO List
- [ ] tidy up Brewfile (remove unused packages/dependencies)
- [x] add lazygit
- [ ] build a buffer navigation system 
- [ ] get tabout  to working
