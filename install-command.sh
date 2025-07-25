#!/bin/bash

USERID=$(id -u)

if [ $USERID -ne 0 ]
then
    echo "Please run with root user"
    exit 1
else
    echo "User is a root user and proceed with installation"
fi

# dnf install nginx -y
#     if [ $? -eq 0]
#     then
#     echo "installation successful"
#     exit
#     else 
#     echo "installation failed"
#     fi

dnf list installed mysql
if [ $? -ne 0 ]
then
    echo "mysql is not installed and proceed with installation"
    dnf install mysql -y
    if [ $? -eq 0]
    then
    echo "installation successful"
    exit 1
    else 
    echo "installation failed"
    fi
else
    echo "mysql already installed"
fi