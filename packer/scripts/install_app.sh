#!/bin/bash
mkdir /app-otus/
cd /app-otus/
#clone source
git clone -b monolith https://github.com/express42/reddit.git
#deploy
cd /app-otus/reddit/
bundle install
#install puma service
cp /tmp/puma.service /etc/systemd/system/puma.service
systemctl enable puma
systemctl start puma
