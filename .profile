export PATH=$HOME/bin:$HOME/.local/bin:$HOME/.cargo/bin:$HOME/.npm/bin:$PATH
export PATH="$PATH:$(ruby -e 'puts Gem.user_dir')/bin"

export SRCPATH=$HOME/src # where external source repositories get checked out
export MYSRCPATH=$SRCPATH/github.com/edrex

export HOMEREPO=$MYSRCPATH/dotfiles
export ETCREPO=$MYSRCPATH/etc

# Set up Node Version Manager
export NVM_DIR="$HOME/.nvm"                            # You can change this if you want.
export NVM_SOURCE="/usr/share/nvm"                     # The AUR package installs it to here.
[ -s "$NVM_SOURCE/nvm.sh" ] && . "$NVM_SOURCE/nvm.sh"  # Load NVM
nvm use 12

export GOPATH=$HOME
export GOROOT="$(go env GOROOT)"
export EDITOR=kak
# export EDITOR=vim
export NVIM_LISTEN_ADDRESS=/tmp/eric-nvimsocket
# export EDITOR=nsvc
export TERMINAL=sakura
# somehow this makes emacs daemon start automatically if not already
# https://stackoverflow.com/questions/5570451/how-to-start-emacs-server-only-if-it-is-not-started
export ALTERNATE_EDITOR=""

# like dark theme
export CALIBRE_USE_SYSTEM_THEME=1
export Wiki=$HOME/Documents/wikis/ericwiki
export FeelsWiki=$HOME/Documents/wikis/feels
export FZF_DEFAULT_COMMAND='fd --type file'

# source $HOME/.nix-profile/etc/profile.d/nix.sh
# Default value from
# https://standards.freedesktop.org/basedir-spec/basedir-spec-latest.html
#export XDG_DATA_DIRS=$HOME/.nix-profile/share:$HOME/.share:"${XDG_DATA_DIRS:-/usr/local/share/:/usr/share/}"
export XDG_DATA_DIRS="${XDG_DATA_DIRS:-/usr/local/share/:/usr/share/}"

# Start the gpg-agent if not already running
# if ! pgrep -x -u "${USER}" gpg-agent >/dev/null 2>&1; then
#  gpg-connect-agent /bye >/dev/null 2>&1
# fi

# Set SSH to use gpg-agent
unset SSH_AGENT_PID
# if [ "${gnupg_SSH_AUTH_SOCK_by:-0}" -ne $$ ]; then
#  export SSH_AUTH_SOCK="/run/user/$UID/gnupg/S.gpg-agent.ssh"
# fi
#ssh-add
