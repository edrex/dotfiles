cd $HOME
for file in $HOME/src/dotfiles/configs/*
do
  ok symlink ".$(basename $file)" $file
done

ok directory "$HOME/bin"
cd $HOME/bin
for file in $HOME/src/dotfiles/bin/*
do
    ok symlink "$(basename $file)" $file
done

ok github $HOME/.oh-my-zsh robbyrussell/oh-my-zsh
ok loginshell $(which zsh)

ok directory "$HOME/.ssh"
ok check "[ -e $HOME/.ssh/*.pub ]"
if check_failed && satisfying; then
    echo "Generating SSH Key"
    ssh-keygen -t rsa
fi

case $platform in
    Darwin)
        ok brew
        ok brew git
        ok cask gpgtools
        ok brew hub
        ok cask emacs
        ok brew the_silver_searcher
        ok cask flux
        ;;
    Linux)
        ;;
    *) ;;
esac
