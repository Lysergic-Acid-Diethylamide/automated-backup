#!/bin/bash

#auth: Lysergic
#name: upload.sh
#desc: connects to backup server and uploads a target directory
#note: logging information is generated and stored in custom directory

echo "[$(date +"%d/%m/%Y--%H:%M:%S")] script activated"
#define paths for adaptability and/or customisability
UPLOAD_DIR=[DEFINE DIRECTORY YOU WANT BACKED UP] 	#example : root/work
DEST_DIR=[DEFINE DIRECTORY FOR NON-LOG BACKUPS] 	#example: BACKUPS/desktop-1/backups
LOCAL_DIR=$(pwd)
LOG_DIR=/var/log #linux log folder
LOG_DEST_DIR=[DEFINE DIRECTORY FOR LOG BACKUPS]		#example: BACKUPS/desktop-1/logs

#use the system time for organisation and unique filenaming
#dd/mm/yy
TIME=$(date +"%m-%d-%Y--%H-%M-%S")
TIME=${TIME,,}

#define filename for upload
UPLOAD_FILE=$LOCAL_DIR/temp/$TIME.tar.gz
UPLOAD_LOG=$LOCAL_DIR/temp/system_logs-$TIME.tar.gz
SERVER_NAME="[DEFINE IP OR HOSTNAME OF MACHINE STORING BACKUPS]"

echo "[$(date +"%d/%m/%Y--%H:%M:%S")] compressing $UPLOAD_DIR for upload.."
#compress target directories
tar -zcvf $UPLOAD_FILE $UPLOAD_DIR

echo
echo "[$(date +"%d/%m/%Y--%H:%M:%S")] compressing $LOG_DIR for upload.."
tar -zcf $UPLOAD_LOG $LOG_DIR

echo "[$(date +"%d/%m/%Y--%H:%M:%S")] connecting to $SERVER_NAME for upload.."

#connect to server through ssh with rsa key for automatic authentiation
scp -i $LOCAL_DIR/auth/id_rsa $UPLOAD_FILE pi@$SERVER_NAME:$DEST_DIR
echo "[$(date +"%d/%m/%Y--%H:%M:%S")] $UPLOAD_FILE transfer was successful.."

scp -i $LOCAL_DIR/auth/id_rsa $UPLOAD_LOG pi@$SERVER_NAME:$LOG_DEST_DIR
echo "[$(date +"%d/%m/%Y--%H:%M:%S")] $UPLOAD_LOG transfer was successful.."
echo "[$(date +"%d/%m/%Y--%H:%M:%S")] uploads successful, disconnecting"
#notify user that the uploads were successful

echo "[$(date +"%d/%m/%Y--%H:%M:%S")] removing $UPLOAD_FILE and $UPLOAD_LOG locally.."
#clean temp directoy
rm $LOCAL_DIR/temp/*

echo "[$(date +"%d/%m/%Y--%H:%M:%S")] execution successful, exiting."
echo "------------------------------------"
echo
