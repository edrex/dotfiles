ANTIGEN_PATH=$HOME/src/github.com/zsh-users/antigen
source $ANTIGEN_PATH/antigen.zsh

# Load the oh-my-zsh's library.
antigen use oh-my-zsh

# Bundles from the default repo (robbyrussell's oh-my-zsh).
antigen bundle git
# antigen bundle heroku
# antigen bundle pip
antigen bundle golang
antigen bundle command-not-found

# Syntax highlighting bundle.
antigen bundle zsh-users/zsh-syntax-highlighting

# Load the theme.
antigen theme refined
# antigen theme robbyrussell
# antigen theme pure

# Tell Antigen that you're done.
antigen apply
