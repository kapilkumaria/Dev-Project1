#!/bin/bash
sudo su
apt update -y
apt install awscli -y
apt install apt-transport-https ca-certificates curl software-properties-common -y
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
apt update -y
apt-cache policy docker-ce
apt install docker.io -y
service docker start
usermod -a -G docker ec2-user
chkconfig docker on
$(aws ecr get-login --no-include-email --region us-east-1)
docker pull 931058976119.dkr.ecr.us-east-1.amazonaws.com/my-nodeapp
docker run -d -it -p 3000:3000 931058976119.dkr.ecr.us-east-1.amazonaws.com/my-nodeapp

