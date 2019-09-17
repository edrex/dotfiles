export PATH=$HOME/bin:$HOME/.local/bin:$HOME/.cargo/bin:$HOME/.npm/bin:$PATH
export SRCPATH=$HOME/src # where external source repositories get checked out
export MYSRCPATH=$SRCPATH/github.com/edrex
export HOMEREPO=$MYSRCPATH/dotfiles
export ETCREPO=$MYSRCPATH/etc
export GOPATH=$HOME
export GOROOT="$(go env GOROOT)"
export EDITOR=vim
# export EDITOR=nsvc
export TERMINAL=termite
# somehow this makes emacs daemon start automatically if not already
# https://stackoverflow.com/questions/5570451/how-to-start-emacs-server-only-if-it-is-not-started
export ALTERNATE_EDITOR=""

source $HOME/.nix-profile/etc/profile.d/nix.sh
# Default value from
# https://standards.freedesktop.org/basedir-spec/basedir-spec-latest.html
export XDG_DATA_DIRS=$HOME/.nix-profile/share:$HOME/.share:"${XDG_DATA_DIRS:-/usr/local/share/:/usr/share/}"
source ~/.aliases

# Start fasd
eval "$(fasd --init auto)"

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
