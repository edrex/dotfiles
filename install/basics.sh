cd $HOME
for file in $HOME/src/dotfiles/configs/*
do                                            # for each file in ~/code/dotfiles/configs,
  ok symlink ".$(basename $file)" $file       # presense of a symlink to file in ~ with a leading dot
done

ok directory "$HOME/.ssh"
ok check "[ -e $HOME/.ssh/*.pub ]"
if check_failed && satisfying; then
    echo "Generating SSH Key"
    ssh-keygen -t rsa
fi

