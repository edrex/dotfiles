export PATH=$HOME/bin:$HOME/.npm/bin:/Applications/Emacs.app/Contents/MacOS/bin:$PATH
export SRCPATH=$HOME/src # where external source repositories get checked out
export MYSRCPATH=$SRCPATH/github.com/edrex
export HOMEREPO=$MYSRCPATH/dotfiles
export GOPATH=$HOME
export GOROOT="$(go env GOROOT)"
export EDITOR=vim

# somehow this makes emacs daemon start automatically if not already
# https://stackoverflow.com/questions/5570451/how-to-start-emacs-server-only-if-it-is-not-started
export ALTERNATE_EDITOR=""

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
