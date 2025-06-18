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

#now after checking installed mysql another exit code is generated 
#if exit code is now 0 it displays "mysql is already installed" else "mysql is not installed...goin to install"
if [ $? -ne 0 ]
then
    echo "mysql is not installed...goin to install"
else
    echo "mysql is already installed"
    exit 1
fi
#----3----

#again an exit code is generated here 
#if the exit code = 0 then it goes to the command install mysql
#if the exit code != 0 then it end at exit 1 #2

dnf install mysql -y

# after installing it produces another exit code 
#if the exit code = 0 then it prints Successful else Failure
if [ $? -eq 0 ]
then
    echo "Installation is ....Successful"
else
    echo "Installation is ....Failure"
    exit 1
fi 