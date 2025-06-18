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

#----2----

# $? checks exit status of top code and continues
# if exit code is =0 then it checks whether theres any installed mysql
# else it exits at exitcode 1 #1

dnf list installed mysql

if [ $? -ne 0 ]
then
    echo "mysql is not installed...goin to install"
    
dnf install mysql -y


if [ $? -eq 0 ]
then
    echo "Installation is ....Successful"
else
    echo "Installation is ....Failure"
    exit 1
fi 
else
    echo "mysql is already installed"
    
fi




dnf list installed python3

if [ $? -ne 0 ]
then
    echo "python3 is not installed...goin to install"
    
dnf install python3 -y

if [ $? -eq 0 ]
then
    echo "Installation is ....Successful"
else
    echo "Installation is ....Failure"
    exit 1
fi 
else
    echo "python3 is already installed"
    
fi


    dnf list installed nginx


if [ $? -ne 0 ]
then
    echo "nginx is not installed...goin to install"
    
dnf install nginx -y

if [ $? -eq 0 ]
then
    echo "Installation is ....Successful"
else
    echo "Installation is ....Failure"
    exit 1
fi 
else
    echo "nginx is already installed"
    exit 1
fi