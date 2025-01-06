#!/bin/bash
USERID=$(id -u)
R="\e[31m"
Y="\e[32m"
R="\e[33m"
VALIDATE(){
    if [ $1 -ne 0 ]
        then    
                echo -e "$2  $R failure"
                exit 1
     else
        echo -E "$2  $G success"

     fi              
}
if [ $USERID -ne 0 ]
    then
         echo -e " $R error :: you must have root access to execute the command"
         exit 1
 fi
 dnf list installed mysql
 if [ $? -ne 0 ]  
    then
            dnf install mysql -y
            VALIDATE $? "installing mysql"
    else    
         echo -e " $Y my sql is already installed"
 fi

 dnf list installed git
 if [ $? -ne 0 ] 
    then
            install dnf git -y
            VALIDATE $? "installing git"
     else
          echo echo -e " $Y git is already installed"
fi               