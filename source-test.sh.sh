#!/bin/bash
source ./common.sh
SOURCE_DIR= "/home/ec2-user/app-log"

FILES_TO_DELETE=$(find $SOURCE_DIR -name "*.log" -mtime +14)
echo "files to be deleted: $FILES_TO_DELETE"
while read -r files  #here files is the variable name,you can give any name
 do
    echo "deleting files: $file" &>>$LOG_FILE_NAME
    rm -rf $file
    echo "deleted file : $file"
  done <<< $FILES_TO_DELETE