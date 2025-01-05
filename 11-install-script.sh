#!/bin/bash
USERID=$(id -u)  # id -u is to check the id of current user

if [ $USERID -ne 0 ]
  then
        echo "ERROR: you must have root access to install"
fi

dnf install mysql -y