#!/bin/bash

# Установить имя файла
filename = 'test.txt'
# Создать пустой файл
touch $filename
# Проверить, существует ли файл,
if [ -f $filename ]; then
rm test.txt
echo "$filename удален"
fi

