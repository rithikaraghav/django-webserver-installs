#!/bin/bash
#title          :frameworkinstall.sh
#Description	:Installs the following modules
#		:python3-pip				//For pip installs
#		:python3-dev				//Python Development Package for building Python extensions
#		:libpq-dev				//For postgresql, optional
#		:postgresql				//SQL Database, optional
#		:postgresql-contrib			//SQL Database, optional
#		:nginx					//HTTP Server
#		:curl					//for testing Gunicorn via command line
#		:virtualenv   				//Virtual Environment
#		:django   				//Python Web Framework
#		:gunicorn   				//WSGI HTTP Server for Unix
#		:psycopg2-binary			//Provides thread safety and used for API implementation
#		:djangorestframework   			//for Rest APIs
#		:aioapns  				//for IOS Push Notifications
#		:twilio	  				//for SMS Text Notifications
#		:mysql-connector   			//Connection from Python to MySQL Database
#author         :Rithika Raghav
#date           :20200608
#version        :1.0
#usage          :frameworkinstall.sh "ipaddress" "virtualenv" "projectname" "appname"
#notes          :
#=========================================================================================================================================

ipaddress=$1
virtualenvname=$2
projectname=$3
appname=$4
sudo apt install python3-pip python3-dev libpq-dev
sudo apt install postgresql postgresql-contrib nginx curl
sudo apt install virtualenv
mkdir djangoprojects
virtualenv -p python3 $virtualenvname
source $virtualenvname/bin/activate
pip3 install django gunicorn psycopg2-binary
pip3 install djangorestframework
pip3 install aioapns
pip3 install twilio
pip3 install mysql-connector
cd ~/djangoprojects/$virtualenvname/bin
django-admin startproject $projectname ~/djangoprojects
cd ~/djangoprojects
python manage.py startapp $appname
cd ~/djangoprojects/$projectname
sed -i 's/^ALLOWED_HOSTS.*$/ALLOWED_HOSTS = ['\"$ipaddress'\",'\"localhost'\"]/g' ~/djangoprojects/$projectname/settings.py
echo -e "STATIC_ROOT = os.path.join(BASE_DIR, 'static/')" >> ~/djangoprojects/$projectname/settings.py
python ~/djangoprojects/manage.py migrate
python ~/djangoprojects/manage.py makemigrations
