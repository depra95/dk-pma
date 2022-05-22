#!/bin/bash
# docker
sudo yum install docker -y
sudo systemctl enable docker --now
sudo usermod -a -G docker ec2-user
sudo mkdir -p /usr/local/lib/docker/cli-plugins
sudo curl -SL https://github.com/docker/compose/releases/download/v2.5.0/docker-compose-linux-x86_64 -o /usr/local/lib/docker/cli-plugins/docker-compose
sudo chmod +x /usr/local/lib/docker/cli-plugins/docker-compose
# git
sudo yum install git -y
cd ~
git clone https://github.com/depra95/dk-pma.git
# cert
cd ~/dk-pma/nginx/certs/
openssl req -x509 -sha256 -nodes -days 3650 -newkey rsa:2048 -subj /CN=`curl http://169.254.169.254/latest/meta-data/public-hostname` -keyout private.key -out server.crt 