#!/bin/bash

sudo gnome-terminal -- bash -c "geth --datadir go-ethereum/Node_4 --networkid 4869 --port 30004 --netrestrict 140.113.216.0/24 console --bootnodes enode://2c7daa8cb639f74e018875bbc10bf7fd4f9cea1cd5344eda66e3fe6591ef8fa4fba107c0d2e8670da7ace8e2b8e7c2aaac37b8deba8415151c3b8b1ab77d649b@140.113.216.70:30000"

sudo gnome-terminal -- bash -c "geth --datadir go-ethereum/Node_5 --networkid 4869 --port 30005 --netrestrict 140.113.216.0/24 console --bootnodes enode://2c7daa8cb639f74e018875bbc10bf7fd4f9cea1cd5344eda66e3fe6591ef8fa4fba107c0d2e8670da7ace8e2b8e7c2aaac37b8deba8415151c3b8b1ab77d649b@140.113.216.70:30000"

sudo gnome-terminal -- bash -c "geth --datadir go-ethereum/Node_6 --networkid 4869 --port 30006 --netrestrict 140.113.216.0/24 console --bootnodes enode://2c7daa8cb639f74e018875bbc10bf7fd4f9cea1cd5344eda66e3fe6591ef8fa4fba107c0d2e8670da7ace8e2b8e7c2aaac37b8deba8415151c3b8b1ab77d649b@140.113.216.70:30000"

sudo gnome-terminal -- bash -c "geth --datadir go-ethereum/Node_7 --networkid 4869 --port 30007 --netrestrict 140.113.216.0/24 console --bootnodes enode://2c7daa8cb639f74e018875bbc10bf7fd4f9cea1cd5344eda66e3fe6591ef8fa4fba107c0d2e8670da7ace8e2b8e7c2aaac37b8deba8415151c3b8b1ab77d649b@140.113.216.70:30000"

