ok check "fdesetup status | grep 'On'"
if check_failed; then
    echo "Filevault is not setup. Please enable filevault before continuing."
    open "/System/Library/PreferencePanes/Security.prefpane"
    exit 1
fi
if [ -n "$computer_name" ]; then
ok scutil ComputerName $computer_name
ok scutil HostName $computer_name
ok scutil LocalHostName $computer_name
fi

ok cask gpgtools

ok brew hub

ok cask emacs
