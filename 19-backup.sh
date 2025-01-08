#!/bin/bash

USERID=$(id -u)
R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\E[0m"

SOURCE_DIR=$1
DEST_DIR=$2
DAYS=${3:-14} #if user is not providing no. of days we are taking 14 days by deafault.

LOGS_FOLDER="/var/log/shellscript-logs"
LOG_FILE=$(echo $0 | cut -d "." -f1 )
TIMESTAMP=$(date +%Y-%m-%d-%H-%M-%S)
LOG_FILE_NAME="$LOGS_FOLDER/$LOG_FILE-$TIMESTAMP.log"  #the result will be delete-old-logs-time stamp.log /var/log/shellscript-logs/backup-20250108.log

USAGE(){
    echo -e "$R USAGE:: $N backup <SOURCE_DIR> <DEST_DIR> <DAYS(optional)>"
    exit 1
}

mkdir -p /home/ec2-user/shellscript-logs

if [ $# -lt 2 ] # $# means no of variables
then    
    USAGE
 fi
 if [ ! -d "$SOURCE_DIR" ] # -d checks if the source directory available or not.
    then   
      echo -e "$SOURCE_DIR does not exist..please check"
      exit 1
  fi 

  if [ ! -d "$DEST_DIR" ]  # -d checks if the dest directory available or not.
    then   
      echo -e "$DEST_DIR does not exist..please check"
      exit 1
  fi        

  echo "script started executing at: $TIMESTAMP"  &>>$LOG_FILE_NAME
  FILES=$(find $SOURCE_DIR -name "*.log" -mtime +$DAYS)

  if [ -n "$FILES" ] # true if there are files to zip.-n is used to verify if there are any files that need to be processed
    then
        echo "files are:$FILES"
        ZIP_FILE="$DEST_DIR/app-logs-$TIMESTAMP.zip"
        find $SOURCE_DIR -name "*.log" -mtime +$DAYS | zip -@ "$ZIP_FILE"

        if [ -f "$ZIP_FILE" ] #-f checks if the $ZIP_FILE (the zip file you want to create) exists and is a regular file
        then    
             echo -e "successfully created zip files for files older than $DAYS"
             while read -r filepath 
             do 
                echo "deleting file: $filepath" &>>$LOG_FILE_NAME
                rm -rf $filepath
                echo "deleted files : $filepath"
             done <<<$FILES
          else
                echo -e "$R Error: $N failed to create zip file"
                exit 1
            fi
         else   
                echo "no files found older than $DAYS"
                fi             
        