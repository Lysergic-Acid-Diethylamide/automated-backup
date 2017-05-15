#!/bin/bash

#auth: Lysergic
#name: storage_statistics.sh
#desc: gathers and processes storage statistics to display to the user
#note: script is run in .bashrc upon opening a shell

output=$(df -k | grep /dev/root) #command returns storage statistics
IFS=" "				 #character to split output

declare -i counter
counter=0	#define counter for selecting correct argument

for val in $output; do
	counter=counter+1 #increment counter

	if [ "$counter" == "3" ];then #grabs storage used
		memUsed="$val"
	fi
	if [ "$counter" == "4" ];then #grabs storage remaining
		memRemaining="$val"
		break
	fi
done

#because bash out right refuses to use floats, use awk to calculate %
memUsedPercent=$(awk -v t1="$memUsed" -v t2="$memRemaining" 'BEGIN{print (t1/t2) * 100}')

#output for the user to read
echo "storage capactiy"
echo "[$memUsedPercent% used]"
echo
echo "used      $memUsed"
echo "availible $memRemaining"
echo "total     30582804 bytes" #machine I used had 38GB of storage hence 30582804
