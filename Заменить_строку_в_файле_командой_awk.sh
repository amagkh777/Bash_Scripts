#!/bin/bash

# Проверить, существует ли значение аргумента командной строки или нет
if [ $1 != "" ]; then
# Искать во всей строке по дате
awk '{sub("02/06/2020","12/06/2020")}1' $1 > temp.txt && mv temp.txt $1
fi

