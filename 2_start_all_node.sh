#!/bin/bash

# start first node and open http(rpc) port for control
gnome-terminal -- bash -c "geth --datadir go-ethereum/Node_0 --networkid 4869 --port 30000 --netrestrict 140.113.216.0/24 --http --http.addr 140.113.216.70 --http.port 40000 --http.api \"eth,net,web3,personal,miner,admin\" --allow-insecure-unlock"

# attach to Node_0's console 
read -n 1 -r -s -p $'Press enter to continue...\n'
gnome-terminal -- bash -c "expect info_Node_0.exp"
#gnome-terminal -- bash -c "geth attach http://140.113.216.70:40000"


#start Node_1 to Node_3 with console
read -n 1 -r -s -p $'Press enter to continue...\n'
gnome-terminal -- bash -c "expect Node_1.exp"
read -n 1 -r -s -p $'Press enter to continue...\n'
gnome-terminal -- bash -c "expect Node_2.exp"
read -n 1 -r -s -p $'Press enter to continue...\n'
gnome-terminal -- bash -c "expect Node_3.exp"
#gnome-terminal -- bash -c "geth --datadir go-ethereum/Node_1 --networkid 4869 --port 30001 --netrestrict 140.113.216.0/24 console"

#gnome-terminal -- bash -c "geth --datadir go-ethereum/Node_2 --networkid 4869 --port 30002 --netrestrict 140.113.216.0/24 console"

#gnome-terminal -- bash -c "geth --datadir go-ethereum/Node_3 --networkid 4869 --port 30003 --netrestrict 140.113.216.0/24 console"


# start other node without console
# sudo gnome-terminal -- bash -c "geth --datadir go-ethereum/Node_4 --networkid 4869 --port 30004 --bootnodes enode://957062b0327d106bc40d383ae18b558ae125c4f26d3b59926e6594a7e3e8ae3050cf3ace5093c25963e279931e01961ebba3f1aa5b9b8fb0c2f6209a987754a4@140.113.216.75:30000"
