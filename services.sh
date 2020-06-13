
#!/bin/bash
#title		:services.sh
#description	:Sets up gunicorn.socket, gunicorn.service, and nginx
#author		:Rithika Raghav
#date		:20200608
#version	:1.0
#usage		:services.sh "ipaddress" "virtualenvname" "username" "projectname"
#notes		:This has to be run as root as files are written to /etc
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

ipaddress=$1
virtualenvname=$2
username=$3
projectname=$4
touch /etc/systemd/system/gunicorn.socket
touch /etc/systemd/system/gunicorn.service
echo -e "[Unit]" >> /etc/systemd/system/gunicorn.socket
echo -e "Description=gunicorn socket\n" >> /etc/systemd/system/gunicorn.socket
echo -e "[Socket]" >> /etc/systemd/system/gunicorn.socket
echo -e "ListenStream=/run/gunicorn.sock\n" >> /etc/systemd/system/gunicorn.socket
echo -e "[Install]" >> /etc/systemd/system/gunicorn.socket
echo -e "WantedBy=sockets.target" >> /etc/systemd/system/gunicorn.socket
echo -e "[Unit]" >> /etc/systemd/system/gunicorn.service
echo -e "Description=gunicorn daemon" >> /etc/systemd/system/gunicorn.service
echo -e "Requires=gunicorn.socket" >> /etc/systemd/system/gunicorn.service
echo -e "After=network.target\n" >> /etc/systemd/system/gunicorn.service
echo -e "[Service]" >> /etc/systemd/system/gunicorn.service
echo -e "User=$appuser" >> /etc/systemd/system/gunicorn.service
echo -e "Group=www-data" >> /etc/systemd/system/gunicorn.service
echo -e "WorkingDirectory=/home/$username/djangoprojects" >> /etc/systemd/system/gunicorn.service
echo -e "ExecStart=/home/$username/$virtualenvname/bin/gunicorn \\" >> /etc/systemd/system/gunicorn.service
echo -e "--access-logfile - \\" >> /etc/systemd/system/gunicorn.service
echo -e "--workers 3 \\" >> /etc/systemd/system/gunicorn.service
echo -e "--bind unix:/run/gunicorn.sock \\" >> /etc/systemd/system/gunicorn.service
echo -e "$projectname.wsgi:application\n" >> /etc/systemd/system/gunicorn.service
echo -e "[Install]" >> /etc/systemd/system/gunicorn.service
echo -e "WantedBy=multi-user.target" >> /etc/systemd/system/gunicorn.service
{
echo ' server {'
echo '   listen 80;'
echo '   server_name' $ipaddress';'
echo '   location = /favicon.ico { access_log off; log_not_found off; }'
echo '   location /static/ {'
echo '        root /home/'$username'/'$projectname';'
echo '    }'
echo '    location / {'
echo '        include proxy_params;'
echo '        proxy_pass http://unix:/run/gunicorn.sock;'
echo '    }'
echo ' }'
} >> /etc/nginx/sites-available/$projectname
systemctl daemon-reload
systemctl stop gunicorn.service
systemctl start gunicorn.service
systemctl enable gunicorn.service
sudo ln -s /etc/nginx/sites-available/$projectname /etc/nginx/sites-enabled
sudo ufw delete allow 8000
sudo ufw allow 'Nginx Full'
sudo systemctl stop nginx
sudo systemctl start nginx
