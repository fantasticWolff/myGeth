#!/bin/bash
sudo apt install -y curl
curl -sL https://deb.nodesource.com/setup_14.x | sudo -E bash -
sudo apt-get install -y nodejs
sudo npm install -g npm
sudo npm install -g truffle
#chmod 777 /home/wolff/.config/
#sudo npm install -g truffle
sudo truffle
