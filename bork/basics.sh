cd $HOME
for file in $HOME/src/dotfiles/configs/*
do
  # presense of a symlink to file in ~ with a leading dot
  ok symlink ".$(basename $file)" $file
done

ok directory "$HOME/bin"
cd $HOME/bin
for file in $HOME/src/dotfiles/bin/*
do
    ok symlink "$(basename $file)" $file
done


ok directory "$HOME/.ssh"
ok check "[ -e $HOME/.ssh/*.pub ]"
if check_failed && satisfying; then
    echo "Generating SSH Key"
    ssh-keygen -t rsa
fi

