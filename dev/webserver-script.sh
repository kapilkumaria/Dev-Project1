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
cp dir.conf /etc/apache2/mods-enabled/dir.conf
cp 000-default.conf /etc/apache2/sites-enabled/000-default.conf
mkdir /var/www/html/Dev-Project1
cp /var/lib/jenkins/workspace/kk1/dev/index.js /var/www/html/Dev-Project1/
cp /var/lib/jenkins/workspace/kk1/dev/index.test.js /var/www/html/Dev-Project1/
cp /var/lib/jenkins/workspace/kk1/dev/package.json /var/www/html/Dev-Project1/
cp /var/lib/jenkins/workspace/kk1/dev/000-default.conf /etc/apache2/sites-enabled/
cp /var/lib/jenkins/workspace/kk1/dev/dir.conf /etc/apache2/mods-enabled/
apt install nodejs -y
apt install npm -y
npm install
service apache2 reload
service apache2 restart
npm start
