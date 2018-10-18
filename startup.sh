#!/bin/bash
### install pkg
#update yum
sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv EA312927
sudo bash -c 'echo "deb http://repo.mongodb.org/apt/ubuntu xenial/mongodb-org/3.2 multiverse" > /etc/apt/sources.list.d/mongodb-org-3.2.list'
sudo apt update
#install ruby + mongo
sudo apt install -y ruby-full ruby-bundler build-essential mongodb-org
#start and enable mongo
sudo systemctl start mongod && sudo systemctl enable mongod

### deploy app
#create dir
mkdir /app-otus/ & cd /app-otus/
#clone source
git clone -b monolith https://github.com/express42/reddit.git
#deploy
cd /app-otus/reddit/
sudo bundle install
sudo puma -d

