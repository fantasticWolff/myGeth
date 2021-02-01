#!/bin/bash

# start first node and open http(rpc) port for control
gnome-terminal -- bash -c "geth --datadir go-ethereum/Node_0 --networkid 4869 --port 30000 --netrestrict 140.113.216.0/24 --http --http.addr 140.113.216.70 --http.port 40000 --http.api \"eth,net,web3,personal,miner,admin\" --allow-insecure-unlock"

read -n 1 -r -s -p $'Press enter to continue...\n'
gnome-terminal -- bash -c "expect info_Node_0.exp"


