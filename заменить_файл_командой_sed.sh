#!/bin/bash

# Присвойте имя файла
filename="Sales.txt"

# Возьмите строку поиска
read -p "Введите строку поиска: " search

# Возьмите строку замены
read -p "Введите строку замены: " replace

if [[ $search != "" && $replace != "" ]]; then
sed -i "s/$search/$replace/" $filename
fi
