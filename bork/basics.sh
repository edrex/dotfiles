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

# for vim backups
ok directory ~/.tmp

ok github $HOME/.oh-my-zsh robbyrussell/oh-my-zsh
ok loginshell $(which zsh)

ok directory "$HOME/.ssh"
ok check "[ -e $HOME/.ssh/*.pub ]"
if check_failed && satisfying; then
    echo "Generating SSH Key"
    ssh-keygen -t rsa
fi

ok check "[ -d $HOME/.emacs.d ]"
if check_failed && satisfying; then
    ok github $HOME/.emacs.d syl20bnr/spacemacs
fi

cd $HOME
ok symlink .password-store Documents/.password-store

case $platform in
    Darwin)
        ok brew
        ok brew git

        ok cask gpgtools
        ok brew pass
        ok cask qtpass
        ok brew pwgen

        ok cask iterm2
        ok brew hub
        ok cask emacs
        ok brew the_silver_searcher
        ok cask flux

        ok brew go
        ;;
    Linux)
        ;;
    *) ;;
esac

# for emacs golang
ok go-get github.com/nsf/gocode
ok go-get github.com/rogpeppe/godef
ok go-get golang.org/x/tools/cmd/guru
ok go-get golang.org/x/tools/cmd/gorename
ok go-get golang.org/x/tools/cmd/goimports
