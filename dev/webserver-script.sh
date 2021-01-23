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
npm install
service apache2 reload
service apache2 restart
npm start
