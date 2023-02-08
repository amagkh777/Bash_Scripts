#!/bin/bash

# Взять строку поиска
read -p "Введите строку поиска: " search

Взять строку замены
read -p "Введите строку замены: " replace

if [[ $search != "" && $replace != "" ]]; then
sed -i "s/$search/$replace/gi" $1
fi
