#!/bin/bash
#title          :mysqlinstall.sh
#description	:Performs MySQL Installations and sets up ports and starts the service
#author         :Rithika Raghav
#date           :20200608
#version        :1.0
#usage		:mysqlinstall.sh
#notes          :
#=========================================================================================================================================

ssh-keygen
sudo apt update
sudo apt install mysql-server
sudo mysql_secure_installation 
systemctl status mysql.service
sudo ufw allow 8000
sudo ufw allow 3306
sudo service mysql reload 
sudo systemctl stop mysql-server
sudo service mysql restart
