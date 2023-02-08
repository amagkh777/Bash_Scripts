#!/bin/bash

files=""
space=""

# Проверить, указано ли несколько имен файлов,
if [ $# > 2 ]; then
# Чтение значений аргументов с использованием цикла
for argval in "$@"
do
if [ -f $argval ]; then
files+=$argval$space
else
echo "$argval не существует"
fi
done

# Удалить файлы
rm  $files
echo "файлы удалены."
else
echo "Имена файлов не указаны или имя файла не существует"
fi
