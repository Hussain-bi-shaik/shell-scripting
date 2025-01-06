#!/bin/bash
USERID=$(id -u)
VALIDATE(){
    if [ $1 -ne 0 ]
        then    
                echo "$2 failure"
                exit 1
     else
        echo "$2 success"

     fi              
}
if [ $USERID -ne 0 ]
    then
         echo "error :: you must have root access to execute the command"
         exit 1
 fi
 dnf list installed mysql
 if [ $? -ne 0] 
    then
            dnf install mysql -y
            VALIDATE $? "installing my sql"
    else    
         echo "my sql is already installed"
 fi

 dnf list installed git
 if [ $? -ne 0 ] 
    then
            install dnf git -y
     else
          echo "git is already installed"
fi               