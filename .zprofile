
# Setting PATH for Python 3.9
# The original version is saved in .zprofile.pysave
# PATH="/Library/Frameworks/Python.framework/Versions/3.9/bin:${PATH}"
# export PATH

# # Added by `rbenv init` on Thu Aug  1 15:29:59 +07 2024
# eval "$(rbenv init - --no-rehash zsh)"
#
# # Setting PATH for Python 3.13
# # The original version is saved in .zprofile.pysave
# PATH="/Library/Frameworks/Python.framework/Versions/3.13/bin:${PATH}"
# export PATH
#
# ~/.zprofile

# Homebrew (Apple Silicon)
if [[ -d /opt/homebrew/bin ]]; then
  export PATH="/opt/homebrew/bin:/opt/homebrew/sbin:$PATH"
fi

# Python Framework (optional)
if [[ -d /Library/Frameworks/Python.framework/Versions/3.13/bin ]]; then
  export PATH="/Library/Frameworks/Python.framework/Versions/3.13/bin:$PATH"
fi

# rbenv
if command -v rbenv >/dev/null 2>&1; then
  eval "$(rbenv init - zsh --no-rehash)"
fi

