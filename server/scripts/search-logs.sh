#!/bin/bash

#auth: Lysergic
#name: serach-logs.sh
#desc: searches laptop system logs based on the user's options

DESKTOP_LOG_PATH="DIRECTORY OF WHERE BACKUPED LOGS ARE HELD"

echo "return latest log         [0]"
echo "search for a specific log [1]"
read SEARCH_OPTION

if [ "$SEARCH_OPTION" == "0" ]; then
        echo
        echo "LAPTOP LOGS"
        echo "----------------------"
        echo "[most recent]"
        find $DESKTOP_LOG_PATH | sort -n -r | sed -n "1p"     #display lastest log
        echo "----------------------"
        find $DESKTOP_LOG_PATH | sort -n -r | tail -n -5      #display 5 latest logs
fi

if [ "$SEARCH_OPTION" == "1" ]; then
        echo
        echo "enter a specific date (dd-mm-yyyy)"
        read DATE
        echo
        echo "searching..."
        find $DESKTOP_LOG_PATH | grep $DATE   #search for log with that date
        echo
fi
