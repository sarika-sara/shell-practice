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
pack=( "mysql" "python3" "nginx")
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

for packs in ${pack[@]}
do

dnf list installed $packs &>>$log_file

if [ $? -ne 0 ]
then
    echo -e "$R $packs is not installed...$G Installing" | tee -a $log_file
    
dnf install $packs -y &>>$log_file
VALID $? "$packs"

else
    echo -e "$Y $packs is already installed" | tee -a $log_file
   
fi

done
