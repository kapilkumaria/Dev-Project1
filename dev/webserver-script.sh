#!/bin/bash

#####################################################################
##### USE THIS WITH PROJECT-2 DEPLOY JENKINS WITH TERRAFORM ########
#####################################################################

# get admin privileges 

sudo su

# install apache2 webserver

apt update -y
apt install apache2 -y
service apache2 start
service apache2 enable
mkdir /var/www/html/Dev-Project1
apt install nodejs -y
apt install npm -y
cp /var/lib/jenkins/workspace/kk1/dev/index.js /var/www/html/Dev-Project1/index.js
cp /var/lib/jenkins/workspace/kk1/dev/index.test.js /var/www/html/Dev-Project1/index.test.js
cp /var/lib/jenkins/workspace/kk1/dev/package.json /var/www/html/Dev-Project1/package.json
cp /var/lib/jenkins/workspace/kk1/dev/000-default.conf /etc/apache2/sites-enabled/000-default.conf
cp /var/lib/jenkins/workspace/kk1/dev/dir.conf /etc/apache2/mods-enabled/dir.conf
npm install
service apache2 reload
service apache2 restart
npm start
