##Backup-Automation

#Usage guide for "setup.sh"
Bash script will generate folders for "upload.sh" to execute, create a cronjob to execute "upload.sh" on reboot.
Essentially, "setup.sh" will generate and automate all the dull things to save fifteen glorious seconds.

#Usage guide for "upload.sh"

Bash script will connect to external machine (ip address of machine hardcoded into script) and upload a compressed
directory (MAKE SURE TO CHANGE SOURCE) to defined directory (MAKE SURE TO CHANGE SOURCE).

notes::
upload.sh 	should be executed on the machine CONNECTING to the backup server and is the one BEING backed up
id_rsa 		should be kept locally and it used for easy authentication to the server
id_rsa.pub 	should be placed on the SERVER which is STORING the backups for easy authentication (.ssh/authorized_keys)

Script is executed by cron job sheduled every system reboot. Files will not be executed and only stored.
This script is for basic backups and should NOT be used for anything formal.

IMPORTANT: remember to keep server up and running or script will fail, no upload exceptions implemented.

Compression type: bzip2, tar
