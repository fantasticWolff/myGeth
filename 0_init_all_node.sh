#!/bin/bash

sudo rm -rf go-ethereum/Node_0 go-ethereum/Node_1 go-ethereum/Node_2 go-ethereum/Node_3 go-ethereum/Node_4 go-ethereum/Node_5 go-ethereum/Node_6 go-ethereum/Node_7

mkdir go-ethereum/Node_0 go-ethereum/Node_1 go-ethereum/Node_2 go-ethereum/Node_3 go-ethereum/Node_4 go-ethereum/Node_5 go-ethereum/Node_6 go-ethereum/Node_7

gnome-terminal -- bash -c "expect new_Node_0.exp"
read -n 1 -r -s -p $'Press enter to continue...\n'
geth init --datadir go-ethereum/Node_0 go-ethereum/genesis.json

gnome-terminal -- bash -c "expect new_Node_1.exp"
read -n 1 -r -s -p $'Press enter to continue...\n'
geth init --datadir go-ethereum/Node_1 go-ethereum/genesis.json

gnome-terminal -- bash -c "expect new_Node_2.exp"
read -n 1 -r -s -p $'Press enter to continue...\n'
geth init --datadir go-ethereum/Node_2 go-ethereum/genesis.json

gnome-terminal -- bash -c "expect new_Node_3.exp"
read -n 1 -r -s -p $'Press enter to continue...\n'
geth init --datadir go-ethereum/Node_3 go-ethereum/genesis.json





