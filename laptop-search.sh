#!/bin/bash

#auth: root
#name: laptop-search.sh
#desc: searches laptop backups based on the user's options

LAPTOP_BACKUP_PATH="/home/pi/BACKUP/laptop/backup"

echo "return latest backups        [0]"
echo "search for a specific backup [1]"
read SEARCH_OPTION

if [ "$SEARCH_OPTION" == "0" ]; then
        echo
        echo "LAPTOP BACKUPS"
        echo "----------------------"
        echo "[most recent]"
        find $LAPTOP_BACKUP_PATH | sort -n -r | sed -n "1p"	#display lastest backup
        echo "----------------------"
	find $LAPTOP_BACKUP_PATH | sort -n -r | tail -n -5	#display 5 latest backups
fi

if [ "$SEARCH_OPTION" == "1" ]; then
	echo
	echo "enter a specific date (dd-mm-yyyy)"
	read DATE
	echo
	echo "searching..."
	find $LAPTOP_BACKUP_PATH | grep $DATE	#search for backup with that date
	echo
fi
