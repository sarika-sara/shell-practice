#!/bin/bash

 #to install any application we should have root access 
 #we give condition that user id=0 as root id is 0

 USERID=$(id -u)

 if [ $USERID -ne 0 ]

 then  

      echo "You dont have root permissions"
# here shell doesnt end even after the condition is false and proceeds to install
# so we use exit code 0 for success and 1-127 is failure
    exit 1
#here userid !=0 so it prints "You dont have root permissions" and ends @exit code 1
 else
    echo "Root access is enabled"
 fi
 
#now it checks wether mysql is installed or not 
#exit status not equal to 0 true then it proceeds to next condition else prints package is already installed

dnf list installed mysql
if [ $? -ne 0 ]

then 
    echo "Package is not installed...now Installing"
else 
    echo "Package is already installed"
    exit 1
fi 

 dnf install mysql -y

if [ $? -eq 0 ]

then 
    echo "Installation is ....Successful"
else 
    echo "Installation is ....Failure"
    exit 1
fi