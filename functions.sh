#!/bin/bash

#!/bin/bash

USERID=$(id -u)
R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"

if [ $USERID -ne 0 ]
then
    echo -e "$Y Please run with root user"
    exit 1
else
    echo -e "$G User is a root user and proceed with installation"
fi

dnf list installed nginx
if [ $? -ne 0 ]
then
    echo "$y nginx is not installed and proceed with installation"
    dnf install nginx -y
    validate $? "nginx"
else
    echo "$Y nginx already installed"
fi

dnf list installed mysql
if [ $? -ne 0 ]
then
    echo "$y mysql is not installed and proceed with installation"
    dnf install mysql -y
    validate $? "mysql"
else
    echo "$Y mysql already installed"
fi

validate(){
    if [ $1 -eq 0]
    then
    echo "$G installation of $2 successful"
    exit 1
    else 
    echo "$R Error:: $N $2 installation failed"
    fi
}

