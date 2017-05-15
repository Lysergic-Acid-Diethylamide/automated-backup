#!/bin/bash

#auth: root
#name: nuke.sh
#desc: wipes all backups

BACKUP_DIR="/home/pi/BACKUP"

echo "are you sure you want to delete all files? y/n"
read OPTION	#check with the user

if [ "$OPTION" == "y" ];then
	PASS=$RANDOM

	echo "to confirm please re-enter this code $PASS"
	read AUTH	#enter random password to avoid mistakes
	if [ "$PASS" == "$AUTH" ]; then
		echo "playing: \"Global Thermonuclear War\""
		find $BACKUP_DIR -exec shred {} \;	#shred backups
		echo "nuked all logs!"
		echo "exiting..."
	fi
fi
