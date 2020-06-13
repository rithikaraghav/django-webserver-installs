#!/bin/bash
#title		:createuser.sh
#description	:Creates an app user that will contain the framework for a Django web server that uses Nginx, Gunicorn, and MySQL backbone
#author		:Rithika Raghav
#date		:20200608
#version	:1.0
#usage		:createuser.sh "username" "ipaddress" "password"
#notes		:
#=========================================================================================================================================

username=$1
ipaddress=$2
password=$3
adduser --quiet --disabled-password --shell /bin/bash --home /home/$username --gecos "User" $username
echo "$username:$password" | chpasswd
echo "USER $username CREATED SUCCESSFULLY [OK]"
usermod -aG sudo $username #this will ensure that you can do installations under the new user
chown $username mysqlinstall.sh 
chgrp $username mysqlinstall.sh
cp mysqlinstall.sh /home/$username
cp createmysqldb.sh /home/$username
cp frameworkinstall.sh /home/$username
cp frameworkuninstall.sh /home/$username
