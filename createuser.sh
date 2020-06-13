#!/bin/bash
#title		:createuser.sh
#description	:Creates an app user that will contain the framework for a Django web server that uses Nginx, Gunicorn, and MySQL backbone
#author		:Rithika Raghav
#date		:20200608
#version	:1.0
#usage		:createuser.sh "username" "ipaddress" "password"
#notes		:
#THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS
#“AS IS” AND ANY EXPRESS OR #IMPLIED WARRANTIES, INCLUDING, BUT NOT
#LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY #AND FITNESS
#FOR A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT
#OWNER OR #CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL,
#SPECIAL, EXEMPLARY, OR #CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED
#TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR
#PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF
#LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING
#NEGLIGENCE OR #OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS
#SOFTWARE, EVEN IF ADVISED OF THE #POSSIBILITY OF SUCH DAMAGE.
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
