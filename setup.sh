#!/bin/bash

#auth: Lysergic
#name: setup.sh
#desc: buids directories and completes the more dull tasks
#note: creates cronjob and rsa keys

mkdir backup
mkdir backup/temp 	#create folders
mkdir backup/log
mkdir backup/auth

DIR=$(pwd) 	#define working directory for adaptability
touch backup/log/upload.log #create logging file

echo "   LOG FOR UPLOAD.SH   " >> backup/log/upload.log #set up logging file
echo "-----------------------" >> backup/log/upload.log
echo "" >> backup/log/upload.log

echo "id_rsa     : stays on THIS machine (the one being backup(ed)" > backup/auth/info.txt
echo "id_rsa.pub : stays on the machine HOLDING the backups" >> backup/auth/info.txt	#create help information for the user
echo "backup/auth/id_rsa" | ssh-keygen -t rsa

crontab -l > temp_cron
echo "" >> temp_cron 	#create cron job
echo "#cron task for automating backup process" >> temp_cron
echo "@reboot $DIR/backup/upload.sh" >> temp_cron
crontab temp_cron
rm temp_cron

touch backup/upload.sh
mv $DIR/upload.sh $DIR/backup/upload.sh