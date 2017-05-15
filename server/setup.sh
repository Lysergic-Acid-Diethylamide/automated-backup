#!/bin/bash

#auth: Lysegic
#name: setup.sh
#desc: sets up server folders and files

#add custom commands to bash_aliases
cat commands.txt >> .bash_aliases

#add text to banner
##uncomment to add bash banner
echo "/scripts/storage-capacity.sh" >> .bashrc
