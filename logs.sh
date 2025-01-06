#!/bin/bash
USERID=$(id -u)
LOGS_FOLDER="/var/log/shellscript-logs"
LOG_FILE=$(echo $0 | cut -d "." -f1)
TIMESTAMP=$(date +%y-%m-%d-%h-%m-%s)
LOG_FILE_NAME="$LOGS_FOLDER|$LOGS_FILE-$TIMESTAMP.log$"
R="\e[31m"
G="\e[32m"
Y="\e[33m"
VALIDATE(){
    if [ $1 -ne 0 ]
        then    
                echo -e "$2...$R failure"
                exit 1
     else
        echo -e "$2...$G success"

     fi              
}
echo "script executed at : "$TIMESTAMP" &>>$LOG_FILE_NAME
if [ $USERID -ne 0 ]
    then
         echo -e "$R...error :: you must have root access to execute the command"
         exit 1
 fi
 dnf list installed mysql &>>$LOG_FILE_NAME
 if [ $? -ne 0 ]  
    then
            dnf install mysql -y &>>$LOG_FILE_NAME
            VALIDATE $? "installing mysql"
    else    
         echo -e "my sql is already...$Y installed"
 fi

 dnf list installed git &>>$LOG_FILE_NAME
 if [ $? -ne 0 ] 
    then
            install dnf git -y &>>$LOG_FILE_NAME
            VALIDATE $? "installing git"
     else
          echo -e "git is already...$Y installed"
fi               