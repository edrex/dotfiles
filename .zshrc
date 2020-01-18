source ~/.aliases
# Start fasd
eval "$(fasd --init auto)"

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
antigen bundle zsh-users/zsh-autosuggestions
# Syntax highlighting bundle.
antigen bundle zsh-users/zsh-syntax-highlighting

# Load the theme.
antigen theme refined
# antigen theme robbyrussell
# antigen theme pure

# Tell Antigen that you're done.
antigen apply

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# using ripgrep combined with preview
# find-in-file - usage: fif <searchTerm>
fif() {
  if [ ! "$#" -gt 0 ]; then echo "Need a string to search for!"; return 1; fi
  rg --files-with-matches --no-messages "$1" | fzf --preview "highlight -O ansi -l {} 2> /dev/null | rg --colors 'match:bg:yellow' --ignore-case --pretty --context 10 '$1' || rg --ignore-case --pretty --context 10 '$1' {}"
}

# make project
# cd dir
# git init
# git remote

p() {

}
