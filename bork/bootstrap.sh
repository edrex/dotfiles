# case $platform in
#     Linux)
#         ok apt git
#         ;;
#     *) ;;
# esac

ok check "[ -f $HOME/.ssh/id_rsa ]"
if check_failed && satisfying; then
    ok check "ssh-keygen -t rsa -b 4096 -o -a 100 -f ~/.ssh/id_rsa"
fi

# echo "TODO: upload ssh key to github"
curl -u "edrex" --data '{"title":"${USER}@$(hostname -f)","key":"'"$(cat ~/.ssh/id_rsa.pub)"'"}' https://api.github.com/user/keys

# basics
ok directory $HOME/src

ok git $HOME/src/dotfiles git@github.com:edrex/dotfiles.git
ok git $HOME/src/bork git@github.com:edrex/bork.git

# github type doesn't work with bork-compile
# ok github $HOME/src/dotfiles edrex/dotfiles # presence, drift of git repository in ~/code/dotfiles
# ok github $HOME/src/bork edrex/bork
ok directory $HOME/bin
cd $HOME/bin
ok symlink bork $HOME/src/bork/bin/bork
ok symlink bork-compile $HOME/src/bork/bin/bork-compile 
