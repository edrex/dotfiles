#!/bin/sh

if [ "$#" -ne 1 ];
    then echo "Usage: ${0} user@host"
    exit
fi

HOST=$1

echo Bootstrapping dotfiles on $HOST

echo Compiling bootstrap script
bork compile bork/bootstrap.sh >compiled-bootstrap.sh

echo Copying pubkey to host
ssh-copy-id $HOST

echo Uploading script to host
scp compiled-bootstrap.sh $HOST:/tmp/
rm compiled-bootstrap.sh

echo Running script on host
# alloc psuedo tty for prompts
ssh -t -t $HOST bash /tmp/compiled-bootstrap.sh

echo TODO: setup syncthing
echo TODO: copy GPG keypair
