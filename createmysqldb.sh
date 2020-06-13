#!/bin/bash
#title          :createmysqldb.sh
#Description	:Creates MySQL database, user, and grants privileges to user
#author         :Rithika Raghav
#date           :20200608
#version        :1.0
#usage		:createmysqldb.sh "dbname" "username" "password"
#notes          :
#=========================================================================================================================================

dbname=$1
username=$2
password=$3

echo "create database $dbname;" | sudo mysql -u root
echo "create user $username identified by '$password';" | sudo mysql -u root 
echo "grant all privileges on $dbname.* to $username; flush privileges;" | sudo mysql -u root
