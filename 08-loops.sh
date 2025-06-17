#!/bin/bash

#!/bin/bash

USERID=$(id -u)
R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"
LOGS_FOLDER="var/log/shellscript-logs"
SCRIPT_NAME=$(echo $0 | cut -d "." -f1)
LOGS_FILE="$LOGS_FOLDER/$SCRIPT_NAME.log"
PACKAGES=("mysql" "nginx" "httpd")

mkdir -p $LOGS_FOLDER
echo "Script started:$(date)" | tee -a $LOGS_FILE

if [ $USERID -ne 0 ]
then
    echo -e "$Y Please run with root user" | tee -a $LOGS_FILE
    exit 1
else
    echo -e "$G User is a root user and proceed with installation" | tee -a $LOGS_FILE
fi

validate(){
    if [ $1 -eq 0 ]
    then
    echo -e "$G installation of $2 successful" | tee -a $LOGS_FILE
    exit 1
    else 
    echo -e "$R Error:: $N $2 installation failed" | tee -a $LOGS_FILE
    fi
}

for package in ${PACKAGES[@]}
do
dnf list installed $package &>>$LOGS_FILE
if [ $? -ne 0 ]
then
    echo -e "$Y $package is not installed and proceed with installation" | tee -a $LOGS_FILE
    dnf install $package -y | tee -a $LOGS_FILE
    validate $? "$package"
else
    echo -e "$R $package already installed" | tee -a $LOGS_FILE
fi
done



# dnf list installed nginx &>>$LOGS_FILE
# if [ $? -ne 0 ]
# then
#     echo -e "$Y nginx is not installed and proceed with installation" | tee -a $LOGS_FILE
#     dnf install nginx -y | tee -a $LOGS_FILE
#     validate $? "nginx"
# else
#     echo -e "$R nginx already installed" | tee -a $LOGS_FILE
# fi

# dnf list installed mysql &>>$LOGS_FILE
# if [ $? -ne 0 ]
# then
#     echo -e "$Y mysql is not installed and proceed with installation" | tee -a $LOGS_FILE
#     dnf install mysql -y | tee -a $LOGS_FILE
#     validate $? "mysql"
# else
#     echo -e "$Y mysql already installed" | tee -a $LOGS_FILE
# fi