#!/bin/bash

#-----1-----
USERID=$(id -u)
#checks user id
if [ $USERID -eq 0 ]

then 
   echo "User has root access"
   dnf list installed mysql

#if userid =0 then it prints "User has root access"
#then it runs the cmd list installed mysql 
#if installed it shows exit_code of 0 else 1

    if [ $? -ne 0 ]
    then
    echo "mysql is not installed...goin to install"
    dnf install mysql -y
#if mysql is not installed then the give condition is true 
#now it runs the install cmd
#if installed it shows exit_code of 0 else 1

 if [ $? -eq 0 ]
then
    echo "Installation is ....Successful"    #if exit_code is 0 then it prints  
                                             
    echo "Installation is ....Failure"
    exit 1                                   #else it prints failure and stops running the script
fi 
else
    echo "mysql is already installed"        #if exit_code is 1 then it prints and exits
    exit 1
fi
else
   echo "User doesn't have root access"      #if user_id !=0 it directly prints and exits
 
fi
