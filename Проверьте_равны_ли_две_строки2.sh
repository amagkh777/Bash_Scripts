#!/bin/bash

read -p "Введите первую строку: " VAR1
read -p "Введите вторую строку: " VAR2

if [[ "$VAR1" == "$VAR2" ]]; then
    echo "Строки равны."
else
    echo "Строки не равны."
fi
