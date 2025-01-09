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