#!/bin/bash
echo "Dropping packets from $1"
iptables -I INPUT -s $1 -j DROP

# Move to the script's directory and run it as: sudo ./script_name.sh IP_ADDRESS
