#!/bin/bash
sudo apt install openjdk-8-jdk -y
sudo groupadd docker
sudo usermod -aG docker ubuntu
su -s ubuntu