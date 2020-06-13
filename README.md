## 5 Minute Install of Django Framework with Nginx/Gunicorn HTTP Server for Mobile Application Development

This installation assumes that you have none of the following frameworks installed. If you have some of them installed already in your system, this installation instruction will not work. 

### About the Project 
Utilizing Django REST API Framework for Backend Mobile Application Development requires several steps and many modules to complete the installation. Manually completing this process takes a significant amount of time and trial/error. This project automates the installation process using scripts. 

### Built With
Bash Shell Scripts.

### Getting Started 
#### Prerequisites
You would need access to a Unix server with root access such as Ubuntu or Linux before you get started. This has been tested with Ubuntu in DigitalOcean Cloud Service. 

For SMS Messaging, you would need access to a service such as Twilio. Twilio Module Install is included in our scripts. If you are using a different service, you would need to edit frameworkinstall.sh script to install that particular service. 

You will also need to think of the following parameters for your project:
* Unix Username
* Unix Password
* Note down the IP Address of the server where you will be installing 
* You will be installing the framework in a virtual environment. So, think of a virtual environment name. 
* Think of a name for your Django project. 
* Think of a name for your Django app within the project. 


#### Usage 
* Clone the GIT Repo at: 
```
git clone https://github.com/
```
* Copy the following files from the clone to a folder under the root user. You can do this using a service such as SFTP:
    * createuser.sh
    * mysqlinstall.sh
    * createmysqldb.sh
    * frameworkinstall.sh
    * frameworkuninstall.sh
    * services.sh
* Log into root user 
```
ssh root@xxx.xxx.xx.xxx
```
* Run createuser.sh script which creates a Unix user that will contain the modules you will need. It also copies the other scripts that will be executed under that user to the home directory of the user. 
```
./createuser.sh "username" "ipaddress" "password"
```
* Exit from the root user and log into the new user that you just created. 
```
exit
ssh username@xxx.xxx.xx.xxx
```
* Run mysqlinstall.sh script which performs MySQL database installations, sets up the ports you will need, and starts the MySQL service. 
```
./mysqlinstall.sh
```
* You can skip all of the following when prompted by hitting enter during MySQL install. 
```
Generating public/private rsa key pair.
Enter file in which to save the key (/home/appuser/.ssh/id_rsa): 
Created directory '/home/appuser/.ssh'.
Enter passphrase (empty for no passphrase): 
Enter same passphrase again: 
Your identification has been saved in /home/appuser/.ssh/id_rsa.
Your public key has been saved in /home/appuser/.ssh/id_rsa.pub.
The key fingerprint is:
SHA256:JwP/Ov4LKYKKFgOanknEKOzgbu+ejEZcqFWu4jFQlFo appuser@mobileserver
The key's randomart image is:
+---[RSA 2048]----+
| ...             |
|  E .            |
|++.o  .          |
|B=...  o         |
|%o..    S .      |
|=@..     *       |
|*.O . . o .      |
|.@o .. ..o       |
|*.+*   .ooo.     |
+----[SHA256]-----+
```
* Run createmysqldb.sh script. This script creates the MySQL database and user. It also grants all privileges to the MySQL user that you create. 
```
./createmysqldb.sh "dbname" "username" "password"
```
* Test the database that you created from createmysqldb.sh script using a MySQL tool such as MySQLWorkbench. The connection parameters should look as follows. 

![](https://i.imgur.com/0FYb5iR.png)
* When you test the connection, it should provide you with a message similar to the following. 

![](https://i.imgur.com/waqwJa3.png)
* Run frameworkinstall.sh script. This contains all modules that you will need to get started on a Django REST API/MySQL project. It also contains the Nginx and Gunicorn Web Framework Install. 
```
./frameworkinstall.sh "ipaddress" "virtualenv" "projectname" "appname"
```
* If you want to start from scratch, you can run frameworkuninstall.sh script. This script uninstalls all of the modules that you would have installed in frameworkinstall.sh script. 
```
./frameworkuninstall.sh 
```
* Log back into the root user by exiting from the user you created in the beginning.  
```
exit
ssh root@xxx.xxx.xx.xxx
```
* Run services.sh script. This script sets up the Gunicorn Socket, Gunicorn Service, and Nginx Frameworks. 
```
./services.sh "ipaddress" "virtualenvname" "username" "projectname"
```
* Check that your Nginx and Gunicorn services are running by going to the following link:
```
http://xxx.xxx.xx.xxx
```
