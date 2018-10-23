#!/bin/bash
mkdir /app-otus/
cd /app-otus/
#clone source
git clone -b monolith https://github.com/express42/reddit.git
#deploy
cd /app-otus/reddit/
sudo bundle install
sudo puma -d
