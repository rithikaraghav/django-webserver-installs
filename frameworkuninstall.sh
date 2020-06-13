#!/bin/bash
#title          :frameworkuninstall.sh
#description	:Uninstalls all modules if you want to start from scratch
#author         :Rithika Raghav
#date           :20200608
#version        :1.0
#usage		:frameworkuninstall.sh
#notes          :
#=========================================================================================================================================

sudo apt-get purge nginx nginx-common
sudo apt-get remove python3-pip
sudo apt-get remove python3-dev
sudo apt-get remove postgresql
sudo apt-get remove postgresql-contrib
sudo apt-get remove libpq-dev
pip3 uninstall django
pip3 uninstall aioapns
pip3 uninstall twilio
pip3 uninstall mysql-connector
pip3 uninstall djangorestframework
pip3 uninstall gunicorn
pip3 uninstall psycopg2-binary
