FPATH="$(brew --prefix)/share/zsh/site-functions:${FPATH}"
eval "$(nodenv init -)"
eval "$(rbenv init -)"

export PATH="/usr/local/sbin:$PATH"
