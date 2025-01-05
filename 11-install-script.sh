#!/bin/bash
USERID=$(id -u)  # id -u is to check the id of current user

if [ $USERID -ne 0 ]
  then
        echo "ERROR: you must have root access to install"
        exit 1  #otherthan zero
fi
dnf list installed mysql
if [ $? -ne 0 ]  # $? is to check exit status to the above command it is already there it give zero if not it give any other number
   then
        dnf install mysql -y

       if [ $? -NE 0 ] 
        then 
            echo "installing mysql ...failure"
            exit 1
        else
            echo "installing mysql...successfull"
        fi
  else
        echo "my sql is already installed"
 fi
 dnf list installed git
 if [ $? -ne 0 ] 
    then
        dnf install git -y
          if [ $? -ne 0 ] 
             then
                    echo "installing git ...failure"
                    exit 1
              else
                echo "installing git ...succesfull"
            fi
      else
            echo "git is already installed"      
  fi                                      