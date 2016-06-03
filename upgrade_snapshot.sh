#!/bin/bash

# A script to upgrade the snapshot in Virtualbox
# after changes made to provisional ansible scripts


read -p "It's going to restore its original state, and remove everything. Are you sure? [Yy]" -n 1 -r
echo    # (optional) move to a new line
if [[ ! $REPLY =~ ^[Yy]$ ]]
then
    exit 1
fi

# Remove everything and restore to original state
vagrant snapshot restore latest

# Start VM and provision this VM
vagrant up --provision

# Stop VM and create new latest snapshot
vagrant halt
vagrant snapshot delete latest
vagrant snapshot save latest


read -p "Do you want to start the VM? [Yy]" -n 1 -r
echo    # (optional) move to a new line
if [[ ! $REPLY =~ ^[Yy]$ ]]
then
    exit 0
fi

# Start VM
vagrant up
