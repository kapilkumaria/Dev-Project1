#!/bin/bash
sudo apt install openjdk-8-jdk -y
sudo chmod 666 /var/run/docker.sock
aws ecr get-login-password --region us-east-1 | docker login --username AWS --password-stdin 931058976119.dkr.ecr.us-east-1.amazonaws.com
