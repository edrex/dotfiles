# basics
ok directory $HOME/src                       # presence of the ~/code directory
#ok github $HOME/src/dotfiles edrex/dotfiles # presence, drift of git repository in ~/code/dotfiles

ok github $HOME/src/bork edrex/bork
ok directory $HOME/bin
cd $HOME/bin
ok symlink bork $HOME/src/bork/bin/bork
ok symlink bork-compile $HOME/src/bork/bin/bork-compile 

