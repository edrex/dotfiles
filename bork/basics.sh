DF=$HOME/src/dotfiles

pushd $HOME
    for file in "$DF"/configs/*
    do
    ok symlink ".$(basename $file)" $file
    done
popd

ok directory "$HOME/bin"
pushd $HOME/bin
    for file in "$DF"/bin/*
    do
        ok symlink "$(basename $file)" $file
    done
popd

# for vim backups
ok directory ~/.tmp

ok directory "$HOME/.ssh"
ok check "[ -e $HOME/.ssh/*.pub ]"
if check_failed && satisfying; then
    echo "Generating SSH Key"
    ssh-keygen -t rsa
fi

cd $HOME
ok symlink .password-store Documents/.password-store

case $platform in
    Darwin)
        ok brew
        ok brew git
        ok brew zsh

        ok cask gpgtools
        ok brew pass
        ok cask qtpass
        ok brew pwgen

        ok cask iterm2
        ok cask hyper
        ok brew hub
        # the railwaycat emacs port works better than the official one IMO
        ok brew-tap railwaycat/emacsmacport
        ok cask emacs-mac
        # ok cask emacs
        pushd $HOME/bin
            ok symlink emacs "$DF"/misc/emacs-mac.sh
        popd
        ok brew ripgrep
        ok cask flux
        ok brew node
        ok npm tern

        ok brew syncthing
        if did_install; then
            brew services start syncthing
        fi
        ok cask launchcontrol
        ok brew go

        ok brew python3

        ok brew-tap caskroom/fonts
        ok cask font-inconsolata-for-powerline
        ok cask font-fira-code
        ok cask android-studio
        ok cask java
        ok brew mas
        ok mas 497799835 Xcode
        ok brew mpv
        ok cask amethyst
        ;;
    Linux)
        ;;
    *) ;;
esac

register types/shells.sh
ok shells $(which zsh)
ok loginshell $(which zsh)

ok github $HOME/.oh-my-zsh robbyrussell/oh-my-zsh

ok check "[ -d $HOME/.emacs.d ]"
if check_failed && satisfying; then
    ok github $HOME/.emacs.d syl20bnr/spacemacs
fi


# for emacs golang
ok go-get github.com/nsf/gocode
ok go-get github.com/rogpeppe/godef
ok go-get golang.org/x/tools/cmd/guru
ok go-get golang.org/x/tools/cmd/gorename
ok go-get golang.org/x/tools/cmd/goimports
