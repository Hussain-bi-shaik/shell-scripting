#!/bin/bash

DISK_USAGE=$(df -hT | grep xfs)
DISK_THRESHOLD=5 # in real projects will moniter for 70
MSG=" "
while read -r line
do
    USAGE=$(echo $line | awk -F " " '{print $6F}' | cut -d "%" -f1)
    PARTITION=$(echo $line | awk -F " " '{print $NF}')
    if [ $USAGE -ge $DISK_THRESHOLD ]
       then
            MSG+="High disk usage on partition: $PARTITION usage is: $USAGE \n"
     fi
     done <<<$DISK_USAGE
     echo -e "message: $MSG"
     exho "$ MSG | mutt -5 High disk usage" shabanashaik745@gmail.com 
           