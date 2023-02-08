#!/bin/bash
USER_NAME="root"
HOST_FILE="/root/hosts"
ERROR_FILE="/tmp/ssh-copy_error.txt"
PUBLIC_KEY_FILE="$1"

if [ ! -f  $PUBLIC_KEY_FILE ]; then
        echo "File '$PUBLIC_KEY_FILE' не найден!"
        exit 1
fi

if [ ! -f $HOST_FILE ]; then
        echo "File '$HOST_FILE' не найден!"
        exit 2
fi

for IP in `cat $HOST_FILE`; do
        ssh-copy-id -i $PUBLIC_KEY_FILE $USER_NAME@$IP 2>$ERROR_FILE
        RESULT=$?
        if [ $RESULT -eq 0 ]; then
                echo ""
                echo "Открытый ключ успешно скопирован на $IP"
                echo ""
        else
                echo "$(cat  $ERROR_FILE)"
                echo 
                exit 3
        fi
        echo ""
done
