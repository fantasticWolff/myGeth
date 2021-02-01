#!/bin/bash
# start Node_1 to Node_3 with console and mine
gnome-terminal -- bash -c "expect Node_1.exp"
read -n 1 -r -s -p $'Press enter to continue...\n'
gnome-terminal -- bash -c "expect Node_2.exp"
read -n 1 -r -s -p $'Press enter to continue...\n'
gnome-terminal -- bash -c "expect Node_3.exp"
#gnome-terminal -- bash -c "expect Node_4.exp"
