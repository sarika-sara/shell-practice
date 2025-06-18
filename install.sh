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
 fi
 
 dnf install nginx -y
