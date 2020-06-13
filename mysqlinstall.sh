#!/bin/bash
#title          :mysqlinstall.sh
#description	:Performs MySQL Installations and sets up ports and starts the service
#author         :Rithika Raghav
#date           :20200608
#version        :1.0
#usage		:mysqlinstall.sh
#notes          :
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
