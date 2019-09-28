#!/bin/sh

apt update
apt upgrade
apt install -y apt-transport-https openjdk-8-jre-headless uuid-runtime pwgen dirmngr

apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv 9DA31620334BD75D9DCB49F368818C72E52529D4
echo "deb http://repo.mongodb.org/apt/debian stretch/mongodb-org/4.0 main" | tee /etc/apt/sources.list.d/mongodb-org-4.0.list
apt-get update
apt-get install -y mongodb-org

systemctl daemon-reload
systemctl enable mongod.service
systemctl restart mongod.service

wget -qO - https://artifacts.elastic.co/GPG-KEY-elasticsearch | apt-key add -
echo "deb https://artifacts.elastic.co/packages/oss-6.x/apt stable main" | tee -a /etc/apt/sources.list.d/elastic-6.x.list
apt update
apt install -y elasticsearch-oss

echo -e "cluster.name: graylog\naction.auto_create_index: false" > /etc/elasticsearch/elasticsearch.yml

systemctl daemon-reload
systemctl enable elasticsearch.service
systemctl restart elasticsearch.service

wget https://packages.graylog2.org/repo/packages/graylog-2.5-repository_latest.deb
dpkg -i graylog-2.5-repository_latest.deb
apt update
sudo apt install -y graylog-server
