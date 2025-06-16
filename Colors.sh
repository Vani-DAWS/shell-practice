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

# dnf list installed nginx
# if [ $? -ne 0 ]
# then
#     echo "$y nginx is not installed and proceed with installation"
#     dnf install nginx -y
#     if [ $? -eq 0]
#     then
#     echo "$G installation successful"
#     exit 1
#     else 
#     echo "$R Error:: $N installation failed"
#     fi
# else
#     echo "$Y nginx already installed"
# fi

# dnf list installed mysql
# if [ $? -ne 0 ]
# then
#     echo "$y mysql is not installed and proceed with installation"
#     dnf install mysql -y
#     if [ $? -eq 0]
#     then
#     echo "$G installation successful"
#     exit 1
#     else 
#     echo "$R Error:: $N installation failed"
#     fi
# else
#     echo "$Y mysql already installed"
# fi

function install_package{
    dnf list installed mysql
if [ $1 -ne 0 ]
then
    echo "$y $2 is not installed and proceed with installation"
    dnf install $2 -y
    if [ $1 -eq 0]
    then
    echo "$G installation successful"
    exit 1
    else 
    echo "$R Error:: $N installation failed"
    fi
else
    echo "$Y $2 already installed"
fi
}

install_package $1 "mysql"
install_package $1 "nginx"