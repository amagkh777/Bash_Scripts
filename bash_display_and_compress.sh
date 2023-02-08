#!/bin/bash
echo "Displaying the contents of $1 ..."
sleep 2
cat $1
echo 
echo "Compressing $1 ..."
sleep 2
tar -cjvf "$1.tar.gz" $1

# Move to the script's directory and run it as: ./script_name.sh filename 
# or: sudo ./script_name.sh /etc/passwd