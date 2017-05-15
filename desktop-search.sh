#!/bin/bash

#auth: root
#name: desktop-search.sh
#desc: search desktop backups based on the user's options

DESKTOP_BACKUP_PATH="/home/pi/BACKUP/desktop/backup"

echo "return latest backups        [0]"
echo "search for a specific backup [1]"
read SEARCH_OPTION

if [ "$SEARCH_OPTION" == "0" ]; then
        echo
        echo "DESKTOP BACKUPS"
        echo "----------------------"
        echo "[most recent]"
        find $DESKTOP_BACKUP_PATH | sort -n -r | sed -n "1p"	#display latest backup
        echo "----------------------"
	find $DESKTOP_BACKUP_PATH | sort -n -r | tail -n -5	#display 5 latest backups
fi

if [ "$SEARCH_OPTION" == "1" ]; then
	echo
	echo "enter a specific date (dd-mm-yyyy)"
	read DATE
	echo
	echo "searching..."
	find $DESKTOP_BACKUP_PATH | grep $DATE	#search for backup with that date
	echo
fi
