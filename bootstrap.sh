#!/bin/bash
cd /tmp
curl https://packages.microsoft.com/config/ubuntu/16.04/prod.list > ./microsoft-prod.list
cp ./microsoft-prod.list /etc/apt/sources.list.d/
curl https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > microsoft.gpg
cp ./microsoft.gpg /etc/apt/trusted.gpg.d/
apt-get update
apt-get install -y moby-engine moby-cli 2> /dev/null
# needs to be separate or sometimes it wont install iotedge
apt-get install -y iotedge 2> /dev/null
cp /vagrant/config.yaml /etc/iotedge/config.yaml
mkdir /usr/iotedge_certs
cp /vagrant/complete_certs/* /usr/iotedge_certs/
chmod 766 /usr/iotedge_certs/*
# systemctl restart iotedge
