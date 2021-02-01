FROM ubuntu:18.04
MAINTAINER Wolff
RUN apt-get update && apt-get -y upgrade
RUN apt-get -y dist-upgrade
RUN apt install -y vim build-essential make wget

#ADD InstallGeth_source.sh /
#RUN source InstallGeth_source.sh

## Install Geth
RUN wget https://storage.googleapis.com/golang/go1.15.linux-amd64.tar.gz
RUN tar -xvf go1.15.linux-amd64.tar.gz
RUN mv go /usr/local
ENV GOROOT=/usr/local/go
ENV PATH=$GOPATH/bin:$GOROOT/bin:$PATH
ENV GOPATH=$HOME/go
RUN rm -rf go1.15.linux-amd64.tar.gz
RUN go version

## Init Geth
ADD ./go-ethereum /go-ethereum
RUN cd /go-ethereum && make geth && cp build/bin/geth /usr/local/bin/
EXPOSE 30303 30304 30305 30306 40303 40304 40305 40306 30303/udp
ENTRYPOINT ["geth"]

## Install Truffle
ADD ./Truffle_SmartContract /Truffle_SmartContract 
RUN apt install -y curl git
RUN curl -sL https://deb.nodesource.com/setup_14.x | bash -
RUN apt-get install -y nodejs
RUN npm install -g npm
RUN npm install -g truffle
#RUN chmod 777 /home/wolff/.config/
#sudo npm install -g truffle
#chmod 777 /home/wolff/.config/
#sudo npm install -g truffle
RUN truffle init
