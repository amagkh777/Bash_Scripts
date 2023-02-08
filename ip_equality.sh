#!/bin/bash
  
list_ip_txt=$(ifconfig |grep -E '[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}'|awk {'print $2'} > ip_list.txt)
list_ip=$(cat ip_list.txt)
#list_ip=('127.0.0.1' '127.0.0.2' '192.168.1.5')

OLD_IP="192.168.1.5"


for p in $(cat ip_list.txt)

do
if [ "${p}" != "${OLD_IP}" ]; then
    echo "${p}-отличается"
else
        echo "${p}-не отличается"
fi

done