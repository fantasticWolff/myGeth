#!/bin/bash
sudo apt install -y vim build-essential make wget expect
wget https://storage.googleapis.com/golang/go1.15.linux-amd64.tar.gz
tar -xvf go1.15.linux-amd64.tar.gz
sudo mv go /usr/local
export GOROOT=/usr/local/go
export PATH=$GOPATH/bin:$GOROOT/bin:$PATH
export GOPATH=$HOME/go
rm -rf go1.15.linux-amd64.tar.gz
go version
