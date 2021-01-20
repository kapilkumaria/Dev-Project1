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
cd /var/www/html
mkdir Dev-Project1
cp ../index.js /var/www/html/Dev-Project1/index.js
cp ../index.test.js /var/www/html/Dev-Project1/index.test.js
cp ../package.json /var/www/html/Dev-Project1/package.json
apt install nodejs -y
apt install npm -y
npm install
service apache2 start
npm start
