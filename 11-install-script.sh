#!/bin/bash
USERID=$(id -u)  # id -u is to check the id of current user

if [ $USERID -ne 0 ]
  then
        echo "ERROR: you must have root access to install"
        exit 1
fi

dnf install mysql -y