#!/bin/bash

USERID=$(id -u)
R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\E[0m"

SOURCE_DIR= "/home/ec2-user/app-log"
LOGS_FOLDER="/var/log/shellscript-logs"
LOG_FILE=$(echo $0 | cut -d "." -f1 )
TIMESTAMP=$(date +%Y-%m-%d-%H-%M-%S)
LOG_FILE_NAME="$LOGS_FOLDER/$LOG_FILE-$TIMESTAMP.log"  #the result will be delete-old-logs-time stamp.log

VALIDATE(){
    if [ $1 -ne 0 ]
        then    
                echo -e "$2...$R failure $N"
                exit 1
     else
        echo -e "$2...$G success $N"

     fi              
}
CHECK_ROOT(){
    if [ $USERID -ne 0 ]
      then
            echo "error : you must have root access"
            exit 1
     fi       
}
echo "script executed at :$TIMESTAMP" &>>$LOG_FILE_NAME

FILES_TO_DELETE=$(find $SOURCE_DIR -name "*.log" -mtime +14)
echo "files to be deleted $FILES_TO_DELETE"
while read -r files
 do
    echo "deleting files: $file"
    rm -rf $file
  done <<< $FILES_TO_DELETE