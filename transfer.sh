#!/bin/bash

#Определим переменные
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"  #определим директорию со скриптом
NUM=$1
NUM1=$( grep -v ";" /etc/asterisk/sip.conf|grep -c -w "username = ${NUM}") 

#w1=$( echo $NUM1 | sed 's/^\(.\).*/\1/' )

echo -n $NUM1
