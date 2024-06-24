#!/bin/bash

## Check wether root user or not

R="\e[31m"
N="\e[0m"

yum install -y yum-utils
yum-config-manager --add-repo https://download.docker.com/linux/rhel/docker-ce.repo
yum install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin -y
systemctl enable docker
systemctl start docker
systemctl status docker

## add the ec2-user into docker group, to run the docker commands without root user.
usermod -aG docker ec2-user
#logout and login again into server to effect the changes
echo -e "$R Logout and Login again $N"