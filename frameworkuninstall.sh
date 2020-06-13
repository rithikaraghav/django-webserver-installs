#!/bin/bash
#title          :frameworkuninstall.sh
#description	:Uninstalls all modules if you want to start from scratch
#author         :Rithika Raghav
#date           :20200608
#version        :1.0
#usage		:frameworkuninstall.sh
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
