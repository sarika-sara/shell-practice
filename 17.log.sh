#!/bin/bash

#-----1-----
USERID=$(id -u)

R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"

logs_folder="/var/log/shell-script"
script_name=$(echo $0 | cut -d "." -f1)
log_file="$logs_folder/$script_name.log"

mkdir -p $logs_folder

#checks user id
if [ $USERID -eq 0 ]

then 
   echo -e "$G User has root access "
else
   echo -e "$R User doesn't have root access "
   exit 1
fi


VALID() {
if [ $1 -eq 0 ]
then
    echo -e " $N Installation of $2 is ....$G Successful"
else
    echo -e "$N Installation of $2 is ....$R Failure"
    exit 1
fi 
}

dnf list installed mysql &>>$log_file

if [ $? -ne 0 ]
then
    echo -e "$R mysql is not installed...$G Installing" | tee -a $log_file
    
dnf install mysql -y &>>$log_file
VALID $? "mysql"

else
    echo -e "$Y mysql is already installed" | tee -a $log_file
    
fi

dnf list installed python3 &>>$log_file

if [ $? -ne 0 ]
then
    echo  -e "$R python3 is not installed...$G Installing"| tee -a $log_file
    
dnf install python3 -y &>>$log_file
VALID $? "python3"

else
    echo -e "$Y python3 is already installed" | tee -a $log_file
    
fi


    dnf list installed nginx  &>>$log_file

if [ $? -ne 0 ]
then
    echo -e "$R nginx is not installed...$G Installing" | tee -a $log_file
    
dnf install nginx -y  &>>$log_file
VALID $? "nginx" 

else
    echo -e "$Y nginx is already installed" | tee -a $log_file
    exit 1
fi