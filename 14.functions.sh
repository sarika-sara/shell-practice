#!/bin/bash

#-----1-----
USERID=$(id -u)
#checks user id
if [ $USERID -eq 0 ]

then 
   echo "User has root access"
else
   echo "User doesn't have root access"
   exit 1
fi

VALID() {
if [ $1 -eq 0 ]
then
    echo "Installation of $2 is ....Successful"
else
    echo "Installation of $2 is ....Failure"
    exit 1
fi 
}

dnf list installed mysql

if [ $? -ne 0 ]
then
    echo "mysql is not installed...goin to install"
    
dnf install mysql -y
VALID $? "mysql"

else
    echo "mysql is already installed"
    
fi

dnf list installed python3

if [ $? -ne 0 ]
then
    echo "python3 is not installed...goin to install"
    
dnf install python3 -y
VALID $? "python3"

else
    echo "python3 is already installed"
    
fi


    dnf list installed nginx

if [ $? -ne 0 ]
then
    echo "nginx is not installed...goin to install"
    
dnf install nginx -y
VALID $? "nginx"

else
    echo "nginx is already installed"
    exit 1
fi